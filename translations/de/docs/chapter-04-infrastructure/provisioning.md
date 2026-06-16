# Bereitstellung von Azure-Ressourcen mit AZD

**Kapitel-Navigation:**
- **📚 Kursübersicht**: [AZD für Einsteiger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 4 - Infrastruktur als Code & Bereitstellung
- **⬅️ Vorheriges**: [Bereitstellungsleitfaden](deployment-guide.md)
- **➡️ Nächstes Kapitel**: [Kapitel 5: Multi-Agenten KI-Lösungen](../../examples/retail-scenario.md)
- **🔧 Verwandt**: [Kapitel 6: Vorbereitungsvalidierung](../chapter-06-pre-deployment/capacity-planning.md)

## Einführung

Dieser umfassende Leitfaden behandelt alles, was Sie über die Bereitstellung und Verwaltung von Azure-Ressourcen mit der Azure Developer CLI wissen müssen. Lernen Sie, Infrastructure-as-Code-(IaC)-Muster zu implementieren — von der grundlegenden Ressourcenerstellung bis hin zu fortgeschrittenen, unternehmensgerechten Infrastrukturlösungen mit Bicep, ARM-Vorlagen, Terraform und Pulumi.

## Lernziele

Nach Abschluss dieses Leitfadens werden Sie:
- Die Prinzipien von Infrastructure as Code und die Bereitstellung von Azure-Ressourcen beherrschen
- Verschiedene von der Azure Developer CLI unterstützte IaC-Provider verstehen
- Bicep-Vorlagen für gängige Anwendungsarchitekturen entwerfen und implementieren
- Ressourcenparameter, Variablen und umgebungsspezifische Einstellungen konfigurieren
- Erweiterte Infrastruktur-Muster einschließlich Netzwerk und Sicherheit implementieren
- Den Lebenszyklus von Ressourcen, Updates und Abhängigkeitsauflösung verwalten

## Lernergebnisse

Nach Abschluss sind Sie in der Lage:
- Azure-Infrastruktur mit Bicep und ARM-Vorlagen zu entwerfen und bereitzustellen
- Komplexe Multi-Service-Architekturen mit korrekten Ressourcenabhängigkeiten zu konfigurieren
- Parametrisierte Vorlagen für mehrere Umgebungen und Konfigurationen zu implementieren
- Probleme bei der Infrastruktur-Bereitstellung zu beheben und Deployment-Fehler zu lösen
- Prinzipien des Azure Well-Architected Framework auf das Infrastrukturodesign anzuwenden
- Infrastruktur-Updates zu verwalten und Strategien zur Versionskontrolle der Infrastruktur umzusetzen

## Überblick über die Infrastruktur-Bereitstellung

Azure Developer CLI unterstützt mehrere Infrastructure-as-Code-(IaC)-Provider:
- **Bicep** (empfohlen) - Azures domänenspezifische Sprache
- **ARM Templates** - JSON-basierte Azure Resource Manager-Vorlagen
- **Terraform** - Multi-Cloud-Infrastruktur-Tool
- **Pulumi** - Moderne Infrastructure as Code mit Programmiersprachen

## Verständnis von Azure-Ressourcen

### Ressourcen-Hierarchie
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Häufige Azure-Dienste für Anwendungen
- **Compute**: App Service, Container Apps, Functions, virtuelle Maschinen
- **Speicher**: Storage Account, Cosmos DB, SQL-Datenbank, PostgreSQL
- **Netzwerk**: Virtuelles Netzwerk, Application Gateway, CDN
- **Sicherheit**: Key Vault, Application Insights, Log Analytics
- **KI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep-Infrastrukturvorlagen

### Grundstruktur einer Bicep-Vorlage
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

### Erweiterte Bicep-Muster

#### Modulare Infrastruktur
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

#### Bedingte Ressourcenerstellung
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

## 🌐 Terraform mit azd verwenden

Bicep ist der Standard von azd, aber azd unterstützt auch **Terraform** – nützlich, wenn Ihr Team bereits darauf standardisiert oder Sie Multi-Cloud-Infrastruktur verwalten. Der azd-Workflow (`azd up`, `azd provision`, `azd down`) ist identisch; nur die Infrastruktur‑Sprache und die Ordnerstruktur ändern sich.

### azd anweisen, Terraform zu verwenden

Fügen Sie einen `infra`-Abschnitt zu `azure.yaml` hinzu, der auf den Terraform-Provider zeigt:

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

### Terraform-Ordnerstruktur

Beim Einsatz des Terraform-Providers verwendet Ihr `infra/`-Ordner `.tf`-Dateien anstelle von Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Eine minimale `main.tf`

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

### Wie azd Ihre Terraform-Outputs verwendet

azd liest Terraform-**outputs**, um Ihre Endpunkte zu ermitteln und Umgebungswerte zurück in Ihre App zu speisen. Die Namen der Outputs sind wichtig — azd sucht nach bestimmten Namen:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Wichtig:** azd verwendet das `azd-env-name`-Tag und `AZURE_*`-Outputs, um Ressourcen pro Umgebung nachzuverfolgen. Markieren Sie Ihre Ressourcengruppe stets mit `"azd-env-name" = var.environment_name`, damit `azd down` alles finden und entfernen kann.

### Bereitstellen mit Terraform

Die Befehle sind genau dieselben wie bei Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd führt 'terraform plan' unter der Haube aus
azd up                    # Provisionierung + Bereitstellung
azd down --force          # zerstört die von Terraform verwalteten Ressourcen
```

> **Voraussetzung:** Terraform muss installiert und in Ihrem `PATH` vorhanden sein. azd verwaltet den Terraform-*Workflow*, installiert Terraform jedoch nicht für Sie. Für den State verwendet azd standardmäßig lokalen State; für Teams konfigurieren Sie ein Remote-Backend (z. B. ein Azure Storage-Backend) in `provider.tf`.

Für vollständige, lauffähige Terraform-Starter durchsuchen Sie die [Awesome AZD gallery](https://azure.github.io/awesome-azd/) und filtern nach Terraform, oder sehen Sie in der offiziellen [azd Terraform-Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) nach.

## 🧩 Pulumi mit azd verwenden

Wenn Ihr Team Infrastruktur in einer Allgemeinprogrammiersprache (TypeScript, Python, Go oder C#) statt in einer DSL schreibt, unterstützt azd auch **Pulumi**. Wie bei Terraform bleibt der `azd up` / `azd provision` / `azd down`-Workflow unverändert — nur die Infrastruktur-Tools und die Ordnerstruktur unterscheiden sich.

### azd anweisen, Pulumi zu verwenden

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

### Pulumi-Ordnerstruktur

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### Ein minimales `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// Kennzeichne jede Ressource, damit azd sie verfolgen und bereinigen kann
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd liest diese Ausgaben wieder in deine Umgebung ein
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stacks werden azd-Umgebungen zugeordnet

Pulumi organisiert Deployments in **Stacks**, und azd ordnet jeder azd-Umgebung einen Pulumi-Stack mit dem gleichen Namen zu. Wenn Sie `azd env new staging` ausführen, wählt azd den `staging` Pulumi-Stack aus (oder erstellt ihn). Dieselbe `azd-env-name`-Kennzeichnung und die `AZURE_*`-Output-Regeln gelten, sodass `azd down` alles finden und entfernen kann.

### Bereitstellen mit Pulumi

```bash
azd auth login
azd env new dev
azd provision --preview   # azd führt 'pulumi preview' im Hintergrund aus
azd up                    # Provisionierung + Bereitstellung
azd down --force          # führt 'pulumi destroy' aus
```

> **Voraussetzung:** Pulumi muss installiert und in Ihrem `PATH` vorhanden sein, und Sie benötigen ein State-Backend (Pulumi Cloud oder ein selbstverwaltetes Backend wie Azure Blob Storage). azd verwaltet den Pulumi-*Workflow*, nicht die Installation. Siehe die offizielle [azd Pulumi-Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 Auswahl eines Hosts für Ihren Dienst

Das `host`-Feld in `azure.yaml` bestimmt, wo Ihr Code ausgeführt wird. azd unterstützt mehrere Hosts — die Wahl des richtigen Hosts ist wichtiger als die Infrastruktur‑Sprache. Hier ein anfängerfreundlicher Vergleich:

| `host` value | Best for | Why |
|--------------|----------|-----|
| `appservice` | Traditionelle Web-Apps und APIs | Einfachste PaaS-Lösung; keine Container erforderlich |
| `staticwebapp` | Front-End-SPAs (React, Vue, Angular) | Globales CDN + kostenloses SSL, integrierte API-Unterstützung |
| `function` | Ereignisgesteuerte und serverlose Workloads | Skalierung bis auf Null, Bezahlung pro Ausführung |
| `containerapp` | Containerisierte Microservices | Serverlose Container, Skalierung bis auf Null, integrierter Ingress |
| `aks` | Komplexe Orchestrierungsanforderungen | Volle Kubernetes-Kontrolle, wenn Sie sie wirklich benötigen |
| `springapp` | Java Spring Boot-Apps | Managed Azure Spring Apps-Laufzeit, optimiert für Spring |

### Wann man AKS wählen sollte

**Azure Kubernetes Service (`host: aks`)** bietet Ihnen die volle Power von Kubernetes — benutzerdefinierte Controller, Service Meshes, komplexes Networking und fein granulare Scheduling-Optionen. Diese Leistung bringt jedoch betriebliche Komplexität mit sich: Sie verwalten Node-Pools, Upgrades und Clusternetzwerke.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Fangen Sie einfacher an, wenn möglich.** Für die meisten Microservices bieten **Container Apps** Container, automatische Skalierung und Skalierung auf Null, ohne einen Cluster zu verwalten. Wählen Sie AKS nur, wenn Sie Kubernetes-spezifische Funktionen benötigen.

### Wann Azure Spring Apps verwenden

**Azure Spring Apps (`host: springapp`)** ist eine verwaltete Laufzeit, die speziell für Spring Boot entwickelt wurde. Sie übernimmt Service Discovery, Config Server und Blue-Green-Deployments, sodass Java-Teams ihre eigene Infrastruktur nicht betreiben müssen.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Verwenden Sie `springapp`, wenn Sie vorhandene Spring-Boot-Anwendungen haben und eine darauf abgestimmte Laufzeit möchten. Für neue containerisierte Java-Anwendungen ohne spring-spezifische Anforderungen ist `containerapp` oft die einfachere Wahl.

## 🗃️ Datenbank-Bereitstellung

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

## 🔒 Sicherheit und Geheimnisverwaltung

### Key Vault-Integration
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

### Konfiguration verwalteter Identitäten
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

## 🌍 Netzwerk und Konnektivität

### Virtuelles Netzwerk konfigurieren
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

### Application Gateway mit SSL
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

## 📊 Überwachung und Beobachtbarkeit

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

### Benutzerdefinierte Metriken und Warnungen
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

## 🔧 Umgebungs­abhängige Konfigurationen

### Parameterdateien für verschiedene Umgebungen
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

### Bedingte Ressourcenbereitstellung
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

## 🚀 Erweiterte Bereitstellungsmuster

### Multi-Region-Bereitstellung
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

### Infrastrukturtests
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

## 🧪 Infrastrukturvorschau & Validierung (NEU)

### Infrastrukturänderungen vor der Bereitstellung prüfen

Die Funktion `azd provision --preview` ermöglicht es Ihnen, die Infrastruktur‑Bereitstellung zu **simulieren**, bevor Sie tatsächlich Ressourcen bereitstellen. Sie ist ähnlich wie `terraform plan` oder `bicep what-if` und bietet eine **Dry-Run‑Ansicht** dessen, welche Änderungen in Ihrer Azure‑Umgebung vorgenommen würden.

#### 🛠️ Was es macht
- **Analysiert Ihre IaC-Vorlagen** (Bicep oder Terraform)
- **Zeigt eine Vorschau der Ressourcenänderungen**: Hinzufügungen, Löschungen, Aktualisierungen
- **Wendet keine Änderungen an** — es ist schreibgeschützt und sicher ausführbar

#### Anwendungsfälle
```bash
# Vorschau von Infrastrukturänderungen vor der Bereitstellung
azd provision --preview

# Vorschau für eine bestimmte Umgebung
azd provision --preview -e production
```

Dieser Befehl hilft Ihnen:
- **Infrastrukturänderungen zu validieren**, bevor Ressourcen bereitgestellt werden
- **Fehlkonfigurationen frühzeitig zu erkennen** im Entwicklungszyklus
- **Sicher in Teamumgebungen zusammenzuarbeiten**
- **Least-Privilege-Bereitstellungen sicherzustellen**, ohne Überraschungen

Er ist besonders nützlich, wenn:
- Sie mit komplexen Multi-Service-Umgebungen arbeiten
- Änderungen an Produktionsinfrastruktur vorgenommen werden
- Vorlagenänderungen vor der PR-Freigabe validiert werden sollen
- Neue Teammitglieder in Infrastruktur-Muster eingearbeitet werden

### Beispiel einer Preview-Ausgabe
Die genaue Vorschauausgabe variiert je nach Provider und Projektstruktur, aber das Ergebnis sollte vorgeschlagene Änderungen klar identifizieren, bevor irgendetwas angewendet wird.

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

## �🔄 Ressourcen-Updates und Migrationen

### Sichere Ressourcen-Updates
```bash
# Zuerst Infrastrukturänderungen in der Vorschau prüfen (EMPFOHLEN)
azd provision --preview

# Änderungen nach Bestätigung der Vorschau anwenden
azd provision --confirm-with-no-prompt

# Für einen Rollback Git verwenden, um Infrastrukturänderungen rückgängig zu machen:
git revert HEAD  # Letzten Infrastruktur-Commit rückgängig machen
azd provision    # Vorherigen Zustand der Infrastruktur anwenden
```

### Datenbankmigrationen
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

## 🎯 Beste Vorgehensweisen

### 1. Namenskonventionen für Ressourcen
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Tagging-Strategie
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

### 3. Parametervalidierung
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

### 4. Ausgabeorganisation
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

## Nächste Schritte

- [Vorbereitungsplanung](../chapter-06-pre-deployment/capacity-planning.md) - Ressourcenverfügbarkeit validieren
- [Häufige Probleme](../chapter-07-troubleshooting/common-issues.md) - Infrastrukturprobleme beheben
- [Debugging Guide](../chapter-07-troubleshooting/debugging.md) - Bereitstellungsprobleme debuggen
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Geeignete Service-Stufen wählen

## Zusätzliche Ressourcen

- [Azure Bicep-Dokumentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager-Vorlagen](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigation**
- **Vorherige Lektion**: [Bereitstellungsleitfaden](deployment-guide.md)
- **Nächste Lektion**: [Kapazitätsplanung](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
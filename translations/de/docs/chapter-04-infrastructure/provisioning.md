# Bereitstellung von Azure-Ressourcen mit AZD

**Kapitel-Navigation:**
- **📚 Kursübersicht**: [AZD für Einsteiger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 4 - Infrastruktur als Code & Deployment
- **⬅️ Vorheriges**: [Deployment Anleitung](deployment-guide.md)
- **➡️ Nächstes Kapitel**: [Kapitel 5: Multi-Agent AI Lösungen](../../examples/retail-scenario.md)
- **🔧 Verwandt**: [Kapitel 6: Pre-Deployment Validierung](../chapter-06-pre-deployment/capacity-planning.md)

## Einführung

Diese Anleitung behandelt die Bereitstellung und Verwaltung von Azure-Ressourcen mit der Azure Developer CLI und deren integrierten Bicep- und Terraform-Anbietern.

> Überprüft anhand von `azd 1.37.2` (November 2026). Sofern nicht anders angegeben, sind Bicep-, Terraform- und Skriptbeispiele **illustrierende Fragmente** und keine vollständigen Templates. Integrieren Sie sie in ein Projekt, das die referenzierten Parameter, Module, Identitäten, Netzwerke und Anwendungscode bereitstellt. Die Azure-Bereitstellung wurde bei dieser Überprüfung nicht ausgeführt.

## Lernziele

Mit Abschluss dieser Anleitung werden Sie:
- Die Prinzipien von Infrastruktur als Code meistern und Azure-Ressourcen bereitstellen können
- Mehrere von Azure Developer CLI unterstützte IaC-Anbieter verstehen
- Bicep-Templates für gängige Anwendungsarchitekturen entwerfen und implementieren
- Ressourcenparameter, Variablen und umgebungsspezifische Einstellungen konfigurieren
- Fortgeschrittene Infrastrukturmuster einschließlich Netzwerke und Sicherheit implementieren
- Ressourcenlebenszyklus, Updates und Abhängigkeitsauflösung verwalten

## Lernergebnisse

Nach Abschluss werden Sie in der Lage sein:
- Azure-Infrastruktur mit Bicep- und ARM-Templates zu entwerfen und bereitzustellen
- Komplexe Multi-Service-Architekturen mit korrekten Ressourcenketteinrichtungen zu konfigurieren
- Parametrisierte Templates für mehrere Umgebungen und Konfigurationen umzusetzen
- Probleme bei der Infrastruktur-Bereitstellung zu diagnostizieren und Bereitstellungsfehler zu beheben
- Azure Well-Architected Framework-Prinzipien im Infrastrukturdesign anzuwenden
- Infrastruktur-Updates zu verwalten und Versionierungsstrategien einzuführen

## Überblick Infrastruktur-Bereitstellung

Die Azure Developer CLI unterstützt mehrere Infrastructure as Code (IaC) Anbieter:
- **Bicep** (empfohlen) – die domänenspezifische Sprache von Azure
- **ARM Templates** – Bicep wird zu ARM kompiliert; rohes ARM JSON ist kein separater integrierter `infra.provider`
- **Terraform** – Multi-Cloud-Infrastruktur-Tool
- **Erweiterungsanbieter** – erfordern eine separat installierte Anbieter-Erweiterung und deren dokumentierte Konfiguration; es darf nicht angenommen werden, dass ein Anbietersymbol unterstützt wird

## Verständnis von Azure-Ressourcen

### Ressourcen-Hierarchie
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Gängige Azure-Dienste für Anwendungen
- **Compute**: App Service, Container Apps, Functions, Virtuelle Maschinen
- **Storage**: Storage Account, Cosmos DB, SQL-Datenbank, PostgreSQL
- **Networking**: Virtuelles Netzwerk, Application Gateway, CDN
- **Sicherheit**: Key Vault, Application Insights, Log Analytics
- **KI/ML**: Azure KI-Dienste, Azure OpenAI, Azure Machine Learning

## Bicep Infrastruktur Templates

### Grundstruktur eines Bicep-Templates
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

Für ein vollständiges azd-Projekt rufen Sie dieses Modul aus einem azd-Abonnements-Scoped `infra/main.bicep` auf, der eine getaggte Ressourcengruppe erstellt und ihren Scope übergibt. Stimmen Sie `environmentName`/`location` in `main.parameters.json` ab. Das `azd-service-name: web`-Tag verbindet die Ressource mit `services.web`; nur beliebige Ausgabe-Namen konfigurieren keinen Service-Discovery.

### Fortgeschrittene Bicep-Muster

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

Bicep ist der Standard von azd, aber azd unterstützt auch **Terraform** – nützlich, wenn Ihr Team dies bereits standardisiert oder Sie Multi-Cloud-Infrastruktur verwalten. Der azd-Workflow (`azd up`, `azd provision`, `azd down`) ist identisch; nur die Infrastruktur-Sprache und Ordnerstruktur ändern sich.

### azd anweisen, Terraform zu verwenden

Fügen Sie eine `infra`-Sektion zu `azure.yaml` hinzu, die auf den Terraform-Anbieter zeigt:

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

Mit dem Terraform-Anbieter verwendet Ihr `infra/`-Ordner `.tf`-Dateien anstelle von Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Ein `main.tf`-Fragment

Dieses Fragment erstellt nur eine Ressourcengruppe und einen Plan, keinen bereitstellbaren Dienst. Sie müssen auch Eingabevariablen, einen kompatiblen `azurerm`-Anbieter, die Web-App und deren Service-Tag-/Ressourcen-Namenszuordnung deklarieren.

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

### Wie azd auf Ihre Terraform-Ausgaben zugreift

azd liest Terraform-**Outputs** in Umgebungswerte ein. Dieses Fragment setzt voraus, dass Sie `azurerm_linux_web_app.web` definiert haben; Service-Discovery erfordert weiterhin einen passenden Ressourcennamen oder ein `azd-service-name`-Tag:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Wichtig:** azd verwendet das `azd-env-name`-Tag und `AZURE_*`-Outputs, um Ressourcen pro Umgebung zu verfolgen. Markieren Sie Ihre Ressourcengruppe stets mit `"azd-env-name" = var.environment_name`, damit `azd down` alles finden und entfernen kann.

### Mit Terraform bereitstellen

Die Befehle sind genau die gleichen wie bei Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Voraussetzung:** Terraform muss installiert und in Ihrem `PATH` sein. azd verwaltet den Terraform *Workflow*, installiert Terraform aber nicht für Sie. Für den Status verwendet azd standardmäßig lokalen Status; für Teams konfigurieren Sie ein Remote-Backend (zum Beispiel Azure Storage Backend) in `provider.tf`.

Für vollständige, ausführbare Terraform-basierte Starter durchsuchen Sie die [Awesome AZD Galerie](https://azure.github.io/awesome-azd/) und filtern nach Terraform oder sehen Sie die offizielle [azd Terraform-Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Andere Infrastruktur-Werkzeuge

Pulumi ist kein integrierter azd 1.37.2-Bereitstellungsanbieter. Die reine Einstellung von `infra.provider: pulumi` stellt keine funktionierende Integration her, und `azd env new` legt nicht automatisch einen Pulumi-Stack an oder wählt ihn aus. Wenn Sie ein anderes IaC-Tool verwenden, befolgen Sie die Dokumentation einer verifizierten Anbieter-Erweiterung oder verwalten Sie dessen Lebenszyklus explizit im eigenen Workflow. Dieser Kurs stellt keinen Pulumi-Anbieter bereit oder validiert ihn.

## 🎯 Wahl eines Hosts für Ihren Dienst

Das `host`-Feld in `azure.yaml` entscheidet, wo Ihr Code ausgeführt wird. azd unterstützt mehrere Hosts – die Wahl des richtigen ist wichtiger als die Infrastruktur-Sprache. Hier ein anfängerfreundlicher Vergleich:

| `host` Wert | Am besten geeignet für | Warum |
|--------------|----------|-----|
| `appservice` | Traditionelle Web-Apps und APIs | Einfachstes PaaS; keine Container erforderlich |
| `staticwebapp` | Frontend-SPAs (React, Vue, Angular) | Globales CDN + kostenloses SSL, integrierte API-Unterstützung |
| `function` | Ereignisgesteuerte und serverlose Workloads | Scale-to-Zero, Abrechnung pro Ausführung |
| `containerapp` | Containerisierte Microservices | Serverlose Container, Scale-to-Zero, integrierter Ingress |
| `aks` | Komplexer Orchestrierungsbedarf | Vollständige Kubernetes-Kontrolle, wenn wirklich benötigt |
| `springapp` | Bestehende Azure Spring Apps-Bereitstellungen | Legacy-Ziel; Dienst wird am 31. März 2028 eingestellt und ist für Neukunden geschlossen |

### Wann AKS wählen

**Azure Kubernetes Service (`host: aks`)** gibt Ihnen die volle Kubernetes-Power — benutzerdefinierte Controller, Service Meshes, komplexes Networking und feingranulares Scheduling. Diese Power bringt aber auch Betriebsaufwand mit sich: Sie verwalten Node Pools, Upgrades und Cluster-Netzwerke.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Starten Sie simpler, wenn möglich.** Für die meisten Microservices bieten **Container Apps** Container, automatisches Skalieren und Scale-to-Zero ohne Clusterverwaltung. Wählen Sie AKS nur, wenn Sie Kubernetes-spezifische Funktionen benötigen.

### Wann Azure Spring Apps nutzen

**Azure Spring Apps (`host: springapp`)** ist eine verwaltete Laufzeit, speziell für Spring Boot gebaut. Sie übernimmt Service-Discovery, Config-Server und Blue-Green-Deployment, sodass Java-Teams keine eigene Infrastruktur betreiben müssen.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Wählen Sie Azure Spring Apps nicht für neue Anfängerprojekte: es ist für Neukunden geschlossen und [wird am 31. März 2028 eingestellt](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Bevorzugen Sie unterstützte Alternativen wie Container Apps und planen Sie Migrationen für bestehende Deployments.

## 🗃️ Datenbankbereitstellung

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
**Fragmentvoraussetzungen:** Deklarieren Sie `@secure() param databasePassword string` und verwenden Sie einen starken bereitgestellten Wert. Wählen Sie öffentlichen Zugriff **oder** integrieren Sie das untenstehende delegierte Subnetz/private DNS; die beiden Schnipsel verbinden sich nicht automatisch miteinander.

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

Die `0.0.0.0`-Regel erlaubt Verbindungen von Azure-Diensten außerhalb Ihres eigenen Abonnements. Es handelt sich nicht um private Vernetzung; bevorzugen Sie für reale Workloads ein eingeschränktes Netzwerkdesign.

## 🔒 Sicherheit und Geheimnisverwaltung

### Key Vault Integration
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

### Managed Identity Konfiguration
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

Bei einer systemzugewiesenen Identität setzen Sie `AZURE_CLIENT_ID` nicht auf deren Principal-ID. Eine benutzerzugewiesene Identität verwendet ihre **Client-ID**, nicht Objekt-/Principal-ID. Die Key Vault-Referenz benötigt außerdem eine Rollen-Zuweisung für die Vault der App-Identität und Netzwerkzugang.

## 🌍 Networking und Konnektivität

### Virtuelles Netzwerk-Konfiguration
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
**Unvollständiges Architektur-Fragment, kein bereitstellbares Gateway:** Fügen Sie dem VNet einen dedizierten `gateway-subnet` sowie Backend-Pools, HTTP-Einstellungen, Listener, Routing-Regeln mit Prioritäten und ein TLS-Zertifikat (oder autorisierte Key Vault-Referenz) hinzu. Nur das Öffnen von Port 443 konfiguriert kein HTTPS.

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

### Benutzerdefinierte Metriken und Alarme
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

## 🔧 Umgebungspezifische Konfigurationen

### Parameterdateien für verschiedene Umgebungen
Die beiden Dateien unten sind **alternative Parameterdatei-Beispiele**. azd wählt `main.parameters.dev.json` oder `main.parameters.prod.json` nicht automatisch nach Umgebungsname aus. Verwenden Sie die tatsächliche `main.parameters.json` mit Umgebungsersetzungen (z.B. `${APP_SERVICE_SKU=B1}`) und deklarieren bzw. konsumieren Sie jeden Parameter in Bicep.

Beispielinhalt für `infra/main.parameters.dev.json`:

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

Beispielinhalt für `infra/main.parameters.prod.json`:

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

### Bedingte Ressourcenerstellung
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

## 🚀 Fortgeschrittene Bereitstellungsmuster

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

### Infrastrukturtests
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Die Bereitstellung von Infrastruktur setzt Ihren Anwendungscode nicht ein. Führen Sie Anwendungstests nur nach `azd deploy`/`azd up` aus, und verwenden Sie `/health` nur, wenn Ihre App es implementiert. ARM-Bereitstellungsskripte erstellen Azure-Ressourcen und benötigen zusätzliche Identität, unterstützte Runtime-Versionen und Berechtigungen; sie sind keine lokalen Unit-Tests.

## 🧪 Infrastruktur-Vorschau und Validierung (NEU)

### Infrastrukturänderungen vor der Bereitstellung anzeigen

Die `azd provision --preview`-Funktion ermöglicht es Ihnen, die **Infrastruktur-Bereitstellung zu simulieren**, bevor Ressourcen tatsächlich bereitgestellt werden. Es ist ähnlich wie `terraform plan` oder `bicep what-if` und bietet Ihnen eine **Trockendurchlauf-Ansicht** der vorgeschlagenen Änderungen an Ihrer Azure-Umgebung.

#### 🛠️ Was es macht
- **Analysiert Ihre IaC-Templates** (Bicep oder Terraform)
- **Zeigt eine Vorschau der Ressourcenänderungen**: Hinzufügungen, Löschungen, Aktualisierungen
- **Wendet die vorgeschlagenen Infrastrukturänderungen des Anbieters nicht an** — überprüfen Sie zuerst Projekthooks; Skripte können Nebeneffekte haben und die Vorschau erfordert dennoch Azure-Berechtigungen

#### Anwendungsfälle
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

Dieser Befehl hilft Ihnen:
- **Infrastrukturänderungen vor Einbindung validieren**
- **Fehlkonfigurationen früh im Entwicklungszyklus erkennen**
- **Sicher im Team zusammenarbeiten**
- **Minimalprivilegien-Bereitstellungen ohne Überraschungen sicherstellen**

Er ist besonders nützlich bei:
- Arbeit mit komplexen Multi-Service-Umgebungen
- Änderungen an Produktionsinfrastruktur
- Validierung von Template-Änderungen vor PR-Freigabe
- Schulung neuer Teammitglieder zu Infrastrukturmustern

### Beispiel für Vorschau-Ausgabe
Die genaue Vorschau-Ausgabe variiert je nach Anbieter und Projektstruktur, aber das Ergebnis sollte die vorgeschlagenen Änderungen klar erkennen lassen, bevor etwas angewendet wird.

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

## 🔄 Ressourcen-Updates und Migrationen

### Sichere Ressourcen-Updates
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

### Datenbankmigrationen
**Unvollständiges Deployment-Skriptmuster:** Erfordert eine konfigurierte benutzerzugewiesene Identität, eine unterstützte Azure CLI Runtime, verfügbare Migrationstools, ein bereitgestelltes Migrationsverzeichnis/-konfiguration und Datenbankverbindung. Es ist nicht allein durch Einfügen dieser Ressource in ein Template ausführbar.

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

## 🎯 Best Practices

### 1. Benennungskonventionen für Ressourcen
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Tagging-Strategie
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

### 3. Parameter-Validierung
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

- [Planung vor der Bereitstellung](../chapter-06-pre-deployment/capacity-planning.md) - Verfügbarkeit von Ressourcen prüfen
- [Häufige Probleme](../chapter-07-troubleshooting/common-issues.md) - Infrastrukturprobleme beheben
- [Debugging-Leitfaden](../chapter-07-troubleshooting/debugging.md) - Fehlerbehebung bei Bereitstellungsproblemen
- [SKU-Auswahl](../chapter-06-pre-deployment/sku-selection.md) - Geeignete Service-Tarife auswählen

## Weitere Ressourcen

- [Azure Bicep Dokumentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Vorlagen](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architekturzentrum](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigation**
- **Vorherige Lektion**: [Bereitstellungsanleitung](deployment-guide.md)
- **Nächste Lektion**: [Kapazitätsplanung](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
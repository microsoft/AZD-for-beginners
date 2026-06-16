# Provisioning Azure Resources with AZD

**Chapter Navigation:**
- **📚 Inicio del curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo actual**: Capítulo 4 - Infraestructura como Código y Despliegue
- **⬅️ Anterior**: [Guía de Despliegue](deployment-guide.md)
- **➡️ Próximo Capítulo**: [Capítulo 5: Soluciones de IA Multi-Agente](../../examples/retail-scenario.md)
- **🔧 Relacionado**: [Capítulo 6: Validación Previa al Despliegue](../chapter-06-pre-deployment/capacity-planning.md)

## Introducción

Esta guía completa cubre todo lo que necesitas saber sobre aprovisionamiento y gestión de recursos de Azure usando Azure Developer CLI. Aprende a implementar patrones de Infraestructura como Código (IaC) desde la creación básica de recursos hasta arquitecturas de infraestructura avanzadas de grado empresarial usando Bicep, plantillas ARM, Terraform y Pulumi.

## Objetivos de aprendizaje

Al completar esta guía, tú:
- Dominarás los principios de Infraestructura como Código y el aprovisionamiento de recursos en Azure
- Comprenderás los múltiples proveedores IaC soportados por Azure Developer CLI
- Diseñarás e implementarás plantillas Bicep para arquitecturas de aplicación comunes
- Configurarás parámetros de recursos, variables y ajustes específicos por entorno
- Implementarás patrones de infraestructura avanzados, incluyendo redes y seguridad
- Gestionarás el ciclo de vida de los recursos, actualizaciones y resolución de dependencias

## Resultados de aprendizaje

Al finalizar, serás capaz de:
- Diseñar y aprovisionar infraestructura de Azure usando Bicep y plantillas ARM
- Configurar arquitecturas complejas multi-servicio con dependencias de recursos apropiadas
- Implementar plantillas parametrizadas para múltiples entornos y configuraciones
- Solucionar problemas de aprovisionamiento de infraestructura y resolver fallos de despliegue
- Aplicar los principios del Azure Well-Architected Framework al diseño de infraestructura
- Gestionar actualizaciones de infraestructura e implementar estrategias de versionado de infraestructura

## Visión general del aprovisionamiento de infraestructura

Azure Developer CLI soporta múltiples proveedores de Infraestructura como Código (IaC):
- **Bicep** (recomendado) - lenguaje específico de dominio de Azure
- **ARM Templates** - plantillas de Azure Resource Manager basadas en JSON
- **Terraform** - herramienta de infraestructura multi-nube
- **Pulumi** - infraestructura como código moderna con lenguajes de programación

## Comprendiendo los recursos de Azure

### Jerarquía de recursos
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Servicios comunes de Azure para aplicaciones
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Plantillas de infraestructura Bicep

### Estructura básica de una plantilla Bicep
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

### Patrones avanzados de Bicep

#### Infraestructura modular
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

#### Creación condicional de recursos
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

## 🌐 Usando Terraform con azd

Bicep es el valor por defecto de azd, pero azd también soporta **Terraform**—útil si tu equipo ya lo estandariza o gestionas infraestructura multi-nube. El flujo de trabajo de azd (`azd up`, `azd provision`, `azd down`) es idéntico; solo cambia el lenguaje de infraestructura y la estructura de carpetas.

### Indicar a azd que use Terraform

Agrega una sección `infra` a `azure.yaml` apuntando al proveedor Terraform:

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

### Estructura de carpetas para Terraform

Con el proveedor Terraform, tu carpeta `infra/` usa archivos `.tf` en lugar de Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Un `main.tf` mínimo

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

### Cómo azd se conecta a tus outputs de Terraform

azd lee los **outputs** de Terraform para conocer tus endpoints y para conectar valores de entorno de vuelta en tu aplicación. Los nombres de los outputs importan—azd busca nombres específicos:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Importante:** azd usa la etiqueta `azd-env-name` y los outputs `AZURE_*` para rastrear recursos por entorno. Siempre etiqueta tu grupo de recursos con `"azd-env-name" = var.environment_name` para que `azd down` pueda encontrar y eliminar todo.

### Desplegar con Terraform

Los comandos son exactamente los mismos que con Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd ejecuta 'terraform plan' internamente
azd up                    # aprovisionar + desplegar
azd down --force          # destruye los recursos gestionados por Terraform
```

> **Requisito previo:** Terraform debe estar instalado y en tu `PATH`. azd gestiona el *flujo de trabajo* de Terraform pero no instala Terraform por ti. Para el estado, azd usa por defecto estado local; para equipos, configura un backend remoto (por ejemplo, un backend de Azure Storage) en `provider.tf`.

Para starters completos y ejecutables basados en Terraform, revisa la [Awesome AZD gallery](https://azure.github.io/awesome-azd/) y filtra por Terraform, o consulta la documentación oficial de [azd Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Usando Pulumi con azd

Si tu equipo escribe infraestructura en un lenguaje de propósito general (TypeScript, Python, Go o C#) en lugar de un DSL, azd también soporta **Pulumi**. Como con Terraform, el flujo `azd up` / `azd provision` / `azd down` no cambia—solo difiere la herramienta de infraestructura y la estructura de carpetas.

### Indicar a azd que use Pulumi

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

### Estructura de carpetas para Pulumi

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### Un `index.ts` mínimo

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// Etiqueta cada recurso para que azd pueda rastrearlos y eliminarlos
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd lee estas salidas de nuevo en tu entorno
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Los stacks se mapean a los entornos de azd

Pulumi organiza despliegues en **stacks**, y azd mapea cada entorno de azd a un stack de Pulumi con el mismo nombre. Cuando ejecutas `azd env new staging`, azd selecciona (o crea) el stack de Pulumi `staging`. Se aplican las mismas reglas de etiquetado `azd-env-name` y outputs `AZURE_*`, para que `azd down` pueda encontrar y eliminar todo.

### Desplegar con Pulumi

```bash
azd auth login
azd env new dev
azd provision --preview   # azd ejecuta 'pulumi preview' internamente
azd up                    # aprovisionar + desplegar
azd down --force          # ejecuta 'pulumi destroy'
```

> **Requisito previo:** Pulumi debe estar instalado y en tu `PATH`, y necesitarás un backend de estado (Pulumi Cloud o un backend autogestionado como Azure Blob Storage). azd gestiona el *flujo de trabajo* de Pulumi, no la instalación. Consulta la documentación oficial de [azd Pulumi](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 Elegir un host para tu servicio

El campo `host` en `azure.yaml` decide dónde se ejecuta tu código. azd soporta varios hosts—elegir el correcto importa más que el lenguaje de infraestructura. Aquí hay una comparación para principiantes:

| `host` value | Best for | Why |
|--------------|----------|-----|
| `appservice` | Aplicaciones web y APIs tradicionales | PaaS más sencillo; no se requieren contenedores |
| `staticwebapp` | SPAs de front-end (React, Vue, Angular) | CDN global + SSL gratis, soporte de API integrado |
| `function` | Cargas de trabajo event-driven y sin servidor | Escalado a cero, pago por ejecución |
| `containerapp` | Microservicios en contenedores | Contenedores serverless, escalado a cero, ingreso integrado |
| `aks` | Necesidades complejas de orquestación | Control completo de Kubernetes cuando realmente lo necesitas |
| `springapp` | Aplicaciones Java Spring Boot | Runtime administrado de Azure Spring Apps ajustado para Spring |

### Cuándo optar por AKS

**Azure Kubernetes Service (`host: aks`)** te da el poder completo de Kubernetes—controladores personalizados, service meshes, redes complejas y programación detallada. Ese poder trae sobrecarga operativa: gestionas pools de nodos, actualizaciones y la red del clúster.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Empieza más simple si puedes.** Para la mayoría de microservicios, **Container Apps** te ofrece contenedores, escalado automático y escalado a cero sin gestionar un clúster. Elige AKS solo cuando necesites características específicas de Kubernetes.

### Cuándo usar Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** es un runtime administrado diseñado para Spring Boot. Maneja discovery de servicios, config server y despliegues blue-green para que los equipos Java no gestionen su propia infraestructura.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Usa `springapp` cuando tengas apps Spring Boot existentes y quieras un runtime optimizado para ellas. Para nuevas apps Java conteinerizadas sin necesidades específicas de Spring, `containerapp` suele ser la opción más simple.

## 🗃️ Aprovisionamiento de bases de datos

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

## 🔒 Seguridad y gestión de secretos

### Integración con Key Vault
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

### Configuración de Managed Identity
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

## 🌍 Redes y conectividad

### Configuración de Virtual Network
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

### Application Gateway con SSL
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

## 📊 Monitorización y observabilidad

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

### Métricas personalizadas y alertas
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

## 🔧 Configuraciones específicas por entorno

### Archivos de parámetros para diferentes entornos
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

### Aprovisionamiento condicional de recursos
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

## 🚀 Patrones avanzados de aprovisionamiento

### Despliegue multi-región
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

### Pruebas de infraestructura
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

## 🧪 Vista previa y validación de infraestructura (NUEVO)

### Previsualiza los cambios de infraestructura antes del despliegue

La característica `azd provision --preview` te permite **simular el aprovisionamiento de infraestructura** antes de desplegar realmente los recursos. Es similar en espíritu a `terraform plan` o `bicep what-if`, ofreciéndote una **vista de ejecución en seco** de qué cambios se harían en tu entorno de Azure.

#### 🛠️ Qué hace
- **Analiza tus plantillas IaC** (Bicep o Terraform)
- **Muestra una vista previa de los cambios de recursos**: adiciones, eliminaciones, actualizaciones
- **No aplica cambios** — es de solo lectura y seguro de ejecutar

#### Casos de uso
```bash
# Vista previa de los cambios en la infraestructura antes del despliegue
azd provision --preview

# Vista previa para un entorno específico
azd provision --preview -e production
```

Este comando te ayuda a:
- **Validar cambios de infraestructura** antes de comprometer recursos
- **Detectar errores de configuración temprano** en el ciclo de desarrollo
- **Colaborar de forma segura** en entornos de equipo
- **Asegurar despliegues con mínimo privilegio** sin sorpresas

Es especialmente útil cuando:
- Trabajas con entornos complejos multi-servicio
- Realizas cambios en infraestructura de producción
- Validás modificaciones de plantillas antes de la aprobación de un PR
- Capacitas a nuevos miembros del equipo en patrones de infraestructura

### Ejemplo de salida de la vista previa
La salida exacta de la vista previa varía según el proveedor y la estructura del proyecto, pero el resultado debe identificar claramente los cambios propuestos antes de aplicar nada.

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

## �🔄 Actualizaciones y migraciones de recursos

### Actualizaciones seguras de recursos
```bash
# Previsualice primero los cambios en la infraestructura (RECOMENDADO)
azd provision --preview

# Aplique los cambios después de confirmar la vista previa
azd provision --confirm-with-no-prompt

# Para revertir, use Git para deshacer los cambios en la infraestructura:
git revert HEAD  # Revertir el último commit de infraestructura
azd provision    # Aplicar el estado anterior de la infraestructura
```

### Migraciones de bases de datos
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

## 🎯 Mejores prácticas

### 1. Convenciones de nombres de recursos
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Estrategia de etiquetado
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

### 3. Validación de parámetros
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

### 4. Organización de outputs
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

## Siguientes pasos

- [Planificación previa al despliegue](../chapter-06-pre-deployment/capacity-planning.md) - Validar disponibilidad de recursos
- [Problemas comunes](../chapter-07-troubleshooting/common-issues.md) - Solucionar problemas de infraestructura
- [Guía de depuración](../chapter-07-troubleshooting/debugging.md) - Depurar problemas de aprovisionamiento
- [Selección de SKU](../chapter-06-pre-deployment/sku-selection.md) - Elegir niveles de servicio apropiados

## Recursos adicionales

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navegación**
- **Lección anterior**: [Guía de Despliegue](deployment-guide.md)
- **Próxima lección**: [Planificación de capacidad](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
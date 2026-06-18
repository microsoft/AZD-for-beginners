# Provisionamento de Recursos do Azure com AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD Para Iniciantes](../../README.md)
- **📖 Current Chapter**: Capítulo 4 - Infraestrutura como Código & Implantação
- **⬅️ Previous**: [Guia de Implantação](deployment-guide.md)
- **➡️ Next Chapter**: [Capítulo 5: Soluções de IA Multi-Agente](../../examples/retail-scenario.md)
- **🔧 Related**: [Capítulo 6: Validação Pré-Implantação](../chapter-06-pre-deployment/capacity-planning.md)

## Introdução

Este guia abrangente cobre tudo o que você precisa saber sobre provisionamento e gerenciamento de recursos do Azure usando o Azure Developer CLI. Aprenda a implementar padrões de Infraestrutura como Código (IaC) desde a criação básica de recursos até arquiteturas de infraestrutura de nível empresarial usando Bicep, ARM templates, Terraform e Pulumi.

## Objetivos de Aprendizagem

Ao concluir este guia, você irá:
- Dominar os princípios de Infraestrutura como Código e o provisionamento de recursos do Azure
- Compreender múltiplos provedores IaC suportados pelo Azure Developer CLI
- Projetar e implementar templates Bicep para arquiteturas de aplicações comuns
- Configurar parâmetros de recursos, variáveis e configurações específicas de ambiente
- Implementar padrões avançados de infraestrutura incluindo rede e segurança
- Gerenciar o ciclo de vida dos recursos, atualizações e resolução de dependências

## Resultados de Aprendizagem

Ao finalizar, você será capaz de:
- Projetar e provisionar infraestrutura do Azure usando Bicep e ARM templates
- Configurar arquiteturas complexas multi-serviço com dependências de recursos adequadas
- Implementar templates parametrizados para múltiplos ambientes e configurações
- Solucionar problemas de provisionamento de infraestrutura e resolver falhas de implantação
- Aplicar os princípios do Azure Well-Architected Framework ao design da infraestrutura
- Gerenciar atualizações de infraestrutura e implementar estratégias de versionamento de infraestrutura

## Visão Geral do Provisionamento de Infraestrutura

Azure Developer CLI suporta múltiplos provedores de Infrastructure as Code (IaC):
- **Bicep** (recomendado) - linguagem específica de domínio da Azure
- **ARM Templates** - templates Azure Resource Manager baseados em JSON
- **Terraform** - ferramenta de infraestrutura multi-cloud
- **Pulumi** - infraestrutura como código moderna com linguagens de programação

## Entendendo os Recursos do Azure

### Hierarquia de Recursos
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Serviços Comuns do Azure para Aplicações
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Templates de Infraestrutura Bicep

### Estrutura Básica de Template Bicep
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

### Padrões Avançados de Bicep

#### Infraestrutura Modular
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

#### Criação Condicional de Recursos
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

## 🌐 Usando Terraform com azd

Bicep é o padrão do azd, mas o azd também suporta **Terraform**—útil se sua equipe já padroniza nele ou você gerencia infraestrutura multi-cloud. O fluxo de trabalho do azd (`azd up`, `azd provision`, `azd down`) é idêntico; apenas a linguagem de infraestrutura e o layout de pastas mudam.

### Diga ao azd para usar Terraform

Adicione uma seção `infra` ao `azure.yaml` apontando para o provedor Terraform:

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

### Layout de pastas do Terraform

Com o provedor Terraform, sua pasta `infra/` usa arquivos `.tf` em vez de Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Um `main.tf` mínimo

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

### Como o azd se conecta aos outputs do Terraform

O azd lê os **outputs** do Terraform para descobrir seus endpoints e para propagar valores de ambiente de volta ao seu app. Os nomes dos outputs importam—o azd procura por nomes específicos:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Importante:** azd usa a tag `azd-env-name` e os outputs `AZURE_*` para rastrear recursos por ambiente. Sempre marque seu resource group com `"azd-env-name" = var.environment_name` para que `azd down` possa encontrar e remover tudo.

### Implantar com Terraform

Os comandos são exatamente os mesmos que no Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd executa 'terraform plan' nos bastidores
azd up                    # provisionamento + implantação
azd down --force          # destrói os recursos gerenciados pelo Terraform
```

> **Pré-requisito:** Terraform deve estar instalado e disponível no seu `PATH`. azd gerencia o *workflow* do Terraform mas não instala o Terraform para você. Para state, o azd usa por padrão state local; para equipes, configure um backend remoto (por exemplo, um backend do Azure Storage) em `provider.tf`.

Para starters completos e executáveis baseados em Terraform, navegue pela [Awesome AZD gallery](https://azure.github.io/awesome-azd/) e filtre por Terraform, ou consulte a [documentação azd Terraform oficial](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Usando Pulumi com azd

Se sua equipe escreve infraestrutura em uma linguagem de uso geral (TypeScript, Python, Go ou C#) em vez de uma DSL, o azd também suporta **Pulumi**. Assim como no Terraform, o fluxo `azd up` / `azd provision` / `azd down` permanece inalterado—apenas as ferramentas de infraestrutura e o layout de pastas diferem.

### Diga ao azd para usar Pulumi

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

### Layout de pastas do Pulumi

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### Um `index.ts` mínimo

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// Marque todos os recursos para que o azd possa rastreá-los e removê-los
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd lê essas saídas de volta para o seu ambiente
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stacks mapeiam para ambientes azd

O Pulumi organiza implantações em **stacks**, e o azd mapeia cada ambiente azd para um stack Pulumi com o mesmo nome. Quando você executa `azd env new staging`, o azd seleciona (ou cria) o stack Pulumi `staging`. As mesmas regras de marcação `azd-env-name` e outputs `AZURE_*` se aplicam, para que `azd down` possa encontrar e remover tudo.

### Implantar com Pulumi

```bash
azd auth login
azd env new dev
azd provision --preview   # azd executa 'pulumi preview' por baixo do capô
azd up                    # provisionar + implantar
azd down --force          # executa 'pulumi destroy'
```

> **Pré-requisito:** Pulumi deve estar instalado e disponível no seu `PATH`, e você precisará de um backend de state (Pulumi Cloud ou um backend auto-gerenciado como Azure Blob Storage). azd gerencia o *workflow* do Pulumi, não a instalação. Consulte a [documentação azd Pulumi oficial](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 Escolhendo um Host para Seu Serviço

O campo `host` em `azure.yaml` decide onde seu código executa. azd suporta vários hosts—escolher o certo importa mais do que a linguagem de infraestrutura. Aqui está uma comparação amigável para iniciantes:

| `host` value | Ideal para | Por quê |
|--------------|------------|--------|
| `appservice` | Aplicações web tradicionais e APIs | PaaS mais simples; nenhum container necessário |
| `staticwebapp` | SPAs front-end (React, Vue, Angular) | CDN global + SSL gratuito, suporte a API embutido |
| `function` | Workloads orientados a eventos e serverless | Escala até zero, paga por execução |
| `containerapp` | Microserviços conteinerizados | Containers serverless, escala até zero, ingress embutido |
| `aks` | Necessidades complexas de orquestração | Controle total do Kubernetes quando realmente necessário |
| `springapp` | Aplicações Java Spring Boot | Runtime gerenciado do Azure Spring Apps otimizado para Spring |

### Quando optar pelo AKS

**Azure Kubernetes Service (`host: aks`)** oferece todo o poder do Kubernetes—controladores personalizados, service meshes, rede complexa e agendamento granular. Esse poder vem com sobrecarga operacional: você gerencia node pools, atualizações e a rede do cluster.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Comece mais simples se puder.** Para a maioria dos microserviços, **Container Apps** fornece containers, autoescalonamento e escala até zero sem gerenciar um cluster. Escolha AKS apenas quando precisar de recursos específicos do Kubernetes.

### Quando usar Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** é um runtime gerenciado projetado para Spring Boot. Ele lida com service discovery, config server e implantações blue-green para que equipes Java não precisem rodar sua própria infraestrutura.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Use `springapp` quando você tiver aplicações Spring Boot existentes e quiser um runtime ajustado para elas. Para novas aplicações Java conteinerizadas sem necessidades específicas do Spring, `containerapp` costuma ser a escolha mais simples.

## 🗃️ Provisionamento de Banco de Dados

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

## 🔒 Segurança e Gerenciamento de Segredos

### Integração com Key Vault
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

### Configuração de Identidade Gerenciada
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

## 🌍 Rede e Conectividade

### Configuração de Rede Virtual
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

### Application Gateway com SSL
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

## 📊 Monitoramento e Observabilidade

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

### Métricas Personalizadas e Alertas
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

## 🔧 Configurações Específicas por Ambiente

### Arquivos de Parâmetros para Diferentes Ambientes
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

### Provisionamento Condicional de Recursos
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

## 🚀 Padrões Avançados de Provisionamento

### Implantação Multi-Região
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

### Testes de Infraestrutura
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

## 🧪 Pré-visualização e Validação de Infraestrutura (NOVO)

### Pré-visualizar Alterações de Infraestrutura Antes da Implantação

O recurso `azd provision --preview` permite **simular o provisionamento de infraestrutura** antes de realmente implantar recursos. É similar em espírito ao `terraform plan` ou `bicep what-if`, oferecendo uma **visão dry-run** do que seria alterado no seu ambiente Azure.

#### 🛠️ O que isso faz
- **Analisa seus templates IaC** (Bicep ou Terraform)
- **Mostra uma pré-visualização das mudanças nos recursos**: adições, exclusões, atualizações
- **Não aplica mudanças** — é somente leitura e seguro de executar

#### Casos de Uso
```bash
# Visualizar alterações na infraestrutura antes da implantação
azd provision --preview

# Pré-visualização para um ambiente específico
azd provision --preview -e production
```

Este comando ajuda você a:
- **Validar mudanças de infraestrutura** antes de comprometer recursos
- **Detectar má-configuração cedo** no ciclo de desenvolvimento
- **Colaborar com segurança** em ambientes de equipe
- **Garantir implantações com princípio de menor privilégio** sem surpresas

É especialmente útil quando:
- Trabalhando com ambientes multi-serviço complexos
- Fazendo mudanças na infraestrutura de produção
- Validando modificações de templates antes da aprovação de PR
- Treinando novos membros da equipe em padrões de infraestrutura

### Exemplo de Saída da Pré-visualização
A saída exata da pré-visualização varia conforme o provedor e a estrutura do projeto, mas o resultado deve identificar claramente as mudanças propostas antes de qualquer aplicação.

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

## �🔄 Atualizações e Migrações de Recursos

### Atualizações Seguras de Recursos
```bash
# Visualize primeiro as alterações na infraestrutura (RECOMENDADO)
azd provision --preview

# Aplique as alterações após a confirmação da pré-visualização
azd provision --confirm-with-no-prompt

# Para rollback, use o Git para reverter as alterações na infraestrutura:
git revert HEAD  # Reverta o último commit da infraestrutura
azd provision    # Aplique o estado anterior da infraestrutura
```

### Migrações de Banco de Dados
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

## 🎯 Melhores Práticas

### 1. Convenções de Nomes de Recursos
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Estratégia de Tags
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

### 3. Validação de Parâmetros
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

### 4. Organização de Outputs
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

## Próximos Passos

- [Planejamento Pré-implantação](../chapter-06-pre-deployment/capacity-planning.md) - Validar disponibilidade de recursos
- [Problemas Comuns](../chapter-07-troubleshooting/common-issues.md) - Solucionar problemas de infraestrutura
- [Guia de Depuração](../chapter-07-troubleshooting/debugging.md) - Depurar problemas de provisionamento
- [Seleção de SKU](../chapter-06-pre-deployment/sku-selection.md) - Escolher níveis de serviço apropriados

## Recursos Adicionais

- [Documentação do Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Modelos do Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Centro de Arquitetura do Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Framework Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navegação**
- **Lição Anterior**: [Guia de Implantação](deployment-guide.md)
- **Próxima Lição**: [Planejamento de Capacidade](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
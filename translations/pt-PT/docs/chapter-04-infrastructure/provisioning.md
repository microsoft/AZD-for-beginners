# Aprovisionamento de Recursos Azure com AZD

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 4 - Infraestrutura como Código e Implementação
- **⬅️ Anterior**: [Guia de Implementação](deployment-guide.md)
- **➡️ Próximo Capítulo**: [Capítulo 5: Soluções de IA Multi-Agente](../../examples/retail-scenario.md)
- **🔧 Relacionado**: [Capítulo 6: Validação Pré-Implementação](../chapter-06-pre-deployment/capacity-planning.md)

## Introdução

Este guia aborda o aprovisionamento e a gestão de recursos Azure usando Azure Developer CLI com os seus provedores incorporados Bicep e Terraform.

> Revisado com base em `azd 1.37.2` (novembro de 2026). A menos que indicado de outra forma, Bicep, Terraform e exemplos de scripts são **fragmentos ilustrativos**, não um modelo completo. Integre-os num projeto que forneça os parâmetros, módulos, identidades, rede e código da aplicação referenciados. O aprovisionamento Azure não foi executado nesta revisão.

## Objetivos de Aprendizagem

Ao completar este guia, você irá:
- Dominar os princípios de Infraestrutura como Código e o aprovisionamento de recursos Azure
- Compreender múltiplos provedores IaC suportados pelo Azure Developer CLI
- Projetar e implementar modelos Bicep para arquiteturas comuns de aplicações
- Configurar parâmetros de recursos, variáveis e definições específicas de ambiente
- Implementar padrões avançados de infraestrutura incluindo rede e segurança
- Gerir o ciclo de vida dos recursos, atualizações e resolução de dependências

## Resultados Esperados

Após a conclusão, será capaz de:
- Projetar e aprovisionar infraestrutura Azure usando templates Bicep e ARM
- Configurar arquiteturas multi-serviço complexas com dependências corretas entre recursos
- Implementar templates parametrizados para múltiplos ambientes e configurações
- Diagnosticar problemas no aprovisionamento e resolver falhas de implementação
- Aplicar os princípios do Azure Well-Architected Framework ao design da infraestrutura
- Gerir atualizações de infraestrutura e implementar estratégias de versionamento

## Visão Geral do Aprovisionamento de Infraestrutura

O Azure Developer CLI suporta múltiplos provedores de Infraestrutura como Código (IaC):
- **Bicep** (recomendado) - linguagem específica do domínio do Azure
- **Modelos ARM** - Bicep compila para ARM; o JSON ARM cru não é um provedor incorporado separado `infra.provider`
- **Terraform** - ferramenta multi-cloud para infraestrutura
- **Provedores de extensão** - requerem uma extensão de provedor instalada separadamente e sua configuração documentada; não assuma que qualquer string de provedor seja suportada

## Compreender Recursos Azure

### Hierarquia de Recursos
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Serviços Azure Comuns para Aplicações
- **Computação**: App Service, Container Apps, Functions, Máquinas Virtuais
- **Armazenamento**: Conta de Armazenamento, Cosmos DB, Base de Dados SQL, PostgreSQL
- **Rede**: Rede Virtual, Application Gateway, CDN
- **Segurança**: Key Vault, Application Insights, Log Analytics
- **IA/ML**: Serviços Azure AI, Azure OpenAI, Azure Machine Learning

## Modelos de Infraestrutura Bicep

### Estrutura Básica de um Template Bicep
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

Para um projeto azd completo, invoque este módulo de um `infra/main.bicep` ao nível da subscrição que cria um grupo de recursos etiquetado e passa o seu âmbito. Combine `environmentName`/`location` em `main.parameters.json`. A etiqueta `azd-service-name: web` associa o recurso com `services.web`; nomes arbitrários de saída isolados não configuram descoberta de serviço.

### Padrões Avançados Bicep

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

## 🌐 Uso do Terraform com azd

Bicep é o padrão do azd, mas o azd também suporta **Terraform**—útil se sua equipa já padroniza nele ou se você gere infraestrutura multi-cloud. O fluxo de trabalho azd (`azd up`, `azd provision`, `azd down`) é idêntico; só muda a linguagem de infraestrutura e a organização das pastas.

### Dizer ao azd para usar Terraform

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

### Organização da pasta Terraform

Com o provedor Terraform, a sua pasta `infra/` usa ficheiros `.tf` em vez de Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Um fragmento `main.tf`

Isto apenas cria um grupo de recursos e plano, não um serviço implementável. Você também deve declarar variáveis de entrada, um provedor `azurerm` compatível, a aplicação web e o seu mapeamento de etiquetas/nomes de recursos do serviço.

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

### Como o azd conecta-se às suas saídas Terraform

azd lê os **outputs** do Terraform para valores de ambiente. Este fragmento assume que você definiu `azurerm_linux_web_app.web`; a descoberta de serviço ainda requer um nome de recurso correspondente ou etiqueta `azd-service-name`:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Importante:** o azd usa a etiqueta `azd-env-name` e outputs `AZURE_*` para rastrear recursos por ambiente. Sempre etiqueta o seu grupo de recursos com `"azd-env-name" = var.environment_name` para que `azd down` possa encontrar e remover tudo.

### Implementar com Terraform

Os comandos são exatamente iguais aos do Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Pré-requisito:** Terraform deve estar instalado e disponível no seu `PATH`. azd gere o *fluxo de trabalho* Terraform mas não instala o Terraform por si. Para estado, azd usa estado local por defeito; para equipas, configure um backend remoto (por exemplo, backend Azure Storage) em `provider.tf`.

Para exemplos completos e executáveis baseados em Terraform, explore a [galeria Awesome AZD](https://azure.github.io/awesome-azd/) e filtre por Terraform, ou consulte a documentação oficial [azd Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Outras Ferramentas de Infraestrutura

Pulumi não é um provedor de aprovisionamento incorporado no azd 1.37.2. Definir `infra.provider: pulumi` sozinho não estabelece uma integração funcional, e `azd env new` não cria/seleciona automaticamente uma stack Pulumi. Se usar outra ferramenta IaC, siga a documentação verificada da extensão do provedor ou gestione explicitamente seu ciclo de vida no seu fluxo de trabalho. Este curso não fornece nem valida um provedor Pulumi.

## 🎯 Escolhendo um Host para o Seu Serviço

O campo `host` em `azure.yaml` decide onde o seu código será executado. azd suporta vários hosts—escolher o correto é mais importante que a linguagem de infraestrutura. Aqui está uma comparação amigável para iniciantes:

| Valor `host` | Melhor para | Porquê |
|--------------|----------|-----|
| `appservice` | Apps web tradicionais e APIs | PaaS mais simples; sem contêineres necessários |
| `staticwebapp` | SPAs front-end (React, Vue, Angular) | CDN global + SSL grátis, suporte API embutido |
| `function` | Cargas orientadas a eventos e sem servidor | Scale-to-zero, paga por execução |
| `containerapp` | Microsserviços conteinerizados | Contêineres serverless, scale-to-zero, ingress embutido |
| `aks` | Necessidades complexas de orquestração | Controle completo Kubernetes quando realmente precisa |
| `springapp` | Implementações Azure Spring Apps existentes | Destino legado; serviço encerra em 31 de março de 2028 e não aceita novos clientes |

### Quando optar pelo AKS

**Azure Kubernetes Service (`host: aks`)** oferece o poder completo do Kubernetes—controladores customizados, malhas de serviço, rede complexa e agendamento detalhado. Esse poder traz overhead operacional: você gere pools de nós, atualizações e rede do cluster.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Comece por soluções mais simples se puder.** Para a maioria dos microsserviços, **Container Apps** oferece contêineres, autoescalamento e scale-to-zero sem precisar gerir um cluster. Escolha AKS apenas se precisar de funcionalidades específicas do Kubernetes.

### Quando usar Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** é um runtime gerido construído especialmente para Spring Boot. Ele gere descoberta de serviço, servidor de configs e deployments blue-green para que equipas Java não precisem gerir sua infraestrutura.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Não selecione Azure Spring Apps para um projeto iniciante novo: está encerrado para novos clientes e [será descontinuado em 31 de março de 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Prefira alternativas suportadas como Container Apps e planeie migrações para implementações existentes.

## 🗃️ Aprovisionamento de Base de Dados

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
**Pré-requisitos do fragmento:** declare `@secure() param databasePassword string` e use um valor forte fornecido. Escolha acesso público **ou** integre a sub-rede delegada/DNS privado abaixo; os dois fragmentos não se conectam automaticamente.

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

A regra `0.0.0.0` permite conexões de serviços Azure além da sua subscrição. Não é rede privada; prefira um design de rede restrito para cargas reais.

## 🔒 Segurança e Gestão de Segredos

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

### Configuração de Identidade Gerida
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

Para uma identidade atribuída pelo sistema, não defina `AZURE_CLIENT_ID` para o seu ID principal. Uma identidade atribuída pelo utilizador usa o seu **client ID**, não o objecto/ID principal. A referência Key Vault também requer a atribuição da função do cofre à identidade da app e acesso de rede.

## 🌍 Rede e Conectividade

### Configuração da Rede Virtual
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
**Fragmento de arquitetura incompleto, não um gateway implementável:** adicione um `gateway-subnet` dedicado à VNet além de pools backend, configurações HTTP, listeners, regras de roteamento com prioridades e certificado TLS (ou referência autorizada no Key Vault). Apenas abrir a porta 443 não configura HTTPS.

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

## 📊 Monitorização e Observabilidade

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

## 🔧 Configurações Específicas de Ambiente

### Ficheiros de Parâmetros para Diferentes Ambientes
Os dois ficheiros abaixo são **exemplos alternativos de ficheiros de parâmetros**. azd não seleciona automaticamente `main.parameters.dev.json` ou `main.parameters.prod.json` pelo nome do ambiente. Use o `main.parameters.json` real com substituições de ambiente (por exemplo `${APP_SERVICE_SKU=B1}`) e declare/consuma todos os parâmetros em Bicep.

Conteúdo exemplo para `infra/main.parameters.dev.json`:

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

Conteúdo exemplo para `infra/main.parameters.prod.json`:

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

### Aprovisionamento Condicional de Recursos
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

## 🚀 Padrões Avançados de Aprovisionamento

### Implementação Multi-Região
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
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

O aprovisionamento da infraestrutura não implementa o código da sua aplicação. Execute verificações da aplicação apenas depois de `azd deploy`/`azd up`, e use `/health` só se a sua app o implementar. Scripts de implementação ARM criam recursos Azure e precisam de identidade adicional, versões runtime compatíveis e permissões; não são testes unitários locais.

## 🧪 Pré-visualização e Validação da Infraestrutura (NOVO)

### Pré-visualizar Alterações de Infraestrutura Antes da Implementação

A funcionalidade `azd provision --preview` permite-lhe **simular o aprovisionamento** antes de realmente implementar recursos. Tem um espírito semelhante a `terraform plan` ou `bicep what-if`, dando-lhe uma **vista em modo simulação** das alterações que seriam feitas no seu ambiente Azure.

#### 🛠️ O Que Faz
- **Analisa os seus templates IaC** (Bicep ou Terraform)
- **Mostra uma pré-visualização das alterações dos recursos**: adições, eliminações, atualizações
- **Não aplica as alterações propostas pelo provedor** — inspecione os hooks do projeto primeiro; scripts podem ter efeitos secundários e a pré-visualização ainda requer permissões Azure

#### Casos de Uso
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

Este comando ajuda a:
- **Validar alterações de infraestrutura** antes de aplicar recursos
- **Detectar más configurações cedo** no ciclo de desenvolvimento
- **Colaborar com segurança** em ambientes de equipa
- **Garantir implementações com privilégio mínimo** sem surpresas

É especialmente útil quando:
- Trabalha com ambientes complexos multi-serviço
- Faz alterações na infraestrutura de produção
- Valida modificações de templates antes da aprovação de PR
- Treina novos membros da equipa em padrões de infraestrutura

### Exemplo de Saída da Pré-visualização
A saída exata da pré-visualização varia conforme o provedor e estrutura do projeto, mas o resultado deve identificar claramente as alterações propostas antes de qualquer coisa ser aplicada.

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

## �🔄 Atualizações e Migrações de Recursos

### Atualizações Seguras de Recursos
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

### Migrações de Base de Dados
**Padrão incompleto de script de implementação:** requer uma identidade atribuída pelo utilizador configurada onde necessário, runtime Azure CLI suportado, ferramentas de migração disponíveis, diretório/configuração de migração fornecidos e conectividade de base de dados. Não é executável apenas colando este recurso num template.

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

## 🎯 Melhores Práticas

### 1. Convenções de Nomeação de Recursos
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Estratégia de Etiquetagem
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

### 4. Organização de Saídas
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

- [Planeamento Pré-implementação](../chapter-06-pre-deployment/capacity-planning.md) - Validar disponibilidade de recursos
- [Problemas Comuns](../chapter-07-troubleshooting/common-issues.md) - Diagnosticar problemas de infraestrutura
- [Guia de Depuração](../chapter-07-troubleshooting/debugging.md) - Depurar problemas de provisionamento
- [Seleção de SKU](../chapter-06-pre-deployment/sku-selection.md) - Escolher níveis de serviço apropriados

## Recursos Adicionais

- [Documentação Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Modelos Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Centro de Arquitetura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Framework Azure Bem-Arquitectado](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navegação**
- **Lição Anterior**: [Guia de Implementação](deployment-guide.md)
- **Próxima Lição**: [Planeamento de Capacidade](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
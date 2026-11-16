# Provisionamento de Recursos Azure com AZD

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 4 - Infraestrutura como Código & Implantação
- **⬅️ Anterior**: [Guia de Implantação](deployment-guide.md)
- **➡️ Próximo Capítulo**: [Capítulo 5: Soluções Multi-Agente de IA](../../examples/retail-scenario.md)
- **🔧 Relacionado**: [Capítulo 6: Validação Pré-Implantação](../chapter-06-pre-deployment/capacity-planning.md)

## Introdução

Este guia aborda o provisionamento e gerenciamento de recursos Azure usando o Azure Developer CLI com seus provedores integrados Bicep e Terraform.

> Revisado contra `azd 1.37.2` (novembro de 2026). A menos que indicado o contrário, Bicep, Terraform e os exemplos de scripts são **fragmentos ilustrativos**, não um template completo. Os incorpore em um projeto que forneça os parâmetros referenciados, módulos, identidades, rede e código da aplicação. O provisionamento Azure não foi executado nesta revisão.

## Objetivos de Aprendizagem

Ao concluir este guia, você irá:
- Dominar os princípios de Infraestrutura como Código e provisionamento de recursos Azure
- Entender múltiplos provedores IaC suportados pelo Azure Developer CLI
- Projetar e implementar templates Bicep para arquiteturas comuns de aplicações
- Configurar parâmetros de recurso, variáveis e definições específicas para o ambiente
- Implementar padrões avançados de infraestrutura incluindo rede e segurança
- Gerenciar o ciclo de vida de recursos, atualizações e resolução de dependências

## Resultados de Aprendizagem

Após a conclusão, você será capaz de:
- Projetar e provisionar infraestrutura Azure usando templates Bicep e ARM
- Configurar arquiteturas complexas multi-serviço com dependências de recursos adequadas
- Implementar templates parametrizados para múltiplos ambientes e configurações
- Solucionar problemas de provisionamento de infraestrutura e resolver falhas de implantação
- Aplicar princípios do Azure Well-Architected Framework ao design da infraestrutura
- Gerenciar atualizações de infraestrutura e implementar estratégias de versionamento

## Visão Geral do Provisionamento de Infraestrutura

O Azure Developer CLI suporta múltiplos provedores de Infraestrutura como Código (IaC):
- **Bicep** (recomendado) - linguagem específica de domínio da Azure
- **ARM Templates** - Bicep compila para ARM; JSON ARM bruto não é um `infra.provider` integrado separado
- **Terraform** - ferramenta de infraestrutura multi-nuvem
- **Provedores de extensão** - exigem uma extensão de provedor instalada separadamente e configuração documentada; não assuma que qualquer string de provedor é suportada

## Entendendo Recursos Azure

### Hierarquia de Recursos
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Serviços Azure Comuns para Aplicações
- **Computação**: App Service, Container Apps, Functions, Máquinas Virtuais
- **Armazenamento**: Conta de Armazenamento, Cosmos DB, Banco de Dados SQL, PostgreSQL
- **Rede**: Rede Virtual, Application Gateway, CDN
- **Segurança**: Key Vault, Application Insights, Log Analytics
- **IA/ML**: Serviços Azure AI, Azure OpenAI, Azure Machine Learning

## Templates de Infraestrutura Bicep

### Estrutura Básica do Template Bicep
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

Para um projeto azd completo, chame este módulo a partir de um `infra/main.bicep` com escopo de assinatura que cria um grupo de recursos com tags e passa seu escopo. Combine `environmentName`/`location` em `main.parameters.json`. A tag `azd-service-name: web` associa o recurso a `services.web`; apenas nomes arbitrários de saída não configuram a descoberta de serviço.

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

## 🌐 Usando Terraform com azd

Bicep é o padrão do azd, mas azd também suporta **Terraform** — útil se sua equipe já utiliza ou você gerencia infraestrutura multi-nuvem. O fluxo de trabalho azd (`azd up`, `azd provision`, `azd down`) é idêntico; somente a linguagem e o layout das pastas de infraestrutura mudam.

### Diga ao azd para usar Terraform

Adicione uma seção `infra` em `azure.yaml` apontando para o provedor Terraform:

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

### Layout da pasta Terraform

Com o provedor Terraform, sua pasta `infra/` usa arquivos `.tf` em vez de Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Um fragmento `main.tf`

Isto somente cria um grupo de recursos e um plano, não um serviço implantável. É necessário também declarar variáveis de entrada, um provedor `azurerm` compatível, o web app e seu mapeamento de tag/recurso de serviço.

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

### Como o azd se conecta às suas outputs Terraform

azd lê os **outputs** do Terraform como valores de ambiente. Este fragmento pressupõe que você definiu `azurerm_linux_web_app.web`; a descoberta de serviço ainda requer nome de recurso correspondente ou tag `azd-service-name`:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Importante:** azd usa a tag `azd-env-name` e os outputs `AZURE_*` para rastrear recursos por ambiente. Sempre marque seu grupo de recursos com `"azd-env-name" = var.environment_name` para que `azd down` possa localizar e remover tudo.

### Implantação com Terraform

Os comandos são exatamente os mesmos do Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Pré-requisito:** Terraform deve estar instalado e no seu `PATH`. O azd gerencia o *workflow* do Terraform, mas não instala o Terraform para você. Quanto ao estado, azd usa o estado local por padrão; para equipes, configure um backend remoto (por exemplo, backend Azure Storage) em `provider.tf`.

Para starters completos e funcionais baseados em Terraform, navegue pela [galeria Awesome AZD](https://azure.github.io/awesome-azd/) e filtre por Terraform, ou veja a documentação oficial do [azd para Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Outras Ferramentas de Infraestrutura

Pulumi não é um provedor integrado do azd 1.37.2. Definir `infra.provider: pulumi` sozinho não estabelece uma integração funcional, e `azd env new` não cria/seleciona automaticamente uma stack Pulumi. Se usar outra ferramenta IaC, siga a documentação da extensão de provedor verificada ou gerencie seu ciclo de vida explicitamente no seu próprio fluxo. Este curso não fornece nem valida um provedor Pulumi.

## 🎯 Escolhendo um Host para Seu Serviço

O campo `host` em `azure.yaml` decide onde seu código será executado. azd suporta vários hosts — escolher o correto importa mais do que a linguagem da infraestrutura. Aqui está uma comparação amigável para iniciantes:

| valor `host` | Melhor para | Por quê |
|--------------|----------|-----|
| `appservice` | Apps web tradicionais e APIs | PaaS mais simples; não precisa de containers |
| `staticwebapp` | SPAs front-end (React, Vue, Angular) | CDN global + SSL grátis, suporte API integrado |
| `function` | Workloads orientados a eventos e serverless | Escala a zero, paga por execução |
| `containerapp` | Microsserviços conteinerizados | Containers serverless, escala a zero, ingress integrado |
| `aks` | Necessidades complexas de orquestração | Controle completo do Kubernetes quando realmente precisar |
| `springapp` | Implantações existentes Azure Spring Apps | Legado; esse serviço será descontinuado em 31 de março de 2028 e não aceita novos clientes |

### Quando escolher AKS

**Azure Kubernetes Service (`host: aks`)** oferece todo o poder do Kubernetes — controladores customizados, malhas de serviço, rede complexa e agendamento detalhado. Esse poder vem com sobrecarga operacional: você gerencia pools de nós, atualizações e rede do cluster.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Comece mais simples se puder.** Para a maioria dos microsserviços, **Container Apps** oferece containers, autoescalonamento e escala a zero sem precisar gerenciar um cluster. Escolha AKS só quando precisar de recursos específicos do Kubernetes.

### Quando usar Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** é um runtime gerenciado especialmente para Spring Boot. Ele cuida de descoberta de serviço, servidor de configuração e implantação blue-green para que equipes Java não precisem administrar sua própria infraestrutura.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Não selecione Azure Spring Apps para um projeto iniciante novo: ele está fechado para novos clientes e [será aposentado em 31 de março de 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Prefira alternativas suportadas como Container Apps e planeje migração para implantações existentes.

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
**Pré-requisitos para o fragmento:** declare `@secure() param databasePassword string` e use um valor forte fornecido. Escolha acesso público **ou** integre a sub-rede delegada/DNS privado abaixo; os dois snippets não se conectam automaticamente.

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

A regra `0.0.0.0` permite conexões de serviços Azure além da sua assinatura. Isso não é rede privada; prefira um design de rede restrito para workloads reais.

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
          name: 'NODE_ENV'
          value: 'production'
        }
      ]
    }
  }
}
```

Para identidade atribuída pelo sistema, não defina `AZURE_CLIENT_ID` para seu ID principal. Uma identidade atribuída pelo usuário usa seu **client ID**, não seu object/principal ID. A referência Key Vault também precisa da atribuição de função do cofre para a identidade do app e de acesso de rede.

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
**Fragmento de arquitetura incompleto, não é gateway implantável:** adicione um `gateway-subnet` dedicado à VNet, mais pools backend, configurações HTTP, listeners, regras de roteamento com prioridades e um certificado TLS (ou referência autorizada Key Vault). Apenas abrir a porta 443 não configura HTTPS.

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

## 🔧 Configurações Específicas por Ambiente

### Arquivos de Parâmetros para Diferentes Ambientes
Os dois arquivos abaixo são **exemplos alternativos de arquivos de parâmetros**. azd não seleciona automaticamente `main.parameters.dev.json` ou `main.parameters.prod.json` pelo nome do ambiente. Use o `main.parameters.json` real com substituições de ambiente (por exemplo `${APP_SERVICE_SKU=B1}`) e declare/consuma todo parâmetro no Bicep.

Conteúdo de exemplo para `infra/main.parameters.dev.json`:

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

Conteúdo de exemplo para `infra/main.parameters.prod.json`:

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

### Provisionamento Condicional de Recursos
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
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Provisionar infraestrutura não implanta seu código da aplicação. Execute verificações do app somente após `azd deploy`/`azd up`, e use `/health` apenas se seu app implementar isso. Scripts de implantação ARM criam recursos Azure e precisam de identidade adicional, versões runtime suportadas e permissões; não são testes unitários locais.

## 🧪 Pré-visualização & Validação de Infraestrutura (NOVO)

### Visualize Mudanças de Infraestrutura Antes da Implantação

O recurso `azd provision --preview` permite **simular o provisionamento da infraestrutura** antes de realmente implantar os recursos. É semelhante em espírito ao `terraform plan` ou `bicep what-if`, dando uma **visão de dry-run** do que mudaria no seu ambiente Azure.

#### 🛠️ O que isso faz
- **Analisa seus templates IaC** (Bicep ou Terraform)
- **Exibe uma prévia das mudanças nos recursos**: adições, exclusões, atualizações
- **Não aplica as mudanças propostas pelo provedor** — inspecione hooks do projeto primeiro; scripts podem ter efeitos colaterais e preview ainda requer permissões Azure

#### Casos de Uso
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

Este comando ajuda você a:
- **Validar mudanças de infraestrutura** antes de comprometer recursos
- **Detectar erros de configuração cedo** no ciclo de desenvolvimento
- **Colaborar com segurança** em ambientes de equipe
- **Garantir deploys com privilégio mínimo** sem surpresas

É especialmente útil quando:
- Trabalha com ambientes complexos multi-serviços
- Faz mudanças em infraestrutura de produção
- Valida modificações em templates antes da aprovação de PR
- Treina novos membros da equipe em padrões de infraestrutura

### Exemplo de Saída de Pré-visualização
A saída exata da pré-visualização varia por provedor e estrutura do projeto, mas o resultado deve identificar claramente as mudanças propostas antes de aplicar qualquer coisa.

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

### Migrações de Banco de Dados
**Padrão incompleto para script de implantação:** requer identidade atribuída pelo usuário configurada onde necessário, runtime Azure CLI suportado, ferramentas de migração disponíveis, diretório/configuração de migração fornecido e conectividade ao banco. Não é executável apenas colando este recurso num template.

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

- [Planejamento Pré-Implantação](../chapter-06-pre-deployment/capacity-planning.md) - Valide disponibilidade de recursos
- [Problemas Comuns](../chapter-07-troubleshooting/common-issues.md) - Solucione problemas de infraestrutura
- [Guia de Depuração](../chapter-07-troubleshooting/debugging.md) - Depurar problemas de provisionamento
- [Seleção de SKU](../chapter-06-pre-deployment/sku-selection.md) - Escolher níveis de serviço apropriados

## Recursos Adicionais

- [Documentação do Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Modelos do Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Centro de Arquitetura do Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Framework Azure Bem-Arquitetado](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navegação**
- **Lição Anterior**: [Guia de Implantação](deployment-guide.md)
- **Próxima Lição**: [Planejamento de Capacidade](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
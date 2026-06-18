# AZD로 Azure 리소스 프로비저닝

**챕터 내비게이션:**
- **📚 과정 홈**: [초보자를 위한 AZD](../../README.md)
- **📖 현재 챕터**: 4장 - 코드형 인프라 및 배포
- **⬅️ 이전**: [배포 가이드](deployment-guide.md)
- **➡️ 다음 챕터**: [5장: 멀티 에이전트 AI 솔루션](../../examples/retail-scenario.md)
- **🔧 관련**: [6장: 사전 배포 검증](../chapter-06-pre-deployment/capacity-planning.md)

## 소개

이 종합 가이드는 Azure Developer CLI를 사용하여 Azure 리소스를 프로비저닝하고 관리하는 데 필요한 모든 내용을 다룹니다. Bicep, ARM 템플릿, Terraform, Pulumi를 사용하여 기본 리소스 생성부터 고급 엔터프라이즈급 인프라 구조 구현까지 코드형 인프라(IaC) 패턴을 배워보세요.

## 학습 목표

이 가이드를 완료하면 다음을 할 수 있습니다:
- 코드형 인프라 원칙 및 Azure 리소스 프로비저닝 마스터
- Azure Developer CLI에서 지원하는 다양한 IaC 공급자 이해
- 일반적인 애플리케이션 아키텍처를 위한 Bicep 템플릿 설계 및 구현
- 리소스 매개변수, 변수 및 환경별 설정 구성
- 네트워킹 및 보안을 포함한 고급 인프라 패턴 구현
- 리소스 라이프사이클, 업데이트 및 종속성 해결 관리

## 학습 성과

완료 후 다음을 수행할 수 있습니다:
- Bicep 및 ARM 템플릿을 사용해 Azure 인프라 설계 및 프로비저닝
- 적절한 리소스 종속성을 가진 복잡한 다중 서비스 아키텍처 구성
- 여러 환경 및 구성을 위한 매개변수화된 템플릿 구현
- 인프라 프로비저닝 문제 해결 및 배포 실패 해결
- Azure Well-Architected Framework 원칙을 인프라 설계에 적용
- 인프라 업데이트 관리 및 인프라 버전 관리 전략 구현

## 인프라 프로비저닝 개요

Azure Developer CLI는 여러 코드형 인프라(IaC) 공급자를 지원합니다:
- **Bicep** (권장) - Azure 전용 도메인 특화 언어
- **ARM 템플릿** - JSON 기반 Azure Resource Manager 템플릿
- **Terraform** - 멀티클라우드 인프라 도구
- **Pulumi** - 프로그래밍 언어를 사용하는 현대적 코드형 인프라

## Azure 리소스 이해하기

### 리소스 계층 구조
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### 애플리케이션을 위한 일반 Azure 서비스
- <strong>컴퓨트</strong>: App Service, Container Apps, Functions, 가상 머신
- <strong>스토리지</strong>: 스토리지 계정, Cosmos DB, SQL Database, PostgreSQL
- <strong>네트워킹</strong>: 가상 네트워크, Application Gateway, CDN
- <strong>보안</strong>: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI 서비스, Azure OpenAI, Azure Machine Learning

## Bicep 인프라 템플릿

### 기본 Bicep 템플릿 구조
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

### 고급 Bicep 패턴

#### 모듈식 인프라
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

#### 조건부 리소스 생성
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

## 🌐 terraform을 azd와 함께 사용하기

Bicep은 azd의 기본값이지만, azd는 <strong>Terraform</strong>도 지원합니다—팀이 이미 Terraform을 표준으로 사용하거나 멀티클라우드 인프라를 관리하는 경우 유용합니다. azd 워크플로(`azd up`, `azd provision`, `azd down`)는 동일하며, 인프라 언어와 폴더 구조만 변경됩니다.

### azd에 Terraform 사용 지시하기

`azure.yaml`에 Terraform 공급자를 가리키는 `infra` 섹션 추가:

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

### Terraform 폴더 구조

Terraform 공급자와 함께 `infra/` 폴더는 Bicep 대신 `.tf` 파일을 사용합니다:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### 최소한의 `main.tf`

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

### azd가 Terraform 출력에 연결하는 방법

azd는 Terraform <strong>출력값</strong>을 읽어 엔드포인트를 파악하고 환경 값을 앱에 다시 연결합니다. 출력 이름이 중요합니다—azd는 특정 이름을 찾습니다:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **중요:** azd는 `azd-env-name` 태그와 `AZURE_*` 출력을 사용하여 환경별 리소스를 추적합니다. 항상 리소스 그룹에 `"azd-env-name" = var.environment_name` 태그를 달아 `azd down`이 모든 항목을 찾고 제거할 수 있게 하세요.

### Terraform으로 배포하기

명령어는 Bicep과 동일합니다:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd는 내부적으로 'terraform plan'을 실행합니다
azd up                    # 프로비저닝 + 배포
azd down --force          # Terraform으로 관리되는 리소스를 파괴합니다
```

> **전제 조건:** Terraform이 설치되어 `PATH`에 있어야 합니다. azd는 Terraform <em>워크플로우</em>를 관리하지만 Terraform을 직접 설치하지 않습니다. 상태는 기본값으로 로컬 상태를 사용하며, 팀 환경에서는 `provider.tf`에서 원격 백엔드(예: Azure Storage 백엔드)를 설정하세요.

완전하고 실행 가능한 Terraform 기반 시작 프로젝트는 [Awesome AZD 갤러리](https://azure.github.io/awesome-azd/)에서 Terraform 필터를 사용하거나 공식 [azd Terraform 문서](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd)를 참고하세요.

## 🧩 Pulumi를 azd와 함께 사용하기

팀에서 DSL 대신 TypeScript, Python, Go, C#과 같은 범용 언어로 인프라를 작성하는 경우, azd는 <strong>Pulumi</strong>도 지원합니다. Terraform과 마찬가지로 `azd up` / `azd provision` / `azd down` 워크플로우는 동일하며, 인프라 도구와 폴더 구조만 다릅니다.

### azd에 Pulumi 사용 지시하기

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

### Pulumi 폴더 구조

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### 최소한의 `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// azd가 모든 리소스를 추적하고 정리할 수 있도록 태그를 지정합니다
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd가 이러한 출력을 다시 환경으로 읽어들입니다
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### 스택은 azd 환경과 매핑됨

Pulumi는 배포를 <strong>스택</strong> 단위로 관리하며, azd는 각 azd 환경을 이름이 같은 Pulumi 스택과 매핑합니다. `azd env new staging`을 실행하면 azd가 `staging` Pulumi 스택을 선택(또는 생성)합니다. 동일한 `azd-env-name` 태깅 및 `AZURE_*` 출력 규칙이 적용되므로 `azd down`이 모든 항목을 찾고 제거할 수 있습니다.

### Pulumi로 배포하기

```bash
azd auth login
azd env new dev
azd provision --preview   # azd는 내부적으로 'pulumi preview'를 실행합니다
azd up                    # 프로비저닝 + 배포
azd down --force          # 'pulumi destroy'를 실행합니다
```

> **전제 조건:** Pulumi가 설치되어 `PATH`에 포함되어 있어야 하며, 상태 백엔드(Pulumi Cloud 또는 Azure Blob Storage 같은 자체 관리 백엔드)가 필요합니다. azd는 Pulumi <em>워크플로우</em>를 관리하며 설치는 하지 않습니다. 공식 [azd Pulumi 문서](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd)를 참고하세요.

## 🎯 서비스 호스트 선택하기

`azure.yaml`의 `host` 필드는 코드 실행 위치를 결정합니다. azd는 여러 호스트를 지원하며, 올바른 선택은 인프라 언어보다 더 중요합니다. 초보자에게 친숙한 비교는 다음과 같습니다:

| `host` 값 | 적합한 경우 | 이유 |
|--------------|----------|-----|
| `appservice` | 전통적인 웹 앱 및 API | 가장 단순한 PaaS; 컨테이너 불필요 |
| `staticwebapp` | 프론트엔드 SPA(React, Vue, Angular) | 글로벌 CDN + 무료 SSL, 내장 API 지원 |
| `function` | 이벤트 기반 서버리스 워크로드 | 0까지 확장 가능, 실행당 과금 |
| `containerapp` | 컨테이너화된 마이크로서비스 | 서버리스 컨테이너, 0까지 자동 확장, 내장 인그레스 |
| `aks` | 복잡한 오케스트레이션 필요 | Kubernetes 전체 제어 가능 |
| `springapp` | Java Spring Boot 앱 | Spring에 최적화된 관리형 Azure Spring Apps 런타임 |

### AKS를 선택해야 할 때

**Azure Kubernetes Service(`host: aks`)**는 Kubernetes의 모든 기능을 제공합니다—커스텀 컨트롤러, 서비스 메시, 복잡한 네트워킹, 세밀한 스케줄링. 하지만 운영 부담이 있으며, 노드 풀, 업그레이드, 클러스터 네트워킹을 직접 관리해야 합니다.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **가능하면 더 단순한 방법부터 시작하세요.** 대부분 마이크로서비스에는 <strong>Container Apps</strong>가 클러스터 관리 없이 컨테이너, 자동 확장, 0까지 확장을 제공합니다. Kubernetes 전용 기능이 필요할 때만 AKS를 선택하세요.

### Azure Spring Apps를 사용해야 할 때

**Azure Spring Apps(`host: springapp`)**는 Spring Boot를 위해 특화된 관리형 런타임입니다. 서비스 검색, 구성 서버, 블루-그린 배포를 처리하여 Java 팀이 자체 인프라를 운영하지 않아도 됩니다.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> 기존 Spring Boot 앱이 있고 Spring에 최적화된 런타임이 필요한 경우 `springapp`을 사용하세요. Spring 전용 필요가 없는 새로운 컨테이너화 Java 앱은 보통 `containerapp`이 더 간단한 선택입니다.

## 🗃️ 데이터베이스 프로비저닝

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

## 🔒 보안 및 비밀 관리

### Key Vault 통합
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

### 관리형 ID 구성
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

## 🌍 네트워킹 및 연결성

### 가상 네트워크 구성
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

### SSL이 적용된 Application Gateway
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

## 📊 모니터링 및 관측성

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

### 맞춤형 메트릭 및 알림
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

## 🔧 환경별 구성

### 다양한 환경용 매개변수 파일
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

### 조건부 리소스 프로비저닝
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

## 🚀 고급 프로비저닝 패턴

### 다중 리전 배포
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

### 인프라 테스트
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

## 🧪 인프라 미리보기 및 검증 (NEW)

### 배포 전에 인프라 변경사항 미리보기

`azd provision --preview` 기능은 실제 리소스 배포 전에 <strong>인프라 프로비저닝을 시뮬레이션</strong>할 수 있습니다. `terraform plan` 또는 `bicep what-if`와 유사하게, Azure 환경에 대해 어떤 변경이 일어날지 <strong>드라이런 뷰(dry-run view)</strong>를 제공합니다.

#### 🛠️ 기능
- IaC 템플릿(Bicep 또는 Terraform) 분석
- 리소스 변경사항 미리보기 제공: 추가, 삭제, 업데이트
- 변경 적용하지 않음 — 읽기만 가능하며 안전하게 실행 가능

#### 활용 사례
```bash
# 배포 전에 인프라 변경 사항 미리 보기
azd provision --preview

# 특정 환경에 대한 미리 보기
azd provision --preview -e production
```

이 명령은 다음에 유용합니다:
- 리소스 커밋 전 인프라 변경 검증
- 개발 초기에 잘못된 구성 발견
- 팀 환경에서 안전한 협업
- 놀라움 없이 최소 권한 배포 보장

특히 다음 때 유용합니다:
- 복잡한 다중 서비스 환경 작업 시
- 운영 인프라 변경 시
- PR 승인 전 템플릿 수정 검증 시
- 신입 팀원에게 인프라 패턴 교육 시

### 예제 미리보기 출력
정확한 미리보기 출력은 공급자 및 프로젝트 구조에 따라 다르지만, 모든 변경 제안 사항을 명확히 표시해야 합니다.

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

## �🔄 리소스 업데이트 및 마이그레이션

### 안전한 리소스 업데이트
```bash
# 먼저 인프라 변경 사항 미리보기 (권장)
azd provision --preview

# 미리보기 확인 후 변경 사항 적용
azd provision --confirm-with-no-prompt

# 롤백하려면 Git을 사용하여 인프라 변경 사항을 되돌리세요:
git revert HEAD  # 마지막 인프라 커밋 되돌리기
azd provision    # 이전 인프라 상태 적용
```

### 데이터베이스 마이그레이션
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

## 🎯 모범 사례

### 1. 리소스 명명 규칙
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. 태깅 전략
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

### 3. 매개변수 검증
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

### 4. 출력 정리
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

## 다음 단계

- [사전 배포 계획](../chapter-06-pre-deployment/capacity-planning.md) - 리소스 가용성 확인
- [일반 문제](../chapter-07-troubleshooting/common-issues.md) - 인프라 문제 해결
- [디버깅 가이드](../chapter-07-troubleshooting/debugging.md) - 프로비저닝 문제 디버깅
- [SKU 선택](../chapter-06-pre-deployment/sku-selection.md) - 적절한 서비스 등급 선택

## 추가 자료

- [Azure Bicep 문서](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager 템플릿](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure 아키텍처 센터](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

<strong>내비게이션</strong>
- **이전 레슨**: [배포 가이드](deployment-guide.md)
- **다음 레슨**: [용량 계획](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
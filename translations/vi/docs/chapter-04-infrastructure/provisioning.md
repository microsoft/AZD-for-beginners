# Cung cấp tài nguyên Azure bằng AZD

**Điều hướng chương:**
- **📚 Trang khóa học**: [AZD cho người mới bắt đầu](../../README.md)
- **📖 Chương hiện tại**: Chương 4 - Hạ tầng như mã & Triển khai
- **⬅️ Trước**: [Deployment Guide](deployment-guide.md)
- **➡️ Chương tiếp theo**: [Chương 5: Giải pháp AI đa tác nhân](../../examples/retail-scenario.md)
- **🔧 Liên quan**: [Chương 6: Xác thực trước khi triển khai](../chapter-06-pre-deployment/capacity-planning.md)

## Giới thiệu

Hướng dẫn toàn diện này bao quát mọi thứ bạn cần biết về việc cung cấp và quản lý tài nguyên Azure bằng Azure Developer CLI. Học cách triển khai các mô hình Hạ tầng như Mã (IaC) từ việc tạo tài nguyên cơ bản đến các kiến trúc hạ tầng doanh nghiệp nâng cao sử dụng Bicep, ARM templates, Terraform và Pulumi.

## Mục tiêu học tập

Khi hoàn thành hướng dẫn này, bạn sẽ:
- Nắm vững nguyên tắc Hạ tầng như Mã và việc cung cấp tài nguyên Azure
- Hiểu các nhà cung cấp IaC khác nhau được Azure Developer CLI hỗ trợ
- Thiết kế và triển khai các mẫu Bicep cho các kiến trúc ứng dụng phổ biến
- Cấu hình tham số tài nguyên, biến và các thiết lập theo môi trường
- Triển khai các mẫu hạ tầng nâng cao bao gồm mạng và bảo mật
- Quản lý vòng đời tài nguyên, cập nhật và giải quyết phụ thuộc

## Kết quả học tập

Sau khi hoàn thành, bạn sẽ có khả năng:
- Thiết kế và cung cấp hạ tầng Azure bằng Bicep và ARM templates
- Cấu hình kiến trúc đa dịch vụ phức tạp với phụ thuộc tài nguyên phù hợp
- Triển khai các mẫu tham số hóa cho nhiều môi trường và cấu hình
- Khắc phục sự cố trong quá trình cung cấp hạ tầng và giải quyết lỗi triển khai
- Áp dụng các nguyên tắc của Azure Well-Architected Framework vào thiết kế hạ tầng
- Quản lý cập nhật hạ tầng và thực hiện chiến lược phiên bản hóa hạ tầng

## Tổng quan về Cung cấp Hạ tầng

Azure Developer CLI hỗ trợ nhiều nhà cung cấp Hạ tầng như Mã (IaC):
- **Bicep** (khuyến nghị) - ngôn ngữ đặc thù của Azure
- **ARM Templates** - templates Azure Resource Manager dạng JSON
- **Terraform** - công cụ hạ tầng đa đám mây
- **Pulumi** - Hạ tầng như mã hiện đại với ngôn ngữ lập trình

## Hiểu về các Tài nguyên Azure

### Cấp bậc tài nguyên
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Các dịch vụ Azure thường dùng cho ứng dụng
- **Tính toán**: App Service, Container Apps, Functions, Virtual Machines
- **Lưu trữ**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Mạng**: Virtual Network, Application Gateway, CDN
- **Bảo mật**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Mẫu Hạ tầng Bicep

### Cấu trúc mẫu Bicep cơ bản
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

### Các mẫu Bicep nâng cao

#### Hạ tầng mô-đun
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

#### Tạo tài nguyên có điều kiện
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

## 🌐 Sử dụng Terraform với azd

Bicep là mặc định của azd, nhưng azd cũng hỗ trợ **Terraform**—hữu ích nếu đội của bạn đã chuẩn hóa trên Terraform hoặc bạn quản lý hạ tầng đa đám mây. Quy trình công việc azd (`azd up`, `azd provision`, `azd down`) là giống hệt; chỉ có ngôn ngữ hạ tầng và bố cục thư mục thay đổi.

### Bảo cho azd sử dụng Terraform

Thêm một phần `infra` vào `azure.yaml` trỏ tới nhà cung cấp Terraform:

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

### Bố cục thư mục Terraform

Với nhà cung cấp Terraform, thư mục `infra/` của bạn sử dụng các tệp `.tf` thay vì Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Một `main.tf` tối thiểu

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

### Cách azd kết nối với outputs của Terraform

azd đọc các **outputs** của Terraform để biết các endpoints của bạn và để kết nối các giá trị môi trường trở lại ứng dụng. Tên output quan trọng—azd tìm kiếm các tên cụ thể:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Quan trọng:** azd sử dụng thẻ `azd-env-name` và các output `AZURE_*` để theo dõi tài nguyên theo môi trường. Luôn gắn thẻ nhóm tài nguyên của bạn với "azd-env-name" = var.environment_name để `azd down` có thể tìm và xóa mọi thứ.

### Triển khai với Terraform

Các lệnh hoàn toàn giống như Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd chạy 'terraform plan' ở hậu trường
azd up                    # cung cấp + triển khai
azd down --force          # hủy các tài nguyên do Terraform quản lý
```

> **Yêu cầu tiên quyết:** Terraform phải được cài đặt và nằm trong `PATH` của bạn. azd quản lý *quy trình làm việc* Terraform nhưng không cài Terraform cho bạn. Đối với trạng thái, azd mặc định dùng trạng thái cục bộ; đối với đội nhóm, cấu hình một backend từ xa (ví dụ, backend Azure Storage) trong `provider.tf`.

Để có các starter dựa trên Terraform chạy được đầy đủ, duyệt qua [Awesome AZD gallery](https://azure.github.io/awesome-azd/) và lọc cho Terraform, hoặc xem [tài liệu azd Terraform chính thức](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Sử dụng Pulumi với azd

Nếu đội của bạn viết hạ tầng bằng ngôn ngữ tổng quát (TypeScript, Python, Go, hoặc C#) thay vì một DSL, azd cũng hỗ trợ **Pulumi**. Như với Terraform, quy trình `azd up` / `azd provision` / `azd down` không thay đổi—chỉ có công cụ hạ tầng và bố cục thư mục khác nhau.

### Bảo cho azd sử dụng Pulumi

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

### Bố cục thư mục Pulumi

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### Một `index.ts` tối thiểu

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// Gắn thẻ mọi tài nguyên để azd có thể theo dõi và dọn dẹp chúng
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd đọc lại các đầu ra này vào môi trường của bạn
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stacks tương ứng với môi trường azd

Pulumi tổ chức triển khai thành **stacks**, và azd ánh xạ mỗi môi trường azd tới một Pulumi stack cùng tên. Khi bạn chạy `azd env new staging`, azd chọn (hoặc tạo) Pulumi stack `staging`. Quy tắc gắn thẻ `azd-env-name` và các output `AZURE_*` vẫn áp dụng, để `azd down` có thể tìm và xóa mọi thứ.

### Triển khai với Pulumi

```bash
azd auth login
azd env new dev
azd provision --preview   # azd thực thi 'pulumi preview' phía sau hậu trường
azd up                    # cấp phát + triển khai
azd down --force          # chạy 'pulumi destroy'
```

> **Yêu cầu tiên quyết:** Pulumi phải được cài đặt và nằm trong `PATH` của bạn, và bạn sẽ cần một backend trạng thái (Pulumi Cloud hoặc một backend tự quản như Azure Blob Storage). azd quản lý *quy trình Pulumi*, không quản lý việc cài đặt. Xem [tài liệu azd Pulumi chính thức](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 Chọn Host cho Dịch vụ của bạn

Trường `host` trong `azure.yaml` quyết định nơi mã của bạn chạy. azd hỗ trợ nhiều host—chọn host phù hợp còn quan trọng hơn ngôn ngữ hạ tầng. Dưới đây là so sánh thân thiện cho người mới:

| `host` value | Phù hợp cho | Tại sao |
|--------------|-------------|--------|
| `appservice` | Ứng dụng web truyền thống và API | PaaS đơn giản nhất; không cần container |
| `staticwebapp` | Front-end SPA (React, Vue, Angular) | CDN toàn cầu + SSL miễn phí, hỗ trợ API tích hợp |
| `function` | Workload theo sự kiện và serverless | Scale-to-zero, trả theo lần thực thi |
| `containerapp` | Microservices đóng gói container | Container serverless, scale-to-zero, ingress tích hợp |
| `aks` | Nhu cầu điều phối phức tạp | Kiểm soát Kubernetes đầy đủ khi bạn thực sự cần |
| `springapp` | Ứng dụng Java Spring Boot | Runtime Azure Spring Apps được quản lý, tối ưu cho Spring |

### Khi nào nên chọn AKS

**Azure Kubernetes Service (`host: aks`)** cung cấp cho bạn toàn bộ sức mạnh của Kubernetes—controller tùy chỉnh, service mesh, mạng phức tạp và lập lịch chi tiết. Sức mạnh đó đi kèm chi phí vận hành: bạn phải quản lý node pools, nâng cấp và mạng lưới cụm.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Bắt đầu đơn giản hơn nếu có thể.** Đối với hầu hết microservices, **Container Apps** cung cấp container, autoscaling và scale-to-zero mà không cần quản lý cụm. Chỉ chọn AKS khi bạn cần những tính năng đặc thù của Kubernetes.

### Khi nào sử dụng Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** là một runtime được quản lý, thiết kế đặc biệt cho Spring Boot. Nó xử lý service discovery, config server và blue-green deployment để các đội Java không phải tự vận hành hạ tầng.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Sử dụng `springapp` khi bạn có các ứng dụng Spring Boot hiện có và muốn một runtime được tối ưu cho chúng. Đối với các ứng dụng Java mới đóng gói container mà không cần tính năng đặc thù của Spring, `containerapp` thường là lựa chọn đơn giản hơn.

## 🗃️ Cung cấp Cơ sở dữ liệu

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

## 🔒 Bảo mật và Quản lý Bí mật

### Tích hợp Key Vault
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

### Cấu hình Managed Identity
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

## 🌍 Mạng và Kết nối

### Cấu hình Virtual Network
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

### Application Gateway với SSL
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

## 📊 Giám sát và Quan sát

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

### Metrics tùy chỉnh và Cảnh báo
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

## 🔧 Cấu hình theo Môi trường

### Tệp tham số cho các Môi trường khác nhau
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

### Cung cấp tài nguyên có điều kiện
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

## 🚀 Mẫu Cung cấp Nâng cao

### Triển khai đa khu vực
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

### Kiểm thử Hạ tầng
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

## 🧪 Xem trước & Xác thực Hạ tầng (MỚI)

### Xem trước thay đổi hạ tầng trước khi triển khai

Tính năng `azd provision --preview` cho phép bạn **mô phỏng việc cung cấp hạ tầng** trước khi thực sự triển khai tài nguyên. Nó tương tự về tinh thần với `terraform plan` hoặc `bicep what-if`, cung cấp cho bạn một cái nhìn **dry-run** về những thay đổi sẽ được thực hiện lên môi trường Azure của bạn.

#### 🛠️ Nó làm gì
- **Phân tích các mẫu IaC của bạn** (Bicep hoặc Terraform)
- **Hiển thị bản xem trước các thay đổi tài nguyên**: thêm mới, xóa, cập nhật
- **Không áp dụng thay đổi** — chỉ đọc và an toàn để chạy

#### Trường hợp sử dụng
```bash
# Xem trước các thay đổi cơ sở hạ tầng trước khi triển khai
azd provision --preview

# Xem trước cho môi trường cụ thể
azd provision --preview -e production
```

Lệnh này giúp bạn:
- **Xác thực các thay đổi hạ tầng** trước khi cam kết tài nguyên
- **Phát hiện cấu hình sai sớm** trong chu trình phát triển
- **Hợp tác an toàn** trong môi trường nhóm
- **Đảm bảo triển khai với quyền tối thiểu** mà không có điều bất ngờ

Nó đặc biệt hữu ích khi:
- Làm việc với môi trường đa dịch vụ phức tạp
- Thay đổi hạ tầng production
- Xác thực sửa đổi template trước khi phê duyệt PR
- Đào tạo thành viên mới về các mẫu hạ tầng

### Ví dụ đầu ra xem trước
Đầu ra xem trước chính xác thay đổi tùy theo nhà cung cấp và cấu trúc dự án, nhưng kết quả nên xác định rõ các thay đổi đề xuất trước khi bất kỳ thứ gì được áp dụng.

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

## �🔄 Cập nhật tài nguyên và Di cư

### Cập nhật tài nguyên an toàn
```bash
# Trước tiên, xem trước các thay đổi cơ sở hạ tầng (ĐƯỢC KHUYẾN NGHỊ)
azd provision --preview

# Áp dụng các thay đổi sau khi xác nhận bản xem trước
azd provision --confirm-with-no-prompt

# Để hoàn tác, sử dụng Git để đảo ngược các thay đổi cơ sở hạ tầng:
git revert HEAD  # Hoàn tác commit cuối cùng của cơ sở hạ tầng
azd provision    # Áp dụng trạng thái trước đó của cơ sở hạ tầng
```

### Di cư cơ sở dữ liệu
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

## 🎯 Thực hành tốt nhất

### 1. Quy ước đặt tên tài nguyên
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Chiến lược gắn thẻ
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

### 3. Xác thực tham số
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

### 4. Tổ chức outputs
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

## Bước tiếp theo

- [Lên kế hoạch trước khi triển khai](../chapter-06-pre-deployment/capacity-planning.md) - Xác thực khả năng cung cấp tài nguyên
- [Các vấn đề thường gặp](../chapter-07-troubleshooting/common-issues.md) - Khắc phục sự cố hạ tầng
- [Hướng dẫn gỡ lỗi](../chapter-07-troubleshooting/debugging.md) - Gỡ lỗi các vấn đề khi cung cấp
- [Lựa chọn SKU](../chapter-06-pre-deployment/sku-selection.md) - Chọn hạng dịch vụ phù hợp

## Tài nguyên bổ sung

- [Tài liệu Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Điều hướng**
- **Bài học trước**: [Deployment Guide](deployment-guide.md)
- **Bài học tiếp theo**: [Lên kế hoạch công suất](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
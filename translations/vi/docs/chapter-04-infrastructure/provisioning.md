# Cung cấp tài nguyên Azure với AZD

**Điều hướng Chương:**
- **📚 Trang Khóa Học**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 4 - Hạ Tầng dưới dạng Mã & Triển Khai
- **⬅️ Trước Đó**: [Hướng Dẫn Triển Khai](deployment-guide.md)
- **➡️ Chương Tiếp Theo**: [Chương 5: Giải Pháp AI Đa Tác Nhân](../../examples/retail-scenario.md)
- **🔧 Liên Quan**: [Chương 6: Kiểm Tra Trước Khi Triển Khai](../chapter-06-pre-deployment/capacity-planning.md)

## Giới Thiệu

Hướng dẫn này bao gồm việc cung cấp và quản lý tài nguyên Azure bằng Azure Developer CLI với các nhà cung cấp Bicep và Terraform tích hợp sẵn.

> Đã xem xét theo `azd 1.37.2` (tháng 11 năm 2026). Trừ khi có ghi chú khác, các ví dụ Bicep, Terraform và script là **đoạn minh họa**, không phải mẫu hoàn chỉnh. Kết hợp chúng vào một dự án cung cấp các tham số, module, danh tính, mạng và mã ứng dụng tham chiếu. Đánh giá không thực hiện cấp phát tài nguyên Azure.

## Mục Tiêu Học Tập

Sau khi hoàn thành hướng dẫn này, bạn sẽ:
- Nắm vững các nguyên tắc Hạ Tầng dưới dạng Mã và cung cấp tài nguyên Azure
- Hiểu về nhiều nhà cung cấp IaC được Azure Developer CLI hỗ trợ
- Thiết kế và triển khai mẫu Bicep cho các kiến trúc ứng dụng phổ biến
- Cấu hình tham số tài nguyên, biến và cài đặt theo môi trường
- Triển khai các mô hình hạ tầng nâng cao bao gồm mạng và bảo mật
- Quản lý vòng đời tài nguyên, cập nhật và giải quyết phụ thuộc

## Kết Quả Học Tập

Khi hoàn thành, bạn sẽ có khả năng:
- Thiết kế và cung cấp hạ tầng Azure bằng mẫu Bicep và ARM
- Cấu hình kiến trúc đa dịch vụ phức tạp với phụ thuộc tài nguyên đúng cách
- Triển khai mẫu tham số hóa cho nhiều môi trường và cấu hình
- Khắc phục sự cố cung cấp hạ tầng và xử lý lỗi triển khai
- Áp dụng nguyên tắc Azure Well-Architected Framework trong thiết kế hạ tầng
- Quản lý cập nhật hạ tầng và triển khai chiến lược phiên bản hóa hạ tầng

## Tổng Quan Cung Cấp Hạ Tầng

Azure Developer CLI hỗ trợ nhiều nhà cung cấp Hạ Tầng dưới dạng Mã (IaC):
- **Bicep** (khuyến nghị) - ngôn ngữ chuyên biệt của Azure
- **ARM Templates** - Bicep biên dịch thành ARM; JSON ARM thô không phải là `infra.provider` riêng biệt tích hợp sẵn
- **Terraform** - công cụ hạ tầng đa đám mây
- **Nhà cung cấp mở rộng** - Cần cài đặt riêng phần mở rộng nhà cung cấp và cấu hình theo tài liệu; không giả định chuỗi nhà cung cấp nào được hỗ trợ

## Hiểu Về Tài Nguyên Azure

### Cấu Trúc Hệ Thống Tài Nguyên
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Các Dịch Vụ Azure Phổ Biến Cho Ứng Dụng
- **Tính Toán**: App Service, Container Apps, Functions, Máy Ảo
- **Lưu Trữ**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Mạng**: Virtual Network, Application Gateway, CDN
- **Bảo Mật**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Dịch vụ AI Azure, Azure OpenAI, Azure Machine Learning

## Mẫu Hạ Tầng Bicep

### Cấu Trúc Mẫu Bicep Cơ Bản
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

Để có một dự án azd hoàn chỉnh, gọi module này từ `infra/main.bicep` phạm vi đăng ký tạo nhóm tài nguyên có tag và truyền phạm vi đó. Khớp `environmentName`/`location` trong `main.parameters.json`. Tag `azd-service-name: web` liên kết tài nguyên với `services.web`; chỉ đặt tên output tùy ý không cấu hình khám phá dịch vụ.

### Mô Hình Bicep Nâng Cao

#### Hạ Tầng Mô-đun
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

#### Tạo Tài Nguyên Có Điều Kiện
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

## 🌐 Sử Dụng Terraform với azd

Bicep là mặc định của azd, nhưng azd cũng hỗ trợ **Terraform** — hữu ích nếu nhóm bạn đã chuẩn hóa trên nó hoặc bạn quản lý hạ tầng đa đám mây. Quy trình azd (`azd up`, `azd provision`, `azd down`) giống hệt; chỉ thay đổi ngôn ngữ hạ tầng và cấu trúc thư mục.

### Bảo azd sử dụng Terraform

Thêm phần `infra` vào `azure.yaml` trỏ tới nhà cung cấp Terraform:

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

### Cấu trúc thư mục Terraform

Với nhà cung cấp Terraform, thư mục `infra/` của bạn dùng các file `.tf` thay vì Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Một đoạn `main.tf`

Đoạn này chỉ tạo nhóm tài nguyên và kế hoạch, không phải dịch vụ có thể triển khai. Bạn phải khai báo biến đầu vào, nhà cung cấp `azurerm` tương thích, web app và ánh xạ tag tên dịch vụ/tài nguyên.

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

### Cách azd kết nối với output Terraform

azd đọc các **output** của Terraform thành giá trị môi trường. Đoạn này giả định bạn tạo `azurerm_linux_web_app.web`; khám phá dịch vụ vẫn cần tên tài nguyên hoặc tag `azd-service-name` phù hợp:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Quan trọng:** azd dùng tag `azd-env-name` và output `AZURE_*` để theo dõi tài nguyên theo môi trường. Luôn luôn gắn tag nhóm tài nguyên với `"azd-env-name" = var.environment_name` để `azd down` có thể tìm và loại bỏ hoàn toàn.

### Triển khai với Terraform

Câu lệnh hoàn toàn giống với Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Điều kiện tiên quyết:** Terraform phải được cài đặt và có trong `PATH` của bạn. azd quản lý *quy trình* Terraform nhưng không cài đặt Terraform cho bạn. Về state, azd mặc định dùng state cục bộ; với nhóm, cấu hình backend từ xa (chẳng hạn backend Azure Storage) trong `provider.tf`.

Để có mẫu mẫu chạy được dựa trên Terraform hoàn chỉnh, duyệt [bộ sưu tập Awesome AZD](https://azure.github.io/awesome-azd/) và lọc theo Terraform, hoặc xem tài liệu chính thức [azd Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Công Cụ Hạ Tầng Khác

Pulumi không phải là nhà cung cấp cấp phát tích hợp sẵn của azd 1.37.2. Chỉ đặt `infra.provider: pulumi` không thiết lập tích hợp hoạt động, và `azd env new` không tự động tạo/chọn stack Pulumi. Nếu sử dụng công cụ IaC khác, hãy làm theo tài liệu phần mở rộng nhà cung cấp được xác thực hoặc quản lý vòng đời rõ ràng trong quy trình của bạn. Khóa học này không cung cấp hay xác thực nhà cung cấp Pulumi.

## 🎯 Lựa Chọn Nơi Lưu Trữ Dịch Vụ

Trường `host` trong `azure.yaml` quyết định nơi mã của bạn chạy. azd hỗ trợ nhiều host—chọn đúng quan trọng hơn ngôn ngữ hạ tầng. Đây là so sánh thân thiện cho người mới:

| Giá trị `host` | Phù hợp với | Tại sao |
|--------------|----------|-----|
| `appservice` | Ứng dụng web và API truyền thống | PaaS đơn giản nhất; không cần container |
| `staticwebapp` | SPA front-end (React, Vue, Angular) | CDN toàn cầu + SSL miễn phí, hỗ trợ API tích hợp |
| `function` | Tải công việc theo sự kiện và serverless | Tỷ lệ tự động về zero, trả tiền theo lượt chạy |
| `containerapp` | Microservices đóng gói container | Container serverless, tỷ lệ về zero, ingress tích hợp |
| `aks` | Nhu cầu điều phối phức tạp | Toàn quyền Kubernetes khi bạn thật sự cần |
| `springapp` | Triển khai Azure Spring Apps hiện có | Mục tiêu cũ; dịch vụ ngừng hoạt động 31 tháng 3 năm 2028 và không nhận khách mới |

### Khi Nào Nên Dùng AKS

**Azure Kubernetes Service (`host: aks`)** cung cấp toàn bộ sức mạnh Kubernetes—bộ điều khiển tùy chỉnh, service mesh, mạng phức tạp và lập lịch chi tiết. Sức mạnh này đi kèm gánh nặng vận hành: bạn quản lý node pool, nâng cấp và mạng cụm.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Bắt đầu đơn giản hơn nếu có thể.** Với đa số microservices, **Container Apps** cung cấp container, tự động điều chỉnh và tỷ lệ về zero mà không cần quản lý cụm. Chọn AKS khi bạn cần tính năng đặc thù Kubernetes.

### Khi Nào Nên Dùng Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** là môi trường chạy được quản lý dành riêng cho Spring Boot. Nó xử lý khám phá dịch vụ, config server và triển khai blue-green để nhóm Java không phải tự quản hạ tầng.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Không chọn Azure Spring Apps cho dự án mới dành cho người mới: nó đóng cửa không nhận khách mới và [ngừng hoạt động 31 tháng 3 năm 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Ưu tiên lựa chọn thay thế được hỗ trợ như Container Apps và lập kế hoạch di cư cho triển khai hiện tại.

## 🗃️ Cung Cấp Cơ Sở Dữ Liệu

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
**Điều kiện tiên quyết đoạn:** khai báo `@secure() param databasePassword string` và dùng giá trị mạnh được cung cấp. Chọn truy cập công khai **hoặc** tích hợp subnet được ủy quyền/DNS riêng tư phía dưới; hai đoạn không tự kết nối với nhau.

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

Quy tắc `0.0.0.0` cho phép kết nối từ dịch vụ Azure ngoài đăng ký của bạn. Nó không phải mạng riêng; ưu tiên thiết kế mạng hạn chế cho tải thực.

## 🔒 Bảo Mật và Quản Lý Bí Mật

### Tích Hợp Key Vault
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

### Cấu Hình Danh Tính Quản Lý
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

Với danh tính hệ thống tự gán, không đặt `AZURE_CLIENT_ID` thành ID chính của nó. Danh tính do người dùng gán sử dụng **client ID**, không phải ID đối tượng/chính. Tham chiếu Key Vault cũng cần vai trò vault của danh tính app và truy cập mạng.

## 🌍 Mạng và Kết Nối

### Cấu Hình Mạng Ảo
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
**Đoạn kiến trúc chưa hoàn chỉnh, không phải gateway có thể triển khai:** thêm `gateway-subnet` riêng cho VNet kèm pool backend, cài đặt HTTP, listener, quy tắc định tuyến với ưu tiên và chứng chỉ TLS (hoặc tham chiếu Key Vault ủy quyền). Mở cổng 443 đơn thuần không cấu hình HTTPS.

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

## 📊 Giám Sát và Quan Sát

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

### Chỉ Số Tùy Chỉnh và Cảnh Báo
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

## 🔧 Cấu Hình Theo Môi Trường

### Tệp Tham Số Cho Các Môi Trường Khác Nhau
Hai tệp dưới đây là **ví dụ tệp tham số thay thế**. azd không tự chọn `main.parameters.dev.json` hoặc `main.parameters.prod.json` theo tên môi trường. Dùng `main.parameters.json` thực với thay thế môi trường (ví dụ `${APP_SERVICE_SKU=B1}`), và khai báo/sử dụng mọi tham số trong Bicep.

Ví dụ nội dung `infra/main.parameters.dev.json`:

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

Ví dụ nội dung `infra/main.parameters.prod.json`:

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

### Cung Cấp Tài Nguyên Có Điều Kiện
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

## 🚀 Mô Hình Cung Cấp Nâng Cao

### Triển Khai Đa Khu Vực
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

### Kiểm Tra Hạ Tầng
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Cung cấp hạ tầng không triển khai mã ứng dụng của bạn. Chạy kiểm tra ứng dụng chỉ sau `azd deploy`/`azd up`, và dùng `/health` nếu app bạn hỗ trợ. Script triển khai ARM tạo tài nguyên Azure và cần danh tính bổ sung, runtime hỗ trợ và quyền; không phải kiểm thử đơn vị cục bộ.

## 🧪 Xem Trước & Kiểm Tra Hạ Tầng (MỚI)

### Xem Trước Thay Đổi Hạ Tầng Trước Khi Triển Khai

Tính năng `azd provision --preview` cho phép bạn **mô phỏng cung cấp hạ tầng** trước khi triển khai thực tế tài nguyên. Nó tương tự `terraform plan` hoặc `bicep what-if`, cung cấp **xem trước khô** về các thay đổi sẽ thực hiện trong môi trường Azure của bạn.

#### 🛠️ Nó Thực Hiện
- **Phân tích mẫu IaC** của bạn (Bicep hoặc Terraform)
- **Hiển thị xem trước thay đổi tài nguyên**: thêm, xóa, cập nhật
- **Không áp dụng thay đổi hạ tầng được đề xuất** — kiểm tra trước các hook dự án; script có thể gây tác dụng phụ và xem trước vẫn yêu cầu quyền Azure

#### Trường Hợp Sử Dụng
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

Lệnh này giúp bạn:
- **Xác nhận thay đổi hạ tầng** trước khi cam kết tài nguyên
- **Phát hiện sai cấu hình sớm** trong chu trình phát triển
- **Hợp tác an toàn** trong môi trường nhóm
- **Đảm bảo triển khai quyền tối thiểu** không gây bất ngờ

Nó đặc biệt hữu ích khi:
- Làm việc với môi trường đa dịch vụ phức tạp
- Thay đổi hạ tầng sản xuất
- Kiểm tra sửa đổi mẫu trước khi duyệt PR
- Đào tạo thành viên nhóm mới về mô hình hạ tầng

### Ví Dụ Đầu Ra Xem Trước
Đầu ra xem trước cụ thể thay đổi theo nhà cung cấp và cấu trúc dự án, nhưng kết quả cần xác định rõ các thay đổi đề xuất trước khi áp dụng gì.

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

## �🔄 Cập Nhật và Di Cư Tài Nguyên

### Cập Nhật Tài Nguyên An Toàn
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

### Di Cư Cơ Sở Dữ Liệu
**Mô hình script triển khai chưa hoàn chỉnh:** yêu cầu danh tính người dùng gán được cấu hình nơi cần, runtime Azure CLI được hỗ trợ, công cụ di cư sẵn có, thư mục/cấu hình di cư cung cấp, và kết nối cơ sở dữ liệu. Không thể thực thi chỉ bằng cách dán tài nguyên này vào mẫu.

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

## 🎯 Thực Tiễn Tốt Nhất

### 1. Quy Ước Đặt Tên Tài Nguyên
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Chiến Lược Gắn Tag
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

### 3. Xác Thực Tham Số
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

### 4. Tổ Chức Output
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

## Bước Tiếp Theo

- [Lập Kế Hoạch Trước Triển Khai](../chapter-06-pre-deployment/capacity-planning.md) - Xác nhận tài nguyên khả dụng
- [Vấn Đề Thường Gặp](../chapter-07-troubleshooting/common-issues.md) - Khắc phục sự cố hạ tầng
- [Hướng dẫn Gỡ lỗi](../chapter-07-troubleshooting/debugging.md) - Gỡ lỗi các vấn đề cung cấp
- [Chọn SKU](../chapter-06-pre-deployment/sku-selection.md) - Chọn tầng dịch vụ phù hợp

## Tài nguyên Thêm

- [Tài liệu Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Mẫu Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Trung tâm Kiến trúc Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Khung kiến trúc Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Điều hướng**
- **Bài học Trước**: [Hướng dẫn Triển khai](deployment-guide.md)
- **Bài học Tiếp theo**: [Lập kế hoạch Năng lực](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
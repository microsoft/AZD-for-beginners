# Hướng dẫn chọn SKU - Lựa chọn các cấp dịch vụ Azure phù hợp

**Điều hướng chương:**
- **📚 Trang khóa học**: [AZD For Beginners](../../README.md)
- **📖 Chương hiện tại**: Chương 6 - Xác thực & Lập kế hoạch trước khi triển khai
- **⬅️ Trước**: [Capacity Planning](capacity-planning.md)
- **➡️ Tiếp theo**: [Preflight Checks](preflight-checks.md)
- **🚀 Chương tiếp theo**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

## Giới thiệu

Hướng dẫn toàn diện này giúp bạn lựa chọn các SKU dịch vụ Azure (Stock Keeping Units) tối ưu cho các môi trường, khối lượng công việc và yêu cầu khác nhau. Tìm hiểu cách phân tích nhu cầu hiệu năng, yếu tố chi phí và yêu cầu mở rộng để chọn các cấp dịch vụ phù hợp nhất cho các triển khai Azure Developer CLI của bạn.

## Mục tiêu học tập

Hoàn thành hướng dẫn này, bạn sẽ:
- Hiểu các khái niệm SKU của Azure, mô hình định giá và khác biệt về tính năng
- Nắm vững chiến lược lựa chọn SKU theo môi trường cho phát triển, staging và sản xuất
- Phân tích yêu cầu khối lượng công việc và ghép chúng với các cấp dịch vụ phù hợp
- Triển khai các chiến lược tối ưu chi phí qua lựa chọn SKU thông minh
- Áp dụng các kỹ thuật kiểm tra hiệu năng và xác thực cho các lựa chọn SKU
- Cấu hình đề xuất SKU tự động và giám sát

## Kết quả học tập

Sau khi hoàn thành, bạn sẽ có khả năng:
- Chọn các SKU dịch vụ Azure phù hợp dựa trên yêu cầu và ràng buộc của khối lượng công việc
- Thiết kế kiến trúc nhiều môi trường tiết kiệm chi phí với việc chọn cấp phù hợp
- Triển khai đánh giá hiệu năng và xác thực cho các lựa chọn SKU
- Tạo công cụ tự động đề xuất SKU và tối ưu chi phí
- Lập kế hoạch di chuyển SKU và chiến lược mở rộng khi yêu cầu thay đổi
- Áp dụng các nguyên tắc của Azure Well-Architected Framework cho việc lựa chọn cấp dịch vụ

## Mục lục

- [Hiểu về SKUs](../../../../docs/chapter-06-pre-deployment)
- [Lựa chọn theo môi trường](../../../../docs/chapter-06-pre-deployment)
- [Hướng dẫn theo dịch vụ](../../../../docs/chapter-06-pre-deployment)
- [Chiến lược tối ưu chi phí](../../../../docs/chapter-06-pre-deployment)
- [Các lưu ý về hiệu năng](../../../../docs/chapter-06-pre-deployment)
- [Bảng tham khảo nhanh](../../../../docs/chapter-06-pre-deployment)
- [Công cụ xác thực](../../../../docs/chapter-06-pre-deployment)

---

## Hiểu về SKUs

### SKUs là gì?

SKUs (Stock Keeping Units) đại diện cho các cấp dịch vụ khác nhau và mức hiệu năng cho các tài nguyên Azure. Mỗi SKU cung cấp khác nhau:

- **Đặc tính hiệu năng** (CPU, bộ nhớ, thông lượng)
- **Khả năng tính năng** (tùy chọn mở rộng, mức SLA)
- **Mô hình định giá** (theo mức tiêu thụ, đặt trước dung lượng)
- **Khả dụng theo khu vực** (không phải SKU nào cũng có ở mọi khu vực)

### Các yếu tố chính khi chọn SKU

1. **Yêu cầu khối lượng công việc**
   - Lưu lượng/mô hình tải dự kiến
   - Yêu cầu hiệu năng (CPU, bộ nhớ, I/O)
   - Nhu cầu lưu trữ và mô hình truy cập

2. **Loại môi trường**
   - Phát triển/kiểm thử so với sản xuất
   - Yêu cầu khả dụng
   - Nhu cầu bảo mật và tuân thủ

3. **Ràng buộc ngân sách**
   - Chi phí ban đầu so với chi phí vận hành
   - Chiết khấu đặt trước dung lượng
   - Ảnh hưởng chi phí của auto-scaling

4. **Dự báo tăng trưởng**
   - Yêu cầu khả năng mở rộng
   - Nhu cầu tính năng trong tương lai
   - Độ phức tạp khi di chuyển

---

## Lựa chọn theo môi trường

### Môi trường Phát triển

**Ưu tiên**: Tối ưu chi phí, chức năng cơ bản, dễ cấp phát/hủy bỏ

#### Recommended SKUs
```yaml
# Development environment configuration
environment: development
skus:
  app_service: "F1"          # Free tier
  sql_database: "Basic"       # Basic tier, 5 DTU
  storage: "Standard_LRS"     # Locally redundant
  cosmos_db: "Free"          # Free tier (400 RU/s)
  key_vault: "Standard"      # Standard pricing tier
  application_insights: "Free" # First 5GB free
```

#### Đặc điểm
- **App Service**: F1 (Free) or B1 (Basic) for simple testing
- **Databases**: Basic tier with minimal resources
- **Storage**: Standard with local redundancy only
- **Compute**: Shared resources acceptable
- **Networking**: Basic configurations

### Staging/Testing Environment

**Ưu tiên**: Cấu hình giống sản xuất, cân bằng chi phí, khả năng kiểm tra hiệu năng

#### Recommended SKUs
```yaml
# Staging environment configuration
environment: staging
skus:
  app_service: "S1"          # Standard tier
  sql_database: "S2"         # Standard tier, 50 DTU
  storage: "Standard_GRS"    # Geo-redundant
  cosmos_db: "Standard"      # 400 RU/s provisioned
  container_apps: "Consumption" # Pay-per-use
```

#### Đặc điểm
- **Performance**: 70-80% of production capacity
- **Features**: Most production features enabled
- **Redundancy**: Some geographic redundancy
- **Scaling**: Limited auto-scaling for testing
- **Monitoring**: Full monitoring stack

### Production Environment

**Ưu tiên**: Hiệu năng, khả dụng, bảo mật, tuân thủ, khả năng mở rộng

#### Recommended SKUs
```yaml
# Production environment configuration
environment: production
skus:
  app_service: "P1V3"        # Premium v3 tier
  sql_database: "P2"         # Premium tier, 250 DTU
  storage: "Premium_GRS"     # Premium geo-redundant
  cosmos_db: "Provisioned"   # Dedicated throughput
  container_apps: "Dedicated" # Dedicated environment
  key_vault: "Premium"       # Premium with HSM
```

#### Đặc điểm
- **High availability**: 99.9%+ SLA requirements
- **Performance**: Dedicated resources, high throughput
- **Security**: Premium security features
- **Scaling**: Full auto-scaling capabilities
- **Monitoring**: Comprehensive observability

---

## Hướng dẫn theo dịch vụ

### Azure App Service

#### Ma trận quyết định SKU

| Trường hợp sử dụng | SKU được khuyến nghị | Lý do |
|-------------------|----------------------|-------|
| Development/Testing | F1 (Free) or B1 (Basic) | Tiết kiệm chi phí, đủ cho thử nghiệm |
| Small production apps | S1 (Standard) | Custom domains, SSL, auto-scaling |
| Medium production apps | P1V3 (Premium V3) | Better performance, more features |
| High-traffic apps | P2V3 or P3V3 | Dedicated resources, high performance |
| Mission-critical apps | I1V2 (Isolated V2) | Network isolation, dedicated hardware |

#### Ví dụ cấu hình

**Development**
```bicep
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'asp-${environmentName}-dev'
  location: location
  sku: {
    name: 'F1'
    tier: 'Free'
    capacity: 1
  }
  properties: {
    reserved: false
  }
}
```

**Production**
```bicep
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'asp-${environmentName}-prod'
  location: location
  sku: {
    name: 'P1V3'
    tier: 'PremiumV3'
    capacity: 3
  }
  properties: {
    reserved: false
  }
}
```

### Azure SQL Database

#### Khung lựa chọn SKU

1. **Dựa trên DTU (Database Transaction Units)**
   - **Basic**: 5 DTU - Phát triển/kiểm thử
   - **Standard**: S0-S12 (10-3000 DTU) - Mục đích chung
   - **Premium**: P1-P15 (125-4000 DTU) - Hiệu năng quan trọng

2. **Dựa trên vCore** (Khuyến nghị cho sản xuất)
   - **General Purpose**: Cân bằng compute và lưu trữ
   - **Business Critical**: Độ trễ thấp, IOPS cao
   - **Hyperscale**: Lưu trữ có thể mở rộng lớn (lên tới 100TB)

#### Ví dụ cấu hình

```bicep
// Development
resource sqlDatabase 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  name: 'db-${environmentName}-dev'
  parent: sqlServer
  location: location
  sku: {
    name: 'Basic'
    tier: 'Basic'
    capacity: 5
  }
  properties: {
    maxSizeBytes: 2147483648 // 2GB
  }
}

// Production
resource sqlDatabase 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  name: 'db-${environmentName}-prod'
  parent: sqlServer
  location: location
  sku: {
    name: 'GP_Gen5'
    tier: 'GeneralPurpose'
    family: 'Gen5'
    capacity: 4
  }
  properties: {
    maxSizeBytes: 536870912000 // 500GB
  }
}
```

### Azure Container Apps

#### Loại môi trường

1. **Consumption-based**
   - Pay-per-use pricing
   - Suitable for development and variable workloads
   - Shared infrastructure

2. **Dedicated (Workload Profiles)**
   - Dedicated compute resources
   - Predictable performance
   - Better for production workloads

#### Ví dụ cấu hình

**Development (Consumption)**
```bicep
resource containerAppEnvironment 'Microsoft.App/managedEnvironments@2022-10-01' = {
  name: 'cae-${environmentName}-dev'
  location: location
  properties: {
    zoneRedundant: false
  }
}

resource containerApp 'Microsoft.App/containerApps@2022-10-01' = {
  name: 'ca-${environmentName}-dev'
  location: location
  properties: {
    managedEnvironmentId: containerAppEnvironment.id
    configuration: {
      ingress: {
        external: true
        targetPort: 3000
      }
    }
    template: {
      containers: [{
        name: 'main'
        image: 'nginx:latest'
        resources: {
          cpu: json('0.25')
          memory: '0.5Gi'
        }
      }]
      scale: {
        minReplicas: 0
        maxReplicas: 1
      }
    }
  }
}
```

**Production (Dedicated)**
```bicep
resource containerAppEnvironment 'Microsoft.App/managedEnvironments@2022-10-01' = {
  name: 'cae-${environmentName}-prod'
  location: location
  properties: {
    zoneRedundant: true
    workloadProfiles: [{
      name: 'production-profile'
      workloadProfileType: 'D4'
      minimumCount: 2
      maximumCount: 10
    }]
  }
}
```

### Azure Cosmos DB

#### Mô hình thông lượng

1. **Manual Provisioned Throughput**
   - Predictable performance
   - Reserved capacity discounts
   - Best for steady workloads

2. **Autoscale Provisioned Throughput**
   - Automatic scaling based on usage
   - Pay for what you use (with minimum)
   - Good for variable workloads

3. **Serverless**
   - Pay-per-request
   - No provisioned throughput
   - Ideal for development and intermittent workloads

#### SKU Examples

```bicep
// Development - Serverless
resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: 'cosmos-${environmentName}-dev'
  location: location
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [{
      locationName: location
    }]
    capabilities: [{
      name: 'EnableServerless'
    }]
  }
}

// Production - Provisioned with Autoscale
resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: 'cosmos-${environmentName}-prod'
  location: location
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [
      {
        locationName: location
        failoverPriority: 0
      }
      {
        locationName: secondaryLocation
        failoverPriority: 1
      }
    ]
    enableAutomaticFailover: true
    enableMultipleWriteLocations: false
  }
}

resource cosmosDatabase 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2023-04-15' = {
  name: 'main'
  parent: cosmosAccount
  properties: {
    resource: {
      id: 'main'
    }
    options: {
      autoscaleSettings: {
        maxThroughput: 4000
      }
    }
  }
}
```

### Azure Storage Account

#### Các loại tài khoản lưu trữ

1. **Standard_LRS** - Phát triển, dữ liệu không quan trọng
2. **Standard_GRS** - Sản xuất, cần sao lưu địa lý
3. **Premium_LRS** - Ứng dụng cần hiệu năng cao
4. **Premium_ZRS** - Khả dụng cao với dự phòng theo zone

#### Các cấp hiệu năng

- **Standard**: Mục đích chung, tiết kiệm chi phí
- **Premium**: Hiệu năng cao, kịch bản độ trễ thấp

```bicep
// Development
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'sa${uniqueString(resourceGroup().id)}dev'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    minimumTlsVersion: 'TLS1_2'
  }
}

// Production
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'sa${uniqueString(resourceGroup().id)}prod'
  location: location
  sku: {
    name: 'Standard_GRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    minimumTlsVersion: 'TLS1_2'
    networkAcls: {
      defaultAction: 'Deny'
      virtualNetworkRules: []
      ipRules: []
    }
  }
}
```

---

## Chiến lược tối ưu chi phí

### 1. Đặt trước dung lượng

Reserve resources for 1-3 years for significant discounts:

```bash
# Kiểm tra các tùy chọn đặt chỗ
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Chọn kích thước phù hợp

Start with smaller SKUs and scale up based on actual usage:

```yaml
# Progressive scaling approach
development:
  app_service: "F1"    # Free tier
testing:
  app_service: "B1"    # Basic tier  
staging:
  app_service: "S1"    # Standard tier
production:
  app_service: "P1V3"  # Premium tier
```

### 3. Cấu hình tự động mở rộng

Implement intelligent scaling to optimize costs:

```bicep
resource autoScaleSettings 'Microsoft.Insights/autoscalesettings@2022-10-01' = {
  name: 'autoscale-${appServicePlan.name}'
  location: location
  properties: {
    profiles: [{
      name: 'default'
      capacity: {
        minimum: '1'
        maximum: '10'
        default: '2'
      }
      rules: [
        {
          metricTrigger: {
            metricName: 'CpuPercentage'
            metricResourceUri: appServicePlan.id
            operator: 'GreaterThan'
            threshold: 70
            timeAggregation: 'Average'
            timeGrain: 'PT1M'
            timeWindow: 'PT5M'
          }
          scaleAction: {
            direction: 'Increase'
            type: 'ChangeCount'
            value: '1'
            cooldown: 'PT5M'
          }
        }
        {
          metricTrigger: {
            metricName: 'CpuPercentage'
            metricResourceUri: appServicePlan.id
            operator: 'LessThan'
            threshold: 30
            timeAggregation: 'Average'
            timeGrain: 'PT1M'
            timeWindow: 'PT5M'
          }
          scaleAction: {
            direction: 'Decrease'
            type: 'ChangeCount'
            value: '1'
            cooldown: 'PT5M'
          }
        }
      ]
    }]
    enabled: true
    targetResourceUri: appServicePlan.id
  }
}
```

### 4. Lên lịch mở rộng

Scale down during off-hours:

```json
{
  "profiles": [
    {
      "name": "business-hours",
      "capacity": {
        "minimum": "2",
        "maximum": "10", 
        "default": "3"
      },
      "recurrence": {
        "frequency": "Week",
        "schedule": {
          "timeZone": "Pacific Standard Time",
          "days": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
          "hours": [8],
          "minutes": [0]
        }
      }
    },
    {
      "name": "off-hours",
      "capacity": {
        "minimum": "1",
        "maximum": "2",
        "default": "1"
      },
      "recurrence": {
        "frequency": "Week", 
        "schedule": {
          "timeZone": "Pacific Standard Time",
          "days": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
          "hours": [18],
          "minutes": [0]
        }
      }
    }
  ]
}
```

---

## Các lưu ý về hiệu năng

### Yêu cầu hiệu năng cơ bản

Define clear performance requirements before SKU selection:

```yaml
performance_requirements:
  response_time:
    p95: "< 500ms"
    p99: "< 1000ms"
  throughput:
    requests_per_second: 1000
    concurrent_users: 500
  availability:
    uptime: "99.9%"
    rpo: "15 minutes"
    rto: "30 minutes"
```

### Kiểm tra tải

Test different SKUs to validate performance:

```bash
# Dịch vụ kiểm thử tải Azure
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Giám sát và tối ưu hóa

Set up comprehensive monitoring:

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'ai-${environmentName}'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    RetentionInDays: 90
  }
}

resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: 'law-${environmentName}'
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}
```

---

## Bảng tham khảo nhanh

### Tham chiếu nhanh SKU App Service

| SKU | Cấp | vCPU | RAM | Storage | Price Range | Trường hợp sử dụng |
|-----|------|------|-----|---------|-------------|--------------------|
| F1 | Free | Shared | 1GB | 1GB | Free | Development |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Small apps |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Production |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | High performance |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### Tham chiếu nhanh SKU SQL Database

| SKU | Cấp | DTU/vCore | Storage | Price Range | Trường hợp sử dụng |
|-----|------|-----------|---------|-------------|--------------------|
| Basic | Basic | 5 DTU | 2GB | $ | Development |
| S2 | Standard | 50 DTU | 250GB | $$ | Small production |
| P2 | Premium | 250 DTU | 1TB | $$$ | High performance |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Balanced |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Mission critical |

### Tham chiếu nhanh SKU Container Apps

| Model | Pricing | CPU/Memory | Trường hợp sử dụng |
|-------|---------|------------|-------------------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Development, variable load |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Production |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | High performance |

---

## Công cụ xác thực

### SKU Availability Checker

```bash
#!/bin/bash
# Kiểm tra tính khả dụng của SKU trong khu vực đích

check_sku_availability() {
    local region=$1
    local resource_type=$2
    local sku=$3
    
    echo "Checking $sku availability for $resource_type in $region..."
    
    case $resource_type in
        "app-service")
            az appservice list-locations --sku $sku --output table
            ;;
        "sql-database")
            az sql db list-editions --location $region --output table
            ;;
        "storage")
            az storage account check-name --name "test" --output table
            ;;
        *)
            echo "Resource type not supported"
            ;;
    esac
}

# Cách sử dụng
check_sku_availability "eastus" "app-service" "P1V3"
```

### Cost Estimation Script

```powershell
# Tập lệnh PowerShell để ước tính chi phí
function Get-AzureCostEstimate {
    param(
        [string]$SubscriptionId,
        [string]$ResourceGroup,
        [hashtable]$Resources
    )
    
    $totalCost = 0
    
    foreach ($resource in $Resources.GetEnumerator()) {
        $resourceType = $resource.Key
        $sku = $resource.Value
        
        # Sử dụng Azure Pricing API hoặc trình tính toán
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Cách sử dụng
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### Performance Validation

```yaml
# Load test configuration for SKU validation
test_configuration:
  duration: "10m"
  users:
    spawn_rate: 10
    max_users: 100
  
  scenarios:
    - name: "sku_performance_test"
      requests:
        - url: "https://myapp.azurewebsites.net/api/health"
          method: "GET"
          expect:
            - status_code: 200
            - response_time_ms: 500
        
        - url: "https://myapp.azurewebsites.net/api/data"
          method: "POST"
          expect:
            - status_code: 201
            - response_time_ms: 1000

  thresholds:
    http_req_duration:
      - "p(95)<500"  # 95% of requests under 500ms
      - "p(99)<1000" # 99% of requests under 1s
    http_req_failed:
      - "rate<0.1"   # Less than 10% failure rate
```

---

## Tóm tắt các thực hành tốt nhất

### Nên làm

1. **Bắt đầu nhỏ và mở rộng** dựa trên sử dụng thực tế
2. **Sử dụng các SKU khác nhau cho các môi trường khác nhau**
3. **Giám sát hiệu năng và chi phí liên tục**
4. **Tận dụng đặt trước dung lượng cho khối lượng sản xuất**
5. **Triển khai auto-scaling khi phù hợp**
6. **Kiểm tra hiệu năng với khối lượng công việc thực tế**
7. **Lập kế hoạch cho tăng trưởng nhưng tránh cấp quá mức**
8. **Sử dụng các cấp miễn phí cho phát triển khi có thể**

### Không nên

1. **Không sử dụng SKU sản xuất cho phát triển**
2. **Không bỏ qua khả dụng theo khu vực của SKU**
3. **Không quên chi phí truyền dữ liệu**
4. **Không cấp quá mức mà không có lý do**
5. **Không bỏ qua ảnh hưởng của các phụ thuộc**
6. **Không đặt giới hạn auto-scaling quá cao**
7. **Không quên các yêu cầu tuân thủ**
8. **Không đưa ra quyết định chỉ dựa trên giá**

---

**Mẹo chuyên nghiệp**: Sử dụng Azure Cost Management và Advisor để nhận các khuyến nghị cá nhân hóa nhằm tối ưu lựa chọn SKU của bạn dựa trên mẫu sử dụng thực tế.

---

**Điều hướng**
- **Bài trước**: [Capacity Planning](capacity-planning.md)
- **Bài tiếp theo**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Văn bản này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Văn bản gốc bằng ngôn ngữ ban đầu nên được coi là nguồn có thẩm quyền. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ sự hiểu nhầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
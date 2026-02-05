# Hướng Dẫn Chọn SKU - Lựa Chọn Các Tầng Dịch Vụ Azure Phù Hợp

**Điều Hướng Chương:**
- **📚 Trang Chủ Khóa Học**: [AZD For Beginners](../../README.md)
- **📖 Chương Hiện Tại**: Chương 6 - Xác Thực & Lập Kế Hoạch Trước Triển Khai
- **⬅️ Trước**: [Lập Kế Hoạch Năng Lực](capacity-planning.md)
- **➡️ Tiếp Theo**: [Kiểm Tra Trước Triển Khai](preflight-checks.md)
- **🚀 Chương Tiếp Theo**: [Chương 7: Xử Lý Sự Cố](../troubleshooting/common-issues.md)

## Giới Thiệu

Hướng dẫn toàn diện này giúp bạn chọn các SKU (Stock Keeping Units) dịch vụ Azure tối ưu cho các môi trường, khối lượng công việc, và yêu cầu khác nhau. Tìm hiểu cách phân tích nhu cầu hiệu suất, cân nhắc chi phí, và yêu cầu mở rộng để chọn các tầng dịch vụ phù hợp nhất cho triển khai Azure Developer CLI của bạn.

## Mục Tiêu Học Tập

Khi hoàn thành hướng dẫn này, bạn sẽ:
- Hiểu các khái niệm về SKU Azure, mô hình giá cả, và sự khác biệt về tính năng
- Thành thạo chiến lược chọn SKU theo môi trường cho phát triển, thử nghiệm, và sản xuất
- Phân tích yêu cầu khối lượng công việc và ghép nối chúng với các tầng dịch vụ phù hợp
- Thực hiện các chiến lược tối ưu hóa chi phí thông qua việc chọn SKU thông minh
- Áp dụng các kỹ thuật kiểm tra hiệu suất và xác thực cho các lựa chọn SKU
- Cấu hình các đề xuất SKU tự động và giám sát

## Kết Quả Học Tập

Sau khi hoàn thành, bạn sẽ có thể:
- Chọn các SKU dịch vụ Azure phù hợp dựa trên yêu cầu và hạn chế của khối lượng công việc
- Thiết kế kiến trúc đa môi trường hiệu quả về chi phí với việc chọn tầng phù hợp
- Thực hiện kiểm tra hiệu suất và xác thực cho các lựa chọn SKU
- Tạo công cụ tự động để đề xuất SKU và tối ưu hóa chi phí
- Lập kế hoạch di chuyển SKU và chiến lược mở rộng cho các yêu cầu thay đổi
- Áp dụng các nguyên tắc của Azure Well-Architected Framework vào việc chọn tầng dịch vụ

## Mục Lục

- [Hiểu Về SKU](../../../../docs/pre-deployment)
- [Lựa Chọn Theo Môi Trường](../../../../docs/pre-deployment)
- [Hướng Dẫn Theo Dịch Vụ](../../../../docs/pre-deployment)
- [Chiến Lược Tối Ưu Hóa Chi Phí](../../../../docs/pre-deployment)
- [Cân Nhắc Hiệu Suất](../../../../docs/pre-deployment)
- [Bảng Tham Khảo Nhanh](../../../../docs/pre-deployment)
- [Công Cụ Xác Thực](../../../../docs/pre-deployment)

---

## Hiểu Về SKU

### SKU Là Gì?

SKU (Stock Keeping Units) đại diện cho các tầng dịch vụ và mức hiệu suất khác nhau của tài nguyên Azure. Mỗi SKU cung cấp các đặc điểm khác nhau:

- **Đặc điểm hiệu suất** (CPU, bộ nhớ, thông lượng)
- **Khả năng tính năng** (tùy chọn mở rộng, mức SLA)
- **Mô hình giá cả** (dựa trên tiêu thụ, dung lượng đặt trước)
- **Khả năng khu vực** (không phải tất cả SKU đều có sẵn ở mọi khu vực)

### Các Yếu Tố Chính Trong Việc Chọn SKU

1. **Yêu Cầu Khối Lượng Công Việc**
   - Mẫu lưu lượng/tải dự kiến
   - Yêu cầu hiệu suất (CPU, bộ nhớ, I/O)
   - Nhu cầu lưu trữ và mẫu truy cập

2. **Loại Môi Trường**
   - Phát triển/thử nghiệm so với sản xuất
   - Yêu cầu khả dụng
   - Nhu cầu bảo mật và tuân thủ

3. **Hạn Chế Ngân Sách**
   - Chi phí ban đầu so với chi phí vận hành
   - Giảm giá dung lượng đặt trước
   - Tác động chi phí của tự động mở rộng

4. **Dự Báo Tăng Trưởng**
   - Yêu cầu mở rộng
   - Nhu cầu tính năng trong tương lai
   - Độ phức tạp của di chuyển

---

## Lựa Chọn Theo Môi Trường

### Môi Trường Phát Triển

**Ưu Tiên**: Tối ưu hóa chi phí, chức năng cơ bản, dễ dàng cung cấp/hủy cung cấp

#### SKU Đề Xuất
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

#### Đặc Điểm
- **App Service**: F1 (Miễn phí) hoặc B1 (Cơ bản) cho thử nghiệm đơn giản
- **Cơ Sở Dữ Liệu**: Tầng cơ bản với tài nguyên tối thiểu
- **Lưu Trữ**: Tiêu chuẩn với chỉ dự phòng cục bộ
- **Tính Toán**: Chấp nhận tài nguyên chia sẻ
- **Mạng**: Cấu hình cơ bản

### Môi Trường Thử Nghiệm

**Ưu Tiên**: Cấu hình giống sản xuất, cân bằng chi phí, khả năng kiểm tra hiệu suất

#### SKU Đề Xuất
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

#### Đặc Điểm
- **Hiệu Suất**: 70-80% công suất sản xuất
- **Tính Năng**: Hầu hết các tính năng sản xuất được kích hoạt
- **Dự Phòng**: Một số dự phòng địa lý
- **Mở Rộng**: Tự động mở rộng giới hạn để thử nghiệm
- **Giám Sát**: Bộ giám sát đầy đủ

### Môi Trường Sản Xuất

**Ưu Tiên**: Hiệu suất, khả dụng, bảo mật, tuân thủ, mở rộng

#### SKU Đề Xuất
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

#### Đặc Điểm
- **Khả Dụng Cao**: Yêu cầu SLA 99.9%+
- **Hiệu Suất**: Tài nguyên chuyên dụng, thông lượng cao
- **Bảo Mật**: Tính năng bảo mật cao cấp
- **Mở Rộng**: Khả năng tự động mở rộng đầy đủ
- **Giám Sát**: Khả năng quan sát toàn diện

---

## Hướng Dẫn Theo Dịch Vụ

### Azure App Service

#### Ma Trận Quyết Định SKU

| Trường Hợp Sử Dụng | SKU Đề Xuất | Lý Do |
|---------------------|-------------|-------|
| Phát triển/thử nghiệm | F1 (Miễn phí) hoặc B1 (Cơ bản) | Chi phí thấp, đủ cho thử nghiệm |
| Ứng dụng sản xuất nhỏ | S1 (Tiêu chuẩn) | Tên miền tùy chỉnh, SSL, tự động mở rộng |
| Ứng dụng sản xuất trung bình | P1V3 (Premium V3) | Hiệu suất tốt hơn, nhiều tính năng hơn |
| Ứng dụng lưu lượng cao | P2V3 hoặc P3V3 | Tài nguyên chuyên dụng, hiệu suất cao |
| Ứng dụng quan trọng | I1V2 (Isolated V2) | Cách ly mạng, phần cứng chuyên dụng |

#### Ví Dụ Cấu Hình

**Phát Triển**
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

**Sản Xuất**
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

#### Khung Lựa Chọn SKU

1. **Dựa Trên DTU (Database Transaction Units)**
   - **Cơ Bản**: 5 DTU - Phát triển/thử nghiệm
   - **Tiêu Chuẩn**: S0-S12 (10-3000 DTU) - Mục đích chung
   - **Cao Cấp**: P1-P15 (125-4000 DTU) - Hiệu suất quan trọng

2. **Dựa Trên vCore** (Khuyến nghị cho sản xuất)
   - **Mục Đích Chung**: Cân bằng tính toán và lưu trữ
   - **Quan Trọng Kinh Doanh**: Độ trễ thấp, IOPS cao
   - **Hyperscale**: Lưu trữ mở rộng cao (lên đến 100TB)

#### Ví Dụ Cấu Hình

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

#### Loại Môi Trường

1. **Dựa Trên Tiêu Thụ**
   - Giá theo sử dụng
   - Phù hợp cho phát triển và khối lượng công việc biến đổi
   - Hạ tầng chia sẻ

2. **Chuyên Dụng (Hồ Sơ Khối Lượng Công Việc)**
   - Tài nguyên tính toán chuyên dụng
   - Hiệu suất dự đoán
   - Tốt hơn cho khối lượng công việc sản xuất

#### Ví Dụ Cấu Hình

**Phát Triển (Tiêu Thụ)**
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

**Sản Xuất (Chuyên Dụng)**
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

#### Mô Hình Thông Lượng

1. **Thông Lượng Được Cung Cấp Thủ Công**
   - Hiệu suất dự đoán
   - Giảm giá dung lượng đặt trước
   - Tốt nhất cho khối lượng công việc ổn định

2. **Thông Lượng Tự Động Mở Rộng**
   - Tự động mở rộng dựa trên sử dụng
   - Trả tiền theo mức sử dụng (với mức tối thiểu)
   - Tốt cho khối lượng công việc biến đổi

3. **Serverless**
   - Trả tiền theo yêu cầu
   - Không có thông lượng được cung cấp
   - Lý tưởng cho phát triển và khối lượng công việc không thường xuyên

#### Ví Dụ SKU

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

#### Loại Tài Khoản Lưu Trữ

1. **Standard_LRS** - Phát triển, dữ liệu không quan trọng
2. **Standard_GRS** - Sản xuất, cần dự phòng địa lý
3. **Premium_LRS** - Ứng dụng hiệu suất cao
4. **Premium_ZRS** - Khả dụng cao với dự phòng theo vùng

#### Tầng Hiệu Suất

- **Tiêu Chuẩn**: Mục đích chung, chi phí thấp
- **Cao Cấp**: Hiệu suất cao, độ trễ thấp

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

## Chiến Lược Tối Ưu Hóa Chi Phí

### 1. Dung Lượng Đặt Trước

Đặt trước tài nguyên trong 1-3 năm để được giảm giá đáng kể:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Định Cỡ Phù Hợp

Bắt đầu với các SKU nhỏ hơn và mở rộng dựa trên mức sử dụng thực tế:

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

### 3. Cấu Hình Tự Động Mở Rộng

Thực hiện mở rộng thông minh để tối ưu hóa chi phí:

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

### 4. Mở Rộng Theo Lịch Trình

Giảm quy mô trong giờ thấp điểm:

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

## Cân Nhắc Hiệu Suất

### Yêu Cầu Hiệu Suất Cơ Bản

Xác định rõ yêu cầu hiệu suất trước khi chọn SKU:

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

### Kiểm Tra Tải

Kiểm tra các SKU khác nhau để xác thực hiệu suất:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Giám Sát và Tối Ưu Hóa

Thiết lập giám sát toàn diện:

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

## Bảng Tham Khảo Nhanh

### Tham Khảo Nhanh SKU App Service

| SKU | Tầng | vCPU | RAM | Lưu Trữ | Phạm Vi Giá | Trường Hợp Sử Dụng |
|-----|------|------|-----|---------|-------------|--------------------|
| F1 | Miễn phí | Chia sẻ | 1GB | 1GB | Miễn phí | Phát triển |
| B1 | Cơ bản | 1 | 1.75GB | 10GB | $ | Ứng dụng nhỏ |
| S1 | Tiêu chuẩn | 1 | 1.75GB | 50GB | $$ | Sản xuất |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Hiệu suất cao |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Doanh nghiệp |

### Tham Khảo Nhanh SKU SQL Database

| SKU | Tầng | DTU/vCore | Lưu Trữ | Phạm Vi Giá | Trường Hợp Sử Dụng |
|-----|------|-----------|---------|-------------|--------------------|
| Cơ Bản | Cơ bản | 5 DTU | 2GB | $ | Phát triển |
| S2 | Tiêu chuẩn | 50 DTU | 250GB | $$ | Sản xuất nhỏ |
| P2 | Cao cấp | 250 DTU | 1TB | $$$ | Hiệu suất cao |
| GP_Gen5_4 | Mục đích chung | 4 vCore | 4TB | $$$ | Cân bằng |
| BC_Gen5_8 | Quan trọng kinh doanh | 8 vCore | 4TB | $$$$ | Quan trọng |

### Tham Khảo Nhanh SKU Container Apps

| Mô Hình | Giá | CPU/Bộ Nhớ | Trường Hợp Sử Dụng |
|---------|-----|------------|--------------------|
| Tiêu thụ | Trả theo sử dụng | 0.25-2 vCPU | Phát triển, tải biến đổi |
| Chuyên dụng D4 | Đặt trước | 4 vCPU, 16GB | Sản xuất |
| Chuyên dụng D8 | Đặt trước | 8 vCPU, 32GB | Hiệu suất cao |

---

## Công Cụ Xác Thực

### Công Cụ Kiểm Tra Khả Dụng SKU

```bash
#!/bin/bash
# Check SKU availability in target region

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

# Usage
check_sku_availability "eastus" "app-service" "P1V3"
```

### Script Ước Tính Chi Phí

```powershell
# PowerShell script for cost estimation
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
        
        # Use Azure Pricing API or calculator
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Usage
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### Xác Thực Hiệu Suất

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

## Tóm Tắt Các Thực Hành Tốt Nhất

### Nên Làm

1. **Bắt đầu nhỏ và mở rộng** dựa trên mức sử dụng thực tế
2. **Sử dụng các SKU khác nhau cho các môi trường khác nhau**
3. **Giám sát hiệu suất và chi phí liên tục**
4. **Tận dụng dung lượng đặt trước cho khối lượng công việc sản xuất**
5. **Thực hiện tự động mở rộng khi phù hợp**
6. **Kiểm tra hiệu suất với khối lượng công việc thực tế**
7. **Lập kế hoạch tăng trưởng nhưng tránh cung cấp quá mức**
8. **Sử dụng tầng miễn phí cho phát triển khi có thể**

### Không Nên Làm

1. **Không sử dụng SKU sản xuất cho phát triển**
2. **Không bỏ qua khả dụng SKU theo khu vực**
3. **Không quên chi phí chuyển dữ liệu**
4. **Không cung cấp quá mức mà không có lý do**
5. **Không bỏ qua tác động của các phụ thuộc**
6. **Không đặt giới hạn tự động mở rộng quá cao**
7. **Không quên yêu cầu tuân thủ**
8. **Không đưa ra quyết định chỉ dựa trên giá cả**

---

**Mẹo Chuyên Nghiệp**: Sử dụng Azure Cost Management và Advisor để nhận các đề xuất cá nhân hóa nhằm tối ưu hóa lựa chọn SKU của bạn dựa trên mẫu sử dụng thực tế.

---

**Điều Hướng**
- **Bài Học Trước**: [Lập Kế Hoạch Năng Lực](capacity-planning.md)
- **Bài Học Tiếp Theo**: [Kiểm Tra Trước Triển Khai](preflight-checks.md)

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
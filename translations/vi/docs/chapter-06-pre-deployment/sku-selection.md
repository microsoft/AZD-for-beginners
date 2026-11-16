# Hướng Dẫn Chọn SKU - Lựa Chọn Các Cấp Dịch Vụ Azure Phù Hợp

**Điều Hướng Chương:**
- **📚 Trang Chủ Khóa Học**: [AZD For Beginners](../../README.md)
- **📖 Chương Hiện Tại**: Chương 6 - Kiểm Tra & Lập Kế Hoạch Trước Triển Khai
- **⬅️ Trước**: [Capacity Planning](capacity-planning.md)
- **➡️ Tiếp**: [Pre-flight Checks](preflight-checks.md)
- **🚀 Chương Tiếp Theo**: [Chương 7: Khắc Phục Sự Cố](../chapter-07-troubleshooting/common-issues.md)

## Giới Thiệu

Hướng dẫn toàn diện này giúp bạn lựa chọn các SKU dịch vụ Azure tối ưu cho các môi trường, khối lượng công việc và yêu cầu khác nhau. Tìm hiểu cách phân tích nhu cầu hiệu năng, cân nhắc chi phí và yêu cầu mở rộng để chọn các cấp dịch vụ phù hợp nhất cho các triển khai Azure Developer CLI của bạn.

## Mục Tiêu Học Tập

Khi hoàn thành hướng dẫn này, bạn sẽ:
- Hiểu các khái niệm SKU Azure, mô hình giá, và khác biệt tính năng
- Làm chủ chiến lược lựa chọn SKU theo môi trường cho phát triển, giai đoạn thử nghiệm, và sản xuất
- Phân tích yêu cầu khối lượng công việc và đối chiếu với các cấp dịch vụ phù hợp
- Áp dụng chiến lược tối ưu chi phí thông qua lựa chọn SKU thông minh
- Thực hiện kiểm thử và xác thực hiệu năng cho lựa chọn SKU
- Cấu hình đề xuất SKU tự động và giám sát

## Kết Quả Học Tập

Sau khi hoàn thành, bạn sẽ có khả năng:
- Chọn SKU dịch vụ Azure phù hợp dựa trên yêu cầu và giới hạn khối lượng công việc
- Thiết kế kiến trúc đa môi trường với chi phí hiệu quả thông qua lựa chọn cấp phù hợp
- Thực hiện đánh giá hiệu năng và xác thực lựa chọn SKU
- Tạo công cụ tự động đề xuất SKU và tối ưu chi phí
- Lập kế hoạch di cư SKU và chiến lược mở rộng khi yêu cầu thay đổi
- Áp dụng các nguyên tắc của Azure Well-Architected Framework cho lựa chọn cấp dịch vụ

## Mục Lục

- [Hiểu Về SKU](#understanding-skus)
- [Lựa Chọn Theo Môi Trường](#environment-based-selection)
- [Hướng Dẫn Theo Dịch Vụ](#service-specific-guidelines)
- [Chiến Lược Tối Ưu Chi Phí](#cost-optimization-strategies)
- [Cân Nhắc Hiệu Năng](#performance-considerations)
- [Bảng Tham Chiếu Nhanh](#quick-reference-tables)
- [Công Cụ Xác Thực](#validation-tools)

---

## Hiểu Về SKU

> **Phạm vi ví dụ:** Các bản đồ SKU YAML và cấu hình hiệu năng dưới đây là ghi chú thiết kế, không phải `azure.yaml` schema hoặc cấu hình công cụ tải. Các khối Bicep là các lựa chọn/mảnh mã: khai báo tham số và tài nguyên cha, dùng tên ký hiệu duy nhất khi kết hợp, và nối các module thành dự án hoạt động. Giá cả, giới hạn và khả năng có mặt theo vùng/cấp SKU phải được kiểm tra trên đăng ký của bạn trước triển khai.

### SKU là gì?

SKU (Stock Keeping Units) đại diện cho các cấp dịch vụ và mức hiệu năng khác nhau cho tài nguyên Azure. Mỗi SKU cung cấp sự khác biệt về:

- **Đặc tính hiệu năng** (CPU, bộ nhớ, thông lượng)
- **Khả năng tính năng** (tùy chọn mở rộng, mức SLA)
- **Mô hình giá** (theo mức tiêu thụ, dung lượng đặt trước)
- **Khả năng hỗ trợ vùng miền** (không phải SKU nào cũng có ở mọi vùng)

### Các Yếu Tố Chính Trong Việc Chọn SKU

1. **Yêu cầu khối lượng công việc**
   - Mô hình lưu lượng/dòng dữ liệu dự kiến
   - Yêu cầu hiệu năng (CPU, bộ nhớ, I/O)
   - Nhu cầu lưu trữ và mẫu truy cập

2. **Loại môi trường**
   - Phát triển/kiểm thử so với sản xuất
   - Yêu cầu sẵn sàng
   - Nhu cầu bảo mật và tuân thủ

3. **Giới hạn ngân sách**
   - Chi phí ban đầu so với chi phí vận hành
   - Giảm giá khi đặt trước dung lượng
   - Hệ quả chi phí do tự động mở rộng

4. **Dự báo tăng trưởng**
   - Yêu cầu khả năng mở rộng
   - Nhu cầu tính năng tương lai
   - Độ phức tạp trong di cư

---

## Lựa Chọn Theo Môi Trường

### Môi Trường Phát Triển

**Ưu Tiên**: Tối ưu chi phí, chức năng cơ bản, dễ dàng cấp/tước tài nguyên

#### SKU Được Khuyên Dùng
```yaml
# Development environment configuration
environment: development
skus:
  app_service: "F1"          # Free tier
  sql_database: "Basic"       # Basic tier, 5 DTU
  storage: "Standard_LRS"     # Locally redundant
  cosmos_db: "Standard"      # Free tier is an account opt-in, not a SKU
  key_vault: "Standard"      # Standard pricing tier
  application_insights: "workspace-based" # Consumption billing; no Free SKU
```

#### Đặc Điểm
- **App Service**: F1 (Miễn phí) hoặc B1 (Cơ bản) cho thử nghiệm đơn giản
- **Cơ sở dữ liệu**: cấp Basic với tài nguyên tối thiểu
- **Lưu trữ**: Standard chỉ với độ dự phòng cục bộ
- **Tính toán**: Chấp nhận sử dụng tài nguyên chia sẻ
- **Mạng**: Cấu hình cơ bản

### Môi Trường Giai Đoạn/Thử Nghiệm

**Ưu Tiên**: Cấu hình giống sản xuất, cân bằng chi phí, khả năng kiểm thử hiệu năng

#### SKU Được Khuyên Dùng
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
- **Hiệu năng**: 70-80% công suất sản xuất
- **Tính năng**: Hầu hết các tính năng sản xuất được bật
- **Dự phòng**: Một số dự phòng theo vùng địa lý
- **Mở rộng**: Tự động mở rộng có giới hạn cho thử nghiệm
- **Giám sát**: Toàn bộ tính năng giám sát

### Môi Trường Sản Xuất

**Ưu Tiên**: Hiệu năng, tính sẵn sàng, bảo mật, tuân thủ, khả năng mở rộng

#### SKU Được Khuyên Dùng
```yaml
# Production environment configuration
environment: production
skus:
  app_service: "P1V3"        # Premium v3 tier
  sql_database: "P2"         # Premium tier, 250 DTU
  storage: "Standard_GRS"    # Geo-redundant; Premium_GRS is not a storage SKU
  cosmos_db: "Provisioned"   # Dedicated throughput
  container_apps: "Dedicated" # Dedicated environment
  key_vault: "Premium"       # Premium with HSM
```

#### Đặc Điểm
- **Tính khả dụng cao**: Yêu cầu SLA 99.9%+
- **Hiệu năng**: Tài nguyên chuyên dụng, thông lượng cao
- **Bảo mật**: Tính năng bảo mật cao cấp
- **Mở rộng**: Khả năng tự động mở rộng đầy đủ
- **Giám sát**: Quan sát toàn diện

---

## Hướng Dẫn Theo Dịch Vụ

### Azure App Service

#### Ma Trận Quyết Định SKU

| Trường Hợp Sử Dụng | SKU Khuyên Dùng | Lý Do |
|----------|----------------|-----------|
| Phát triển/Thử nghiệm | F1 (Miễn phí) hoặc B1 (Cơ bản) | Hiệu quả về chi phí, đủ cho thử nghiệm |
| Ứng dụng nhỏ sản xuất | S1 (Standard) | Tên miền tùy chỉnh, SSL, tự động mở rộng |
| Ứng dụng trung bình sản xuất | P1V3 (Premium V3) | Hiệu năng tốt hơn, nhiều tính năng hơn |
| Ứng dụng lưu lượng cao | P2V3 hoặc P3V3 | Tài nguyên chuyên dụng, hiệu năng cao |
| Ứng dụng quan trọng đặc biệt | I1V2 (Isolated V2) | Cô lập mạng, phần cứng chuyên dụng |

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

1. **Dựa trên DTU (Đơn vị Giao dịch Cơ sở dữ liệu)**
   - **Basic**: 5 DTU - Phát triển/kiểm thử
   - **Standard**: S0-S12 (10-3000 DTU) - Mục đích chung
   - **Premium**: P1-P15 (125-4000 DTU) - Yêu cầu hiệu năng cao

2. **Dựa trên vCore** (Khuyến nghị cho sản xuất)
   - **General Purpose**: Cân bằng giữa tính toán và lưu trữ
   - **Business Critical**: Độ trễ thấp, IOPS cao
   - **Hyperscale**: Lưu trữ mở rộng cao; kiểm tra giới hạn kích thước hiện tại và hỗ trợ vùng

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

1. **Dựa trên tiêu thụ**
   - Thanh toán theo mức sử dụng
   - Phù hợp phát triển và khối lượng biến động
   - Cơ sở hạ tầng dùng chung

2. **Chuyên Dụng (Hồ Sơ Khối Lượng Công Việc)**
   - Tài nguyên tính toán chuyên dụng
   - Hiệu năng ổn định
   - Phù hợp cho khối lượng sản xuất

#### Ví Dụ Cấu Hình

**Phát Triển (Tiêu thụ)**
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
        targetPort: 80 // nginx listens on 80 by default
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
resource containerAppEnvironment 'Microsoft.App/managedEnvironments@2024-03-01' = {
  name: 'cae-${environmentName}-prod'
  location: location
  properties: {
    zoneRedundant: true
    workloadProfiles: [{
      name: 'production-profile'
      workloadProfileType: 'D4'
      minimumCount: 3
      maximumCount: 10
    }]
  }
}
```

Dự phòng vùng cũng đòi hỏi hạ tầng vùng hỗ trợ và cấu hình VNet/subnet phù hợp, không trình bày ở đây. Ví dụ này dự trù ba nút chuyên dụng; cấu hình ít nhất hai bản sao app để phân phối qua vùng và kích thước cả bản sao và nút để xử lý sự cố vùng. Xem [Hướng dẫn độ tin cậy Container Apps](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Để đặt app trên hồ sơ này, cần thiết lập `workloadProfileName: 'production-profile'` của nó; tạo hồ sơ không tự động chuyển app sang đó.

### Azure Cosmos DB

#### Mô Hình Thông Lượng

1. **Thông lượng đặt trước thủ công**
   - Hiệu năng dự đoán được
   - Giảm giá dung lượng đặt trước
   - Phù hợp cho khối lượng ổn định

2. **Thông lượng đặt trước tự động mở rộng**
   - Tự động mở rộng dựa trên sử dụng
   - Thanh toán theo mức dùng thực tế (có mức tối thiểu)
   - Phù hợp khối lượng biến động

3. **Serverless**
   - Thanh toán theo số yêu cầu
   - Không có thông lượng đặt trước
   - Lý tưởng cho phát triển và khối lượng không liên tục

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
3. **Premium_LRS** - Ứng dụng hiệu năng cao
4. **Premium_ZRS** - Tính khả dụng cao với dự phòng vùng

#### Cấp Hiệu Năng

- **Standard**: Mục đích chung, chi phí hiệu quả
- **Premium**: Hiệu năng cao, độ trễ thấp

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

## Chiến Lược Tối Ưu Chi Phí

### 1. Đặt trước dung lượng

Đặt trước tài nguyên 1-3 năm để nhận giảm giá lớn:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Các loại đặt trước và loại tài nguyên đủ điều kiện thay đổi; kiểm tra catalog và điều khoản mua hàng thay vì giả định mọi dịch vụ/SKU đều hỗ trợ đặt trước.

### 2. Lựa chọn kích thước phù hợp

Bắt đầu với SKU nhỏ hơn và mở rộng dựa trên sử dụng thực tế:

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

Thực hiện mở rộng thông minh để tối ưu chi phí:

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
            statistic: 'Average'
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
            statistic: 'Average'
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

### 4. Mở rộng theo lịch trình

Giảm quy mô trong giờ nghỉ:

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

## Cân Nhắc Hiệu Năng

### Yêu Cầu Hiệu Năng Cơ Bản

Định nghĩa yêu cầu hiệu năng rõ ràng trước khi chọn SKU:

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

Kiểm tra các SKU khác nhau để xác thực hiệu năng:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### Giám Sát và Tối Ưu

Thiết lập giám sát toàn diện:

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'ai-${environmentName}'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
    IngestionMode: 'LogAnalytics'
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

## Bảng Tham Chiếu Nhanh

### Tham Chiếu Nhanh App Service SKU

| SKU | Cấp | vCPU | RAM | Lưu Trữ | Khoảng Giá | Trường Hợp Sử Dụng |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Miễn phí | Chia sẻ | 1GB | 1GB | Miễn phí | Phát triển |
| B1 | Cơ bản | 1 | 1.75GB | 10GB | $ | Ứng dụng nhỏ |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Sản xuất |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Hiệu năng cao |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Doanh nghiệp |

### Tham Chiếu Nhanh SQL Database SKU

| SKU | Cấp | DTU/vCore | Lưu Trữ | Khoảng Giá | Trường Hợp Sử Dụng |
|-----|------|-----------|---------|-------------|----------|
| Basic | Cơ bản | 5 DTU | 2GB | $ | Phát triển |
| S2 | Standard | 50 DTU | 250GB | $$ | Sản xuất nhỏ |
| P2 | Premium | 250 DTU | 1TB | $$$ | Hiệu năng cao |
| GP_Gen5_4 | Mục đích chung | 4 vCore | 4TB | $$$ | Cân bằng |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Quan trọng thiết yếu |

### Tham Chiếu Nhanh Container Apps SKU

| Mô Hình | Giá | CPU/Bộ Nhớ | Trường Hợp Sử Dụng |
|-------|---------|------------|----------|
| Tiêu Thụ | Thanh toán theo dùng | Các kết hợp CPU/bộ nhớ tùy môi trường/hồ sơ | Phát triển hoặc sản xuất, tải biến đổi |
| D4 Chuyên Dụng | Tính phí nút chuyên dụng | 4 vCPU, 16GiB mỗi nút | Tải duy trì/cô lập cần thiết |
| D8 Chuyên Dụng | Tính phí nút chuyên dụng | 8 vCPU, 32GiB mỗi nút | Tải cao hơn duy trì |

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
            # Name availability is not SKU availability.
            az storage sku list --query "[?name=='$sku'].{name:name,locations:locations,restrictions:restrictions}" --output json
            ;;
        *)
            echo "Resource type not supported"
            ;;
    esac
}

# Usage
check_sku_availability "eastus" "app-service" "P1V3"
```

### Kịch Bản Ước Tính Chi Phí

**Chỉ giả mã:** `Get-ResourceCost` dưới đây là hàm cụ thể dự án bạn cần hiện thực dựa vào giá vùng/hợp đồng hiện hành và giả định sử dụng. Không phải cmdlet PowerShell hay Azure.

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

### Xác Thực Hiệu Năng

YAML sau là bản phác thảo yêu cầu, **không phải** schema đầu vào của Azure Load Testing, JMeter, Locust, hoặc k6. Dịch nó sang cấu hình công cụ bạn chọn trước khi dùng lệnh kiểm thử tải phía trên.

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

## Tóm Tắt Thực Hành Tốt Nhất

### Nên Làm

1. **Bắt đầu nhỏ và mở rộng** dựa trên sử dụng thực tế
2. **Dùng SKU khác nhau cho môi trường khác nhau**
3. **Giám sát hiệu năng và chi phí liên tục**
4. **Tận dụng dung lượng đặt trước cho khối lượng sản xuất**
5. **Triển khai tự động mở rộng khi thích hợp**
6. **Kiểm thử hiệu năng với khối lượng thực tế**
7. **Lập kế hoạch tăng trưởng nhưng tránh cấp phát thừa**
8. **Dùng cấp miễn phí cho phát triển khi có thể**

### Không Nên Làm

1. **Không dùng SKU sản xuất cho phát triển**
2. **Không bỏ qua khả năng có mặt SKU theo vùng**
3. **Không quên chi phí truyền dữ liệu**
4. **Không cấp phát thừa mà không có lý do**
5. **Không bỏ qua ảnh hưởng của phụ thuộc**
6. **Không đặt giới hạn tự động mở rộng quá cao**
7. **Không quên các yêu cầu tuân thủ**
8. **Không quyết định chỉ dựa trên giá**

---

**Mẹo Chuyên Sâu**: Dùng Azure Cost Management và Advisor để nhận đề xuất cá nhân hoá tối ưu lựa chọn SKU dựa trên mẫu sử dụng thực tế.

---

**Điều Hướng**
- **Bài Trước**: [Capacity Planning](capacity-planning.md)
- **Bài Tiếp**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
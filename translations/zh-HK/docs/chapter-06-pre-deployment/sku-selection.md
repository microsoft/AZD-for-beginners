# SKU Selection Guide - Choosing the Right Azure Service Tiers

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: 第 6 章 - 預部署驗證與規劃
- **⬅️ Previous**: [容量規劃](capacity-planning.md)
- **➡️ Next**: [預檢查清單](preflight-checks.md)
- **🚀 Next Chapter**: [第 7 章：疑難排解](../chapter-07-troubleshooting/common-issues.md)

## 介紹

本綜合指南幫助你為不同環境、工作負載與需求選擇最合適的 Azure 服務 SKU（庫存單位）。學習如何分析效能需求、成本考量與可擴充性要求，以為你的 Azure Developer CLI 部署選擇最合適的服務層級。

## 學習目標

完成本指南後，你將能：
- 了解 Azure SKU 的概念、定價模型與功能差異
- 精通針對開發、預備與生產環境的 SKU 選擇策略
- 分析工作負載需求並將其配對到適當的服務層級
- 透過智慧的 SKU 選擇實施成本優化策略
- 應用效能測試與驗證技巧來驗證 SKU 選擇
- 設定自動化的 SKU 推薦與監控

## 學習成果

完成後，你將能：
- 根據工作負載需求與限制選擇適當的 Azure 服務 SKU
- 設計具成本效益的多環境架構並選擇適當層級
- 實施 SKU 選擇的效能基準與驗證
- 建立用於 SKU 推薦與成本優化的自動化工具
- 規劃因需求變更而需進行的 SKU 遷移與擴充策略
- 在服務層級選擇上套用 Azure Well-Architected Framework 原則

## 目錄

- [認識 SKUs](../../../../docs/chapter-06-pre-deployment)
- [基於環境的選擇](../../../../docs/chapter-06-pre-deployment)
- [服務專屬指南](../../../../docs/chapter-06-pre-deployment)
- [成本優化策略](../../../../docs/chapter-06-pre-deployment)
- [效能考量](../../../../docs/chapter-06-pre-deployment)
- [快速參考表](../../../../docs/chapter-06-pre-deployment)
- [驗證工具](../../../../docs/chapter-06-pre-deployment)

---

## Understanding SKUs

### 什麼是 SKUs？

SKU（庫存單位）代表 Azure 資源的不同服務層級與效能等級。每個 SKU 提供不同的：

- **效能特性**（CPU、記憶體、吞吐量）
- **功能可用性**（擴充選項、SLA 等級）
- **定價模型**（按用量、預留容量）
- **區域可用性**（並非所有 SKU 在所有區域皆可用）

### 選擇 SKU 的關鍵因素

1. **工作負載需求**
   - 預期流量/負載模式
   - 效能需求（CPU、記憶體、I/O）
   - 儲存需求與存取模式

2. **環境類型**
   - 開發/測試 vs 生產
   - 可用性需求
   - 安全與合規需求

3. **預算限制**
   - 初期成本 vs 營運成本
   - 預留容量折扣
   - 自動調整的成本影響

4. **成長預測**
   - 可擴充性需求
   - 未來功能需求
   - 遷移複雜度

---

## Environment-Based Selection

### 開發環境

**優先事項**：成本優化、基本功能、易於建立/解除配置

#### 建議的 SKUs
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

#### 特性
- **App Service**: F1 (Free) 或 B1 (Basic) 用於簡單測試
- **Databases**: 基本層，最少資源
- **Storage**: 標準，僅本地冗餘
- **Compute**: 可接受共用資源
- **Networking**: 基本設定

### 預備/測試環境

**優先事項**：接近生產的配置、成本與效能平衡、具效能測試能力

#### 建議的 SKUs
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

#### 特性
- **效能**：生產容量的 70-80%
- **功能**：啟用大部分生產功能
- **冗餘**：具部分地理冗餘
- **擴充**：有限的自動擴充以供測試
- **監控**：完整的監控堆疊

### 生產環境

**優先事項**：效能、可用性、安全、合規、可擴充性

#### 建議的 SKUs
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

#### 特性
- **高可用性**：99.9%+ 的 SLA 要求
- **效能**：專用資源，高吞吐量
- **安全**：進階安全功能
- **擴充**：完整的自動擴充能力
- **監控**：全面的可觀察性

---

## Service-Specific Guidelines

### Azure App Service

#### SKU 決策矩陣

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | 成本效益高，足以做測試 |
| Small production apps | S1 (Standard) | 自訂網域、SSL、自動擴充 |
| Medium production apps | P1V3 (Premium V3) | 更佳效能、更多功能 |
| High-traffic apps | P2V3 or P3V3 | 專用資源，高效能 |
| Mission-critical apps | I1V2 (Isolated V2) | 網路隔離，專用硬體 |

#### 配置範例

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

#### SKU 選擇框架

1. **DTU-based (Database Transaction Units)**
   - **Basic**: 5 DTU - 開發/測試
   - **Standard**: S0-S12 (10-3000 DTU) - 通用用途
   - **Premium**: P1-P15 (125-4000 DTU) - 效能關鍵

2. **vCore-based**（建議用於生產）
   - **General Purpose**: 平衡的運算與儲存
   - **Business Critical**: 低延遲、高 IOPS
   - **Hyperscale**: 高度可擴充的儲存（高達 100TB）

#### 範例配置

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

#### 環境類型

1. **Consumption-based**
   - 按使用付費
   - 適合開發與變動工作負載
   - 共用基礎設施

2. **Dedicated (Workload Profiles)**
   - 專用運算資源
   - 可預期的效能
   - 更適合生產工作負載

#### 配置範例

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

#### 吞吐量模式

1. **手動預配吞吐量**
   - 可預期的效能
   - 預留容量折扣
   - 適合穩定的工作負載

2. **自動縮放預配吞吐量**
   - 根據使用自動擴充
   - 按實際使用付費（有最低值）
   - 適合變動工作負載

3. **無伺服器**
   - 按請求付費
   - 無預配吞吐量
   - 適合開發與間歇性工作負載

#### SKU 範例

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

#### 儲存帳戶類型

1. **Standard_LRS** - 開發、非關鍵資料
2. **Standard_GRS** - 生產、需要地理冗餘
3. **Premium_LRS** - 高效能應用
4. **Premium_ZRS** - 區域冗餘下的高可用性

#### 效能層級

- **Standard**: 通用、具成本效益
- **Premium**: 高效能、低延遲情境

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

## 成本優化策略

### 1. 預留容量

預留資源 1-3 年以取得顯著折扣：

```bash
# 檢查預訂選項
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. 合理調整規模（Right-Sizing）

從較小的 SKU 開始，根據實際使用再擴充：

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

### 3. 自動擴充設定

實施智慧的擴充以優化成本：

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

### 4. 排程式擴縮

在非工作時間縮減規模：

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

## 效能考量

### 基線效能需求

在選擇 SKU 前定義明確的效能需求：

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

### 負載測試

測試不同 SKU 以驗證效能：

```bash
# Azure 負載測試服務
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### 監控與優化

建立完整的監控：

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

## 快速參考表

### App Service SKU 快速參考

| SKU | Tier | vCPU | RAM | Storage | Price Range | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | 開發 |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | 小型應用 |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | 生產 |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | 高效能 |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | 企業級 |

### SQL Database SKU 快速參考

| SKU | Tier | DTU/vCore | Storage | Price Range | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | 開發 |
| S2 | Standard | 50 DTU | 250GB | $$ | 小型生產 |
| P2 | Premium | 250 DTU | 1TB | $$$ | 高效能 |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | 平衡用途 |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | 任務關鍵 |

### Container Apps SKU 快速參考

| Model | Pricing | CPU/Memory | Use Case |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | 開發、負載變動 |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | 生產 |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | 高效能 |

---

## 驗證工具

### SKU 可用性檢查器

```bash
#!/bin/bash
# 檢查目標地區內 SKU 的可用性

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

# 用法
check_sku_availability "eastus" "app-service" "P1V3"
```

### 成本估算腳本

```powershell
# PowerShell 腳本，用於成本估算
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
        
        # 使用 Azure 價格 API 或定價計算器
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# 使用方法
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### 效能驗證

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

## 最佳實務摘要

### 可做的事

1. **從小開始並根據實際使用擴充**
2. **為不同環境使用不同的 SKUs**
3. **持續監控效能與成本**
4. **在生產工作負載使用預留容量**
5. **在適當情況下實施自動擴充**
6. **以真實工作負載測試效能**
7. **為成長做規劃但避免過度配置**
8. **盡可能在開發時使用免費層**

### 不該做的事

1. **不要在開發環境使用生產級 SKU**
2. **不要忽視區域 SKU 的可用性**
3. **不要忘記資料傳輸成本**
4. **不要無正當理由地過度配置**
5. **不要忽略依賴關係的影響**
6. **不要把自動擴充的上限設太高**
7. **不要忘記合規性要求**
8. **不要僅以價格做決策**

---

**Pro Tip**: 使用 Azure Cost Management 與 Advisor，根據實際使用模式取得個人化的 SKU 優化建議。

---

**Navigation**
- **Previous Lesson**: [容量規劃](capacity-planning.md)
- **Next Lesson**: [預檢查清單](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原文（原始語言版本）應視為具權威性的版本。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯而導致的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
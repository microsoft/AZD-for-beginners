# SKU 選擇指南 - 選擇合適的 Azure 服務層級

**章節導航：**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 當前章節**: 第六章 - 部署前驗證與規劃
- **⬅️ 上一章**: [容量規劃](capacity-planning.md)
- **➡️ 下一章**: [部署前檢查](preflight-checks.md)
- **🚀 下一章節**: [第七章：故障排除](../troubleshooting/common-issues.md)

## 簡介

這份全面的指南將幫助你為不同的環境、工作負載和需求選擇最佳的 Azure 服務 SKU（庫存單位）。學習如何分析性能需求、成本考量和可擴展性需求，從而為你的 Azure Developer CLI 部署選擇最合適的服務層級。

## 學習目標

完成本指南後，你將能夠：
- 理解 Azure SKU 的概念、定價模型和功能差異
- 掌握針對開發、測試和生產環境的 SKU 選擇策略
- 分析工作負載需求並匹配合適的服務層級
- 通過智能 SKU 選擇實現成本優化
- 應用性能測試和驗證技術來檢查 SKU 選擇
- 配置自動化的 SKU 推薦和監控

## 學習成果

完成後，你將能夠：
- 根據工作負載需求和限制選擇合適的 Azure 服務 SKU
- 設計具有成本效益的多環境架構，並選擇適當的層級
- 實施性能基準測試和 SKU 驗證
- 創建自動化工具以進行 SKU 推薦和成本優化
- 規劃 SKU 遷移和擴展策略以應對需求變化
- 將 Azure Well-Architected Framework 原則應用於服務層級選擇

## 目錄

- [了解 SKU](../../../../docs/pre-deployment)
- [基於環境的選擇](../../../../docs/pre-deployment)
- [服務特定指南](../../../../docs/pre-deployment)
- [成本優化策略](../../../../docs/pre-deployment)
- [性能考量](../../../../docs/pre-deployment)
- [快速參考表](../../../../docs/pre-deployment)
- [驗證工具](../../../../docs/pre-deployment)

---

## 了解 SKU

### 什麼是 SKU？

SKU（庫存單位）代表 Azure 資源的不同服務層級和性能級別。每個 SKU 提供不同的：

- **性能特性**（CPU、內存、吞吐量）
- **功能可用性**（擴展選項、SLA 級別）
- **定價模型**（基於消耗、預留容量）
- **區域可用性**（並非所有區域都提供所有 SKU）

### SKU 選擇的關鍵因素

1. **工作負載需求**
   - 預期的流量/負載模式
   - 性能需求（CPU、內存、I/O）
   - 存儲需求和訪問模式

2. **環境類型**
   - 開發/測試與生產環境
   - 可用性需求
   - 安全性和合規性需求

3. **預算限制**
   - 初始成本與運營成本
   - 預留容量折扣
   - 自動擴展的成本影響

4. **增長預測**
   - 可擴展性需求
   - 未來功能需求
   - 遷移的複雜性

---

## 基於環境的選擇

### 開發環境

**優先事項**: 成本優化、基本功能、便於配置和釋放

#### 推薦 SKU
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
- **應用服務**: F1（免費）或 B1（基本）適用於簡單測試
- **數據庫**: 基本層，資源需求最小
- **存儲**: 僅本地冗餘的標準存儲
- **計算**: 可接受共享資源
- **網絡**: 基本配置

### 測試/預備環境

**優先事項**: 接近生產的配置、成本平衡、性能測試能力

#### 推薦 SKU
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
- **性能**: 生產環境容量的 70-80%
- **功能**: 啟用大部分生產功能
- **冗餘**: 部分地理冗餘
- **擴展**: 限制自動擴展以進行測試
- **監控**: 完整的監控堆棧

### 生產環境

**優先事項**: 性能、可用性、安全性、合規性、可擴展性

#### 推薦 SKU
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
- **高可用性**: 99.9%+ SLA 要求
- **性能**: 專用資源，高吞吐量
- **安全性**: 高級安全功能
- **擴展**: 完整的自動擴展能力
- **監控**: 全面的可觀測性

---

## 服務特定指南

### Azure 應用服務

#### SKU 決策矩陣

| 用例 | 推薦 SKU | 理由 |
|------|----------|------|
| 開發/測試 | F1（免費）或 B1（基本） | 成本效益高，足夠測試使用 |
| 小型生產應用 | S1（標準） | 支援自定義域名、SSL、自動擴展 |
| 中型生產應用 | P1V3（高級 V3） | 更佳性能，更多功能 |
| 高流量應用 | P2V3 或 P3V3 | 專用資源，高性能 |
| 關鍵任務應用 | I1V2（隔離 V2） | 網絡隔離，專用硬件 |

#### 配置示例

**開發**
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

**生產**
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

### Azure SQL 數據庫

#### SKU 選擇框架

1. **基於 DTU（數據庫事務單位）**
   - **基本**: 5 DTU - 開發/測試
   - **標準**: S0-S12（10-3000 DTU）- 通用用途
   - **高級**: P1-P15（125-4000 DTU）- 性能關鍵

2. **基於 vCore**（推薦用於生產）
   - **通用用途**: 計算與存儲平衡
   - **業務關鍵**: 低延遲，高 IOPS
   - **超大規模**: 高度可擴展存儲（最高 100TB）

#### 配置示例

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

### Azure 容器應用

#### 環境類型

1. **基於消耗**
   - 按使用量付費
   - 適用於開發和變化負載
   - 共享基礎設施

2. **專用（工作負載配置文件）**
   - 專用計算資源
   - 性能可預測
   - 更適合生產工作負載

#### 配置示例

**開發（消耗）**
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

**生產（專用）**
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

#### 吞吐模型

1. **手動預配吞吐量**
   - 性能可預測
   - 預留容量折扣
   - 適合穩定工作負載

2. **自動擴展預配吞吐量**
   - 根據使用量自動擴展
   - 按實際使用付費（有最低消耗）
   - 適合變化負載

3. **無伺服器**
   - 按請求付費
   - 無需預配吞吐量
   - 適合開發和間歇性工作負載

#### SKU 示例

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

### Azure 存儲帳戶

#### 存儲帳戶類型

1. **Standard_LRS** - 開發、非關鍵數據
2. **Standard_GRS** - 生產，需地理冗餘
3. **Premium_LRS** - 高性能應用
4. **Premium_ZRS** - 高可用性，區域冗餘

#### 性能層級

- **標準**: 通用，成本效益高
- **高級**: 高性能，低延遲場景

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

預留 1-3 年資源以獲得顯著折扣：

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. 合理配置

從較小的 SKU 開始，根據實際使用情況擴展：

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

### 3. 自動擴展配置

實施智能擴展以優化成本：

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

### 4. 計劃性擴展

在非高峰時段縮減資源：

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

## 性能考量

### 基線性能需求

在選擇 SKU 前明確性能需求：

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

測試不同 SKU 以驗證性能：

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### 監控與優化

設置全面的監控：

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

### 應用服務 SKU 快速參考

| SKU | 層級 | vCPU | RAM | 存儲 | 價格範圍 | 用例 |
|-----|------|------|-----|---------|-------------|----------|
| F1 | 免費 | 共享 | 1GB | 1GB | 免費 | 開發 |
| B1 | 基本 | 1 | 1.75GB | 10GB | $ | 小型應用 |
| S1 | 標準 | 1 | 1.75GB | 50GB | $$ | 生產 |
| P1V3 | 高級 V3 | 2 | 8GB | 250GB | $$$ | 高性能 |
| I1V2 | 隔離 V2 | 2 | 8GB | 1TB | $$$$ | 企業級 |

### SQL 數據庫 SKU 快速參考

| SKU | 層級 | DTU/vCore | 存儲 | 價格範圍 | 用例 |
|-----|------|-----------|---------|-------------|----------|
| Basic | 基本 | 5 DTU | 2GB | $ | 開發 |
| S2 | 標準 | 50 DTU | 250GB | $$ | 小型生產 |
| P2 | 高級 | 250 DTU | 1TB | $$$ | 高性能 |
| GP_Gen5_4 | 通用用途 | 4 vCore | 4TB | $$$ | 平衡型 |
| BC_Gen5_8 | 業務關鍵 | 8 vCore | 4TB | $$$$ | 關鍵任務 |

### 容器應用 SKU 快速參考

| 模型 | 定價 | CPU/內存 | 用例 |
|-------|---------|------------|----------|
| 消耗 | 按使用量付費 | 0.25-2 vCPU | 開發、變化負載 |
| 專用 D4 | 預留 | 4 vCPU, 16GB | 生產 |
| 專用 D8 | 預留 | 8 vCPU, 32GB | 高性能 |

---

## 驗證工具

### SKU 可用性檢查器

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

### 成本估算腳本

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

### 性能驗證

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

## 最佳實踐總結

### 建議

1. **從小規模開始，根據實際使用擴展**
2. **為不同環境選擇不同的 SKU**
3. **持續監控性能和成本**
4. **為生產工作負載利用預留容量**
5. **適當實施自動擴展**
6. **使用真實工作負載進行性能測試**
7. **規劃增長但避免過度配置**
8. **開發時盡可能使用免費層**

### 避免

1. **不要在開發中使用生產 SKU**
2. **不要忽略區域 SKU 的可用性**
3. **不要忽視數據傳輸成本**
4. **不要在沒有理由的情況下過度配置**
5. **不要忽略依賴項的影響**
6. **不要將自動擴展限制設置得過高**
7. **不要忽略合規性要求**
8. **不要僅根據價格做決策**

---

**專業提示**: 使用 Azure 成本管理和顧問工具，根據實際使用模式獲取個性化的 SKU 優化建議。

---

**導航**
- **上一課**: [容量規劃](capacity-planning.md)
- **下一課**: [部署前檢查](preflight-checks.md)

---

**免責聲明**：  
本文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們致力於提供準確的翻譯，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要信息，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或錯誤解釋概不負責。
# SKU 選擇指南 - 選擇合適的 Azure 服務層級

**章節導航：**
- **📚 課程首頁**：[初學者的 AZD](../../README.md)
- **📖 當前章節**：第 6 章 - 部署前驗證與計劃
- **⬅️ 上一章**：[容量規劃](capacity-planning.md)
- **➡️ 下一章**：[飛行前檢查](preflight-checks.md)
- **🚀 下一章**：[第 7 章：疑難排解](../chapter-07-troubleshooting/common-issues.md)

## 介紹

本綜合指南幫助您為不同環境、工作負載和需求選擇最佳的 Azure 服務 SKU（庫存單位）。學習分析效能需求、成本考量和擴展性需求，以為您的 Azure Developer CLI 部署選擇最合適的服務層級。

## 學習目標

完成本指南後，您將能：
- 了解 Azure SKU 概念、定價模型及功能差異
- 精通針對開發、預備和生產環境的特定 SKU 選擇策略
- 分析工作負載需求並匹配合適的服務層級
- 通過智慧 SKU 選擇實施成本優化策略
- 應用效能測試與驗證技術於 SKU 選擇
- 配置自動 SKU 推薦與監控

## 學習成效

完成後，您將能夠：
- 根據工作負載需求與限制選擇合適的 Azure 服務 SKU
- 設計成本效益的多環境架構並正確選擇層級
- 實施效能基準測試與驗證 SKU 選擇
- 創建自動化 SKU 推薦與成本優化工具
- 規劃 SKU 遷移與擴展策略以因應變更需求
- 應用 Azure 良善架構框架原則於服務層級選擇

## 目錄

- [了解 SKUs](#understanding-skus)
- [以環境為基礎的選擇](#environment-based-selection)
- [服務專屬指南](#service-specific-guidelines)
- [成本優化策略](#cost-optimization-strategies)
- [效能考量](#performance-considerations)
- [快速參考表](#quick-reference-tables)
- [驗證工具](#validation-tools)

---

## 了解 SKUs

> **範例範疇：** 下方的 YAML SKU 映射和效能配置是設計筆記，不是 `azure.yaml` 架構或負載工具配置。Bicep 區塊是替代/片段：宣告其參數和父資源，合併時使用唯一符號名稱，並將模組接入可工作的專案。價格、限制與地區/SKU 可用性部署前必須檢查您的訂閱。

### 什麼是 SKUs？

SKUs（庫存單位）代表 Azure 資源的不同服務層級和效能級別。每個 SKU 具有不同：

- <strong>效能特徵</strong>（CPU、記憶體、吞吐量）
- <strong>功能可用性</strong>（擴展選項、SLA 等級）
- <strong>定價模型</strong>（按使用量計費、預留容量）
- <strong>區域可用性</strong>（非所有 SKU 在所有區域均可用）

### 選擇 SKU 的關鍵因素

1. <strong>工作負載需求</strong>
   - 預期流量/負載型態
   - 效能需求（CPU、記憶體、I/O）
   - 儲存需求與存取模式

2. <strong>環境類型</strong>
   - 開發/測試與生產
   - 可用性需求
   - 安全與合規需求

3. <strong>預算限制</strong>
   - 初期成本與運營成本
   - 預留容量折扣
   - 自動擴展成本影響

4. <strong>成長預測</strong>
   - 擴展需求
   - 未來功能需求
   - 遷移複雜度

---

## 以環境為基礎的選擇

### 開發環境

<strong>優先事項</strong>：成本優化、基本功能、輕鬆配置與撤銷

#### 推薦的 SKUs
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

#### 特性
- **App Service**：F1（免費）或 B1（基礎）適合簡單測試
- <strong>資料庫</strong>：基礎層，資源最少
- <strong>儲存</strong>：標準，僅本地冗餘
- <strong>計算</strong>：可接受共用資源
- <strong>網路</strong>：基本配置

### 預備/測試環境

<strong>優先事項</strong>：生產類似配置、成本平衡、效能測試能力

#### 推薦的 SKUs
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
- <strong>效能</strong>：生產容量的 70-80%
- <strong>功能</strong>：啟用大部分生產功能
- <strong>冗餘</strong>：部分地理冗餘
- <strong>擴展</strong>：有限自動擴展供測試用
- <strong>監控</strong>：完整監控堆疊

### 生產環境

<strong>優先事項</strong>：效能、可用性、安全、合規、可擴展性

#### 推薦的 SKUs
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

#### 特性
- <strong>高可用性</strong>：99.9%+ SLA 要求
- <strong>效能</strong>：專用資源，高吞吐量
- <strong>安全</strong>：高級安全功能
- <strong>擴展</strong>：完整自動擴展能力
- <strong>監控</strong>：全面可觀測性

---

## 服務專屬指南

### Azure App Service

#### SKU 決策矩陣

| 使用案例 | 推薦 SKU | 理由 |
|----------|----------------|-----------|
| 開發/測試 | F1（免費）或 B1（基礎） | 成本效益，足夠測試使用 |
| 小型生產應用 | S1（標準） | 支援自訂網域、SSL、自動擴展 |
| 中型生產應用 | P1V3（高級 V3） | 更佳效能，更多功能 |
| 高流量應用 | P2V3 或 P3V3 | 專用資源，高效能 |
| 重要任務應用 | I1V2（隔離 V2） | 網路隔離，專用硬體 |

#### 配置範例

<strong>開發</strong>
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

<strong>生產</strong>
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

1. **基於 DTU（資料庫交易單元）**
   - **Basic**：5 DTU - 開發/測試
   - **Standard**：S0–S12（10-3000 DTU）- 一般用途
   - **Premium**：P1–P15（125-4000 DTU）- 高效能關鍵

2. **基於 vCore**（建議用於生產）
   - **General Purpose**：均衡計算與儲存
   - **Business Critical**：低延遲，高 IOPS
   - **Hyperscale**：高度可擴展儲存；請核實當前大小限制與區域支援

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

1. <strong>按消耗計費</strong>
   - 按用量付費
   - 適合開發和變動工作負載
   - 共享基礎設施

2. **專用（工作負載配置）**
   - 專用計算資源
   - 預測效能
   - 更適合生產工作負載

#### 配置範例

**開發（按消耗）**
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

**生產（專用）**
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

區域冗餘還需要支援區域基礎設施以及適當的 VNet/子網配置，這裡未列出。此例預算三個專用節點；至少配置兩個應用副本以實現跨區域分布，並為區域故障調整副本和節點大小。詳見 [Container Apps 可靠性指導](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps)。將應用置於此配置時，設置其 `workloadProfileName: 'production-profile'`；創建配置本身不會將應用遷移。

### Azure Cosmos DB

#### 吞吐量模型

1. <strong>手動預配吞吐量</strong>
   - 預測性效能
   - 預留容量折扣
   - 適合穩定工作負載

2. <strong>自動擴展預配吞吐量</strong>
   - 根據使用情況自動調整
   - 按使用量付費（含最低額度）
   - 適合變動工作負載

3. **Serverless（無伺服器）**
   - 按請求付費
   - 無預配吞吐量
   - 理想用於開發與間歇性工作負載

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

### Azure 儲存帳戶

#### 儲存帳戶類型

1. **Standard_LRS** - 開發，非關鍵資料
2. **Standard_GRS** - 生產，需地理冗餘
3. **Premium_LRS** - 高效能應用
4. **Premium_ZRS** - 高可用性區域冗餘

#### 效能層級

- **Standard**：通用型，具成本效益
- **Premium**：高效能，低延遲場景

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

預留 1-3 年資源可享重大折扣：

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

預留服務、可用資源類型和購買條款各異；請檢查目錄和條款，勿假設每種服務/SKU 都支持預留。

### 2. 適當規模調整

從較小的 SKU 開始，依實際使用情況擴展：

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

實施智慧擴展以優化成本：

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

### 4. 計劃擴展

在非工作時段縮減規模：

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

## 效能考慮

### 基線效能需求

在選擇 SKU 前明確定義效能需求：

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
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### 監控與優化

設定全面監控：

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

## 快速參考表

### App Service SKU 快速參考

| SKU | 層級 | vCPU | 記憶體 | 儲存空間 | 價格區間 | 使用案例 |
|-----|------|------|-----|---------|-------------|----------|
| F1 | 免費 | 共享 | 1GB | 1GB | 免費 | 開發 |
| B1 | 基礎 | 1 | 1.75GB | 10GB | $ | 小型應用 |
| S1 | 標準 | 1 | 1.75GB | 50GB | $$ | 生產 |
| P1V3 | 高級 V3 | 2 | 8GB | 250GB | $$$ | 高效能 |
| I1V2 | 隔離 V2 | 2 | 8GB | 1TB | $$$$ | 企業 |

### SQL Database SKU 快速參考

| SKU | 層級 | DTU/vCore | 儲存空間 | 價格區間 | 使用案例 |
|-----|------|-----------|---------|-------------|----------|
| Basic | 基礎 | 5 DTU | 2GB | $ | 開發 |
| S2 | 標準 | 50 DTU | 250GB | $$ | 小型生產 |
| P2 | 高級 | 250 DTU | 1TB | $$$ | 高效能 |
| GP_Gen5_4 | 一般用途 | 4 vCore | 4TB | $$$ | 平衡 |
| BC_Gen5_8 | 重要任務 | 8 vCore | 4TB | $$$$ | 關鍵任務 |

### Container Apps SKU 快速參考

| 模型 | 定價 | CPU/記憶體 | 使用案例 |
|-------|---------|------------|----------|
| 消耗型 | 按使用付費 | 環境/配置支援的 CPU/記憶體組合 | 開發或生產，負載變動 |
| 專用 D4 | 專用節點計費 | 每節點 4 vCPU, 16GiB | 持久負載/隔離需求 |
| 專用 D8 | 專用節點計費 | 每節點 8 vCPU, 32GiB | 較高持久負載 |

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

### 成本估算腳本

**僅偽代碼：** 下方 `Get-ResourceCost` 是您必須根據當地區域/合約定價和使用假設自行實作的專案特定函數，非 PowerShell 或 Azure Cmdlet。

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

### 效能驗證

以下 YAML 是需求草案，<strong>非</strong> Azure Load Testing、JMeter、Locust 或 k6 輸入架構。使用前請轉換為所選工具的真實配置以配合上述負載測試指令。

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

## 最佳實踐摘要

### 做的事

1. **從小開始，根據實際使用擴展**
2. **為不同環境使用不同 SKU**
3. <strong>持續監控效能與成本</strong>
4. <strong>利用預留容量於生產工作負載</strong>
5. <strong>適當實施自動擴展</strong>
6. <strong>用現實工作負載測試效能</strong>
7. <strong>規劃成長但避免過度配置</strong>
8. <strong>盡可能使用免費層於開發</strong>

### 不該做的事

1. **開發不要用生產用 SKU**
2. **勿忽略區域 SKU 可用性**
3. <strong>勿忘資料傳輸成本</strong>
4. <strong>勿無故過度配置</strong>
5. <strong>勿忽略依賴關係影響</strong>
6. <strong>勿設定自動擴展限制過高</strong>
7. <strong>勿忽視合規要求</strong>
8. <strong>勿單以價格做決策</strong>

---

<strong>專家提示</strong>：使用 Azure 成本管理和 Advisor，根據實際使用模式獲取個人化推薦，以優化您的 SKU 選擇。

---

<strong>導航</strong>
- <strong>上一課</strong>：[容量規劃](capacity-planning.md)
- <strong>下一課</strong>：[飛行前檢查](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
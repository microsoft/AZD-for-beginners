# SKU 選擇指南 - 選擇合適的 Azure 服務層級

**章節導覽：**
- **📚 課程首頁**：[針對初學者的 AZD](../../README.md)
- **📖 目前章節**：第 6 章 - 預部署驗證與規劃
- **⬅️ 上一章**：[容量規劃](capacity-planning.md)
- **➡️ 下一章**：[起飛前檢查](preflight-checks.md)
- **🚀 下一章節**：[第 7 章：故障排除](../chapter-07-troubleshooting/common-issues.md)

## 簡介

本綜合指南協助您為不同環境、工作負載與需求選擇最佳的 Azure 服務 SKU（庫存單位）。學習如何分析效能需求、成本考量及可擴展性要求，從而選擇最適合您 Azure Developer CLI 部署的服務層級。

## 學習目標

完成本指南後，您將能：
- 了解 Azure SKU 概念、定價模型與功能差異
- 掌握為開發、預備和生產環境量身訂做的 SKU 選擇策略
- 針對工作負載需求進行分析並匹配適當的服務層級
- 通過智慧 SKU 選擇實施成本優化策略
- 應用效能測試及驗證技術於 SKU 選擇
- 配置自動化的 SKU 推薦及監控

## 學習成果

完成後，您將能：
- 根據工作負載需求及限制選擇適當的 Azure 服務 SKU
- 設計具成本效益的多環境架構並正確選層
- 實施效能基準測試與驗證以確保 SKU 選擇正確
- 建立自動化工具以推薦 SKU 與優化成本
- 規劃 SKU 遷移及調整策略以因應需求變化
- 運用 Azure 優良架構框架原則於服務層級選擇

## 目錄

- [認識 SKU](#understanding-skus)
- [依環境選擇](#environment-based-selection)
- [特定服務指引](#service-specific-guidelines)
- [成本優化策略](#cost-optimization-strategies)
- [效能考量](#performance-considerations)
- [快速參考表](#quick-reference-tables)
- [驗證工具](#validation-tools)

---

## 認識 SKU

> **範例範圍：** 以下 YAML SKU 映射和效能配置為設計筆記，非 `azure.yaml` 架構或負載工具配置。Bicep 區塊為備選或片段：聲明其參數與父資源，組合時用唯一符號名稱，並將模組串接成可運作的專案。價格、限制與區域/SKU 可用性請在部署前依您訂閱查核。

### 什麼是 SKU？

SKU（庫存單位）代表 Azure 資源不同的服務層級與效能等級。每個 SKU 提供不同的：

- <strong>效能特性</strong>（CPU、記憶體、吞吐量）
- <strong>功能可用性</strong>（擴展選項、SLA 等級）
- <strong>定價模型</strong>（依消耗計費、預留容量）
- <strong>區域可用性</strong>（並非所有地區均可用）

### 選擇 SKU 的關鍵因素

1. <strong>工作負載需求</strong>
   - 預期流量／負載模式
   - 效能需求（CPU、記憶體、I/O）
   - 儲存需求及存取模式

2. <strong>環境類型</strong>
   - 開發／測試與生產環境
   - 可用性需求
   - 安全與合規需求

3. <strong>預算限制</strong>
   - 建置成本與營運成本
   - 預留容量折扣
   - 自動調整成本影響

4. <strong>成長預估</strong>
   - 可擴展性需求
   - 未來功能需求
   - 遷移複雜度

---

## 依環境選擇

### 開發環境

<strong>優先考量</strong>：成本優化、基本功能、易於佈署與取消佈署

#### 推薦 SKU
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
- <strong>應用服務</strong>：F1（免費）或 B1（基礎）適用於簡單測試
- <strong>資料庫</strong>：基礎層，資源最少
- <strong>儲存</strong>：標準層，僅本地冗餘
- <strong>運算</strong>：允許共用資源
- <strong>網路</strong>：基礎配置

### 預備／測試環境

<strong>優先考量</strong>：近似生產配置、成本平衡、效能測試能力

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
- <strong>效能</strong>：生產容量的 70-80%
- <strong>功能</strong>：啟用大部分生產功能
- <strong>冗餘</strong>：具備部分地理冗餘
- <strong>擴展</strong>：限制自動擴展以用於測試
- <strong>監控</strong>：完整監控組件

### 生產環境

<strong>優先考量</strong>：效能、可用性、安全、合規性、可擴展性

#### 推薦 SKU
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
- <strong>高可用性</strong>：99.9% + SLA 要求
- <strong>效能</strong>：獨享資源，高吞吐量
- <strong>安全</strong>：高階安全功能
- <strong>擴展</strong>：完整自動擴展功能
- <strong>監控</strong>：全面可觀察性

---

## 特定服務指引

### Azure 應用服務

#### SKU 決策矩陣

| 使用案例 | 推薦 SKU | 理由 |
|----------|----------------|-----------|
| 開發/測試 | F1（免費）或 B1（基礎） | 成本效益高，足以測試 |
| 小型生產應用 | S1（標準） | 自訂網域、SSL、自動擴展 |
| 中型生產應用 | P1V3（高級 V3） | 更佳效能，更多功能 |
| 高流量應用 | P2V3 或 P3V3 | 專用資源，高效能 |
| 重要任務應用 | I1V2（隔離 V2） | 網路隔離，獨享硬體 |

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

1. **基於 DTU（資料庫交易單位）**
   - <strong>基礎</strong>：5 DTU - 開發／測試使用
   - <strong>標準</strong>：S0-S12（10-3000 DTU） - 通用目的
   - <strong>高級</strong>：P1-P15（125-4000 DTU） - 劇烈效能需求

2. **基於 vCore**（建議用於生產）
   - <strong>通用目的</strong>：平衡運算與儲存
   - <strong>重要業務</strong>：低延遲，高 IOPS
   - <strong>超大規模</strong>：高度可擴展的儲存；請核實目前大小限制與區域支援

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

1. <strong>依使用量計費</strong>
   - 按用量付費
   - 適合開發和變動負載
   - 共享基礎設施

2. **專屬（工作負載配置）**
   - 專屬運算資源
   - 預測性效能
   - 更適合生產工作負載

#### 配置範例

**開發（依使用量）**
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

**生產（專屬）**
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

區域冗餘亦需支援區域基礎建設及適當 VNet／子網配置，此處省略。此例預算為三個專屬節點；至少配置兩個應用副本以實現跨區域分佈，並為副本與節點大小規劃區域故障。請參考 [Container Apps 可靠性指南](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps)。將應用置於此配置時，需設定其 `workloadProfileName: 'production-profile'`；僅建立配置檔不會自動轉移應用。

### Azure Cosmos DB

#### 吞吐量模型

1. <strong>手動配置吞吐量</strong>
   - 可預測效能
   - 預留容量折扣
   - 適合穩定工作負載

2. <strong>自動擴展配置吞吐量</strong>
   - 根據使用量自動調整
   - 按使用付費（有最低額度）
   - 適用變動工作負載

3. <strong>無伺服器方案</strong>
   - 按請求付費
   - 無須配置吞吐量
   - 適合開發和間歇性工作負載

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

1. **Standard_LRS** - 開發、非關鍵資料
2. **Standard_GRS** - 生產、需地理冗餘
3. **Premium_LRS** - 高效能應用
4. **Premium_ZRS** - 高可用性與區域冗餘

#### 效能層級

- <strong>標準</strong>：通用，具成本效益
- <strong>高級</strong>：高效能、低延遲場景

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

預留資源 1-3 年以獲得大幅折扣：

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

預留方案與適用資源類型各異，請檢查目錄與購買條款，勿認為所有服務／SKU 均支援預留。

### 2. 適當規模化

從較小 SKU 開始，根據實際使用量進行調整：

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

### 4. 定時擴展

非營業時間縮減規模：

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

### 基線效能要求

在選擇 SKU 之前定義明確效能要求：

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

建立完整監控：

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

### 應用服務 SKU 快速參考

| SKU | 層級 | vCPU | 記憶體 | 儲存 | 價格區間 | 使用案例 |
|-----|------|------|-----|---------|-------------|----------|
| F1 | 免費 | 共用 | 1GB | 1GB | 免費 | 開發 |
| B1 | 基礎 | 1 | 1.75GB | 10GB | $ | 小型應用 |
| S1 | 標準 | 1 | 1.75GB | 50GB | $$ | 生產 |
| P1V3 | 高級 V3 | 2 | 8GB | 250GB | $$$ | 高效能 |
| I1V2 | 隔離 V2 | 2 | 8GB | 1TB | $$$$ | 企業 |

### SQL 資料庫 SKU 快速參考

| SKU | 層級 | DTU/vCore | 儲存 | 價格區間 | 使用案例 |
|-----|------|-----------|---------|-------------|----------|
| 基礎 | 基礎 | 5 DTU | 2GB | $ | 開發 |
| S2 | 標準 | 50 DTU | 250GB | $$ | 小型生產 |
| P2 | 高級 | 250 DTU | 1TB | $$$ | 高效能 |
| GP_Gen5_4 | 通用 | 4 vCore | 4TB | $$$ | 平衡型 |
| BC_Gen5_8 | 重要業務 | 8 vCore | 4TB | $$$$ | 重要任務 |

### Container Apps SKU 快速參考

| 模型 | 定價 | CPU/記憶體 | 使用案例 |
|-------|---------|------------|----------|
| 依使用量 | 按用量付費 | 支援的 CPU/記憶體組合依環境與配置不同 | 開發或生產，負載可變 |
| 專屬 D4 | 專屬節點計費 | 每節點 4 vCPU，16GiB | 持續負載／隔離需求 |
| 專屬 D8 | 專屬節點計費 | 每節點 8 vCPU，32GiB | 更高持續負載 |

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

**僅為偽代碼：** `Get-ResourceCost` 下方為專案特定函式，需您依現行區域／合約定價與使用假設自行實作。非 PowerShell 或 Azure 指令集。

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

以下 YAML 為需求草案，<strong>非</strong> Azure 負載測試、JMeter、Locust 或 k6 輸入架構。使用前請轉譯成您選擇的工具之實際配置格式，用於上述 load-test 指令。

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

### 建議做的事

1. **從小規模開始，根據實際使用量升級**
2. **不同環境使用不同 SKU**
3. <strong>持續監控效能與成本</strong>
4. <strong>生產工作負載採用預留容量</strong>
5. <strong>適時實施自動擴展</strong>
6. <strong>用現實工作負載測試效能</strong>
7. <strong>規劃成長但避免過度配置</strong>
8. <strong>開發時盡量使用免費層</strong>

### 不建議做的事

1. **開發時勿使用生產 SKU**
2. **勿忽略區域 SKU 可用性**
3. <strong>勿忘資料傳輸成本</strong>
4. <strong>無正當理由勿過度配置</strong>
5. <strong>勿忽略相依性影響</strong>
6. <strong>勿將自動擴展限制設過高</strong>
7. <strong>勿忽視合規需求</strong>
8. <strong>勿僅以價格作決策</strong>

---

<strong>專家建議</strong>：使用 Azure 成本管理與 Advisor，根據實際使用模式取得個人化建議，優化您的 SKU 選擇。

---

<strong>導覽</strong>
- <strong>前一課程</strong>：[容量規劃](capacity-planning.md)
- <strong>下一課程</strong>：[起飛前檢查](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
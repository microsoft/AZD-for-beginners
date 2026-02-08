# SKU 選擇指南 - 選擇合適的 Azure 服務層級

**Chapter Navigation:**
- **📚 課程首頁**: [AZD For Beginners](../../README.md)
- **📖 本章節**: 第 6 章 - 部署前驗證與規劃
- **⬅️ 上一章**: [Capacity Planning](capacity-planning.md)
- **➡️ 下一章**: [Pre-flight Checks](preflight-checks.md)
- **🚀 下一章節**: [第 7 章：疑難排解](../chapter-07-troubleshooting/common-issues.md)

## 簡介

本綜合指南可協助您為不同環境、工作負載與需求選擇最佳的 Azure 服務 SKU（庫存單位）。學習如何分析效能需求、成本考量與可擴充性需求，以便為您的 Azure Developer CLI 部署選擇最合適的服務層級。

## 學習目標

完成本指南後，您將能夠：
- 了解 Azure SKU 概念、定價模型與功能差異
- 精通針對開發、預備與生產環境的 SKU 選擇策略
- 分析工作負載需求並將其對應到合適的服務層級
- 透過智慧的 SKU 選擇實施成本最佳化策略
- 應用效能測試與驗證技術來評估 SKU 選擇
- 設定自動化的 SKU 建議與監控

## 學習成果

完成後，您將能夠：
- 根據工作負載需求與限制選擇適當的 Azure 服務 SKU
- 設計具成本效益的多環境架構並選定合適層級
- 為 SKU 選擇實施效能基準測試與驗證
- 建立 SKU 建議與成本最佳化的自動化工具
- 為變動需求規劃 SKU 遷移與擴展策略
- 在服務層級選擇中套用 Azure 良好架構框架原則

## 目錄

- [了解 SKUs](../../../../docs/chapter-06-pre-deployment)
- [依環境的選擇](../../../../docs/chapter-06-pre-deployment)
- [服務特定指南](../../../../docs/chapter-06-pre-deployment)
- [成本最佳化策略](../../../../docs/chapter-06-pre-deployment)
- [效能考量](../../../../docs/chapter-06-pre-deployment)
- [快速參考表](../../../../docs/chapter-06-pre-deployment)
- [驗證工具](../../../../docs/chapter-06-pre-deployment)

---

## 了解 SKUs

### 什麼是 SKU？

SKU（庫存單位）代表 Azure 資源的不同服務層級與效能等級。每種 SKU 提供不同的：

- **效能特性**（CPU、記憶體、吞吐量）
- **功能可用性**（擴展選項、SLA 等級）
- **定價模型**（依使用量、預留容量）
- **區域可用性**（並非所有 SKU 在所有區域皆可用）

### SKU 選擇的關鍵因素

1. **工作負載需求**
   - 預期的流量/負載模式
   - 效能需求（CPU、記憶體、I/O）
   - 儲存需求與存取模式

2. **環境類型**
   - 開發/測試與生產環境之別
   - 可用性需求
   - 安全性與合規性需求

3. **預算限制**
   - 初期成本 vs. 運營成本
   - 預留容量折扣
   - 自動調整的成本影響

4. **成長預測**
   - 可擴充性需求
   - 未來功能需求
   - 遷移複雜度

---

## 依環境的選擇

### 開發環境

**優先事項**：成本最佳化、基本功能、易於建立/解除資源

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

#### 特性
- **App Service**: F1（免費）或 B1（Basic）用於簡單測試
- **資料庫**: 基本層級，資源最小化
- **儲存**: 標準，僅使用本地冗餘
- **運算**: 可接受共用資源
- **網路**: 基本設定

### 預備/測試環境

**優先事項**：類生產配置、成本平衡、效能測試能力

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

#### 特性
- **效能**：達到生產容量的 70-80%
- **功能**：大多數生產功能啟用
- **冗餘**：具備部分跨區冗餘
- **擴展**：有限的自動擴展以供測試
- **監控**：完整的監控堆疊

### 生產環境

**優先事項**：效能、可用性、安全、合規、可擴充性

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

#### 特性
- **高可用性**：滿足 99.9%+ 的 SLA 要求
- **效能**：專屬資源，高吞吐量
- **安全**：高級安全功能
- **擴展**：完整的自動擴展能力
- **監控**：完整的可觀測性

---

## 服務特定指南

### Azure App Service

#### SKU 決策矩陣

| 使用情境 | 建議的 SKU | 理由 |
|----------|----------------|-----------|
| 開發/測試 | F1 (Free) or B1 (Basic) | 成本友善，足以進行測試 |
| 小型生產應用 | S1 (Standard) | 自訂網域、SSL、支援自動擴展 |
| 中型生產應用 | P1V3 (Premium V3) | 更好的效能、更多功能 |
| 高流量應用 | P2V3 or P3V3 | 專屬資源，高效能 |
| 關鍵任務應用 | I1V2 (Isolated V2) | 網路隔離、專屬硬體 |

#### 設定範例

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

### Azure SQL Database

#### SKU 選擇框架

1. **基於 DTU（資料庫交易單位）**
   - **Basic**: 5 DTU - 開發/測試
   - **Standard**: S0-S12 (10-3000 DTU) - 一般用途
   - **Premium**: P1-P15 (125-4000 DTU) - 效能關鍵

2. **基於 vCore**（建議用於生產）
   - **General Purpose**: 平衡的運算與儲存
   - **Business Critical**: 低延遲、高 IOPS
   - **Hyperscale**: 高度可擴展的儲存（最高可達 100TB）

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

1. **計量式（Consumption-based）**
   - 依使用付費定價
   - 適合開發與變動負載
   - 共用基礎設施

2. **專用（工作負載配置）**
   - 專屬運算資源
   - 可預期的效能
   - 更適合生產工作負載

#### 設定範例

**開發（計量付費）**
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

#### 吞吐量模型

1. **手動預配置吞吐量**
   - 可預測的效能
   - 預留容量折扣
   - 最適合穩定負載

2. **自動調整預配置吞吐量**
   - 根據使用自動擴展
   - 依使用量付費（有最低值）
   - 適合變動負載

3. **無伺服器（Serverless）**
   - 依請求付費
   - 無預配置吞吐量
   - 適合開發與間歇性負載

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
4. **Premium_ZRS** - 區域冗餘提供高可用性

#### 效能層級

- **Standard**：通用、具成本效益
- **Premium**：高效能、低延遲情境

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

## 成本最佳化策略

### 1. 預留容量

為 1-3 年預留資源以獲得顯著折扣：

```bash
# 檢查預訂選項
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. 調整規模（Right-Sizing）

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

### 3. 自動調整設定

實作智慧擴展以優化成本：

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

### 4. 排程調整

在離峰時段縮減規模：

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

### 基準效能需求

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

建立完整的監控機制：

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

| SKU | 層級 | vCPU | 記憶體 | 儲存 | 價格範圍 | 使用情境 |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | 開發 |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | 小型應用 |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | 生產 |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | 高效能 |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | 企業 |

### SQL Database SKU 快速參考

| SKU | 層級 | DTU/vCore | 儲存 | 價格範圍 | 使用情境 |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | 開發 |
| S2 | Standard | 50 DTU | 250GB | $$ | 小型生產 |
| P2 | Premium | 250 DTU | 1TB | $$$ | 高效能 |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | 平衡負載 |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | 關鍵任務 |

### Container Apps SKU 快速參考

| 模型 | 計價 | CPU/記憶體 | 使用情境 |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | 開發、變動負載 |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | 生產 |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | 高效能 |

---

## 驗證工具

### SKU 可用性檢查器

```bash
#!/bin/bash
# 檢查目標區域的 SKU 可用性

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
# 用於成本估算的 PowerShell 腳本
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
        
        # 使用 Azure 價格 API 或計算器
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# 用法
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

### 應做事項

1. **從小做起並向上擴展**，根據實際使用情況調整
2. **為不同環境使用不同的 SKU**
3. **持續監控效能與成本**
4. **為生產工作負載利用預留容量**
5. **在適當時機實作自動擴展**
6. **使用真實工作負載測試效能**
7. **為成長做規劃，但避免過度配置**
8. **開發時盡可能使用免費層**

### 不可做事項

1. **不要在開發環境使用生產 SKU**
2. **不要忽略區域 SKU 的可用性**
3. **不要忘記資料傳輸成本**
4. **不要在無正當理由下過度配置**
5. **不要忽視相依性的影響**
6. **不要將自動擴展上限設得過高**
7. **不要忘記合規性需求**
8. **不要僅以價格作為決策依據**

---

**專家提示**：使用 Azure Cost Management 與 Advisor，根據實際使用模式取得個人化的 SKU 優化建議。

---

**導覽**
- **上一課**: [Capacity Planning](capacity-planning.md)
- **下一課**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不精確之處。原始語言版本應視為具權威性的資料來源。若內容涉及關鍵資訊，建議委託專業人工翻譯。我們對因使用此翻譯所產生的任何誤解或錯誤詮釋不承擔任何責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
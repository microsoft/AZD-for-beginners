# SKU 选择指南 - 选择合适的 Azure 服务层级

**章节导航：**
- **📚 课程主页**：[初学者的 AZD](../../README.md)
- **📖 当前章节**：第6章 - 部署前验证与规划
- **⬅️ 上一章**：[容量规划](capacity-planning.md)
- **➡️ 下一章**：[预检](preflight-checks.md)
- **🚀 后续章节**：[第7章：故障排除](../chapter-07-troubleshooting/common-issues.md)

## 简介

本全面指南帮助您为不同环境、负载和需求选择最优的 Azure 服务 SKU（库存单位）。学习如何分析性能需求、成本考量和可扩展性要求，为 Azure Developer CLI 部署选择最适合的服务层级。

## 学习目标

完成本指南后，您将能够：
- 理解 Azure SKU 概念、定价模型和功能差异
- 掌握针对开发、暂存和生产环境的SKU选择策略
- 分析工作负载需求，并匹配合适的服务层级
- 通过智能 SKU 选择实现成本优化策略
- 应用性能测试和验证技术以支持 SKU 选择
- 配置自动 SKU 推荐和监控

## 学习成果

完成后，您将能：
- 根据工作负载需求和约束选择合适的 Azure 服务 SKU
- 设计具有成本效益的多环境架构并正确选择层级
- 实施性能基准测试和 SKU 验证
- 创建自动工具实现 SKU 推荐和成本优化
- 规划 SKU 迁移及因应需求变化的扩展策略
- 应用 Azure 优秀架构框架原则于服务层级选择

## 目录

- [理解 SKU](#understanding-skus)
- [基于环境的选择](#environment-based-selection)
- [服务专项指南](#service-specific-guidelines)
- [成本优化策略](#cost-optimization-strategies)
- [性能考量](#performance-considerations)
- [快速参考表](#quick-reference-tables)
- [验证工具](#validation-tools)

---

## 理解 SKU

> **示例范围：** 下面的 YAML SKU 映射和性能配置是设计笔记，不是 `azure.yaml` 模式或负载工具配置。Bicep 代码块是可选/片段：声明它们的参数和父资源，组合时使用独特符号名，并将模块接入工作项目。价格、限制和区域/SKU 可用性必须在您的订阅中部署前确认。

### SKU 是什么？

SKU（库存单位）代表 Azure 资源的不同服务层级和性能等级。每个 SKU 提供不同：

- <strong>性能特征</strong>（CPU、内存、吞吐量）
- <strong>功能可用性</strong>（扩展选项、SLA 等级）
- <strong>定价模型</strong>（按用量计费、预留容量）
- <strong>区域可用性</strong>（并非所有区域支持所有 SKU）

### SKU 选择关键因素

1. <strong>工作负载需求</strong>
   - 预期流量/负载模式
   - 性能需求（CPU、内存、I/O）
   - 存储需求和访问模式

2. <strong>环境类型</strong>
   - 开发/测试 VS 生产
   - 可用性需求
   - 安全与合规需求

3. <strong>预算约束</strong>
   - 初始成本与运营成本
   - 预留容量折扣
   - 自动扩展的成本影响

4. <strong>增长预估</strong>
   - 可扩展性需求
   - 未来功能需求
   - 迁移复杂度

---

## 基于环境的选择

### 开发环境

<strong>优先考虑</strong>：成本优化、基本功能、易于配置和解除配置

#### 推荐 SKU
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

#### 特点
- <strong>应用服务</strong>: 简单测试使用 F1（免费）或 B1（基础）
- <strong>数据库</strong>: 基础层，资源最低
- <strong>存储</strong>: 标准层，仅本地冗余
- <strong>计算</strong>: 可接受共享资源
- <strong>网络</strong>: 基础配置

### 暂存/测试环境

<strong>优先考虑</strong>：接近生产配置、成本平衡、性能测试能力

#### 推荐 SKU
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

#### 特点
- <strong>性能</strong>: 达到生产能力的70-80%
- <strong>功能</strong>: 启用大多数生产功能
- <strong>冗余</strong>: 部分地理冗余
- <strong>扩展</strong>: 限定自动扩展用于测试
- <strong>监控</strong>: 完整监控堆栈

### 生产环境

<strong>优先考虑</strong>：性能、可用性、安全性、合规性、可扩展性

#### 推荐 SKU
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

#### 特点
- <strong>高可用性</strong>: 99.9%以上 SLA 要求
- <strong>性能</strong>: 专用资源，高吞吐量
- <strong>安全性</strong>: 高级安全功能
- <strong>扩展</strong>: 完整自动扩展能力
- <strong>监控</strong>: 全面可观察性

---

## 服务专项指南

### Azure 应用服务

#### SKU 决策矩阵

| 用例 | 推荐 SKU | 理由 |
|----------|----------------|-----------|
| 开发/测试 | F1（免费）或 B1（基础） | 经济实惠，适合测试 |
| 小型生产应用 | S1（标准） | 自定义域、SSL、自动扩展 |
| 中型生产应用 | P1V3（高级 V3） | 性能更好，功能更多 |
| 高流量应用 | P2V3 或 P3V3 | 专用资源，性能高 |
| 关键任务应用 | I1V2（隔离 V2） | 网络隔离，专用硬件 |

#### 配置示例

<strong>开发环境</strong>
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

<strong>生产环境</strong>
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

### Azure SQL 数据库

#### SKU 选择框架

1. **基于 DTU（数据库事务单位）**
   - <strong>基础</strong>: 5 DTU - 适合开发/测试
   - <strong>标准</strong>: S0-S12（10-3000 DTU）- 通用
   - <strong>高级</strong>: P1-P15（125-4000 DTU）- 性能关键型

2. **基于 vCore**（推荐生产环境）
   - <strong>通用型</strong>: 计算和存储平衡
   - <strong>业务关键型</strong>: 低延迟，高 IOPS
   - <strong>超大规模</strong>: 高度可扩展存储；需验证当前大小限制和区域支持

#### 示例配置

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

### Azure 容器应用

#### 环境类型

1. <strong>按使用量计费</strong>
   - 按使用付费定价
   - 适合开发和负载波动
   - 共享基础设施

2. **专用（工作负载配置）**
   - 专用计算资源
   - 性能可预测
   - 更适合生产负载

#### 配置示例

**开发环境（按使用量计费）**
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

**生产环境（专用）**
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

区域冗余还需要支持的区域基础设施和合适的 VNet/子网配置，这里省略。此示例预算三个专用节点；至少配置两个应用副本实现跨区域分布，并合理调整副本和节点大小以应对区域故障。详见 [容器应用可靠性指南](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps)。要将应用放入该配置文件，请设置其 `workloadProfileName: 'production-profile'`；仅创建配置文件不会自动移动应用。

### Azure Cosmos DB

#### 吞吐模型

1. <strong>手动预配置吞吐量</strong>
   - 性能可预测
   - 预留容量折扣
   - 最适合稳定负载

2. <strong>自动扩展预配置吞吐量</strong>
   - 基于使用量自动扩展
   - 按用量付费（设有最小值）
   - 适合变动负载

3. <strong>无服务器模式</strong>
   - 按请求付费
   - 无预配置吞吐量
   - 适合开发和间歇性负载

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

### Azure 存储账户

#### 存储账户类型

1. **Standard_LRS** - 开发，非关键数据
2. **Standard_GRS** - 生产，需地理冗余
3. **Premium_LRS** - 高性能应用
4. **Premium_ZRS** - 高可用性带区域冗余

#### 性能层级

- <strong>标准层</strong>：通用，性价比高
- <strong>高级层</strong>：高性能，低延迟场景

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

## 成本优化策略

### 1. 预留容量

预订资源 1-3 年，享受显著折扣：

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

预订产品及适用资源类型各异；请检查目录和购买条款，不要默认所有服务/SKU 支持预订。

### 2. 适当规格调整

从较小 SKU 开始，根据实际使用规模扩大：

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

### 3. 自动扩展配置

实施智能扩展以优化成本：

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

### 4. 定时扩展

非高峰时段缩减规模：

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

### 基线性能需求

选择 SKU 前定义清晰的性能需求：

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

### 负载测试

测试不同 SKU 以验证性能：

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### 监控与优化

设置全面监控：

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

## 快速参考表

### 应用服务 SKU 快速参考

| SKU | 层级 | vCPU | 内存 | 存储 | 价格范围 | 用例 |
|-----|------|------|-----|---------|-------------|----------|
| F1 | 免费 | 共享 | 1GB | 1GB | 免费 | 开发 |
| B1 | 基础 | 1 | 1.75GB | 10GB | $ | 小型应用 |
| S1 | 标准 | 1 | 1.75GB | 50GB | $$ | 生产 |
| P1V3 | 高级 V3 | 2 | 8GB | 250GB | $$$ | 高性能 |
| I1V2 | 隔离 V2 | 2 | 8GB | 1TB | $$$$ | 企业级 |

### SQL 数据库 SKU 快速参考

| SKU | 层级 | DTU/vCore | 存储 | 价格范围 | 用例 |
|-----|------|-----------|---------|-------------|----------|
| 基础 | 基础 | 5 DTU | 2GB | $ | 开发 |
| S2 | 标准 | 50 DTU | 250GB | $$ | 小型生产 |
| P2 | 高级 | 250 DTU | 1TB | $$$ | 高性能 |
| GP_Gen5_4 | 通用 | 4 vCore | 4TB | $$$ | 平衡型 |
| BC_Gen5_8 | 业务关键 | 8 vCore | 4TB | $$$$ | 关键任务 |

### 容器应用 SKU 快速参考

| 模型 | 定价 | CPU/内存 | 用例 |
|-------|---------|------------|----------|
| 按使用量付费 | 按使用计费 | 支持的 CPU/内存组合依环境/配置而异 | 开发或生产，负载变化 |
| 专用 D4 | 专用节点计费 | 每节点 4 vCPU，16GiB | 持续负载/隔离需求 |
| 专用 D8 | 专用节点计费 | 每节点 8 vCPU，32GiB | 更高持续负载 |

---

## 验证工具

### SKU 可用性检查器

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

### 成本估算脚本

**仅伪代码：** `Get-ResourceCost` 是一个项目特定的函数，您必须使用当前的区域/合同定价和使用假设来实现它。它不是 PowerShell 或 Azure 命令。

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

### 性能验证

下面的 YAML 是需求草图，<strong>不是</strong> Azure 负载测试、JMeter、Locust 或 k6 的输入模式。请在使用上面的 load-test 命令之前，将其转换为您选择的工具的真实配置。

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

## 最佳实践摘要

### 建议做的事情

1. **从小规模开始，根据实际使用情况逐步扩大**
2. **为不同环境使用不同的 SKU**
3. <strong>持续监控性能和成本</strong>
4. <strong>为生产工作负载利用预留容量</strong>
5. <strong>适当时实施自动扩展</strong>
6. <strong>用真实工作负载测试性能</strong>
7. **为增长做计划，但避免资源过度配置**
8. <strong>尽可能利用免费层进行开发</strong>

### 不建议做的事情

1. **不要为开发使用生产 SKU**
2. **不要忽视区域 SKU 的可用性**
3. <strong>不要忘记数据传输费用</strong>
4. <strong>不要无理由地过度配置</strong>
5. <strong>不要忽视依赖关系的影响</strong>
6. <strong>不要将自动扩展限制设置得太高</strong>
7. <strong>不要忘记合规性要求</strong>
8. <strong>不要只根据价格做决策</strong>

---

<strong>专业提示</strong>：使用 Azure 成本管理和 Advisor，根据实际使用模式获得个性化的 SKU 优化建议。

---

<strong>导航</strong>
- <strong>上一课</strong>：[容量规划](capacity-planning.md)
- <strong>下一课</strong>：[预检](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
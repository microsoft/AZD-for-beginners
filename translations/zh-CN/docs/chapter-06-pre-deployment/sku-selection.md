# SKU 选择指南 - 选择合适的 Azure 服务层级

**章节导航：**
- **📚 课程主页**: [AZD 入门](../../README.md)
- **📖 当前章节**: 第6章 - 部署前验证与规划
- **⬅️ 上一节**: [容量规划](capacity-planning.md)
- **➡️ 下一节**: [部署前检查](preflight-checks.md)
- **🚀 下一章**: [第7章：故障排除](../chapter-07-troubleshooting/common-issues.md)

## 介绍

本综合指南帮助你为不同环境、工作负载和需求选择最优的 Azure 服务 SKU（库存单位）。学习如何分析性能需求、成本考量和可扩展性要求，以为你的 Azure Developer CLI 部署选择最合适的服务层级。

## 学习目标

完成本指南后，你将能够：
- 理解 Azure SKU 概念、定价模型和功能差异
- 掌握针对开发、预发布和生产环境的环境特定 SKU 选择策略
- 分析工作负载需求并将其与合适的服务层级匹配
- 通过智能的 SKU 选择实现成本优化策略
- 应用性能测试和验证技术来验证 SKU 选择
- 配置自动化的 SKU 推荐和监控

## 学习成果

完成后，你将能够：
- 根据工作负载要求和约束选择合适的 Azure 服务 SKU
- 设计具有适当层级选择的成本有效的多环境架构
- 实施针对 SKU 选择的性能基准测试和验证
- 创建用于 SKU 推荐和成本优化的自动化工具
- 为不断变化的需求规划 SKU 迁移和扩展策略
- 在服务层级选择中应用 Azure 良好架构框架原则

## 目录

- [理解 SKU](../../../../docs/chapter-06-pre-deployment)
- [基于环境的选择](../../../../docs/chapter-06-pre-deployment)
- [针对具体服务的指南](../../../../docs/chapter-06-pre-deployment)
- [成本优化策略](../../../../docs/chapter-06-pre-deployment)
- [性能注意事项](../../../../docs/chapter-06-pre-deployment)
- [快速参考表](../../../../docs/chapter-06-pre-deployment)
- [验证工具](../../../../docs/chapter-06-pre-deployment)

---

## 理解 SKU

### 什么是 SKU？

SKU（库存单位）表示 Azure 资源的不同服务层级和性能级别。每个 SKU 提供不同的：

- **性能特性**（CPU、内存、吞吐量）
- **功能可用性**（扩缩容选项、SLA 等级）
- **定价模型**（按消费计费、保留容量）
- **区域可用性**（并非所有 SKU 在所有区域可用）

### 选择 SKU 的关键因素

1. **工作负载需求**
   - 预期的流量/负载模式
   - 性能需求（CPU、内存、I/O）
   - 存储需求和访问模式

2. **环境类型**
   - 开发/测试 与 生产
   - 可用性要求
   - 安全和合规需求

3. **预算限制**
   - 初始成本与运行成本
   - 预留容量折扣
   - 自动扩缩容的成本影响

4. **增长预测**
   - 可扩展性要求
   - 未来功能需求
   - 迁移复杂性

---

## 基于环境的选择

### 开发环境

**优先级**：成本优化、基础功能、易于配置/释放

#### 推荐 SKU
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
- **App Service**：F1 (Free) 或 B1 (Basic) 用于简单测试
- **数据库**：基础层，资源最小化
- **存储**：标准，仅本地冗余
- **计算**：可接受共享资源
- **网络**：基础配置

### 预发布/测试环境

**优先级**：接近生产的配置、成本平衡、性能测试能力

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

#### 特性
- **性能**：达到生产容量的 70-80%
- **功能**：启用大部分生产功能
- **冗余**：部分地理冗余
- **扩缩容**：有限的自动扩缩容用于测试
- **监控**：完整的监控堆栈

### 生产环境

**优先级**：性能、可用性、安全、合规、可扩展性

#### 推荐 SKU
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
- **高可用性**：99.9%+ SLA 要求
- **性能**：专用资源，高吞吐量
- **安全**：高级安全功能
- **扩缩容**：完整的自动扩缩容能力
- **监控**：全面的可观测性

---

## 针对具体服务的指南

### Azure App Service

#### SKU 决策矩阵

| 用例 | 推荐 SKU | 理由 |
|----------|----------------|-----------|
| 开发/测试 | F1 (Free) 或 B1 (Basic) | 成本效益高，足以用于测试 |
| 小型生产应用 | S1 (Standard) | 自定义域名、SSL、自动扩缩容 |
| 中型生产应用 | P1V3 (Premium V3) | 更好的性能，更多功能 |
| 高流量应用 | P2V3 或 P3V3 | 专用资源，高性能 |
| 关键任务应用 | I1V2 (Isolated V2) | 网络隔离，专用硬件 |

#### 配置示例

**开发**
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

**生产**
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

#### SKU 选择框架

1. **基于 DTU（数据库事务单位）**
   - **Basic**：5 DTU - 开发/测试
   - **Standard**：S0-S12 (10-3000 DTU) - 通用用途
   - **Premium**：P1-P15 (125-4000 DTU) - 性能关键型

2. **基于 vCore**（推荐用于生产）
   - **General Purpose**：均衡的计算与存储
   - **Business Critical**：低延迟，高 IOPS
   - **Hyperscale**：高度可扩展的存储（最高可达 100TB）

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

### Azure Container Apps

#### 环境类型

1. **按消费计费**
   - 按使用付费定价
   - 适用于开发和可变工作负载
   - 共享基础设施

2. **专用（工作负载配置）**
   - 专用计算资源
   - 可预测的性能
   - 更适合生产工作负载

#### 配置示例

**开发（按消费）**
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

**生产（专用）**
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

1. **手动预配吞吐量**
   - 可预测的性能
   - 预留容量折扣
   - 适合稳定负载

2. **自动缩放预配吞吐量**
   - 根据使用自动扩缩
   - 按使用付费（有最低值）
   - 适合可变负载

3. **无服务器（Serverless）**
   - 按请求付费
   - 无预配吞吐量
   - 适合开发和间歇性工作负载

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

### Azure Storage Account

#### 存储帐户类型

1. **Standard_LRS** - 开发，非关键数据
2. **Standard_GRS** - 生产，需要地理冗余
3. **Premium_LRS** - 高性能应用
4. **Premium_ZRS** - 具备区域冗余的高可用性

#### 性能层级

- **Standard**：通用，具有成本效益
- **Premium**：高性能、低延迟场景

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

为 1-3 年预留资源以获得显著折扣：

```bash
# 检查预订选项
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. 右尺寸（Right-Sizing）

从较小的 SKU 开始，并根据实际使用情况向上扩展：

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

### 3. 自动扩缩容配置

实施智能扩缩容以优化成本：

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

### 4. 定时缩放

在非工作时间缩减规模：

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

## 性能注意事项

### 基线性能需求

在选择 SKU 之前定义明确的性能需求：

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

测试不同的 SKU 以验证性能：

```bash
# Azure 负载测试服务
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### 监控与优化

建立全面的监控：

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

## 快速参考表

### App Service SKU 快速参考

| SKU | 层级 | vCPU | 内存 | 存储 | 价格区间 | 用例 |
|-----|------|------|-----|---------|-------------|----------|
| F1 | 免费 | 共享 | 1GB | 1GB | 免费 | 开发 |
| B1 | 基本 | 1 | 1.75GB | 10GB | $ | 小型应用 |
| S1 | 标准 | 1 | 1.75GB | 50GB | $$ | 生产 |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | 高性能 |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | 企业级 |

### SQL Database SKU 快速参考

| SKU | 层级 | DTU/vCore | 存储 | 价格区间 | 用例 |
|-----|------|-----------|---------|-------------|----------|
| Basic | 基本 | 5 DTU | 2GB | $ | 开发 |
| S2 | 标准 | 50 DTU | 250GB | $$ | 小型生产 |
| P2 | 高级 | 250 DTU | 1TB | $$$ | 高性能 |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | 均衡型 |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | 关键任务 |

### Container Apps SKU 快速参考

| 模式 | 定价 | CPU/内存 | 用例 |
|-------|---------|------------|----------|
| Consumption | 按使用付费 | 0.25-2 vCPU | 开发，可变负载 |
| Dedicated D4 | 预留 | 4 vCPU, 16GB | 生产 |
| Dedicated D8 | 预留 | 8 vCPU, 32GB | 高性能 |

---

## 验证工具

### SKU 可用性检查器

```bash
#!/bin/bash
# 检查目标区域的 SKU 可用性

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

### 成本估算脚本

```powershell
# 用于成本估算的 PowerShell 脚本
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
        
        # 使用 Azure 定价 API 或定价计算器
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

### 性能验证

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

### 应做事项

1. **从小做起并根据实际使用扩展**
2. **为不同环境使用不同的 SKU**
3. **持续监控性能和成本**
4. **对生产工作负载利用预留容量**
5. **在适当情况下实现自动扩缩容**
6. **使用真实负载进行性能测试**
7. **为增长做计划，但避免过度配置**
8. **尽可能在开发环境使用免费层**

### 禁忌事项

1. **不要在开发环境使用生产 SKU**
2. **不要忽视区域性 SKU 的可用性**
3. **不要忘记数据传输成本**
4. **不要在无正当理由下过度配置**
5. **不要忽视依赖关系的影响**
6. **不要将自动扩缩容限制设置得过高**
7. **不要忘记合规性要求**
8. **不要仅以价格为唯一决策依据**

---

**小贴士**: 使用 Azure Cost Management 和 Advisor，根据实际使用模式获取个性化的 SKU 优化建议。

---

**导航**
- **上一课**: [容量规划](capacity-planning.md)
- **下一课**: [部署前检查](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：
本文件使用 AI 翻译服务 Co-op Translator（https://github.com/Azure/co-op-translator）进行翻译。尽管我们力求准确，但请注意自动翻译可能存在错误或不准确之处。原始文档的原文应被视为权威来源。对于关键信息，建议采用专业人工翻译。对于因使用本翻译而产生的任何误解或错误解释，我们不承担任何责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
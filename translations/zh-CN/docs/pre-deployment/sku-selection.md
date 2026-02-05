# SKU选择指南 - 如何选择合适的Azure服务层级

**章节导航：**
- **📚 课程主页**：[AZD入门教程](../../README.md)
- **📖 当前章节**：第6章 - 部署前验证与规划
- **⬅️ 上一章**：[容量规划](capacity-planning.md)
- **➡️ 下一章**：[预检查](preflight-checks.md)
- **🚀 下一章节**：[第7章：故障排查](../troubleshooting/common-issues.md)

## 简介

本指南将帮助您为不同环境、工作负载和需求选择最佳的Azure服务SKU（库存单位）。通过学习分析性能需求、成本考虑和可扩展性要求，您将能够为Azure Developer CLI部署选择最合适的服务层级。

## 学习目标

完成本指南后，您将能够：
- 理解Azure SKU的概念、定价模型和功能差异
- 掌握针对开发、测试和生产环境的SKU选择策略
- 分析工作负载需求并匹配适合的服务层级
- 通过智能SKU选择实施成本优化策略
- 应用性能测试和验证技术来评估SKU选择
- 配置自动化SKU推荐和监控

## 学习成果

完成后，您将能够：
- 根据工作负载需求和限制选择合适的Azure服务SKU
- 设计具有成本效益的多环境架构并选择合适的层级
- 实施性能基准测试并验证SKU选择
- 创建自动化工具进行SKU推荐和成本优化
- 规划SKU迁移和扩展策略以应对需求变化
- 在服务层级选择中应用Azure Well-Architected Framework原则

## 目录

- [理解SKU](../../../../docs/pre-deployment)
- [基于环境的选择](../../../../docs/pre-deployment)
- [服务特定指南](../../../../docs/pre-deployment)
- [成本优化策略](../../../../docs/pre-deployment)
- [性能考虑](../../../../docs/pre-deployment)
- [快速参考表](../../../../docs/pre-deployment)
- [验证工具](../../../../docs/pre-deployment)

---

## 理解SKU

### 什么是SKU？

SKU（库存单位）代表Azure资源的不同服务层级和性能水平。每个SKU提供不同的：

- **性能特性**（CPU、内存、吞吐量）
- **功能可用性**（扩展选项、SLA级别）
- **定价模型**（基于使用量、预留容量）
- **区域可用性**（并非所有SKU在所有区域都可用）

### SKU选择的关键因素

1. **工作负载需求**
   - 预期的流量/负载模式
   - 性能需求（CPU、内存、I/O）
   - 存储需求和访问模式

2. **环境类型**
   - 开发/测试 vs. 生产
   - 可用性需求
   - 安全性和合规性需求

3. **预算限制**
   - 初始成本 vs. 运营成本
   - 预留容量折扣
   - 自动扩展的成本影响

4. **增长预测**
   - 可扩展性需求
   - 未来功能需求
   - 迁移复杂性

---

## 基于环境的选择

### 开发环境

**优先级**：成本优化、基本功能、易于配置和删除

#### 推荐SKU
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

#### 特点
- **应用服务**：F1（免费）或B1（基础）用于简单测试
- **数据库**：基础层，资源需求较低
- **存储**：标准，仅需本地冗余
- **计算**：共享资源即可
- **网络**：基本配置

### 测试/预生产环境

**优先级**：接近生产配置、成本平衡、性能测试能力

#### 推荐SKU
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
- **性能**：生产环境容量的70%-80%
- **功能**：启用大部分生产功能
- **冗余**：部分地理冗余
- **扩展**：有限的自动扩展用于测试
- **监控**：完整的监控堆栈

### 生产环境

**优先级**：性能、可用性、安全性、合规性、可扩展性

#### 推荐SKU
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

#### 特点
- **高可用性**：99.9%+ SLA要求
- **性能**：专用资源，高吞吐量
- **安全性**：高级安全功能
- **扩展**：全面的自动扩展能力
- **监控**：全面的可观测性

---

## 服务特定指南

### Azure应用服务

#### SKU决策矩阵

| 使用场景 | 推荐SKU | 理由 |
|----------|---------|------|
| 开发/测试 | F1（免费）或B1（基础） | 成本低，足够测试 |
| 小型生产应用 | S1（标准） | 自定义域名、SSL、自动扩展 |
| 中型生产应用 | P1V3（高级V3） | 更好的性能，更多功能 |
| 高流量应用 | P2V3或P3V3 | 专用资源，高性能 |
| 关键任务应用 | I1V2（隔离V2） | 网络隔离，专用硬件 |

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

### Azure SQL数据库

#### SKU选择框架

1. **基于DTU（数据库事务单位）**
   - **基础**：5 DTU - 开发/测试
   - **标准**：S0-S12（10-3000 DTU） - 通用用途
   - **高级**：P1-P15（125-4000 DTU） - 性能关键

2. **基于vCore**（推荐用于生产）
   - **通用用途**：计算和存储平衡
   - **业务关键**：低延迟，高IOPS
   - **超大规模**：高度可扩展存储（最高100TB）

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

### Azure容器应用

#### 环境类型

1. **基于使用量**
   - 按使用量付费
   - 适合开发和可变工作负载
   - 共享基础设施

2. **专用（工作负载配置文件）**
   - 专用计算资源
   - 性能可预测
   - 更适合生产工作负载

#### 配置示例

**开发（基于使用量）**
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
   - 性能可预测
   - 预留容量折扣
   - 最适合稳定工作负载

2. **自动扩展预配吞吐量**
   - 根据使用情况自动扩展
   - 按实际使用付费（有最低要求）
   - 适合可变工作负载

3. **无服务器**
   - 按请求付费
   - 无需预配吞吐量
   - 适合开发和间歇性工作负载

#### SKU示例

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

### Azure存储账户

#### 存储账户类型

1. **Standard_LRS** - 开发，非关键数据
2. **Standard_GRS** - 生产，需要地理冗余
3. **Premium_LRS** - 高性能应用
4. **Premium_ZRS** - 高可用性，区域冗余

#### 性能层级

- **标准**：通用，成本效益高
- **高级**：高性能，低延迟场景

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

预留1-3年的资源以获得显著折扣：

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. 合理配置

从较小的SKU开始，根据实际使用情况扩展：

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

### 4. 定时扩展

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

## 性能考虑

### 基线性能需求

在选择SKU之前定义明确的性能需求：

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

测试不同SKU以验证性能：

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### 监控与优化

设置全面的监控：

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

### 应用服务SKU快速参考

| SKU | 层级 | vCPU | RAM | 存储 | 价格范围 | 使用场景 |
|-----|------|------|-----|-------|----------|----------|
| F1 | 免费 | 共享 | 1GB | 1GB | 免费 | 开发 |
| B1 | 基础 | 1 | 1.75GB | 10GB | $ | 小型应用 |
| S1 | 标准 | 1 | 1.75GB | 50GB | $$ | 生产 |
| P1V3 | 高级V3 | 2 | 8GB | 250GB | $$$ | 高性能 |
| I1V2 | 隔离V2 | 2 | 8GB | 1TB | $$$$ | 企业级 |

### SQL数据库SKU快速参考

| SKU | 层级 | DTU/vCore | 存储 | 价格范围 | 使用场景 |
|-----|------|-----------|-------|----------|----------|
| 基础 | 基础 | 5 DTU | 2GB | $ | 开发 |
| S2 | 标准 | 50 DTU | 250GB | $$ | 小型生产 |
| P2 | 高级 | 250 DTU | 1TB | $$$ | 高性能 |
| GP_Gen5_4 | 通用用途 | 4 vCore | 4TB | $$$ | 平衡型 |
| BC_Gen5_8 | 业务关键 | 8 vCore | 4TB | $$$$ | 关键任务 |

### 容器应用SKU快速参考

| 模型 | 定价 | CPU/内存 | 使用场景 |
|-----|------|----------|----------|
| 基于使用量 | 按使用付费 | 0.25-2 vCPU | 开发，可变负载 |
| 专用D4 | 预留 | 4 vCPU, 16GB | 生产 |
| 专用D8 | 预留 | 8 vCPU, 32GB | 高性能 |

---

## 验证工具

### SKU可用性检查器

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

### 成本估算脚本

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

## 最佳实践总结

### 应做

1. **从小规模开始并根据实际使用扩展**
2. **为不同环境选择不同的SKU**
3. **持续监控性能和成本**
4. **为生产工作负载利用预留容量**
5. **在适当情况下实施自动扩展**
6. **使用真实工作负载进行性能测试**
7. **规划增长但避免过度配置**
8. **尽可能使用免费层进行开发**

### 不应做

1. **不要在开发中使用生产SKU**
2. **不要忽略区域SKU的可用性**
3. **不要忽视数据传输成本**
4. **不要在没有理由的情况下过度配置**
5. **不要忽略依赖项的影响**
6. **不要将自动扩展限制设置得过高**
7. **不要忽视合规性要求**
8. **不要仅根据价格做决定**

---

**专业提示**：使用Azure成本管理和顾问工具，根据实际使用模式获取个性化的SKU优化建议。

---

**导航**
- **上一课**：[容量规划](capacity-planning.md)
- **下一课**：[预检查](preflight-checks.md)

---

**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于关键信息，建议使用专业人工翻译。我们不对因使用此翻译而产生的任何误解或误读承担责任。
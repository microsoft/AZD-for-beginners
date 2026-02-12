# SKU Selection Guide - Choosing the Right Azure Service Tiers

**Chapter Navigation:**
- **📚 Course Home**: [AZD для початківців](../../README.md)
- **📖 Current Chapter**: Chapter 6 - Pre-Deployment Validation & Planning
- **⬅️ Previous**: [Планування потужностей](capacity-planning.md)
- **➡️ Next**: [Перевірки перед запуском](preflight-checks.md)
- **🚀 Next Chapter**: [Розділ 7: Усунення неполадок](../chapter-07-troubleshooting/common-issues.md)

## Introduction

Цей вичерпний посібник допоможе вам обрати оптимальні SKU сервісів Azure (Stock Keeping Units) для різних середовищ, навантажень та вимог. Навчіться аналізувати потреби в продуктивності, бюджетні обмеження та вимоги до масштабованості, щоб обирати найвідповідніші рівні сервісів для ваших розгортань з Azure Developer CLI.

## Learning Goals

Виконавши цей посібник, ви:
- Зрозумієте концепцію SKU в Azure, моделі ціноутворення та відмінності у функціональності
- Опануєте стратегії вибору SKU, специфічні для середовищ розробки, підготовки та продакшн
- Навчитесь аналізувати вимоги навантаження і зіставляти їх з відповідними рівнями сервісів
- Реалізуєте стратегії оптимізації витрат через розумний вибір SKU
- Застосуєте методики тестування продуктивності та верифікації вибору SKU
- Налаштуєте автоматичні рекомендації щодо SKU та моніторинг

## Learning Outcomes

Після завершення ви зможете:
- Обирати відповідні SKU сервісів Azure на основі вимог і обмежень навантаження
- Проєктувати економічно ефективні архітектури для кількох середовищ з правильним вибором рівнів
- Реалізувати бенчмаркінг продуктивності та валідацію вибору SKU
- Створювати автоматизовані інструменти для рекомендацій щодо SKU та оптимізації витрат
- Планувати міграції SKU та стратегії масштабування при зміні вимог
- Застосовувати принципи Azure Well-Architected Framework при виборі рівнів сервісів

## Table of Contents

- [Розуміння SKU](../../../../docs/chapter-06-pre-deployment)
- [Вибір за середовищем](../../../../docs/chapter-06-pre-deployment)
- [Рекомендації для конкретних сервісів](../../../../docs/chapter-06-pre-deployment)
- [Стратегії оптимізації витрат](../../../../docs/chapter-06-pre-deployment)
- [Міркування щодо продуктивності](../../../../docs/chapter-06-pre-deployment)
- [Короткі довідкові таблиці](../../../../docs/chapter-06-pre-deployment)
- [Інструменти перевірки](../../../../docs/chapter-06-pre-deployment)

---

## Understanding SKUs

### What are SKUs?

SKU (Stock Keeping Units) представляють різні рівні сервісів і рівні продуктивності для ресурсів Azure. Кожен SKU пропонує різні:

- **Характеристики продуктивності** (CPU, пам’ять, пропускна здатність)
- **Доступність функцій** (опції масштабування, рівні SLA)
- **Моделі ціноутворення** (оплата за споживання, зарезервована потужність)
- **Регіональна доступність** (не всі SKU доступні у всіх регіонах)

### Key Factors in SKU Selection

1. **Вимоги навантаження**
   - Очікувані шаблони трафіку/навантаження
   - Вимоги до продуктивності (CPU, пам’ять, I/O)
   - Потреби в зберіганні та шаблони доступу

2. **Тип середовища**
   - Розробка/тестування vs. продакшн
   - Вимоги до доступності
   - Потреби в безпеці та відповідності

3. **Бюджетні обмеження**
   - Початкові витрати vs. операційні витрати
   - Знижки за резервування потужностей
   - Наслідки авто-масштабування для витрат

4. **Прогнози зростання**
   - Вимоги до масштабованості
   - Майбутні потреби у функціях
   - Складність міграції

---

## Environment-Based Selection

### Development Environment

**Пріоритети**: оптимізація витрат, базова функціональність, просте розгортання/зняття

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

#### Characteristics
- **App Service**: F1 (Free) або B1 (Basic) для простого тестування
- **Databases**: рівень Basic з мінімальними ресурсами
- **Storage**: Standard лише з локальним резервуванням
- **Compute**: допустимі спільні ресурси
- **Networking**: базова конфігурація

### Staging/Testing Environment

**Пріоритети**: конфігурація, наближена до продакшн, баланс витрат, можливість тестування продуктивності

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

#### Characteristics
- **Продуктивність**: 70-80% від потужності продакшн
- **Функції**: більшість продакшн-функцій увімкнено
- **Резервування**: часткова географічна надлишковість
- **Масштабування**: обмежене авто-масштабування для тестування
- **Моніторинг**: повний стек моніторингу

### Production Environment

**Пріоритети**: продуктивність, доступність, безпека, відповідність вимогам, масштабованість

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

#### Characteristics
- **Висока доступність**: вимоги SLA 99.9%+
- **Продуктивність**: виділені ресурси, висока пропускна здатність
- **Безпека**: преміальні функції безпеки
- **Масштабування**: повна функціональність авто-масштабування
- **Моніторинг**: всебічна спостережуваність

---

## Service-Specific Guidelines

### Azure App Service

#### SKU Decision Matrix

| Сценарій використання | Рекомендований SKU | Обґрунтування |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | Економічно ефективний, достатній для тестування |
| Small production apps | S1 (Standard) | Користувацькі домени, SSL, авто-масштабування |
| Medium production apps | P1V3 (Premium V3) | Краща продуктивність, більше функцій |
| High-traffic apps | P2V3 or P3V3 | Виділені ресурси, висока продуктивність |
| Mission-critical apps | I1V2 (Isolated V2) | Ізоляція мережі, виділене обладнання |

#### Configuration Examples

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

#### SKU Selection Framework

1. **DTU-based (Database Transaction Units)**
   - **Basic**: 5 DTU - розробка/тестування
   - **Standard**: S0-S12 (10-3000 DTU) - загального призначення
   - **Premium**: P1-P15 (125-4000 DTU) - для критично важливих сценаріїв

2. **vCore-based** (Рекомендовано для продакшн)
   - **General Purpose**: збалансовані обчислення та зберігання
   - **Business Critical**: низька затримка, висока IOPS
   - **Hyperscale**: високомасштабоване сховище (до 100TB)

#### Example Configurations

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

#### Environment Types

1. **Споживчий (Consumption-based)**
   - Оплата за використання
   - Підходить для розробки та змінних навантажень
   - Спільна інфраструктура

2. **Виділений (Workload Profiles)**
   - Виділені обчислювальні ресурси
   - Передбачувана продуктивність
   - Краще для продуктивних навантажень

#### Configuration Examples

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

#### Throughput Models

1. **Ручне виділення пропускної здатності**
   - Передбачувана продуктивність
   - Знижки за резервовані потужності
   - Краще для стабільних навантажень

2. **Автоматичне масштабування виділеної пропускної здатності**
   - Автоматичне масштабування на основі використання
   - Оплата за фактичне споживання (з мінімумом)
   - Добре для змінних навантажень

3. **Безсерверний (Serverless)**
   - Оплата за запит
   - Без виділеної пропускної здатності
   - Ідеально для розробки та переривчастих навантажень

#### SKU Examples

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

#### Типи Storage Account

1. **Standard_LRS** - Розробка, некритичні дані
2. **Standard_GRS** - Продуктивне, потрібна гео-резервованість
3. **Premium_LRS** - Додатки з високою продуктивністю
4. **Premium_ZRS** - Висока доступність із зональним резервуванням

#### Рівні продуктивності

- **Standard**: загального призначення, економічний
- **Premium**: висока продуктивність, сценарії з низькою затримкою

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

## Cost Optimization Strategies

### 1. Reserved Capacity

Резервуйте ресурси на 1–3 роки для значних знижок:

```bash
# Перевірити варіанти бронювання
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Right-Sizing

Починайте з менших SKU та масштабуйтесь відповідно до фактичного використання:

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

### 3. Auto-Scaling Configuration

Впровадьте інтелектуальне масштабування для оптимізації витрат:

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

### 4. Scheduled Scaling

Масштабуйте вниз у неробочі години:

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

## Performance Considerations

### Baseline Performance Requirements

Визначте чіткі вимоги до продуктивності перед вибором SKU:

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

### Load Testing

Тестуйте різні SKU для валідації продуктивності:

```bash
# служба тестування навантаження Azure
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Monitoring and Optimization

Налаштуйте всебічний моніторинг:

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

## Quick Reference Tables

### App Service SKU Quick Reference

| SKU | Рівень | vCPU | RAM | Сховище | Ціновий діапазон | Сценарій використання |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | Розробка |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Малі додатки |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Продуктивне |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Висока продуктивність |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Корпоративні |

### SQL Database SKU Quick Reference

| SKU | Рівень | DTU/vCore | Storage | Ціновий діапазон | Сценарій використання |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Розробка |
| S2 | Standard | 50 DTU | 250GB | $$ | Невеликий продакшн |
| P2 | Premium | 250 DTU | 1TB | $$$ | Висока продуктивність |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Збалансований |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Критично важливі |

### Container Apps SKU Quick Reference

| Model | Pricing | CPU/Memory | Сценарій використання |
|-------|---------|------------|----------|
| Consumption | Оплата за використання | 0.25-2 vCPU | Розробка, змінне навантаження |
| Dedicated D4 | Резервовано | 4 vCPU, 16GB | Продуктивне |
| Dedicated D8 | Резервовано | 8 vCPU, 32GB | Висока продуктивність |

---

## Validation Tools

### SKU Availability Checker

```bash
#!/bin/bash
# Перевірити доступність SKU у цільовому регіоні

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

# Використання
check_sku_availability "eastus" "app-service" "P1V3"
```

### Cost Estimation Script

```powershell
# PowerShell-скрипт для оцінки витрат
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
        
        # Використовуйте Azure Pricing API або калькулятор
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Використання
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### Performance Validation

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

## Best Practices Summary

### Рекомендації

1. **Починайте з малого і масштабуйтеся** відповідно до фактичного використання
2. **Використовуйте різні SKUs для різних середовищ**
3. **Безперервно моніторте продуктивність та витрати**
4. **Використовуйте резервування потужностей для робочих навантажень у продакшн**
5. **Впроваджуйте авто-масштабування там, де це доречно**
6. **Тестуйте продуктивність на реалістичних навантаженнях**
7. **Плануйте зростання, але уникайте надмірного виділення ресурсів**
8. **Використовуйте безкоштовні рівні для розробки, коли це можливо**

### Чого не слід робити

1. **Не використовуйте продакшн SKU для розробки**
2. **Не ігноруйте регіональну доступність SKU**
3. **Не забувайте про витрати на передачу даних**
4. **Не виділяйте надмірні ресурси без обґрунтування**
5. **Не ігноруйте вплив залежностей**
6. **Не встановлюйте занадто високі межі авто-масштабування**
7. **Не забувайте про вимоги відповідності**
8. **Не приймайте рішення, ґрунтуючись лише на ціні**

---

**Порада**: Використовуйте Azure Cost Management та Advisor, щоб отримувати персоналізовані рекомендації щодо оптимізації вашого вибору SKU на основі фактичних шаблонів використання.

---

**Навігація**
- **Попередній урок**: [Планування потужностей](capacity-planning.md)
- **Наступний урок**: [Перевірки перед запуском](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Відмова від відповідальності:
Цей документ було перекладено з використанням сервісу перекладу на основі штучного інтелекту [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, просимо врахувати, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ його рідною/оригінальною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується звертатися до професійного перекладу, виконаного людиною. Ми не несемо відповідальності за будь‑які непорозуміння чи хибні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
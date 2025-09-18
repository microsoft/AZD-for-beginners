<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "952ed5af7f5db069c53a6840717e1801",
  "translation_date": "2025-09-18T13:49:51+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "uk"
}
-->
# Посібник з вибору SKU - Як обрати правильні рівні сервісів Azure

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 6 - Перевірка перед розгортанням та планування
- **⬅️ Попередній**: [Планування потужностей](capacity-planning.md)
- **➡️ Наступний**: [Перевірки перед запуском](preflight-checks.md)
- **🚀 Наступний розділ**: [Розділ 7: Виправлення помилок](../troubleshooting/common-issues.md)

## Вступ

Цей детальний посібник допоможе вам обрати оптимальні SKU (Stock Keeping Units) сервісів Azure для різних середовищ, навантажень та вимог. Ви навчитеся аналізувати потреби у продуктивності, враховувати витрати та вимоги до масштабованості, щоб обрати найбільш відповідні рівні сервісів для розгортання за допомогою Azure Developer CLI.

## Цілі навчання

Після завершення цього посібника ви:
- Зрозумієте концепції SKU Azure, моделі ціноутворення та відмінності у функціоналі
- Опануєте стратегії вибору SKU для конкретних середовищ: розробка, тестування та продакшн
- Навчитеся аналізувати вимоги до навантаження та співвідносити їх із відповідними рівнями сервісів
- Реалізуєте стратегії оптимізації витрат через розумний вибір SKU
- Застосуєте методи тестування продуктивності та перевірки вибору SKU
- Налаштуєте автоматизовані рекомендації щодо SKU та моніторинг

## Результати навчання

Після завершення ви зможете:
- Обирати відповідні SKU сервісів Azure на основі вимог до навантаження та обмежень
- Проєктувати економічно ефективні архітектури для багатосередовищних систем із правильним вибором рівнів сервісів
- Реалізовувати тестування продуктивності та перевірку вибору SKU
- Створювати автоматизовані інструменти для рекомендацій щодо SKU та оптимізації витрат
- Планувати міграцію SKU та стратегії масштабування для змінних вимог
- Застосовувати принципи Azure Well-Architected Framework до вибору рівнів сервісів

## Зміст

- [Розуміння SKU](../../../../docs/pre-deployment)
- [Вибір на основі середовища](../../../../docs/pre-deployment)
- [Рекомендації для конкретних сервісів](../../../../docs/pre-deployment)
- [Стратегії оптимізації витрат](../../../../docs/pre-deployment)
- [Міркування щодо продуктивності](../../../../docs/pre-deployment)
- [Таблиці швидкого доступу](../../../../docs/pre-deployment)
- [Інструменти перевірки](../../../../docs/pre-deployment)

---

## Розуміння SKU

### Що таке SKU?

SKU (Stock Keeping Units) представляють різні рівні сервісів та рівні продуктивності для ресурсів Azure. Кожен SKU пропонує різні:

- **Характеристики продуктивності** (CPU, пам'ять, пропускна здатність)
- **Доступність функцій** (опції масштабування, рівні SLA)
- **Моделі ціноутворення** (на основі споживання, зарезервованої потужності)
- **Регіональна доступність** (не всі SKU доступні у всіх регіонах)

### Основні фактори вибору SKU

1. **Вимоги до навантаження**
   - Очікувані шаблони трафіку/навантаження
   - Вимоги до продуктивності (CPU, пам'ять, I/O)
   - Потреби у зберіганні даних та шаблони доступу

2. **Тип середовища**
   - Розробка/тестування проти продакшну
   - Вимоги до доступності
   - Потреби у безпеці та відповідності

3. **Бюджетні обмеження**
   - Початкові витрати проти операційних витрат
   - Знижки на зарезервовану потужність
   - Вплив витрат на автоматичне масштабування

4. **Прогнози зростання**
   - Вимоги до масштабованості
   - Майбутні потреби у функціях
   - Складність міграції

---

## Вибір на основі середовища

### Середовище розробки

**Пріоритети**: Оптимізація витрат, базова функціональність, легке створення/видалення ресурсів

#### Рекомендовані SKU
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

#### Характеристики
- **App Service**: F1 (Free) або B1 (Basic) для простого тестування
- **Бази даних**: Базовий рівень із мінімальними ресурсами
- **Сховище**: Стандартне з локальною резервною копією
- **Обчислення**: Допустиме використання спільних ресурсів
- **Мережа**: Базові конфігурації

### Середовище тестування/стейджингу

**Пріоритети**: Конфігурація, схожа на продакшн, баланс витрат, можливість тестування продуктивності

#### Рекомендовані SKU
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

#### Характеристики
- **Продуктивність**: 70-80% від потужності продакшну
- **Функції**: Увімкнено більшість функцій продакшну
- **Резервування**: Деяка географічна резервна копія
- **Масштабування**: Обмежене автоматичне масштабування для тестування
- **Моніторинг**: Повний стек моніторингу

### Середовище продакшну

**Пріоритети**: Продуктивність, доступність, безпека, відповідність, масштабованість

#### Рекомендовані SKU
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

#### Характеристики
- **Висока доступність**: Вимоги SLA 99.9%+
- **Продуктивність**: Виділені ресурси, висока пропускна здатність
- **Безпека**: Преміум-функції безпеки
- **Масштабування**: Повні можливості автоматичного масштабування
- **Моніторинг**: Комплексна спостережуваність

---

## Рекомендації для конкретних сервісів

### Azure App Service

#### Матриця вибору SKU

| Використання | Рекомендований SKU | Обґрунтування |
|--------------|--------------------|---------------|
| Розробка/тестування | F1 (Free) або B1 (Basic) | Економічно вигідно, достатньо для тестування |
| Невеликі продакшн-додатки | S1 (Standard) | Кастомні домени, SSL, автоматичне масштабування |
| Середні продакшн-додатки | P1V3 (Premium V3) | Краща продуктивність, більше функцій |
| Додатки з високим трафіком | P2V3 або P3V3 | Виділені ресурси, висока продуктивність |
| Критично важливі додатки | I1V2 (Isolated V2) | Ізоляція мережі, виділене обладнання |

#### Приклади конфігурацій

**Розробка**
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

**Продакшн**
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

#### Рамка вибору SKU

1. **На основі DTU (Database Transaction Units)**
   - **Basic**: 5 DTU - Розробка/тестування
   - **Standard**: S0-S12 (10-3000 DTU) - Загальне призначення
   - **Premium**: P1-P15 (125-4000 DTU) - Критично важлива продуктивність

2. **На основі vCore** (Рекомендовано для продакшну)
   - **General Purpose**: Збалансовані обчислення та сховище
   - **Business Critical**: Низька затримка, високий IOPS
   - **Hyperscale**: Високомасштабоване сховище (до 100TB)

#### Приклади конфігурацій

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

#### Типи середовищ

1. **На основі споживання**
   - Ціноутворення за використання
   - Підходить для розробки та змінних навантажень
   - Спільна інфраструктура

2. **Виділені (Workload Profiles)**
   - Виділені обчислювальні ресурси
   - Передбачувана продуктивність
   - Краще для продакшн-навантажень

#### Приклади конфігурацій

**Розробка (на основі споживання)**
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

**Продакшн (виділені)**
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

#### Моделі пропускної здатності

1. **Ручне виділення пропускної здатності**
   - Передбачувана продуктивність
   - Знижки на зарезервовану потужність
   - Найкраще для стабільних навантажень

2. **Автоматичне масштабування пропускної здатності**
   - Автоматичне масштабування залежно від використання
   - Оплата за фактичне використання (з мінімумом)
   - Добре для змінних навантажень

3. **Безсерверний режим**
   - Оплата за запит
   - Без виділеної пропускної здатності
   - Ідеально для розробки та періодичних навантажень

#### Приклади SKU

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

#### Типи облікових записів сховища

1. **Standard_LRS** - Розробка, некритичні дані
2. **Standard_GRS** - Продакшн, потрібна георезервна копія
3. **Premium_LRS** - Додатки з високою продуктивністю
4. **Premium_ZRS** - Висока доступність із зональною резервною копією

#### Рівні продуктивності

- **Standard**: Загальне призначення, економічно вигідно
- **Premium**: Висока продуктивність, сценарії з низькою затримкою

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

## Стратегії оптимізації витрат

### 1. Зарезервована потужність

Резервуйте ресурси на 1-3 роки для значних знижок:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Правильний розмір

Починайте з менших SKU та масштабуйте залежно від фактичного використання:

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

### 3. Конфігурація автоматичного масштабування

Реалізуйте інтелектуальне масштабування для оптимізації витрат:

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

### 4. Заплановане масштабування

Зменшуйте масштабування у неробочі години:

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

## Міркування щодо продуктивності

### Базові вимоги до продуктивності

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

### Тестування навантаження

Тестуйте різні SKU для перевірки продуктивності:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Моніторинг та оптимізація

Налаштуйте комплексний моніторинг:

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

## Таблиці швидкого доступу

### Швидкий доступ до SKU App Service

| SKU | Рівень | vCPU | RAM | Сховище | Діапазон цін | Використання |
|-----|--------|------|-----|---------|--------------|--------------|
| F1 | Free | Спільний | 1GB | 1GB | Безкоштовно | Розробка |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Невеликі додатки |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Продакшн |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Висока продуктивність |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Корпоративні |

### Швидкий доступ до SKU SQL Database

| SKU | Рівень | DTU/vCore | Сховище | Діапазон цін | Використання |
|-----|--------|-----------|---------|--------------|--------------|
| Basic | Basic | 5 DTU | 2GB | $ | Розробка |
| S2 | Standard | 50 DTU | 250GB | $$ | Невеликий продакшн |
| P2 | Premium | 250 DTU | 1TB | $$$ | Висока продуктивність |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Збалансований |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Критично важливий |

### Швидкий доступ до SKU Container Apps

| Модель | Ціноутворення | CPU/Пам'ять | Використання |
|--------|---------------|-------------|--------------|
| Consumption | Оплата за використання | 0.25-2 vCPU | Розробка, змінне навантаження |
| Dedicated D4 | Зарезервовано | 4 vCPU, 16GB | Продакшн |
| Dedicated D8 | Зарезервовано | 8 vCPU, 32GB | Висока продуктивність |

---

## Інструменти перевірки

### Перевірка доступності SKU

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

### Скрипт оцінки витрат

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

### Перевірка продуктивності

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

## Резюме найкращих практик

### Що робити

1. **Починайте з малого та масштабуйте** залежно від фактичного використання
2. **Використовуйте різні SKU для різних середовищ**
3. **Постійно моніторте продуктивність та витрати**
4. **Використовуйте зарезервовану потужність для продакшн-навантажень**
5. **Реалізовуйте автоматичне масштабування там, де це доречно**
6. **Тестуйте продуктивність із реалістичними навантаженнями**
7. **Плануйте зростання, але уникайте надмірного резервування**
8. **Використовуйте безкоштовні рівні для розробки, коли це можливо**

### Чого уникати

1. **Не використовуйте продакшн SKU для розробки**
2. **Не ігноруйте регіональну доступність SKU**
3. **Не забувайте про витрати на передачу даних**
4. **Не резервуйте надмірно без обґрунтування**
5. **Не ігноруйте вплив залежностей**
6. **Не встановлюйте надто високі ліміти автоматичного масштабування**
7. **Не забувайте про вимоги відповідності**
8. **Не приймайте рішення лише на основі ціни**

---

**Порада**: Використовуйте Azure Cost Management та Advisor для отримання персоналізованих рекомендацій щодо оптимізації вибору SKU на основі фактичних шаблонів використання.

---

**Навігація**
- **Попередній урок**: [Планування потужностей](capacity-planning.md)
- **Наступний урок**: [Перевірки перед запуском](preflight-checks.md)

---

**Відмова від відповідальності**:  
Цей документ був перекладений за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ на його рідній мові слід вважати авторитетним джерелом. Для критичної інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникають внаслідок використання цього перекладу.
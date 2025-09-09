<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7c000a3a8f4a04aa85c6d35714e3dee0",
  "translation_date": "2025-09-09T19:43:47+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "ru"
}
-->
# Руководство по выбору SKU - Как выбрать подходящие уровни услуг Azure

## Введение

Это подробное руководство поможет вам выбрать оптимальные SKU (Stock Keeping Units) услуг Azure для различных сред, рабочих нагрузок и требований. Узнайте, как анализировать потребности в производительности, учитывать затраты и требования к масштабируемости, чтобы выбрать наиболее подходящие уровни услуг для развертываний с помощью Azure Developer CLI.

## Цели обучения

Пройдя это руководство, вы:
- Поймете концепции SKU Azure, модели ценообразования и различия в функциях
- Освоите стратегии выбора SKU для разработки, тестирования и производства
- Научитесь анализировать требования рабочих нагрузок и сопоставлять их с подходящими уровнями услуг
- Реализуете стратегии оптимизации затрат через грамотный выбор SKU
- Примените методы тестирования производительности и проверки выбора SKU
- Настроите автоматические рекомендации и мониторинг SKU

## Результаты обучения

После завершения вы сможете:
- Выбирать подходящие SKU услуг Azure на основе требований и ограничений рабочих нагрузок
- Проектировать экономичные архитектуры для нескольких сред с правильным выбором уровней
- Реализовывать тестирование производительности и проверку выбора SKU
- Создавать автоматизированные инструменты для рекомендаций SKU и оптимизации затрат
- Планировать миграции SKU и стратегии масштабирования для изменяющихся требований
- Применять принципы Azure Well-Architected Framework к выбору уровней услуг

## Содержание

- [Понимание SKU](../../../../docs/pre-deployment)
- [Выбор на основе среды](../../../../docs/pre-deployment)
- [Рекомендации для конкретных услуг](../../../../docs/pre-deployment)
- [Стратегии оптимизации затрат](../../../../docs/pre-deployment)
- [Учет производительности](../../../../docs/pre-deployment)
- [Таблицы быстрого доступа](../../../../docs/pre-deployment)
- [Инструменты проверки](../../../../docs/pre-deployment)

---

## Понимание SKU

### Что такое SKU?

SKU (Stock Keeping Units) представляют собой различные уровни услуг и уровни производительности для ресурсов Azure. Каждый SKU предлагает разные:

- **Характеристики производительности** (CPU, память, пропускная способность)
- **Доступность функций** (опции масштабирования, уровни SLA)
- **Модели ценообразования** (на основе потребления, резервирование ресурсов)
- **Региональная доступность** (не все SKU доступны во всех регионах)

### Основные факторы выбора SKU

1. **Требования рабочих нагрузок**
   - Ожидаемые шаблоны трафика/нагрузки
   - Требования к производительности (CPU, память, I/O)
   - Потребности в хранилище и шаблоны доступа

2. **Тип среды**
   - Разработка/тестирование vs. производство
   - Требования к доступности
   - Потребности в безопасности и соответствии

3. **Бюджетные ограничения**
   - Первоначальные затраты vs. операционные затраты
   - Скидки на резервирование ресурсов
   - Влияние затрат на авто-масштабирование

4. **Прогнозы роста**
   - Требования к масштабируемости
   - Будущие потребности в функциях
   - Сложность миграции

---

## Выбор на основе среды

### Среда разработки

**Приоритеты**: Оптимизация затрат, базовая функциональность, простота создания/удаления ресурсов

#### Рекомендуемые SKU
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
- **App Service**: F1 (Free) или B1 (Basic) для простого тестирования
- **Базы данных**: Базовый уровень с минимальными ресурсами
- **Хранилище**: Стандартное с локальной избыточностью
- **Вычисления**: Допустимо использование общих ресурсов
- **Сеть**: Базовые конфигурации

### Среда тестирования/стейджинга

**Приоритеты**: Конфигурация, близкая к производственной, баланс затрат, возможность тестирования производительности

#### Рекомендуемые SKU
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
- **Производительность**: 70-80% от производственной мощности
- **Функции**: Включены большинство производственных функций
- **Избыточность**: Некоторая географическая избыточность
- **Масштабирование**: Ограниченное авто-масштабирование для тестирования
- **Мониторинг**: Полный стек мониторинга

### Производственная среда

**Приоритеты**: Производительность, доступность, безопасность, соответствие, масштабируемость

#### Рекомендуемые SKU
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
- **Высокая доступность**: Требования SLA 99.9%+
- **Производительность**: Выделенные ресурсы, высокая пропускная способность
- **Безопасность**: Премиальные функции безопасности
- **Масштабирование**: Полные возможности авто-масштабирования
- **Мониторинг**: Комплексная наблюдаемость

---

## Рекомендации для конкретных услуг

### Azure App Service

#### Матрица выбора SKU

| Сценарий использования | Рекомендуемый SKU | Обоснование |
|-------------------------|------------------|-------------|
| Разработка/тестирование | F1 (Free) или B1 (Basic) | Экономично, достаточно для тестирования |
| Небольшие производственные приложения | S1 (Standard) | Пользовательские домены, SSL, авто-масштабирование |
| Средние производственные приложения | P1V3 (Premium V3) | Лучшая производительность, больше функций |
| Приложения с высокой нагрузкой | P2V3 или P3V3 | Выделенные ресурсы, высокая производительность |
| Критически важные приложения | I1V2 (Isolated V2) | Сетевое изолирование, выделенное оборудование |

#### Примеры конфигураций

**Разработка**
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

**Производство**
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

#### Рамки выбора SKU

1. **На основе DTU (Database Transaction Units)**
   - **Basic**: 5 DTU - Разработка/тестирование
   - **Standard**: S0-S12 (10-3000 DTU) - Общие цели
   - **Premium**: P1-P15 (125-4000 DTU) - Критически важная производительность

2. **На основе vCore** (рекомендуется для производства)
   - **General Purpose**: Сбалансированные вычисления и хранилище
   - **Business Critical**: Низкая задержка, высокая IOPS
   - **Hyperscale**: Высокая масштабируемость хранилища (до 100TB)

#### Примеры конфигураций

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

#### Типы сред

1. **На основе потребления**
   - Ценообразование "плати за использование"
   - Подходит для разработки и переменных нагрузок
   - Общая инфраструктура

2. **Выделенные (профили нагрузки)**
   - Выделенные вычислительные ресурсы
   - Предсказуемая производительность
   - Лучше для производственных нагрузок

#### Примеры конфигураций

**Разработка (на основе потребления)**
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

**Производство (выделенные)**
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

#### Модели пропускной способности

1. **Ручная настройка пропускной способности**
   - Предсказуемая производительность
   - Скидки на резервирование ресурсов
   - Лучше для стабильных нагрузок

2. **Авто-масштабируемая пропускная способность**
   - Автоматическое масштабирование на основе использования
   - Оплата за фактическое использование (с минимумом)
   - Хорошо для переменных нагрузок

3. **Без сервера**
   - Оплата за запрос
   - Нет настроенной пропускной способности
   - Идеально для разработки и периодических нагрузок

#### Примеры SKU

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

#### Типы учетных записей хранилища

1. **Standard_LRS** - Разработка, некритичные данные
2. **Standard_GRS** - Производство, требуется гео-избыточность
3. **Premium_LRS** - Высокопроизводительные приложения
4. **Premium_ZRS** - Высокая доступность с зональной избыточностью

#### Уровни производительности

- **Standard**: Общего назначения, экономично
- **Premium**: Высокая производительность, сценарии с низкой задержкой

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

## Стратегии оптимизации затрат

### 1. Резервирование ресурсов

Резервируйте ресурсы на 1-3 года для значительных скидок:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Правильный размер

Начинайте с меньших SKU и увеличивайте их на основе фактического использования:

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

### 3. Конфигурация авто-масштабирования

Реализуйте интеллектуальное масштабирование для оптимизации затрат:

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

### 4. Запланированное масштабирование

Уменьшайте масштабирование в нерабочие часы:

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

## Учет производительности

### Базовые требования к производительности

Определите четкие требования к производительности перед выбором SKU:

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

### Тестирование нагрузки

Тестируйте различные SKU для проверки производительности:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Мониторинг и оптимизация

Настройте комплексный мониторинг:

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

## Таблицы быстрого доступа

### Быстрая справка по SKU для App Service

| SKU | Уровень | vCPU | RAM | Хранилище | Диапазон цен | Сценарий использования |
|-----|---------|------|-----|-----------|--------------|-------------------------|
| F1 | Free | Shared | 1GB | 1GB | Бесплатно | Разработка |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Небольшие приложения |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Производство |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Высокая производительность |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Корпоративные приложения |

### Быстрая справка по SKU для SQL Database

| SKU | Уровень | DTU/vCore | Хранилище | Диапазон цен | Сценарий использования |
|-----|---------|-----------|-----------|--------------|-------------------------|
| Basic | Basic | 5 DTU | 2GB | $ | Разработка |
| S2 | Standard | 50 DTU | 250GB | $$ | Небольшое производство |
| P2 | Premium | 250 DTU | 1TB | $$$ | Высокая производительность |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Сбалансированное |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Критически важное |

### Быстрая справка по SKU для Container Apps

| Модель | Ценообразование | CPU/Память | Сценарий использования |
|--------|-----------------|------------|-------------------------|
| Consumption | Плати за использование | 0.25-2 vCPU | Разработка, переменная нагрузка |
| Dedicated D4 | Резервирование | 4 vCPU, 16GB | Производство |
| Dedicated D8 | Резервирование | 8 vCPU, 32GB | Высокая производительность |

---

## Инструменты проверки

### Проверка доступности SKU

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

### Скрипт оценки затрат

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

### Проверка производительности

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

## Резюме лучших практик

### Что делать

1. **Начинайте с малого и увеличивайте** на основе фактического использования
2. **Используйте разные SKU для разных сред**
3. **Постоянно мониторьте производительность и затраты**
4. **Резервируйте ресурсы для производственных нагрузок**
5. **Реализуйте авто-масштабирование там, где это уместно**
6. **Тестируйте производительность с реалистичными нагрузками**
7. **Планируйте рост, но избегайте избыточного резервирования**
8. **Используйте бесплатные уровни для разработки, если возможно**

### Чего избегать

1. **Не используйте производственные SKU для разработки**
2. **Не игнорируйте региональную доступность SKU**
3. **Не забывайте о затратах на передачу данных**
4. **Не резервируйте ресурсы без необходимости**
5. **Не игнорируйте влияние зависимостей**
6. **Не устанавливайте слишком высокие лимиты авто-масштабирования**
7. **Не забывайте о требованиях соответствия**
8. **Не принимайте решения только на основе цены**

---

**Совет**: Используйте Azure Cost Management и Advisor для получения персонализированных рекомендаций по оптимизации выбора SKU на основе фактических шаблонов использования.

---

**Навигация**
- **Предыдущий урок**: [Планирование емкости](capacity-planning.md)
- **Следующий урок**: [Проверки перед запуском](preflight-checks.md)

---

**Отказ от ответственности**:  
Этот документ был переведен с использованием сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Хотя мы стремимся к точности, пожалуйста, учитывайте, что автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его родном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неправильные интерпретации, возникающие в результате использования данного перевода.
# Руководство по выбору SKU - Как подобрать подходящие уровни сервиса Azure

**Навигация по главам:**
- **📚 Главная курса**: [AZD For Beginners](../../README.md)
- **📖 Текущая глава**: Глава 6 - Проверка и планирование перед развертыванием
- **⬅️ Предыдущая**: [Планирование емкости](capacity-planning.md)
- **➡️ Следующая**: [Проверки перед запуском](preflight-checks.md)
- **🚀 Следующая глава**: [Глава 7: Устранение неполадок](../chapter-07-troubleshooting/common-issues.md)

## Введение

Это всестороннее руководство поможет вам выбрать оптимальные SKU (единицы учета запасов) сервисов Azure для разных сред, нагрузок и требований. Научитесь анализировать потребности в производительности, учитывать затраты и требования к масштабируемости, чтобы выбрать наиболее подходящие уровни сервиса для ваших развертываний с помощью Azure Developer CLI.

## Цели обучения

Выполнив это руководство, вы:
- Поймете концепцию SKU в Azure, модели ценообразования и различия в функциях
- Овладеете стратегиями выбора SKU в зависимости от среды (разработка, стенд, прод)
- Научитесь сопоставлять требования нагрузки с подходящими уровнями сервиса
- Реализуете стратегии оптимизации затрат через грамотный выбор SKU
- Примените методы тестирования производительности и валидации выбора SKU
- Настроите автоматические рекомендации по SKU и мониторинг

## Результаты обучения

После завершения вы сможете:
- Выбирать подходящие SKU сервисов Azure на основе требований к нагрузке и ограничений
- Проектировать экономичные многосредовые архитектуры с корректным выбором уровней
- Реализовывать бенчмаркинг производительности и валидацию выбранных SKU
- Создавать автоматические инструменты для рекомендаций по SKU и оптимизации затрат
- Планировать миграции SKU и стратегии масштабирования при изменении требований
- Применять принципы Azure Well-Architected Framework при выборе уровня сервиса

## Содержание

- [Понимание SKU](../../../../docs/chapter-06-pre-deployment)
- [Выбор по среде](../../../../docs/chapter-06-pre-deployment)
- [Рекомендации по конкретным сервисам](../../../../docs/chapter-06-pre-deployment)
- [Стратегии оптимизации затрат](../../../../docs/chapter-06-pre-deployment)
- [Соображения по производительности](../../../../docs/chapter-06-pre-deployment)
- [Краткие таблицы справки](../../../../docs/chapter-06-pre-deployment)
- [Инструменты валидации](../../../../docs/chapter-06-pre-deployment)

---

## Понимание SKU

### Что такое SKU?

SKU (единицы учета запасов) представляют разные уровни сервиса и уровни производительности для ресурсов Azure. Каждый SKU предлагает различные:

- **Характеристики производительности** (CPU, память, пропускная способность)
- **Доступность функций** (опции масштабирования, уровни SLA)
- **Модели ценообразования** (потребление, зарезервированная емкость)
- **Региональная доступность** (не все SKU доступны во всех регионах)

### Ключевые факторы при выборе SKU

1. **Требования нагрузки**
   - Ожидаемые шаблоны трафика/нагрузки
   - Требования к производительности (CPU, память, I/O)
   - Потребности в хранении и шаблоны доступа

2. **Тип среды**
   - Разработка/тестирование vs. продакшн
   - Требования к доступности
   - Потребности в безопасности и соответствие требованиям

3. **Бюджетные ограничения**
   - Начальные затраты vs. операционные затраты
   - Скидки за зарезервированную емкость
   - Последствия автоскейлинга для затрат

4. **Прогнозы роста**
   - Требования к масштабируемости
   - Будущие потребности в функциях
   - Сложность миграции

---

## Выбор по среде

### Среда разработки

**Приоритеты**: Оптимизация затрат, базовая функциональность, простота развёртывания/удаления

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
- **Базы данных**: уровень Basic с минимальными ресурсами
- **Хранилище**: Standard с локальной избыточностью
- **Вычисления**: допускается использование разделяемых ресурсов
- **Сеть**: базовые конфигурации

### Среда стенда/тестирования

**Приоритеты**: Конфигурация, похожая на продакшн, баланс затрат и возможности тестирования производительности

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
- **Производительность**: 70–80% от продакшн-емкости
- **Функции**: большинство продакшн-функций включено
- **Избыточность**: частичная географическая избыточность
- **Масштабирование**: ограниченный автоскейлинг для тестирования
- **Мониторинг**: полный стек мониторинга

### Продакшн

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
- **Высокая доступность**: требования SLA 99.9%+
- **Производительность**: выделенные ресурсы, высокая пропускная способность
- **Безопасность**: премиальные функции безопасности
- **Масштабирование**: полные возможности автоскейлинга
- **Мониторинг**: всесторонняя наблюдаемость

---

## Рекомендации по конкретным сервисам

### Azure App Service

#### Матрица принятия решения по SKU

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | Cost-effective, sufficient for testing |
| Small production apps | S1 (Standard) | Custom domains, SSL, auto-scaling |
| Medium production apps | P1V3 (Premium V3) | Better performance, more features |
| High-traffic apps | P2V3 or P3V3 | Dedicated resources, high performance |
| Mission-critical apps | I1V2 (Isolated V2) | Network isolation, dedicated hardware |

#### Примеры конфигурации

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

#### Фреймворк выбора SKU

1. **На основе DTU (Database Transaction Units)**
   - **Basic**: 5 DTU - разработка/тестирование
   - **Standard**: S0-S12 (10-3000 DTU) - общие задачи
   - **Premium**: P1-P15 (125-4000 DTU) - критичные по производительности

2. **На основе vCore** (рекомендуется для продакшн)
   - **General Purpose**: сбалансированные вычисления и хранилище
   - **Business Critical**: низкая задержка, высокий IOPS
   - **Hyperscale**: высокомасштабируемое хранилище (до 100TB)

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
   - Оплата по использованию
   - Подходит для разработки и переменных нагрузок
   - Общая инфраструктура

2. **Выделенные (Workload Profiles)**
   - Выделенные вычислительные ресурсы
   - Предсказуемая производительность
   - Лучше для продакшн-нагрузок

#### Примеры конфигурации

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

#### Модели пропускной способности

1. **Ручно резервируемая пропускная способность**
   - Предсказуемая производительность
   - Скидки за зарезервированную емкость
   - Лучшее для стабильных нагрузок

2. **Автомасштабируемая пропускная способность**
   - Автоматическое масштабирование в зависимости от использования
   - Оплата за фактическое использование (с минимальным порогом)
   - Хорошо для переменных нагрузок

3. **Serverless**
   - Оплата за запрос
   - Нет резервируемой пропускной способности
   - Идеально для разработки и прерывистых нагрузок

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

#### Типы учетных записей хранения

1. **Standard_LRS** - разработка, некритичные данные
2. **Standard_GRS** - продакшн, требуется гео-избыточность
3. **Premium_LRS** - приложения с высокой производительностью
4. **Premium_ZRS** - высокая доступность с зональной избыточностью

#### Уровни производительности

- **Standard**: универсальное, экономичное
- **Premium**: высокая производительность, низкая задержка

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

### 1. Зарезервированная емкость

Резервируйте ресурсы на 1–3 года для значительных скидок:

```bash
# Проверьте варианты бронирования
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Правильный размер (Right-Sizing)

Начинайте с меньших SKU и масштабируйте вверх на основе фактического использования:

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

### 3. Конфигурация автоскейлинга

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

### 4. Плановое масштабирование

Снижайте масштаб в нерабочие часы:

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

## Соображения по производительности

### Базовые требования к производительности

Определите четкие требования к производительности до выбора SKU:

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

### Нагрузочное тестирование

Тестируйте разные SKU для валидации производительности:

```bash
# Служба Azure Load Testing
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Мониторинг и оптимизация

Настройте всесторонний мониторинг:

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

## Краткие таблицы справки

### Быстрая справка по SKU App Service

| SKU | Tier | vCPU | RAM | Storage | Price Range | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | Development |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Small apps |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Production |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | High performance |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### Быстрая справка по SKU SQL Database

| SKU | Tier | DTU/vCore | Storage | Price Range | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Development |
| S2 | Standard | 50 DTU | 250GB | $$ | Small production |
| P2 | Premium | 250 DTU | 1TB | $$$ | High performance |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Balanced |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Mission critical |

### Быстрая справка по SKU Container Apps

| Model | Pricing | CPU/Memory | Use Case |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Development, variable load |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Production |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | High performance |

---

## Инструменты валидации

### Проверка доступности SKU

```bash
#!/bin/bash
# Проверить доступность SKU в целевом регионе

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

# Использование
check_sku_availability "eastus" "app-service" "P1V3"
```

### Скрипт оценки затрат

```powershell
# PowerShell-скрипт для оценки стоимости
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
        
        # Используйте Azure Pricing API или калькулятор
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Использование
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### Валидация производительности

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

## Краткое резюме лучших практик

### Что делать

1. **Начинайте с малого и масштабируйтесь вверх** на основе фактического использования
2. **Используйте разные SKU для разных сред**
3. **Постоянно мониторьте производительность и затраты**
4. **Используйте зарезервированную емкость для продакшн-нагрузок**
5. **Внедряйте автоскейлинг там, где это целесообразно**
6. **Тестируйте производительность реалистичными нагрузками**
7. **Планируйте рост, но избегайте избыточного резервирования**
8. **Используйте бесплатные уровни для разработки, когда это возможно**

### Чего не следует делать

1. **Не используйте продакшн-SKU для разработки**
2. **Не игнорируйте региональную доступность SKU**
3. **Не забывайте про затраты на передачу данных**
4. **Не выделяйте ресурсы сверх необходимости без обоснования**
5. **Не игнорируйте влияние зависимостей**
6. **Не устанавливайте слишком высокие пределы автоскейлинга**
7. **Не забывайте про требования соответствия**
8. **Не принимайте решения, основываясь только на цене**

---

**Совет экспертa**: Используйте Azure Cost Management и Advisor, чтобы получать персонализированные рекомендации по оптимизации выбора SKU на основе фактических шаблонов использования.

---

**Навигация**
- **Предыдущий урок**: [Планирование емкости](capacity-planning.md)
- **Следующий урок**: [Проверки перед запуском](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Отказ от ответственности:
Этот документ был переведен с помощью сервиса автоматического перевода на основе ИИ Co-op Translator (https://github.com/Azure/co-op-translator). Хотя мы стремимся к точности, имейте в виду, что автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для критически важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неверные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
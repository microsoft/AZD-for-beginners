# Руководство по выбору SKU - выбор правильных уровней сервиса Azure

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 6 - Предвари́тельная проверка и планирование
- **⬅️ Предыдущая**: [Планирование ёмкости](capacity-planning.md)
- **➡️ Следующая**: [Проверки перед запуском](preflight-checks.md)
- **🚀 Следующая глава**: [Глава 7: Устранение неполадок](../chapter-07-troubleshooting/common-issues.md)

## Введение

Это подробное руководство поможет вам выбрать оптимальные SKU (единицы складского учёта) сервисов Azure для различных сред, рабочих нагрузок и требований. Научитесь анализировать потребности в производительности, соображения стоимости и требования к масштабируемости для выбора наиболее подходящих уровней сервиса для развертываний Azure Developer CLI.

## Цели обучения

После прохождения этого руководства вы сможете:
- Понимать концепции SKU Azure, модели ценообразования и отличия функций
- Освоить стратегии выбора SKU, специфичные для среды разработки, тестирования и эксплуатации
- Анализировать требования к рабочей нагрузке и сопоставлять их с соответствующими уровнями сервиса
- Внедрять стратегии оптимизации затрат посредством интеллектуального выбора SKU
- Применять техники тестирования производительности и подтверждения выбора SKU
- Настраивать автоматические рекомендации и мониторинг SKU

## Результаты обучения

После завершения вы сможете:
- Выбирать подходящие SKU сервисов Azure на основе требований и ограничений рабочей нагрузки
- Проектировать экономичные архитектуры для нескольких сред с правильным выбором уровней
- Реализовывать бенчмаркинг производительности и проверку для выбора SKU
- Создавать автоматизированные инструменты для рекомендаций по SKU и оптимизации затрат
- Планировать миграции SKU и стратегии масштабирования при изменении требований
- Применять принципы Azure Well-Architected Framework для выбора уровней сервиса

## Содержание

- [Понимание SKU](#understanding-skus)
- [Выбор на основе среды](#environment-based-selection)
- [Руководство по сервисам](#service-specific-guidelines)
- [Стратегии оптимизации затрат](#cost-optimization-strategies)
- [Учёт производительности](#performance-considerations)
- [Справочные таблицы](#quick-reference-tables)
- [Инструменты проверки](#validation-tools)

---

## Понимание SKU

> **Пример области:** YAML-карты SKU и конфигурации производительности ниже - это заметки по проектированию, а не `azure.yaml` схема или конфигурация инструмента нагрузки. Блоки Bicep — альтернативы/фрагменты: объявляйте их параметры и родительские ресурсы, используйте уникальные символьные имена при объединении и подключайте модули в рабочий проект. Цены, лимиты и доступность регионов/SKU необходимо проверить для вашей подписки перед развертыванием.

### Что такое SKU?

SKU (единицы складского учёта) представляют разные уровни сервиса и производительности для ресурсов Azure. Каждый SKU предлагает разные:

- **Характеристики производительности** (ЦПУ, память, пропускная способность)
- **Доступность функций** (опции масштабирования, уровни SLA)
- **Модели ценообразования** (оплата за потребление, зарезервированная ёмкость)
- **Региональную доступность** (не все SKU доступны во всех регионах)

### Ключевые факторы выбора SKU

1. **Требования рабочей нагрузки**
   - Ожидаемый трафик/нагрузка
   - Требования к производительности (ЦПУ, память, ввод-вывод)
   - Потребности в хранилище и шаблоны доступа

2. **Тип среды**
   - Разработка/тестирование против эксплуатации
   - Требования к доступности
   - Потребности безопасности и соответствия

3. **Бюджетные ограничения**
   - Начальные затраты против операционных
   - Скидки на зарезервированную ёмкость
   - Последствия автоматического масштабирования для затрат

4. **Прогнозы роста**
   - Требования к масштабируемости
   - Потребности в будущих функциях
   - Сложность миграции

---

## Выбор на основе среды

### Среда разработки

**Приоритеты**: Оптимизация затрат, базовый функционал, простое выделение/освобождение ресурсов

#### Рекомендуемые SKU
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

#### Характеристики
- **App Service**: F1 (Бесплатный) или B1 (Базовый) для простого тестирования
- **Базы данных**: Базовый уровень с минимальными ресурсами
- **Хранилище**: Стандартное с локальным резервированием
- **Вычесления**: Допустимо использование общих ресурсов
- **Сеть**: Базовые настройки

### Среда предпродакшн/тестирования

**Приоритеты**: Конфигурация, близкая к продакшн, баланс затрат и возможности тестирования производительности

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
- **Функции**: Большинство производственных функций включены
- **Резервирование**: Частичное географическое резервирование
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
  storage: "Standard_GRS"    # Geo-redundant; Premium_GRS is not a storage SKU
  cosmos_db: "Provisioned"   # Dedicated throughput
  container_apps: "Dedicated" # Dedicated environment
  key_vault: "Premium"       # Premium with HSM
```

#### Характеристики
- **Высокая доступность**: Требования SLA 99.9%+
- **Производительность**: Выделенные ресурсы, высокая пропускная способность
- **Безопасность**: Усовершенствованные функции безопасности
- **Масштабирование**: Полные возможности авто-масштабирования
- **Мониторинг**: Комплексная наблюдаемость

---

## Руководство по сервисам

### Azure App Service

#### Матрица выбора SKU

| Случай использования | Рекомендуемый SKU | Обоснование |
|----------|----------------|-----------|
| Разработка/тестирование | F1 (Бесплатный) или B1 (Базовый) | Экономично, достаточно для тестирования |
| Небольшие производственные приложения | S1 (Стандартный) | Пользовательские домены, SSL, авто-масштабирование |
| Средние производственные приложения | P1V3 (Премиум V3) | Лучшая производительность, больше функций |
| Высоконагруженные приложения | P2V3 или P3V3 | Выделенные ресурсы, высокая производительность |
| Критически важные приложения | I1V2 (Изолированный V2) | Сетевая изоляция, выделенное оборудование |

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

**Эксплуатация**
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

1. **На основе DTU (единиц транзакций базы данных)**
   - **Базовый**: 5 DTU - разработка/тестирование
   - **Стандартный**: S0-S12 (10-3000 DTU) - общие цели
   - **Премиум**: P1-P15 (125-4000 DTU) - производительность критична

2. **На основе vCore** (рекомендуется для эксплуатации)
   - **Общие цели**: сбалансированные вычисления и хранилище
   - **Критический бизнес**: низкая задержка, высокая IOPS
   - **Гипермасштаб**: высокомасштабируемое хранилище; проверяйте текущие лимиты и поддержку регионов

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

#### Типы среды

1. **Оплата за потребление**
   - Оплата за использование
   - Подходит для разработки и переменных нагрузок
   - Разделяемая инфраструктура

2. **Выделенная (профили нагрузки)**
   - Выделенные вычислительные ресурсы
   - Предсказуемая производительность
   - Лучше подходит для эксплуатационных нагрузок

#### Примеры конфигураций

**Разработка (Оплата за потребление)**
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

**Эксплуатация (Выделенные ресурсы)**
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

Зональное резервирование также требует поддержки региона и соответствующей конфигурации VNet/подсети, опущенной здесь. Этот пример предусматривает три выделенных узла; настройте как минимум две реплики приложения для распределения по зонам и подберите размер реплик и узлов для отказа зоны. Смотрите [Руководство по надёжности Container Apps](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Чтобы разместить приложение в этом профиле, задайте его `workloadProfileName: 'production-profile'`; создание профиля не переводит приложения туда автоматически.

### Azure Cosmos DB

#### Модели пропускной способности

1. **Ручное выделение пропускной способности**
   - Предсказуемая производительность
   - Скидки на зарезервированную ёмкость
   - Лучший вариант для стабильных нагрузок

2. **Автоматическое масштабирование пропускной способности**
   - Автоматическое масштабирование на основе использования
   - Оплата за фактическое использование (с минимумом)
   - Хорошо подходит для переменных нагрузок

3. **Серверная модель**
   - Оплата за запрос
   - Без выделенной пропускной способности
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

#### Типы аккаунтов хранения

1. **Standard_LRS** - Разработка, некритичные данные
2. **Standard_GRS** - Производство, требуется гео-резервирование
3. **Premium_LRS** - Высокопроизводительные приложения
4. **Premium_ZRS** - Высокая доступность с зональным резервированием

#### Уровни производительности

- **Стандартный**: универсальный, экономичный вариант
- **Премиум**: высокопроизводительные сценарии с низкой задержкой

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

### 1. Зарезервированная ёмкость

Резервируйте ресурсы на 1-3 года для значительных скидок:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Предложения по резервированию и типы ресурсов, пригодных для резерва, различаются; проверяйте каталог и условия покупки вместо предположения, что каждый сервис/SKU поддерживает резервацию.

### 2. Правильный размер

Начинайте с меньших SKU и масштабируйтесь согласно фактическому использованию:

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

### 3. Настройка авто-масштабирования

Внедряйте интеллектуальное масштабирование для оптимизации затрат:

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

### 4. Плановое масштабирование

Снижайте масштаб в нерабочее время:

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

Определите чёткие требования к производительности перед выбором SKU:

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

Тестируйте разные SKU для проверки производительности:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
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

## Справочные таблицы

### Быстрая справка по SKU App Service

| SKU | Уровень | vCPU | ОЗУ | Хранилище | Ценовой диапазон | Случай использования |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Бесплатный | Общий | 1 ГБ | 1 ГБ | Бесплатно | Разработка |
| B1 | Базовый | 1 | 1,75 ГБ | 10 ГБ | $ | Малые приложения |
| S1 | Стандартный | 1 | 1,75 ГБ | 50 ГБ | $$ | Производство |
| P1V3 | Премиум V3 | 2 | 8 ГБ | 250 ГБ | $$$ | Высокая производительность |
| I1V2 | Изолированный V2 | 2 | 8 ГБ | 1 ТБ | $$$$ | Корпоративный |

### Быстрая справка по SKU SQL Database

| SKU | Уровень | DTU/vCore | Хранилище | Ценовой диапазон | Случай использования |
|-----|------|-----------|---------|-------------|----------|
| Basic | Базовый | 5 DTU | 2 ГБ | $ | Разработка |
| S2 | Стандартный | 50 DTU | 250 ГБ | $$ | Малое производство |
| P2 | Премиум | 250 DTU | 1 ТБ | $$$ | Высокая производительность |
| GP_Gen5_4 | Общие цели | 4 vCore | 4 ТБ | $$$ | Сбалансированный |
| BC_Gen5_8 | Критический бизнес | 8 vCore | 4 ТБ | $$$$ | Критически важный |

### Быстрая справка по SKU Container Apps

| Модель | Ценообразование | ЦПУ/Память | Случай использования |
|-------|---------|------------|----------|
| Оплата за потребление | Оплата за использование | Поддерживаемые комбинации ЦПУ/памяти зависят от среды/профиля | Разработка или производство, переменная нагрузка |
| Выделенный D4 | Оплата за выделенный узел | 4 vCPU, 16 ГиБ на узел | Постоянная нагрузка/потребность в изоляции |
| Выделенный D8 | Оплата за выделенный узел | 8 vCPU, 32 ГиБ на узел | Более высокая постоянная нагрузка |

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

### Скрипт оценки затрат

**Только псевдокод:** `Get-ResourceCost` ниже — это функция, специфичная для проекта, которую вы должны реализовать, используя текущие региональные/контрактные цены и предполагаемые данные использования. Это не PowerShell или Azure командлет.

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

Следующий YAML — это эскиз требований, **не** схема входных данных для Azure Load Testing, JMeter, Locust или k6. Преобразуйте его в реальную конфигурацию выбранного инструмента перед использованием команды load-test выше.

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

1. **Начинайте с малого и масштабируйтесь** на основе фактического использования
2. **Используйте разные SKU для разных сред**
3. **Постоянно контролируйте производительность и затраты**
4. **Используйте зарезервированную ёмкость для производственных нагрузок**
5. **Внедряйте авто-масштабирование там, где это уместно**
6. **Тестируйте производительность с реалистичными нагрузками**
7. **Планируйте рост, избегая чрезмерного резервирования**
8. **При возможности используйте бесплатные уровни для разработки**

### Чего не делать

1. **Не используйте производственные SKU для разработки**
2. **Не игнорируйте региональную доступность SKU**
3. **Не забывайте о расходах на передачу данных**
4. **Не избыточно резервируйте ресурсы без обоснования**
5. **Не пренебрегайте влиянием зависимостей**
6. **Не устанавливайте слишком высокие пределы авто-масштабирования**
7. **Не забывайте о требованиях соответствия**
8. **Не принимайте решения, основываясь только на цене**

---

**Полезный совет**: Используйте Azure Cost Management и Advisor для получения персонализированных рекомендаций по оптимизации выбора SKU на основе фактических шаблонов использования.

---

**Навигация**
- **Предыдущее занятие**: [Планирование ёмкости](capacity-planning.md)
- **Следующее занятие**: [Проверки перед запуском](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
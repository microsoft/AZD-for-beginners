# Посібник з вибору SKU – Вибір правильних рівнів сервісів Azure

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 6 – Попередня перевірка та планування
- **⬅️ Попередній**: [Планування ємності](capacity-planning.md)
- **➡️ Наступний**: [Передпольотні перевірки](preflight-checks.md)
- **🚀 Наступний розділ**: [Розділ 7: Усунення неполадок](../chapter-07-troubleshooting/common-issues.md)

## Вступ

Цей всебічний посібник допоможе вам вибрати оптимальні SKU сервісів Azure (одиниці зберігання запасів) для різних середовищ, навантажень і вимог. Навчіться аналізувати потреби в продуктивності, розглядати питання вартості та вимоги масштабованості, щоб обрати найвідповідніші рівні сервісів для ваших розгортань за допомогою Azure Developer CLI.

## Цілі навчання

Завдяки проходженню цього посібника ви:
- Зрозумієте концепції SKU Azure, моделі ціноутворення та відмінності функцій
- Опануєте стратегії вибору SKU, специфічні для різних середовищ – розробка, тестування та продуктивне середовище
- Проаналізуєте вимоги навантажень та підбиратимете відповідні рівні сервісів
- Реалізуєте стратегії оптимізації вартості через розумний вибір SKU
- Застосуєте техніки тестування продуктивності й підтвердження вибору SKU
- Налаштуєте автоматизовані рекомендації й моніторинг SKU

## Очікувані результати навчання

Після завершення ви зможете:
- Вибирати відповідні SKU сервісів Azure на основі вимог і обмежень навантажень
- Проєктувати економічно ефективні архітектури з багатьма середовищами з правильним вибором рівнів
- Застосовувати методи бенчмаркингу та підтвердження продуктивності вибору SKU
- Створювати автоматизовані інструменти для рекомендацій SKU та оптимізації вартості
- Планувати міграції SKU й стратегії масштабування відповідно до змін потреб
- Застосовувати принципи Azure Well-Architected Framework для вибору рівнів сервісів

## Зміст

- [Розуміння SKU](#understanding-skus)
- [Вибір на основі середовища](#environment-based-selection)
- [Керівництво по сервісах](#service-specific-guidelines)
- [Стратегії оптимізації вартості](#cost-optimization-strategies)
- [Врахування продуктивності](#performance-considerations)
- [Таблиці швидкого посилання](#quick-reference-tables)
- [Інструменти перевірки](#validation-tools)

---

## Розуміння SKU

> **Приклад обсягу:** Наведені нижче YAML-карти SKU та налаштування продуктивності - це конструкторські нотатки, а не `azure.yaml` схема або конфігурація інструменту навантаження. Блоки Bicep – це альтернативи/фрагменти: оголошуйте їхні параметри та батьківські ресурси, використовуйте унікальні символічні імена при комбінуванні і підключайте модулі до робочого проєкту. Ціни, обмеження та регіональна доступність SKU потрібно перевіряти для вашої підписки перед розгортанням.

### Що таке SKU?

SKU (одиниці зберігання запасів) представляють різні рівні сервісів і рівні продуктивності для ресурсів Azure. Кожен SKU пропонує різне:

- **Характеристики продуктивності** (ЦП, пам'ять, пропускна здатність)
- **Доступність функцій** (опції масштабування, рівні SLA)
- **Моделі ціноутворення** (оплата за споживання, зарезервована ємність)
- **Регіональна доступність** (не всі SKU доступні у всіх регіонах)

### Ключові фактори вибору SKU

1. **Вимоги навантаження**
   - Очікувані патерни трафіку/навантаження
   - Вимоги до продуктивності (ЦП, пам'ять, ввід/вивід)
   - Потреби в зберіганні та патерни доступу

2. **Тип середовища**
   - Розробка/тестування проти продуктивного середовища
   - Вимоги до доступності
   - Потреби безпеки та відповідності

3. **Бюджетні обмеження**
   - Початкові витрати проти операційних
   - Знижки за зарезервовану ємність
   - Вартість автоматичного масштабування

4. **Прогнози зростання**
   - Вимоги масштабованості
   - Майбутні потреби функцій
   - Складність міграції

---

## Вибір на основі середовища

### Середовище розробки

**Пріоритети**: Оптимізація вартості, базова функціональність, легкість надання/відкликання ресурсів

#### Рекомендовані SKU
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
- **App Service**: F1 (безкоштовний) або B1 (базовий) для простого тестування
- **Бази даних**: Базовий рівень з мінімальними ресурсами
- **Зберігання**: Стандартне з локальною надлишковістю
- **Обчислювальні ресурси**: Вживане спільне використання ресурсів допускається
- **Мережа**: Базові конфігурації

### Середовище стендування/тестування

**Пріоритети**: Конфігурація, наближена до продуктивної, баланс вартості, можливість тестування продуктивності

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
- **Продуктивність**: 70-80% від виробничої потужності
- **Функції**: Більшість продакшн-функцій увімкнено
- **Надлишковість**: Часткова географічна надлишковість
- **Масштабування**: Обмежене автоматичне масштабування для тестування
- **Моніторинг**: Повний стек моніторингу

### Продуктивне середовище

**Пріоритети**: Продуктивність, доступність, безпека, відповідність вимогам, масштабованість

#### Рекомендовані SKU
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
- **Висока доступність**: Вимоги SLA 99,9%+
- **Продуктивність**: Виділені ресурси, висока пропускна здатність
- **Безпека**: Преміальні функції безпеки
- **Масштабування**: Повні можливості авто-масштабування
- **Моніторинг**: Комплексна спостережуваність

---

## Керівництво по сервісах

### Azure App Service

#### Матриця прийняття рішень щодо SKU

| Випадок використання | Рекомендований SKU | Обґрунтування |
|----------|----------------|-----------|
| Розробка/тестування | F1 (безкоштовний) або B1 (базовий) | Вартість, достатньо для тестування |
| Невеликі продуктивні додатки | S1 (стандартний) | Користувацькі домени, SSL, авто-масштабування |
| Середні продуктивні додатки | P1V3 (преміум V3) | Краща продуктивність, більше функцій |
| Високонавантажені додатки | P2V3 або P3V3 | Виділені ресурси, висока продуктивність |
| Критично важливі додатки | I1V2 (ізольований V2) | Ізоляція мережі, виділене обладнання |

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

**Продуктивність**
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

#### Рамкова структура вибору SKU

1. **Базований на DTU (одиниці транзакцій бази даних)**
   - **Базовий**: 5 DTU – розробка/тестування
   - **Стандартний**: S0-S12 (10-3000 DTU) – загального призначення
   - **Преміум**: P1-P15 (125-4000 DTU) – продуктивність критичная

2. **Базований на vCore** (рекомендується для продуктивного середовища)
   - **Загального призначення**: збалансовані обчислення й зберігання
   - **Бізнес-критичний**: низька затримка, високий IOPS
   - **Hyperscale**: високомасштабоване зберігання; перевіряйте актуальні обмеження розміру та регіональну підтримку

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

1. **Оплата за споживання**
   - Ціноутворення за фактом використання
   - Підходить для розробки та змінних навантажень
   - Спільна інфраструктура

2. **Виділені (профілі навантажень)**
   - Виділені обчислювальні ресурси
   - Передбачувана продуктивність
   - Краще для продуктивних навантажень

#### Приклади конфігурацій

**Розробка (оплата за споживання)**
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

**Продуктивність (виділені)**
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

Зональна надлишковість також потребує інфраструктуру підтримуваного регіону і відповідні конфігурації VNet/підмережі, опущені тут. Цей приклад передбачає бюджет на три виділені вузли; налаштуйте принаймні дві репліки додатку для розподілу між зонами й розмірюйте як репліки, так і вузли з урахуванням відмови зони. Дивіться [Керівництво з надійності Container Apps](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Щоб розмістити додаток у цьому профілі, встановіть його `workloadProfileName: 'production-profile'`; створення профілю окремо не переносить додатки до нього.

### Azure Cosmos DB

#### Моделі пропускної здатності

1. **Ручний зарезервований пропускний канал**
   - Передбачувана продуктивність
   - Знижки за резервовану ємність
   - Краще для стабільних навантажень

2. **Автомасштабований пропускний канал**
   - Автоматичне масштабування на основі використання
   - Оплата за фактичне використання (з мінімумом)
   - Добре для змінних навантажень

3. **Безсерверний режим**
   - Оплата за запит
   - Відсутній зарезервований пропускний канал
   - Ідеально для розробки та переривчастих навантажень

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

### Обліковий запис Azure Storage

#### Типи облікових записів зберігання

1. **Standard_LRS** – розробка, некритичні дані
2. **Standard_GRS** – продуктивне середовище, потрібна георедундантність
3. **Premium_LRS** – високопродуктивні застосунки
4. **Premium_ZRS** – висока доступність із зональною надлишковістю

#### Рівні продуктивності

- **Стандартний**: для загального призначення, економічно вигідний
- **Преміум**: високопродуктивний, сценарії з низькою затримкою

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

## Стратегії оптимізації вартості

### 1. Резервування ємності

Бронюйте ресурси на 1–3 роки для значних знижок:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Пропозиції резервування та типи ресурсів, що підпадають під дію, різняться; переглядайте каталог і умови купівлі замість припущення, що кожен сервіс/ SKU підтримує резервування.

### 2. Правильний розмір

Починайте з менших SKU і масштабуйтесь вгору за реальним використанням:

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

### 3. Налаштування авто-масштабування

Впроваджуйте інтелектуальне масштабування для оптимізації вартості:

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

### 4. Планове масштабування

Зменшуйте навантаження в неробочий час:

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

## Врахування продуктивності

### Базові вимоги до продуктивності

Визначайте чіткі вимоги до продуктивності до вибору SKU:

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

Перевіряйте різні SKU для підтвердження продуктивності:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### Моніторинг і оптимізація

Налаштуйте комплексний моніторинг:

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

## Таблиці швидкого посилання

### Швидка довідка по SKU App Service

| SKU | Рівень | vCPU | RAM | Зберігання | Ціновий діапазон | Випадок використання |
|-----|-------|------|-----|-----------|-----------------|---------------------|
| F1 | Безкоштовний | Спільний | 1ГБ | 1ГБ | Безкоштовно | Розробка |
| B1 | Базовий | 1 | 1.75ГБ | 10ГБ | $ | Невеликі додатки |
| S1 | Стандартний | 1 | 1.75ГБ | 50ГБ | $$ | Продуктивність |
| P1V3 | Преміум V3 | 2 | 8ГБ | 250ГБ | $$$ | Висока продуктивність |
| I1V2 | Ізольований V2 | 2 | 8ГБ | 1ТБ | $$$$ | Підприємства |

### Швидка довідка по SKU SQL Database

| SKU | Рівень | DTU/vCore | Зберігання | Ціновий діапазон | Випадок використання |
|-----|-------|-----------|-----------|-----------------|---------------------|
| Basic | Базовий | 5 DTU | 2ГБ | $ | Розробка |
| S2 | Стандартний | 50 DTU | 250ГБ | $$ | Невелика продуктивність |
| P2 | Преміум | 250 DTU | 1ТБ | $$$ | Висока продуктивність |
| GP_Gen5_4 | Загального призначення | 4 vCore | 4ТБ | $$$ | Збалансований |
| BC_Gen5_8 | Бізнес-критичний | 8 vCore | 4ТБ | $$$$ | Критично важливий |

### Швидка довідка по SKU Container Apps

| Модель | Ціноутворення | CPU/Пам’ять | Випадок використання |
|--------|--------------|------------|---------------------|
| Споживання | Оплата за використання | Підтримувані поєднання CPU/пам’яті залежно від середовища/профілю | Розробка чи продуктивність, змінне навантаження |
| Виділений D4 | Оплата за виділений вузол | 4 vCPU, 16GiB на вузол | Стійке навантаження/потреба в ізоляції |
| Виділений D8 | Оплата за виділений вузол | 8 vCPU, 32GiB на вузол | Вищі стійкі навантаження |

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

### Скрипт оцінки вартості

**Лише псевдокод:** `Get-ResourceCost` нижче — це функція, специфічна для проєкту, яку ви повинні реалізувати, використовуючи актуальні регіональні/контрактні ціни та припущення про використання. Це не PowerShell або Azure cmdlet.

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

Нижченаведений YAML — це ескіз вимог, **не** схема введення для Azure Load Testing, JMeter, Locust або k6. Перетворіть його на реальну конфігурацію обраного вами інструменту перед використанням команди load-test вище.

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

## Підсумок найкращих практик

### Рекомендації «Зробити»

1. **Починайте з малого і масштабуйтесь відповідно до використання**
2. **Використовуйте різні SKU для різних середовищ**
3. **Постійно контролюйте продуктивність і витрати**
4. **Використовуйте резервування ємності для продуктивних навантажень**
5. **Впроваджуйте авто-масштабування там, де це доречно**
6. **Тестуйте продуктивність з реалістичними навантаженнями**
7. **Плануйте зростання, але уникайте надлишкового резервування**
8. **Використовуйте безкоштовні рівні для розробки, де можливо**

### Чого не слід робити

1. **Не використовуйте продуктивні SKU для розробки**
2. **Не ігноруйте регіональну доступність SKU**
3. **Не забувайте про витрати на передачу даних**
4. **Не перевищуйте резервування без достатньої причини**
5. **Не ігноруйте вплив залежностей**
6. **Не встановлюйте занадто високі ліміти авто-масштабування**
7. **Не забувайте про вимоги відповідності**
8. **Не приймайте рішення, базуючись тільки на ціні**

---

**Професійна порада**: Використовуйте Azure Cost Management і Advisor для отримання персоналізованих рекомендацій щодо оптимізації вибору SKU відповідно до фактичних патернів використання.

---

**Навігація**
- **Попередній урок**: [Планування ємності](capacity-planning.md)
- **Наступний урок**: [Передпольотні перевірки](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
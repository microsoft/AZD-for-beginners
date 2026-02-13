# Ръководство за избор на SKU - Как да изберете подходящите нива на услугата в Azure

**Навигация на главата:**
- **📚 Начална страница на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 6 - Предварителна валидация и планиране
- **⬅️ Предишна**: [Планиране на капацитета](capacity-planning.md)
- **➡️ Следваща**: [Предполетни проверки](preflight-checks.md)
- **🚀 Следваща глава**: [Глава 7: Отстраняване на проблеми](../chapter-07-troubleshooting/common-issues.md)

## Въведение

Това всеобхватно ръководство ще ви помогне да изберете оптимални SKU-та (Stock Keeping Units) за услуги в Azure за различни среди, работни натоварвания и изисквания. Научете как да анализирате нуждите от производителност, съображенията за разходи и изискванията за мащабируемост, за да изберете най-подходящите нива на услуги за вашите разгръщания с Azure Developer CLI.

## Учебни цели

Като завършите това ръководство, ще:
- Разберете концепциите за SKU в Azure, моделите на ценообразуване и разликите във функциите
- Овладеете стратегии за избор на SKU според средата за разработка, стейджинг и продукция
- Анализирате изискванията на натоварванията и ги съпоставите с подходящите нива на услуги
- Внедрите стратегии за оптимизация на разходите чрез интелигентен избор на SKU-та
- Приложите техники за тестване на производителността и валидация на избора на SKU
- Конфигурирате автоматизирани препоръки за SKU-та и мониторинг

## Резултати от обучението

След завършване ще можете да:
- Избирате подходящи SKU-та на Azure услуги въз основа на изискванията и ограниченията на натоварването
- Проектирате икономични архитектури за множество среди с правилен избор на нива
- Внедрявате бенчмаркинг и валидация на представянето за направения избор на SKU
- Създавате автоматизирани инструменти за препоръки на SKU и оптимизация на разходите
- Планирате миграции на SKU-та и стратегии за скалиране при променящи се изисквания
- Прилагате принципите на Azure Well-Architected Framework при избора на нива на услуги

## Съдържание

- [Разбиране на SKU](../../../../docs/chapter-06-pre-deployment)
- [Избор според средата](../../../../docs/chapter-06-pre-deployment)
- [Насоки за конкретни услуги](../../../../docs/chapter-06-pre-deployment)
- [Стратегии за оптимизация на разходите](../../../../docs/chapter-06-pre-deployment)
- [Съображения относно производителността](../../../../docs/chapter-06-pre-deployment)
- [Бързи референтни таблици](../../../../docs/chapter-06-pre-deployment)
- [Инструменти за валидация](../../../../docs/chapter-06-pre-deployment)

---

## Разбиране на SKU

### Какво представляват SKU?

SKU-та (Stock Keeping Units) представляват различни нива на услуги и нива на производителност за ресурси в Azure. Всяко SKU предлага различни:

- **Характеристики на производителността** (CPU, памет, пропускателна способност)
- **Наличност на функции** (опции за скалиране, нива на SLA)
- **Модели на ценообразуване** (плащане според използването, резервиран капацитет)
- **Регионална наличност** (не всички SKU-та са налични във всички региони)

### Ключови фактори при избора на SKU

1. **Изисквания на натоварването**
   - Очакван трафик/модели на натоварване
   - Изисквания за производителност (CPU, памет, I/O)
   - Нужди от съхранение и модели на достъп

2. **Тип на средата**
   - Разработка/тестове срещу продукция
   - Изисквания за наличност
   - Изисквания за сигурност и съответствие

3. **Ограничения на бюджета**
   - Първоначални разходи срещу оперативни разходи
   - Отстъпки за резервиран капацитет
   - Последствия от авто-скалирането върху разходите

4. **Прогнози за растеж**
   - Изисквания за мащабируемост
   - Бъдещи нужди от функции
   - Сложност на миграцията

---

## Избор според средата

### Среда за разработка

**Приоритети**: Оптимизация на разходите, основна функционалност, лесно внедряване/премахване на ресурси

#### Препоръчани SKU-та
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
- **App Service**: F1 (Безплатно) или B1 (Базово) за просто тестване
- **Бази данни**: Базово ниво с минимални ресурси
- **Съхранение**: Стандартно, само с локална излишност
- **Изчислителни ресурси**: Споделени ресурси са приемливи
- **Мрежа**: Базови конфигурации

### Стейдж/Тестова среда

**Приоритети**: Конфигурация, подобна на продукция, баланс на разходите, възможности за тестиране на производителността

#### Препоръчани SKU-та
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
- **Производителност**: 70-80% от капацитета в продукция
- **Функции**: Повечето функции от продукцията са включени
- **Излишност**: Частична географска излишност
- **Скалиране**: Ограничено автоматично скалиране за тестване
- **Мониторинг**: Пълен стек за мониторинг

### Продукционна среда

**Приоритети**: Производителност, наличност, сигурност, съответствие, мащабируемост

#### Препоръчани SKU-та
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
- **Висока наличност**: Изисквания за SLA 99.9%+
- **Производителност**: Посветени ресурси, висока пропускателна способност
- **Сигурност**: Премиум функции за сигурност
- **Скалиране**: Пълни възможности за автоматично скалиране
- **Мониторинг**: Всеобхватна наблюдаемост

---

## Насоки за конкретни услуги

### Azure App Service

#### Матрица за избор на SKU

| Случай на употреба | Препоръчано SKU | Обосновка |
|--------------------|-----------------|-----------|
| Разработка/Тестване | F1 (Безплатно) или B1 (Базово) | Икономично, достатъчно за тестване |
| Малки продукционни приложения | S1 (Standard) | Персонализирани домейни, SSL, автоматично скалиране |
| Средни продукционни приложения | P1V3 (Premium V3) | По-добра производителност, повече функции |
| Приложения с висок трафик | P2V3 или P3V3 | Посветени ресурси, висока производителност |
| Критични приложения | I1V2 (Isolated V2) | Изолация на мрежата, посветен хардуер |

#### Примери за конфигурации

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

#### Рамка за избор на SKU

1. **Базиран на DTU (Database Transaction Units)**
   - **Basic**: 5 DTU - За разработка/тестване
   - **Standard**: S0-S12 (10-3000 DTU) - За общо предназначение
   - **Premium**: P1-P15 (125-4000 DTU) - За критични по представяне

2. **Базиран на vCore** (Препоръчително за продукция)
   - **General Purpose**: Баланс между изчисления и съхранение
   - **Business Critical**: Ниска латентност, високи IOPS
   - **Hyperscale**: Високо мащабируемо съхранение (до 100TB)

#### Примери за конфигурации

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

#### Типове среди

1. **Базиран на потребление**
   - Плащане според използването
   - Подходящ за разработка и променливи натоварвания
   - Споделена инфраструктура

2. **Посветен (Профили на натоварването)**
   - Посветени изчислителни ресурси
   - Предвидима производителност
   - По-подходящо за продукционни натоварвания

#### Примери за конфигурации

**Разработка (Потребление)**
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

**Производство (Посветено)**
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

#### Модели на пропускателната способност

1. **Ръчно предоставена пропускателна способност**
   - Предвидимо представяне
   - Отстъпки за резервиран капацитет
   - Подходящо за стабилни натоварвания

2. **Автоматично мащабираща се предоставена пропускателна способност**
   - Автоматично мащабиране според използването
   - Плащате за това, което използвате (с минимум)
   - Добро за променливи натоварвания

3. **Безсървърно**
   - Плащане на заявка
   - Без предоставена пропускателна способност
   - Идеално за разработка и интермитентни натоварвания

#### Примери за SKU

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

#### Типове акаунти за съхранение

1. **Standard_LRS** - Разработка, некритични данни
2. **Standard_GRS** - Продукция, необходима географска излишност
3. **Premium_LRS** - Високопроизводителни приложения
4. **Premium_ZRS** - Висока наличност с излишност на зони

#### Нива на производителност

- **Standard**: За общо предназначение, икономично
- **Premium**: Висока производителност, сценарии с ниска латентност

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

## Стратегии за оптимизация на разходите

### 1. Резервиран капацитет

Резервирайте ресурси за 1-3 години за значителни отстъпки:

```bash
# Проверете опциите за резервация
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Правилно оразмеряване

Започнете с по-малки SKU-та и скалирайте нагоре според реалното използване:

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

### 3. Конфигурация за автоматично скалиране

Внедрете интелигентно скалиране за оптимизиране на разходите:

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

### 4. Планирано скалиране

Намалявайте скалата през неработните часове:

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

## Съображения относно производителността

### Базови изисквания за производителност

Дефинирайте ясни изисквания за производителност преди избора на SKU:

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

### Тестове за натоварване

Тествайте различни SKU-та, за да валидирате производителността:

```bash
# Услуга за тестване на натоварване в Azure
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Мониторинг и оптимизация

Настройте всеобхватен мониторинг:

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

## Бързи референтни таблици

### Бърза справка за SKU на App Service

| SKU | Ниво | vCPU | RAM | Съхранение | Ценови диапазон | Случай на употреба |
|-----|------|------|-----|------------|-----------------|--------------------|
| F1 | Безплатно | Споделен | 1GB | 1GB | Безплатно | Разработка |
| B1 | Базово | 1 | 1.75GB | 10GB | $ | Малки приложения |
| S1 | Стандартно | 1 | 1.75GB | 50GB | $$ | Продукция |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Висока производителност |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Предприятие |

### Бърза справка за SKU на SQL Database

| SKU | Ниво | DTU/vCore | Съхранение | Ценови диапазон | Случай на употреба |
|-----|------|-----------|------------|-----------------|--------------------|
| Basic | Basic | 5 DTU | 2GB | $ | Разработка |
| S2 | Standard | 50 DTU | 250GB | $$ | Малка продукция |
| P2 | Premium | 250 DTU | 1TB | $$$ | Висока производителност |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Балансиран |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Критично |

### Бърза справка за SKU на Container Apps

| Модел | Ценообразуване | CPU/Памет | Случай на употреба |
|-------|-----------------|-----------|--------------------|
| Потребление | Плащане според използването | 0.25-2 vCPU | Разработка, променливо натоварване |
| Dedicated D4 | Резервирано | 4 vCPU, 16GB | Продукция |
| Dedicated D8 | Резервирано | 8 vCPU, 32GB | Висока производителност |

---

## Инструменти за валидация

### Проверка за наличност на SKU

```bash
#!/bin/bash
# Проверка на наличността на SKU в целевия регион

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

# Употреба
check_sku_availability "eastus" "app-service" "P1V3"
```

### Скрипт за оценка на разходите

```powershell
# PowerShell скрипт за оценка на разходите
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
        
        # Използвайте Azure Pricing API или калкулатор
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Употреба
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### Валидиране на производителността

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

## Обобщение на добрите практики

### Какво да правите

1. **Започнете с малко и скалирайте нагоре** въз основа на реалното използване
2. **Използвайте различни SKU-та за различни среди**
3. **Наблюдавайте постоянно производителността и разходите**
4. **Възползвайте се от резервиран капацитет за продукционни натоварвания**
5. **Внедрете автоматично скалиране, където е подходящо**
6. **Тествайте производителността с реалистични натоварвания**
7. **Планирайте за растеж, но избягвайте прекомерно предоставяне на ресурси**
8. **Използвайте безплатни нива за разработка, когато е възможно**

### Какво да не правите

1. **Не използвайте продукционни SKU-та за разработка**
2. **Не игнорирайте регионалната наличност на SKU-тата**
3. **Не забравяйте разходите за пренос на данни**
4. **Не предоставяйте прекалено много ресурси без оправдание**
5. **Не игнорирайте въздействието на зависимостите**
6. **Не задавайте твърде високи ограничения за автоматичното скалиране**
7. **Не забравяйте изискванията за съответствие**
8. **Не взимайте решения само въз основа на цената**

---

**Професионален съвет**: Използвайте Azure Cost Management и Advisor, за да получите персонализирани препоръки за оптимизиране на избора на SKU-та въз основа на реални модели на използване.

---

**Навигация**
- **Предишен урок**: [Планиране на капацитета](capacity-planning.md)
- **Следващ урок**: [Предполетни проверки](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на услуга за превод с изкуствен интелект [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, имайте предвид, че автоматизираните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия оригинален език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален превод, извършен от човек. Не носим отговорност за каквито и да е недоразумения или погрешни тълкувания, възникнали в резултат на използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
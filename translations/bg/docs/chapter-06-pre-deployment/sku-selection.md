# Ръководство за избор на SKU - Избор на правилните нива на услугите Azure

**Навигация в главата:**
- **📚 Начало на курса**: [AZD For Beginners](../../README.md)
- **📖 Текуща глава**: Глава 6 - Валидация и планиране преди внедряване
- **⬅️ Предишна**: [Планиране на капацитета](capacity-planning.md)
- **➡️ Следваща**: [Проверки преди стартиране](preflight-checks.md)
- **🚀 Следваща глава**: [Глава 7: Отстраняване на неизправности](../chapter-07-troubleshooting/common-issues.md)

## Въведение

Това обширно ръководство ще ви помогне да изберете оптимални SKU (единици за управление на запасите) за различни Azure услуги в зависимост от среди, работни натоварвания и изисквания. Научете как да анализирате нуждите от производителност, разходи и изисквания за мащабируемост, за да изберете най-подходящите нива на услугите за вашите внедрявания с Azure Developer CLI.

## Учебни цели

След завършване на това ръководство ще:
- Разберете концепциите за Azure SKU, модели на ценообразуване и разлики във функциите
- Умело прилагате стратегии за избор на SKU според средата за разработка, тестове и продукция
- Анализирате изискванията на работното натоварване и ги съпоставите с подходящите нива на услугата
- Изпълнявате стратегии за оптимизация на разходите чрез интелигентен избор на SKU
- Прилагате техники за тестване на производителността и валидация при избор на SKU
- Конфигурирате автоматизирани препоръки и наблюдение на SKU

## Очаквани резултати

След завършване ще можете да:
- Избирате подходящи Azure SKU според изискванията на работното натоварване и ограниченията
- Проектирате рентабилни многосредови архитектури с правилен избор на нива
- Изпълнявате оценка и валидация на производителността при избор на SKU
- Създавате автоматизирани инструменти за препоръка на SKU и оптимизация на разходите
- Планирате миграции и стратегии за мащабиране при променящи се изисквания
- Прилагате принципите на Azure Well-Architected Framework при избора на нива на услугите

## Съдържание

- [Разбиране на SKU](#understanding-skus)
- [Избор според средата](#environment-based-selection)
- [Насоки за конкретна услуга](#service-specific-guidelines)
- [Стратегии за оптимизация на разходите](#cost-optimization-strategies)
- [Съображения за производителността](#performance-considerations)
- [Таблици за бърза справка](#quick-reference-tables)
- [Инструменти за валидация](#validation-tools)

---

## Разбиране на SKU

> **Примерна обхват:** YAML картите за SKU и конфигурациите за производителност по-долу са бележки за проектиране, не са `azure.yaml` схема или конфигурация за инструмент за товарно тестване. Bicep блоковете са алтернативи/фрагменти: декларирайте техните параметри и родителски ресурси, използвайте уникални символни имена при комбинирането им и свържете модулите в работен проект. Цените, лимитите и наличността на SKU/регион трябва да бъдат проверени за вашия абонамент преди внедряване.

### Какво са SKU?

SKU (Stock Keeping Units) представляват различни нива и нива на производителност за Azure ресурси. Всяко SKU предлага различни:

- **Характеристики на производителността** (CPU, памет, пропускателна способност)
- **Наличност на функции** (опции за мащабиране, нива на SLA)
- **Модели на ценообразуване** (на база потребление, резервирана капацитет)
- **Регионална наличност** (не всички SKU са достъпни във всички региони)

### Ключови фактори при избора на SKU

1. **Изисквания на работното натоварване**
   - Очаквани трафик/модели на натоварване
   - Изисквания за производителност (CPU, памет, I/O)
   - Нужди от съхранение и модели на достъп

2. **Тип на средата**
   - Разработка/тест срещу продукция
   - Изисквания за наличност
   - Нужди от сигурност и съответствие

3. **Бюджетни ограничения**
   - Начални разходи срещу оперативни разходи
   - Отстъпки за резервиран капацитет
   - Влияние на разходите от авто-мащабиране

4. **Прогнози за растеж**
   - Изисквания за мащабируемост
   - Бъдещи нужди от функции
   - Сложност на миграцията

---

## Избор според средата

### Разработваща среда

**Приоритети**: Оптимизация на разходите, базова функционалност, лесно предоставяне/отказване на ресурси

#### Препоръчителни SKU
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
- **App Service**: F1 (Безплатен) или B1 (Основен) за прости тестове
- **Бази данни**: Основен слой с минимални ресурси
- **Съхранение**: Стандартно с локална излишност само
- **Изчисления**: Приемливи споделени ресурси
- **Мрежа**: Основни конфигурации

### Тестова/етапна среда

**Приоритети**: Конфигурация подобна на продукция, балансиране на разходи, възможности за тестване на производителността

#### Препоръчителни SKU
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
- **Производителност**: 70-80% от продукционния капацитет
- **Функции**: Повечето продукционни функции активирани
- **Излишност**: Някаква географска излишност
- **Мащабиране**: Ограничено авто-мащабиране за тестове
- **Наблюдение**: Пълен мониторинг

### Продукционна среда

**Приоритети**: Производителност, наличност, сигурност, съответствие, мащабируемост

#### Препоръчителни SKU
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
- **Висока наличност**: Изисквания за SLA 99.9%+
- **Производителност**: Отделени ресурси, висока пропускателна способност
- **Сигурност**: Премиум функции за сигурност
- **Мащабиране**: Пълни възможности за авто-мащабиране
- **Наблюдение**: Комплексна наблюдаемост

---

## Насоки за конкретни услуги

### Azure App Service

#### Матрица за решения при избор на SKU

| Случай на употреба | Препоръчителен SKU | Обосновка |
|----------|----------------|-----------|
| Разработка/Тест | F1 (Безплатен) или B1 (Основен) | Ефективен по разходи, достатъчен за тестове |
| Малки продукционни приложения | S1 (Стандартен) | Персонализирани домейни, SSL, авто-мащабиране |
| Средни продукционни приложения | P1V3 (Премиум V3) | По-добра производителност, повече функции |
| Приложения с висок трафик | P2V3 или P3V3 | Отделени ресурси, висока производителност |
| Мисия-критични приложения | I1V2 (Изолиран V2) | Изолация на мрежата, отделен хардуер |

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

**Продукция**
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

1. **Базирано на DTU (Database Transaction Units)**
   - **Basic**: 5 DTU - Разработка/тест
   - **Standard**: S0-S12 (10-3000 DTU) - Общо предназначение
   - **Premium**: P1-P15 (125-4000 DTU) - Производителност-критично

2. **Базирано на vCore** (Препоръчва се за продукция)
   - **General Purpose**: Балансирани изчисления и съхранение
   - **Business Critical**: Ниска латентност, високи IOPS
   - **Hyperscale**: Високо мащабируемо съхранение; проверете текущите лимити за размер и регионална поддръжка

#### Примерни конфигурации

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

1. **Потребление-базирано**
   - Заплащане според използването
   - Подходящо за разработка и променливи натоварвания
   - Споделена инфраструктура

2. **Посветено (профили на работното натоварване)**
   - Посветени изчислителни ресурси
   - Предвидима производителност
   - По-добро за продукционни натоварвания

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

**Продукция (Посветено)**
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

Зоналната излишност изисква също инфраструктура, поддържана в региона и подходяща конфигурация на VNet/subnet, която е пропусната тук. Този пример предвижда три посветени възела; конфигурирайте поне два реплики на приложението за дистрибуция между зони и оразмерете както репликите, така и възлите за отказ на зона. Вижте [Насоки за надеждност на Container Apps](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). За да поставите приложение на този профил, задайте `workloadProfileName: 'production-profile'`; създаването на профила само по себе си не премества приложения към него.

### Azure Cosmos DB

#### Модели на пропускателна способност

1. **Ръчно зададена пропускателна способност**
   - Предвидима производителност
   - Отстъпки за резервирана капацитет
   - Най-добро за стабилни натоварвания

2. **Автоматично мащабиране на пропускателната способност**
   - Автоматично мащабиране според използването
   - Заплащате за това, което използвате (с минимум)
   - Подходящо за променливи натоварвания

3. **Безсървърен**
   - Заплащане на заявка
   - Без предварително зададена пропускателна способност
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

#### Видове Storage акаунти

1. **Standard_LRS** - Разработка, не-критични данни
2. **Standard_GRS** - Продукция, необходима гео-излишност
3. **Premium_LRS** - Високопроизводителни приложения
4. **Premium_ZRS** - Висока наличност с зонална излишност

#### Нива на производителност

- **Standard**: Общо предназначение, рентабилен
- **Premium**: Високопроизводителни, нисколатентни сценарии

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

### 1. Резервирана капацитет

Резервирайте ресурси за 1-3 години за значителни отстъпки:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Офертите за резервации и типовете подходящи ресурси варират; прегледайте каталога и условията за покупка, вместо да приемате, че всяка услуга/SKU поддържа резервация.

### 2. Правилен размер

Започнете с по-малки SKU и мащабирайте нагоре според реалното използване:

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

### 3. Конфигурация на авто-мащабиране

Прилагайте интелигентно мащабиране за оптимизация на разходите:

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

### 4. Планирано мащабиране

Намалявайте мащаба през непиковите часове:

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

## Съображения за производителността

### Основни изисквания за производителност

Определете ясни изисквания за производителност преди избора на SKU:

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

### Тест за натоварване

Тествайте различни SKU за валидиране на производителността:

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

Настройте комплексен мониторинг:

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

## Таблици за бърза справка

### Бърза справка за App Service SKU

| SKU | Ниво | vCPU | RAM | Съхранение | Ценови диапазон | Случай на употреба |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Безплатно | Споделена | 1GB | 1GB | Безплатно | Разработка |
| B1 | Основно | 1 | 1.75GB | 10GB | $ | Малки приложения |
| S1 | Стандартно | 1 | 1.75GB | 50GB | $$ | Продукция |
| P1V3 | Премиум V3 | 2 | 8GB | 250GB | $$$ | Висока производителност |
| I1V2 | Изолиран V2 | 2 | 8GB | 1TB | $$$$ | Предприятие |

### Бърза справка за SQL Database SKU

| SKU | Ниво | DTU/vCore | Съхранение | Ценови диапазон | Случай на употреба |
|-----|------|-----------|---------|-------------|----------|
| Basic | Основно | 5 DTU | 2GB | $ | Разработка |
| S2 | Стандартно | 50 DTU | 250GB | $$ | Малка продукция |
| P2 | Премиум | 250 DTU | 1TB | $$$ | Висока производителност |
| GP_Gen5_4 | Общо предназначение | 4 vCore | 4TB | $$$ | Балансирано |
| BC_Gen5_8 | Бизнес критично | 8 vCore | 4TB | $$$$ | Мисия критично |

### Бърза справка за Container Apps SKU

| Модел | Ценообразуване | CPU/Памет | Случай на употреба |
|-------|---------|------------|----------|
| Потребление | Заплащане според използването | Поддържани комбинации CPU/памет зависят от средата/профила | Разработка или продукция, променливо натоварване |
| Посветено D4 | Биллинг на посветен възел | 4 vCPU, 16GiB на възел | Устойчиво натоварване/нужди от изолация |
| Посветено D8 | Биллинг на посветен възел | 8 vCPU, 32GiB на възел | По-високо устойчиво натоварване |

---

## Инструменти за валидиране

### Проверител наличност на SKU

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

### Скрипт за оценка на разходите

**Само псевдокод:** `Get-ResourceCost` по-долу е функция, специфична за проекта, която трябва да имплементирате, използвайки текущите регионални/договорни цени и предположения за използването. Това не е PowerShell или Azure cmdlet.

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

### Валидация на производителността

Следният YAML е скица на изискванията, **не** е входна схема за Azure Load Testing, JMeter, Locust или k6. Превърнете го в реална конфигурация на избрания от вас инструмент преди да използвате командата load-test по-горе.

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

## Обобщение на най-добри практики

### Какво да правите

1. **Започнете с малки размери и мащабирайте според реалната употреба**
2. **Използвайте различни SKU за различните среди**
3. **Наблюдавайте производителността и разходите непрекъснато**
4. **Възползвайте се от резервиран капацитет за продукционни натоварвания**
5. **Прилагайте авто-мащабиране, където е подходящо**
6. **Тествайте производителността с реалистични натоварвания**
7. **Планирайте за растеж, но избягвайте прекомерно предоставяне**
8. **Използвайте безплатни нива за разработка, когато е възможно**

### Какво да не правите

1. **Не използвайте продукционни SKU за разработка**
2. **Не пренебрегвайте регионалната наличност на SKU**
3. **Не забравяйте разходите за трансфер на данни**
4. **Не предоставяйте прекомерно без оправдание**
5. **Не пренебрегвайте влиянието на зависимостите**
6. **Не задавайте твърде високи лимити за авто-мащабиране**
7. **Не забравяйте изискванията за съответствие**
8. **Не взимайте решения само на база цена**

---

**Професионален съвет**: Използвайте Azure Cost Management и Advisor за персонализирани препоръки за оптимизиране на избора на SKU според реалните модели на използване.

---

**Навигация**
- **Предишен урок**: [Планиране на капацитета](capacity-planning.md)
- **Следващ урок**: [Проверки преди стартиране](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
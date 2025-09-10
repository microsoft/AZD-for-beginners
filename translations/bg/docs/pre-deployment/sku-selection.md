<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7c000a3a8f4a04aa85c6d35714e3dee0",
  "translation_date": "2025-09-10T06:51:52+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "bg"
}
-->
# Ръководство за избор на SKU - Избор на правилните нива на услуги в Azure

## Въведение

Това изчерпателно ръководство ще ви помогне да изберете оптимални SKU (Stock Keeping Units) за различни среди, натоварвания и изисквания в Azure. Научете как да анализирате нуждите от производителност, разходите и изискванията за мащабируемост, за да изберете най-подходящите нива на услуги за вашите разгръщания с Azure Developer CLI.

## Цели на обучението

След завършване на това ръководство ще:
- Разбирате концепциите за SKU в Azure, моделите на ценообразуване и разликите във функциите
- Усвоите стратегии за избор на SKU, специфични за средата (разработка, тестване и продукция)
- Анализирате изискванията за натоварване и ги съпоставяте с подходящите нива на услуги
- Прилагате стратегии за оптимизация на разходите чрез интелигентен избор на SKU
- Извършвате тестове за производителност и валидиране на избора на SKU
- Конфигурирате автоматизирани препоръки и мониторинг за SKU

## Резултати от обучението

След завършване ще можете:
- Да избирате подходящи SKU за услуги в Azure въз основа на изискванията и ограниченията на натоварването
- Да проектирате икономически ефективни архитектури за много среди с правилен избор на нива
- Да извършвате бенчмаркинг и валидиране на производителността за избора на SKU
- Да създавате автоматизирани инструменти за препоръки и оптимизация на разходите за SKU
- Да планирате миграции и стратегии за мащабиране на SKU при променящи се изисквания
- Да прилагате принципите на Azure Well-Architected Framework към избора на нива на услуги

## Съдържание

- [Разбиране на SKU](../../../../docs/pre-deployment)
- [Избор, базиран на среда](../../../../docs/pre-deployment)
- [Насоки, специфични за услугите](../../../../docs/pre-deployment)
- [Стратегии за оптимизация на разходите](../../../../docs/pre-deployment)
- [Съображения за производителност](../../../../docs/pre-deployment)
- [Бързи референтни таблици](../../../../docs/pre-deployment)
- [Инструменти за валидиране](../../../../docs/pre-deployment)

---

## Разбиране на SKU

### Какво са SKU?

SKU (Stock Keeping Units) представляват различни нива на услуги и производителност за ресурсите в Azure. Всяко SKU предлага различни:

- **Характеристики на производителност** (CPU, памет, пропускателна способност)
- **Наличност на функции** (опции за мащабиране, нива на SLA)
- **Модели на ценообразуване** (на база потребление, резервиран капацитет)
- **Регионална наличност** (не всички SKU са налични във всички региони)

### Основни фактори при избора на SKU

1. **Изисквания за натоварване**
   - Очаквани модели на трафик/натоварване
   - Изисквания за производителност (CPU, памет, I/O)
   - Нужди от съхранение и модели на достъп

2. **Тип на средата**
   - Разработка/тестване срещу продукция
   - Изисквания за наличност
   - Нужди от сигурност и съответствие

3. **Бюджетни ограничения**
   - Първоначални разходи срещу оперативни разходи
   - Отстъпки за резервиран капацитет
   - Импликации на разходите за автоматично мащабиране

4. **Прогнози за растеж**
   - Изисквания за мащабируемост
   - Бъдещи нужди от функции
   - Сложност на миграцията

---

## Избор, базиран на среда

### Среда за разработка

**Приоритети**: Оптимизация на разходите, основна функционалност, лесно създаване и премахване на ресурси

#### Препоръчани SKU
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
- **App Service**: F1 (Free) или B1 (Basic) за просто тестване
- **Бази данни**: Основен слой с минимални ресурси
- **Съхранение**: Стандартно с локална излишност
- **Изчисления**: Споделени ресурси са приемливи
- **Мрежа**: Основни конфигурации

### Среда за тестване/стейджинг

**Приоритети**: Конфигурация, подобна на продукция, баланс на разходите, възможност за тестване на производителност

#### Препоръчани SKU
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
- **Производителност**: 70-80% от капацитета на продукция
- **Функции**: Повечето функции на продукция са активирани
- **Излишност**: Някаква географска излишност
- **Мащабиране**: Ограничено автоматично мащабиране за тестване
- **Мониторинг**: Пълен мониторинг

### Среда за продукция

**Приоритети**: Производителност, наличност, сигурност, съответствие, мащабируемост

#### Препоръчани SKU
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
- **Висока наличност**: Изисквания за SLA от 99.9%+
- **Производителност**: Посветени ресурси, висока пропускателна способност
- **Сигурност**: Премиум функции за сигурност
- **Мащабиране**: Пълни възможности за автоматично мащабиране
- **Мониторинг**: Цялостна наблюдаемост

---

## Насоки, специфични за услугите

### Azure App Service

#### Матрица за избор на SKU

| Случай на употреба | Препоръчано SKU | Основание |
|--------------------|----------------|-----------|
| Разработка/тестване | F1 (Free) или B1 (Basic) | Икономично, достатъчно за тестване |
| Малки приложения за продукция | S1 (Standard) | Персонализирани домейни, SSL, автоматично мащабиране |
| Средни приложения за продукция | P1V3 (Premium V3) | По-добра производителност, повече функции |
| Приложения с висок трафик | P2V3 или P3V3 | Посветени ресурси, висока производителност |
| Критични приложения | I1V2 (Isolated V2) | Мрежова изолация, посветен хардуер |

#### Примери за конфигурация

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

1. **DTU-базирани (Database Transaction Units)**
   - **Basic**: 5 DTU - Разработка/тестване
   - **Standard**: S0-S12 (10-3000 DTU) - Общи цели
   - **Premium**: P1-P15 (125-4000 DTU) - Критична производителност

2. **vCore-базирани** (Препоръчани за продукция)
   - **General Purpose**: Балансирани изчисления и съхранение
   - **Business Critical**: Ниска латентност, високи IOPS
   - **Hyperscale**: Високо мащабируемо съхранение (до 100TB)

#### Примери за конфигурация

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

1. **На база потребление**
   - Ценообразуване според използването
   - Подходящо за разработка и променливи натоварвания
   - Споделена инфраструктура

2. **Посветени (Профили на натоварване)**
   - Посветени изчислителни ресурси
   - Предсказуема производителност
   - По-добро за продукционни натоварвания

#### Примери за конфигурация

**Разработка (На база потребление)**
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

**Продукция (Посветени)**
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

#### Модели на пропускателна способност

1. **Ръчно зададена пропускателна способност**
   - Предсказуема производителност
   - Отстъпки за резервиран капацитет
   - Най-добро за стабилни натоварвания

2. **Автоматично мащабиране**
   - Автоматично мащабиране според използването
   - Плащане за използваното (с минимум)
   - Добро за променливи натоварвания

3. **Сървър без управление**
   - Плащане на заявка
   - Без зададена пропускателна способност
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
2. **Standard_GRS** - Продукция, необходима гео-излишност
3. **Premium_LRS** - Приложения с висока производителност
4. **Premium_ZRS** - Висока наличност със зонова излишност

#### Нива на производителност

- **Standard**: Общи цели, икономично
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
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Правилно оразмеряване

Започнете с по-малки SKU и увеличавайте според реалното използване:

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

### 3. Конфигурация за автоматично мащабиране

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

### 4. Планирано мащабиране

Намалявайте мащаба извън работните часове:

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

## Съображения за производителност

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

### Тестове за натоварване

Тествайте различни SKU за валидиране на производителността:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Мониторинг и оптимизация

Настройте цялостен мониторинг:

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
| F1 | Free | Споделено | 1GB | 1GB | Безплатно | Разработка |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Малки приложения |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Продукция |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Висока производителност |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Корпоративни приложения |

### Бърза справка за SKU на SQL Database

| SKU | Ниво | DTU/vCore | Съхранение | Ценови диапазон | Случай на употреба |
|-----|------|-----------|------------|-----------------|--------------------|
| Basic | Basic | 5 DTU | 2GB | $ | Разработка |
| S2 | Standard | 50 DTU | 250GB | $$ | Малка продукция |
| P2 | Premium | 250 DTU | 1TB | $$$ | Висока производителност |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Балансирано |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Критично за бизнеса |

### Бърза справка за SKU на Container Apps

| Модел | Ценообразуване | CPU/Памет | Случай на употреба |
|-------|---------------|-----------|--------------------|
| На база потребление | Плащане според използването | 0.25-2 vCPU | Разработка, променливи натоварвания |
| Посветени D4 | Резервирани | 4 vCPU, 16GB | Продукция |
| Посветени D8 | Резервирани | 8 vCPU, 32GB | Висока производителност |

---

## Инструменти за валидиране

### Проверка на наличността на SKU

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

### Скрипт за оценка на разходите

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

1. **Започнете с малко и увеличавайте** според реалното използване
2. **Използвайте различни SKU за различни среди**
3. **Непрекъснато наблюдавайте производителността и разходите**
4. **Използвайте резервиран капацитет за продукционни натоварвания**
5. **Прилагайте автоматично мащабиране, когато е подходящо**
6. **Тествайте производителността с реалистични натоварвания**
7. **Планирайте растеж, но избягвайте прекомерно оразмеряване**
8. **Използвайте безплатни нива за разработка, когато е възможно**

### Какво да избягвате

1. **Не използвайте продукционни SKU за разработка**
2. **Не игнорирайте регионалната наличност на SKU**
3. **Не забравяйте за разходите за трансфер на данни**
4. **Не оразмерявайте прекомерно без основателна причина**
5. **Не игнорирайте влиянието на зависимостите**
6. **Не задавайте твърде високи лимити за автоматично мащабиране**
7. **Не забравяйте за изискванията за съответствие**
8. **Не вземайте решения само въз основа на цена**

---

**Съвет**: Използвайте Azure Cost Management и Advisor, за да получите персонализирани препоръки за оптимизация на избора на SKU въз основа на реални модели на използване.

---

**Навигация**
- **Предишен урок**: [Планиране на капацитет](capacity-planning.md)
- **Следващ урок**: [Проверки преди разгръщане](preflight-checks.md)

---

**Отказ от отговорност**:  
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за недоразумения или погрешни интерпретации, произтичащи от използването на този превод.
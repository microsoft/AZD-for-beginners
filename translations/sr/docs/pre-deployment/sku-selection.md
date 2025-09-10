<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7c000a3a8f4a04aa85c6d35714e3dee0",
  "translation_date": "2025-09-10T06:52:42+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "sr"
}
-->
# Водич за избор SKU - Одабир одговарајућих нивоа Azure услуга

## Увод

Овај свеобухватни водич помаже вам да изаберете оптималне Azure SKU (Stock Keeping Units) за различита окружења, радне оптерећења и захтеве. Научите како да анализирате потребе за перформансама, трошкове и захтеве за скалабилношћу како бисте одабрали најприкладније нивое услуга за ваше Azure Developer CLI имплементације.

## Циљеви учења

Завршетком овог водича, научићете:
- Основе Azure SKU концепата, модела цена и разлике у функцијама
- Стратегије избора SKU специфичне за окружење: развој, тестирање и продукција
- Анализу захтева радног оптерећења и њихово усклађивање са одговарајућим нивоима услуга
- Примена стратегија оптимизације трошкова кроз интелигентан избор SKU
- Технике тестирања перформанси и валидације за избор SKU
- Конфигурисање аутоматизованих препорука SKU и праћења

## Исходи учења

По завршетку, бићете у могућности да:
- Изаберете одговарајуће Azure SKU на основу захтева и ограничења радног оптерећења
- Дизајнирате економичне архитектуре за више окружења са правилним избором нивоа услуга
- Спроведете тестирање перформанси и валидацију за избор SKU
- Креирате аутоматизоване алате за препоруке SKU и оптимизацију трошкова
- Планирате миграције SKU и стратегије скалирања за променљиве захтеве
- Примените принципе Azure Well-Architected Framework-а на избор нивоа услуга

## Садржај

- [Разумевање SKU](../../../../docs/pre-deployment)
- [Избор на основу окружења](../../../../docs/pre-deployment)
- [Смернице специфичне за услуге](../../../../docs/pre-deployment)
- [Стратегије оптимизације трошкова](../../../../docs/pre-deployment)
- [Разматрања перформанси](../../../../docs/pre-deployment)
- [Табеле за брзу референцу](../../../../docs/pre-deployment)
- [Алатке за валидацију](../../../../docs/pre-deployment)

---

## Разумевање SKU

### Шта су SKU?

SKU (Stock Keeping Units) представљају различите нивое услуга и перформанси за Azure ресурсе. Сваки SKU нуди различите:

- **Карактеристике перформанси** (CPU, меморија, пропусни опсег)
- **Доступност функција** (опције скалирања, SLA нивои)
- **Моделе цена** (на основу потрошње, резервисаног капацитета)
- **Регионалну доступност** (нису сви SKU доступни у свим регионима)

### Кључни фактори у избору SKU

1. **Захтеви радног оптерећења**
   - Очекивани обрасци саобраћаја/оптерећења
   - Захтеви за перформансама (CPU, меморија, I/O)
   - Потребе за складиштењем и обрасци приступа

2. **Тип окружења**
   - Развој/тестирање у односу на продукцију
   - Захтеви за доступношћу
   - Потребе за безбедношћу и усклађеношћу

3. **Буџетска ограничења**
   - Почетни трошкови у односу на оперативне трошкове
   - Попусти за резервисани капацитет
   - Импликације трошкова аутоматског скалирања

4. **Пројекције раста**
   - Захтеви за скалабилношћу
   - Будуће потребе за функцијама
   - Комплексност миграције

---

## Избор на основу окружења

### Окружење за развој

**Приоритети**: Оптимизација трошкова, основна функционалност, лако постављање/уклањање

#### Препоручени SKU
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

#### Карактеристике
- **App Service**: F1 (Free) или B1 (Basic) за једноставно тестирање
- **Базе података**: Основни ниво са минималним ресурсима
- **Складиштење**: Стандардно са локалном редунданцијом
- **Рачунарство**: Прихватљиви заједнички ресурси
- **Мрежа**: Основне конфигурације

### Тестно/стагинг окружење

**Приоритети**: Конфигурација слична продукцији, баланс трошкова, могућност тестирања перформанси

#### Препоручени SKU
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

#### Карактеристике
- **Перформансе**: 70-80% капацитета продукције
- **Функције**: Већина функција продукције омогућена
- **Редунданција**: Делимична географска редунданција
- **Скалирање**: Ограничено аутоматско скалирање за тестирање
- **Праћење**: Комплетан мониторинг

### Продукционо окружење

**Приоритети**: Перформансе, доступност, безбедност, усклађеност, скалабилност

#### Препоручени SKU
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

#### Карактеристике
- **Висока доступност**: Захтеви SLA од 99.9%+
- **Перформансе**: Дедиковани ресурси, висока пропусност
- **Безбедност**: Премијум безбедносне функције
- **Скалирање**: Потпуне могућности аутоматског скалирања
- **Праћење**: Свеобухватна видљивост

---

## Смернице специфичне за услуге

### Azure App Service

#### Матрица одлука за SKU

| Намена | Препоручени SKU | Образложење |
|-------|----------------|-------------|
| Развој/тестирање | F1 (Free) или B1 (Basic) | Исплативо, довољно за тестирање |
| Мале продукционе апликације | S1 (Standard) | Прилагођени домени, SSL, аутоматско скалирање |
| Средње продукционе апликације | P1V3 (Premium V3) | Боље перформансе, више функција |
| Апликације са великим саобраћајем | P2V3 или P3V3 | Дедиковани ресурси, високе перформансе |
| Критичне апликације | I1V2 (Isolated V2) | Изолација мреже, дедиковани хардвер |

#### Примери конфигурације

**Развој**
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

**Продукција**
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

#### Оквир за избор SKU

1. **На основу DTU (Database Transaction Units)**
   - **Basic**: 5 DTU - Развој/тестирање
   - **Standard**: S0-S12 (10-3000 DTU) - Општа намена
   - **Premium**: P1-P15 (125-4000 DTU) - Критичне перформансе

2. **На основу vCore (Препоручено за продукцију)**
   - **General Purpose**: Балансирано рачунарство и складиштење
   - **Business Critical**: Ниска латенција, високи IOPS
   - **Hyperscale**: Високо скалабилно складиштење (до 100TB)

#### Примери конфигурације

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

#### Типови окружења

1. **На основу потрошње**
   - Цене по коришћењу
   - Погодно за развој и променљива оптерећења
   - Заједничка инфраструктура

2. **Дедиковано (Workload Profiles)**
   - Дедиковани рачунарски ресурси
   - Предвидиве перформансе
   - Боље за продукциона оптерећења

#### Примери конфигурације

**Развој (Потрошња)**
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

**Продукција (Дедиковано)**
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

#### Модели пропусности

1. **Ручно обезбеђена пропусност**
   - Предвидиве перформансе
   - Попусти за резервисани капацитет
   - Најбоље за стабилна оптерећења

2. **Аутоматско скалирање обезбеђене пропусности**
   - Аутоматско скалирање на основу коришћења
   - Плаћање по коришћењу (са минимумом)
   - Добро за променљива оптерећења

3. **Serverless**
   - Плаћање по захтеву
   - Нема обезбеђене пропусности
   - Идеално за развој и повремена оптерећења

#### Примери SKU

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

#### Типови налога за складиштење

1. **Standard_LRS** - Развој, некритични подаци
2. **Standard_GRS** - Продукција, потребна гео-редунданција
3. **Premium_LRS** - Апликације са високим перформансама
4. **Premium_ZRS** - Висока доступност са зонском редунданцијом

#### Нивои перформанси

- **Standard**: Општа намена, исплативо
- **Premium**: Високе перформансе, сценарији са ниском латенцијом

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

## Стратегије оптимизације трошкова

### 1. Резервисани капацитет

Резервишите ресурсе на 1-3 године за значајне попусте:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Правилно димензионисање

Почните са мањим SKU и скалирајте на основу стварне употребе:

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

### 3. Конфигурација аутоматског скалирања

Примените интелигентно скалирање за оптимизацију трошкова:

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

### 4. Скалирање по распореду

Смањите скалирање током периода смањеног оптерећења:

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

## Разматрања перформанси

### Основни захтеви за перформансе

Дефинишите јасне захтеве за перформансе пре избора SKU:

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

### Тестирање оптерећења

Тестирајте различите SKU за валидацију перформанси:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Праћење и оптимизација

Поставите свеобухватно праћење:

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

## Табеле за брзу референцу

### Брза референца за App Service SKU

| SKU | Ниво | vCPU | RAM | Складиштење | Опсег цена | Намена |
|-----|------|------|-----|-------------|------------|-------|
| F1 | Free | Заједнички | 1GB | 1GB | Бесплатно | Развој |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Мале апликације |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Продукција |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Високе перформансе |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Ентерпрајз |

### Брза референца за SQL Database SKU

| SKU | Ниво | DTU/vCore | Складиштење | Опсег цена | Намена |
|-----|------|-----------|-------------|------------|-------|
| Basic | Basic | 5 DTU | 2GB | $ | Развој |
| S2 | Standard | 50 DTU | 250GB | $$ | Мала продукција |
| P2 | Premium | 250 DTU | 1TB | $$$ | Високе перформансе |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Балансирано |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Критично |

### Брза референца за Container Apps SKU

| Модел | Цене | CPU/Меморија | Намена |
|-------|------|-------------|--------|
| Потрошња | Плаћање по коришћењу | 0.25-2 vCPU | Развој, променљиво оптерећење |
| Дедиковано D4 | Резервисано | 4 vCPU, 16GB | Продукција |
| Дедиковано D8 | Резервисано | 8 vCPU, 32GB | Високе перформансе |

---

## Алатке за валидацију

### Провера доступности SKU

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

### Скрипта за процену трошкова

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

### Валидација перформанси

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

## Резиме најбољих пракси

### Шта радити

1. **Почните са мањим и скалирајте** на основу стварне употребе
2. **Користите различите SKU за различита окружења**
3. **Континуирано пратите перформансе и трошкове**
4. **Искористите резервисани капацитет за продукциона оптерећења**
5. **Примените аутоматско скалирање где је прикладно**
6. **Тестирајте перформансе са реалистичним оптерећењима**
7. **Планирајте раст, али избегавајте прекомерно обезбеђивање**
8. **Користите бесплатне нивое за развој кад год је могуће**

### Шта не радити

1. **Не користите продукционе SKU за развој**
2. **Не игноришите регионалну доступност SKU**
3. **Не заборавите на трошкове преноса података**
4. **Не обезбеђујте прекомерне ресурсе без оправдања**
5. **Не игноришите утицај зависности**
6. **Не постављајте лимите аутоматског скалирања превисоко**
7. **Не заборавите на захтеве усклађености**
8. **Не доносите одлуке само на основу цене**

---

**Савет**: Користите Azure Cost Management и Advisor за персонализоване препоруке за оптимизацију избора SKU на основу стварних образаца коришћења.

---

**Навигација**
- **Претходна лекција**: [Планирање капацитета](capacity-planning.md)
- **Следећа лекција**: [Провере пре имплементације](preflight-checks.md)

---

**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да превод буде тачан, молимо вас да имате у виду да аутоматизовани преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални превод од стране људског преводиоца. Не преузимамо одговорност за било каква погрешна тумачења или неспоразуме који могу настати услед коришћења овог превода.
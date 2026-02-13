# Водич за избор SKU-ова - Како изабрати одговарајуће нивое услуга у Azure

**Навигација по поглављима:**
- **📚 Почетак курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 6 - Валидација пре распоређивања и планирање
- **⬅️ Претходно**: [Capacity Planning](capacity-planning.md)
- **➡️ Следеће**: [Pre-flight Checks](preflight-checks.md)
- **🚀 Следеће поглавље**: [Поглавље 7: Решавање проблема](../chapter-07-troubleshooting/common-issues.md)

## Увод

Овај свеобухватни водич помаже вам да изаберете оптималне Azure сервисне SKU-ове (Stock Keeping Units) за различита окружења, оптерећења и захтеве. Научите како да анализирате потребе за перформансама, трошкове и захтеве за скалабилношћу како бисте одабрали најприкладније нивое услуга за своја Azure Developer CLI распоређивања.

## Циљеви учења

Након завршетка овог водича, моћи ћете да:
- Разумете концепте SKU-ова у Azure-у, моделе цена и разлике у карактеристикама
- Усвојите стратегије избора SKU-ова специфичне за окружења (развој, стајд, продукција)
- Анализирате захтеве оптерећења и упарите их са одговарајућим нивоима услуга
- Имплементирате стратегије оптимизације трошкова кроз паметан избор SKU-ова
- Примените технике тестирања перформанси и валидације за избор SKU-ова
- Конфигуришете аутоматизована препоручивања SKU-ова и надгледање

## Очекивани резултати учења

По завршетку, бићете у стању да:
- Одаберете одговарајуће Azure сервисне SKU-ове на основу захтева и ограничења оптерећења
- Дизајнирате економична архитектурна решења за више окружења са правим избором нивоа
- Имплементирате бенчмаркинг перформанси и валидацију избора SKU-ова
- Креирате аутоматизоване алате за препоруке SKU-ова и оптимизацију трошкова
- Планирате миграције SKU-ова и стратегије скалирања за променљиве захтеве
- Примените принципе Azure Well-Architected Framework при избору нивоа услуга

## Садржај

- [Разумевање SKU-ова](../../../../docs/chapter-06-pre-deployment)
- [Избор на основу окружења](../../../../docs/chapter-06-pre-deployment)
- [Смернице специфичне за услуге](../../../../docs/chapter-06-pre-deployment)
- [Стратегије оптимизације трошкова](../../../../docs/chapter-06-pre-deployment)
- [Разматрања перформанси](../../../../docs/chapter-06-pre-deployment)
- [Брзе референтне табеле](../../../../docs/chapter-06-pre-deployment)
- [Алатке за валидацију](../../../../docs/chapter-06-pre-deployment)

---

## Разумевање SKU-ова

### Шта су SKU-ови?

SKU-ови (Stock Keeping Units) представљају различите нивое услуга и нивое перформанси за Azure ресурсе. Сваки SKU нуди различито:

- **Карактеристике перформанси** (CPU, меморија, пропусни опсег)
- **Доступност функција** (опције скалирања, нивои SLA)
- **Модели цена** (плаћање по потрошњи, резервисани капацитет)
- **Регионална доступност** (нису сви SKU-ови доступни у свим регионима)

### Кључни фактори при избору SKU-а

1. **Захтеви радног оптерећења**
   - Очекивани саобраћај/образац оптерећења
   - Захтеви за перформансама (CPU, меморија, I/O)
   - Потребе за складиштењем и обрасци приступа

2. **Тип окружења**
   - Развој/тестирање у односу на продукцију
   - Захтеви за доступност
   - Потребе за безбедношћу и комплајансом

3. **Буџетска ограничења**
   - Почетни трошкови у односу на оперативне трошкове
   - Попусти за резервисани капацитет
   - Импликације трошкова аутоматског скалирања

4. **Пројекције раста**
   - Захтеви за скалабилност
   - Потребе за будућим функцијама
   - Комплексност миграције

---

## Избор на основу окружења

### Окружење за развој

**Приоритети**: Оптимизација трошкова, основна функционалност, лако провизионисање/депровизионисање

#### Препоручени SKU-ови
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
- **Базе података**: Basic ниво са минималним ресурсима
- **Складиште**: Standard са само локалном редунданцијом
- **Рачунарство**: Заједнички ресурси прихватљиви
- **Мрежа**: Основне конфигурације

### Окружење за стајд/тестирање

**Приоритети**: Конфигурација слична продукцији, баланс трошкова, могућности тестирања перформанси

#### Препоручени SKU-ови
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
- **Функције**: Већина продукцијских функција је омогућена
- **Редунданција**: Делимична географска редунданција
- **Скалирање**: Ограничено аутоматско скалирање за тестирање
- **Надгледање**: Потпуни мониторинг стек

### Окружење за продукцију

**Приоритети**: Перформансе, доступност, безбедност, комплајанс, скалабилност

#### Препоручени SKU-ови
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
- **Висока доступност**: Захтеви SLA 99.9%+
- **Перформансе**: Посвећени ресурси, велики пропусни опсег
- **Безбедност**: Премиум безбедносне функције
- **Скалирање**: Потпуне могућности аутоматског скалирања
- **Надгледање**: Свеобухватна опсервабилност

---

## Смернице специфичне за услуге

### Azure App Service

#### Матрица одлуке о SKU-у

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | Cost-effective, sufficient for testing |
| Small production apps | S1 (Standard) | Custom domains, SSL, auto-scaling |
| Medium production apps | P1V3 (Premium V3) | Better performance, more features |
| High-traffic apps | P2V3 or P3V3 | Dedicated resources, high performance |
| Mission-critical apps | I1V2 (Isolated V2) | Network isolation, dedicated hardware |

#### Примери конфигурација

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

#### Оквир за избор SKU-а

1. **DTU-based (Database Transaction Units)**
   - **Basic**: 5 DTU - Development/testing
   - **Standard**: S0-S12 (10-3000 DTU) - General purpose
   - **Premium**: P1-P15 (125-4000 DTU) - Performance-critical

2. **vCore-based** (Препоручено за продукцију)
   - **General Purpose**: Балансирани compute и складиште
   - **Business Critical**: Ниска латенција, висок IOPS
   - **Hyperscale**: Високо скалабилно складиште (до 100TB)

#### Примери конфигурација

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

1. **Consumption-based**
   - Плаћање по употреби
   - Погодно за развој и варијабилна оптерећења
   - Заједничка инфраструктура

2. **Dedicated (Workload Profiles)**
   - Посвећени ресурси за израчунавање
   - Предвидљиве перформансе
   - Погодније за продукцијска оптерећења

#### Примери конфигурација

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

#### Модели пропусности

1. **Manual Provisioned Throughput**
   - Предвидљиве перформансе
   - Попусти за резервисани капацитет
   - Најбоље за стабилна оптерећења

2. **Autoscale Provisioned Throughput**
   - Аутоматско скалирање у односу на употребу
   - Плаћање за оно што користите (са минимумом)
   - Добро за варијабилна оптерећења

3. **Serverless**
   - Плаћање по захтеву
   - Без резервисаног пропусног опсега
   - Идеално за развој и периодична оптерећења

#### Примери SKU-ова

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

#### Типови Storage налога

1. **Standard_LRS** - Развој, некритични подаци
2. **Standard_GRS** - Продукција, потребна гео-редунданција
3. **Premium_LRS** - Апликације високих перформанси
4. **Premium_ZRS** - Висока доступност са зоне-редунданцијом

#### Нивои перформанси

- **Standard**: Општа намена, исплативо
- **Premium**: Високе перформансе, сценарији ниске латенције

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

Резервисати ресурсе на 1-3 године за значајне попусте:

```bash
# Проверите опције резервације
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Правилно димензионисање

Почните са мањим SKU-овима и повећајте на основу стварне употребе:

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

Имплементирајте интелигентно скалирање за оптимизацију трошкова:

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

### 4. Планирано скалирање

Смањите капацитете током ван-пик времена:

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

### Основни захтеви перформанси

Дефинишите јасне захтеве перформанси пре избора SKU-а:

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

Тестирајте различите SKU-ове да бисте верификовали перформансе:

```bash
# Azure услуга за тестирање оптерећења
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Праћење и оптимизација

Подесите свеобухватно праћење:

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

## Брзе референтне табеле

### Брза референца за App Service SKU

| SKU | Tier | vCPU | RAM | Storage | Price Range | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | Development |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Small apps |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Production |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | High performance |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### Брза референца за SQL Database SKU

| SKU | Tier | DTU/vCore | Storage | Price Range | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Development |
| S2 | Standard | 50 DTU | 250GB | $$ | Small production |
| P2 | Premium | 250 DTU | 1TB | $$$ | High performance |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Balanced |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Mission critical |

### Брза референца за Container Apps SKU

| Model | Pricing | CPU/Memory | Use Case |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Development, variable load |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Production |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | High performance |

---

## Алатке за валидацију

### Провера доступности SKU-а

```bash
#!/bin/bash
# Провера доступности SKU у циљном региону

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

# Коришћење
check_sku_availability "eastus" "app-service" "P1V3"
```

### Скрипта за процену трошкова

```powershell
# PowerShell скрипт за процену трошкова
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
        
        # Користите Azure Pricing API или калкулатор
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Коришћење
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

### Шта треба радити

1. **Почните мало и повећајте** на основу стварне употребе
2. **Користите различите SKU-ове за различита окружења**
3. **Континуирано надгледајте перформансе и трошкове**
4. **Искористите резервисани капацитет за продукцијска оптерећења**
5. **Имплементирајте аутоматско скалирање где је прикладно**
6. **Тестирајте перформансе реалистичним оптерећењима**
7. **Планирајте раст, али избегавајте прекомерно провизионисање**
8. **Користите бесплатне нивое за развој кад год је то могуће**

### Чега се треба клонити

1. **Не користите продукцијске SKU-ове за развој**
2. **Не занемарујте регионалну доступност SKU-ова**
3. **Не заборављајте на трошкове преноса података**
4. **Не провизионишите прекомерно без оправдања**
5. **Не занемарујте утицај зависности**
6. **Не постављајте лимите аутоматског скалирања превисоко**
7. **Не заборављајте захтеве за комплајанс**
8. **Не доносите одлуке засновано само на цени**

---

**Про савет**: Користите Azure Cost Management и Advisor да бисте добили персонализоване препоруке за оптимизацију избора SKU-ова на основу стварних образаца употребе.

---

**Навигација**
- **Претходна лекција**: [Capacity Planning](capacity-planning.md)
- **Следећа лекција**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен помоћу сервиса за машински превод вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако настојимо да будемо тачни, имајте на уму да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати меродавним извором. За критичне информације препоручује се професионални превод од стране стручног преводиоца. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења која проистекну из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
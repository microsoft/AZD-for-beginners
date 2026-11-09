# Водич за избор СКУ-а - Избор правих нивоа услуга у Azure-у

**Навигација кроз поглавље:**
- **📚 Почетна страница курса**: [AZD For Beginners](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 6 - Валидација и планирање пре деплоја
- **⬅️ Претходно**: [Планирање капацитета](capacity-planning.md)
- **➡️ Следеће**: [Прелиминарне провере](preflight-checks.md)
- **🚀 Следеће поглавље**: [Поглавље 7: Решавање проблема](../chapter-07-troubleshooting/common-issues.md)

## Увод

Овај обимни водич помаже вам да изаберете оптималне СКУ-ове (јединице за вођење залиха) Azure услуга за различите окружења, радне оптерећења и захтеве. Научите како да анализирате перформансе, трошкове и захтеве за скалабилност како бисте одабрали најприкладније нивое услуга за ваше Azure Developer CLI деплоје.

## Циљеви учења

Након завршетка овог водича, бићете у могућности да:
- Разумете појмове СКУ-а у Azure-у, моделе цена и разлике у карактеристикама
- Савладате стратегије одабира СКУ-а специфичне за окружења за развој, тестирање и продукцију
- Анализирате захтеве радног оптерећења и усагласите их са одговарајућим нивоима услуга
- Спроведете стратегије оптимизације трошкова кроз интелигентан избор СКУ-а
- Примените технике тестирања перформанси и валидације за избор СКУ-а
- Конфигуришете аутоматизоване препоруке и мониторинг СКУ-а

## Остварени резултати учења

По завршетку, моћи ћете да:
- Одаберете одговарајуће Azure сервисне СКУ-ове на основу захтева и ограничења радног оптерећења
- Дизајнирате исплативе архитектуре са више окружења са правилним избором нивоа
- Имплементирате мере перформансног бенчмаркинга и валидације за избор СКУ-а
- Креирате аутоматизоване алате за препоруку СКУ-а и оптимизацију трошкова
- Планирате миграције СКУ-а и стратегије скалирања за променљиве захтеве
- Примените принципе Azure Well-Architected Framework-а на избор нивоа услуга

## Садржај

- [Разумевање СКУ-ова](#understanding-skus)
- [Избор заснован на окружењу](#environment-based-selection)
- [Смернице специфичне за услуге](#service-specific-guidelines)
- [Стратегије оптимизације трошкова](#cost-optimization-strategies)
- [Разматрања перформанси](#performance-considerations)
- [Табеле брзог прегледа](#quick-reference-tables)
- [Алатке за валидацију](#validation-tools)

---

## Разумевање СКУ-ова

> **Пример обима:** YAML мапе СКУ-ова и конфигурације перформанси испод су дизајнерске белешке, не `azure.yaml` шема или конфигурација алата за оптерећење. Бицеp блокови представљају алтернативе/фрагменте: деклараишите њихове параметре и родитељске ресурсе, користите јединствене симболичке називе при њиховом комбиновању и повежите модуле у радни пројекат. Цене, лимити и доступност СКУ-а по регионима морају се проверити за вашу претплату пре деплоја.

### Шта су СКУ-ови?

СКУ-ови (јединице за вођење залиха) представљају различите нивое услуга и нивоа перформанси за Azure ресурсе. Сваки СКУ нуди разлике у:

- **Перформансним карактеристикама** (CPU, меморија, пропусни опсег)
- **Доступности карактеристика** (опције скалирања, ниво СЛА)
- **Моделима цена** (према утрошку, резервисани капацитет)
- **Регионалној доступности** (нису сви СКУ-ови доступни у свим регионима)

### Кључни фактори при избору СКУ-а

1. **Захтеви радног оптерећења**
   - Очекивани саобраћај/образци оптерећења
   - Захтеви за перформансама (CPU, меморија, улаз/излаз)
   - Потребе за складиштењем и обрасци приступа

2. **Тип окружења**
   - Развој/тестирање у односу на продукцију
   - Захтеви за доступношћу
   - Захтеви за безбедност и усаглашеност

3. **Буџетска ограничења**
   - Почетни трошкови у односу на оперативне трошкове
   - Попусти за резервисани капацитет
   - Импликације трошкова аутоматског скалирања

4. **Пројекције раста**
   - Захтеви за скалабилношћу
   - Потребе за будућим карактеристикама
   - Комплексност миграције

---

## Избор заснован на окружењу

### Развојно окружење

**Приоритети**: Оптимизација трошкова, основна функционалност, лако постављање/уклањање

#### Препоручени СКУ-ови
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

#### Карактеристике
- **App Service**: F1 (Бесплатно) или B1 (Основни) за једноставно тестирање
- **Базе података**: Основни ниво са минимумом ресурса
- **Складиштење**: Стандардно са само локалном редунданцијом
- **Обраду**: Делјени ресурси прихватљиви
- **Мрежа**: Основне конфигурације

### Стейџинг/Тестирачко окружење

**Приоритети**: Конфигурација слична продукцији, равнотежа трошкова, могућност тестирања перформанси

#### Препоручени СКУ-ови
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
- **Карактеристике**: Већина производних функција укључена
- **Редунданција**: Нека географска редунданција
- **Скалирање**: Ограничено аутоматско скалирање за тестирање
- **Мониторинг**: Потпуни мониторинг

### Продукционо окружење

**Приоритети**: Перформансе, доступност, безбедност, усклађеност, скалабилност

#### Препоручени СКУ-ови
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

#### Карактеристике
- **Висока доступност**: Захтеви СЛА 99.9%+
- **Перформансе**: Дедикирани ресурси, високи пропусни опсег
- **Безбедност**: Премиум безбедносне карактеристике
- **Скалирање**: Потпуна аутоматска скалирања
- **Мониторинг**: Свеобухватна посматрања

---

## Смернице специфичне за услуге

### Azure App Service

#### Матрица одлука о СКУ-у

| Случај употребе | Препоручени СКУ | Разлози |
|----------|----------------|-----------|
| Развој/тестирање | F1 (Бесплатно) или B1 (Основни) | Исплативо, довољно за тестирање |
| Мале продукционе апликације | S1 (Стандард) | Прилагођени домени, SSL, аутоматско скалирање |
| Средње продукционе апликације | P1V3 (Премиум V3) | Бољи перформанси, више функција |
| Апликације са великим саобраћајем | P2V3 или P3V3 | Дедикирани ресурси, високе перформансе |
| Апликације критичне за посао | I1V2 (Изоловано V2) | Изолација мреже, посвећен хардвер |

#### Примери конфигурација

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

### Azure SQL база података

#### Оквир за избор СКУ-а

1. **Базирано на DTU (јединицама за трансакције базе података)**
   - **Основни**: 5 DTU - Развој/тестирање
   - **Стандардни**: S0-S12 (10-3000 DTU) - Општа намена
   - **Премиум**: P1-P15 (125-4000 DTU) - Критично за перформансе

2. **Базирано на vCore-у** (Препоручује се за продукцију)
   - **Општа намена**: Балансирани обрадни и складишни ресурси
   - **Бизнис критично**: Ниска латенција, високе IOPS
   - **Хиперскалабилно**: Високо скалабилно складиштење; проверите тренутне лимите величине и регионалну подршку

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

1. **Базирано на потрошњи**
   - Цена по коришћењу
   - Прилагођено за развој и променљива радна оптерећења
   - Заједничка инфраструктура

2. **Посвећено (Профили радног оптерећења)**
   - Посвећени обрадни ресурси
   - Предвидљиве перформансе
   - Погодније за продукциона оптерећења

#### Примери конфигурација

**Развој (потрошња)**
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

**Продукција (посвећено)**
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

Зонска редунданција такође захтева инфраструктуру у подржаним регионима и одговарајућу VNet/subnet конфигурацију, овде изостављено. Овај пример планира три посвећена чвора; конфигуришите најмање два апликацијска реплика за дистрибуцију преко зона и величину и реплика и чворова за отказ зоне. Види [водич за поузданост Container Apps](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Да бисте поставили апликацију на овај профил, подесите његов `workloadProfileName: 'production-profile'`; креирање самог профила не премешта апликације на њега.

### Azure Cosmos DB

#### Модели пропусног опсега

1. **Ручно резервисани пропусни опсег**
   - Предвидљиве перформансе
   - Попусти за резервисани капацитет
   - Најбоље за стабилна оптерећења

2. **Ауто-скалирање пропусног опсега**
   - Аутоматско скалирање на основу употребе
   - Плаћање за оно што користите (са минимумом)
   - Погодно за променљива оптерећења

3. **Serverless**
   - Плаћање по захтеву
   - Нема резервисаног пропусног опсега
   - Идеално за развој и честе приступе

#### Примери СКУ-а

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

#### Типови складишних налога

1. **Standard_LRS** - Развој, не-критични подаци
2. **Standard_GRS** - Продукција, потребна гео-редунданција
3. **Premium_LRS** - Високоперформансне апликације
4. **Premium_ZRS** - Висока доступност са редунданцијом по зонама

#### Нивои перформанси

- **Стандардни**: Општа намена, исплативи
- **Премиум**: Високе перформансе, сценарији са малом латенцијом

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
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Понуде за резервације и подобне врсте ресурса варирају; прегледајте каталог и услове куповине уместо да претпостављате да свака услуга/СКУ подржава резервацију.

### 2. Правилна величина

Почните са мањим СКУ-овима и повећавајте по потреби на основу стварне употребе:

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

Спроведите интелигентно скалирање за оптимизацију трошкова:

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

### 4. Заказано скалирање

Смањите капацитете током ванрадних сати:

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

Дефинишите јасне захтеве за перформансе пре избора СКУ-а:

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

Тестирајте различите СКУ-ове ради валидације перформанси:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### Мониторинг и оптимизација

Поставите свеобухватан мониторинг:

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

## Табеле брзог прегледа

### Брзи преглед СКУ-ова за App Service

| СКУ | Ниво | vCPU | RAM | Складиште | Распон цена | Случај употребе |
|-----|------|------|-----|----------|-------------|---------------|
| F1 | Бесплатно | Заједнички | 1GB | 1GB | Бесплатно | Развој |
| B1 | Основни | 1 | 1.75GB | 10GB | $ | Мале апликације |
| S1 | Стандард | 1 | 1.75GB | 50GB | $$ | Продукција |
| P1V3 | Премиум V3 | 2 | 8GB | 250GB | $$$ | Високе перформансе |
| I1V2 | Изоловани V2 | 2 | 8GB | 1TB | $$$$ | Ентерпрајс |

### Брзи преглед СКУ-ова за SQL базу података

| СКУ | Ниво | DTU/vCore | Складиште | Распон цена | Случај употребе |
|-----|------|-----------|----------|-------------|---------------|
| Основни | Основни | 5 DTU | 2GB | $ | Развој |
| S2 | Стандард | 50 DTU | 250GB | $$ | Мала продукција |
| P2 | Премиум | 250 DTU | 1TB | $$$ | Високе перформансе |
| GP_Gen5_4 | Општа намена | 4 vCore | 4TB | $$$ | Балансирано |
| BC_Gen5_8 | Бизнис критично | 8 vCore | 4TB | $$$$ | Мисијски критично |

### Брзи преглед СКУ-ова за Container Apps

| Модел | Цена | CPU/Меморија | Случај употребе |
|-------|---------|-------------|------------------|
| Потрошња | Плаћање по коришћењу | Подржане комбинације CPU/меморије зависе од окружења/профила | Развој или продукција, променљиво оптерећење |
| Посвећено D4 | Фактурисање посвећених чворова | 4 vCPU, 16GiB по чвору | Континуирано оптерећење/потребе за изолацијом |
| Посвећено D8 | Фактурисање посвећених чворова | 8 vCPU, 32GiB по чвору | Више континуирано оптерећење |

---

## Алатке за валидацију

### Провера доступности СКУ-а

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

### Скрипта за процену трошкова

**Псеудокод само:** `Get-ResourceCost` испод је пројектно-специфична функција коју морате имплементирати користећи тренутне регионалне/уговорне цене и претпоставке о коришћењу. Није PowerShell или Azure cmdlet.

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

Следећи YAML је скица захтева, **није** улазна шема за Azure Load Testing, JMeter, Locust или k6. Претворите је у стварну конфигурацију вашег изабраног алата пре коришћења наредбе load-test изнад.

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

## Сажетак најбољих пракси

### Препоруке

1. **Почните са малим и скалирајте по потреби** на основу стварне употребе
2. **Користите различите СКУ-ове за различита окружења**
3. **Континуирано пратите перформансе и трошкове**
4. **Искористите резервацију капацитета за продукциона оптерећења**
5. **Примените аутоматско скалирање где је потребно**
6. **Тестирајте перформансе са реалистичним оптерећењима**
7. **Планирајте раст, али избегавајте прекомеран капацитет**
8. **Користите бесплатне нивое за развој када је могуће**

### Ствари које не треба радити

1. **Не користите продукционе СКУ-ове за развој**
2. **Не занемарујте регионалну доступност СКУ-ова**
3. **Не заборављајте трошкове преноса података**
4. **Не прекомерно обезбеђујте капацитет без оправдања**
5. **Не игноришите утицај зависности**
6. **Не постављајте лимите аутоматског скалирања превисоко**
7. **Не заборављајте захтеве усаглашености**
8. **Не доносите одлуке само на основу цене**

---

**Корисни савет**: Користите Azure Cost Management и Advisor за добијање персонализованих препорука за оптимизацију избора СКУ-а на основу стварних образаца употребе.

---

**Навигација**
- **Претходна лекција**: [Планирање капацитета](capacity-planning.md)
- **Следећа лекција**: [Прелиминарне провере](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
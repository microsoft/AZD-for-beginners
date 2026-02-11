# SKU kiválasztási útmutató - A megfelelő Azure szolgáltatási réteg kiválasztása

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 6. fejezet - Előtelepítés előtti érvényesítés és tervezés
- **⬅️ Előző**: [Capacity Planning](capacity-planning.md)
- **➡️ Következő**: [Pre-flight Checks](preflight-checks.md)
- **🚀 Következő fejezet**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

## Bevezetés

Ez az átfogó útmutató segít az optimális Azure szolgáltatási SKU-k (Stock Keeping Units) kiválasztásában különböző környezetekhez, munkaterhelésekhez és követelményekhez. Tanulja meg elemezni a teljesítményigényeket, költségszempontokat és skálázhatósági követelményeket, hogy a legmegfelelőbb szolgáltatási rétegeket válassza az Azure Developer CLI telepítésekhez.

## Tanulási célok

A útmutató elvégzése után:
- Megérti a Azure SKU-konceptet, az árazási modelleket és a funkciókülönbségeket
- Elsajátítja a környezet-specifikus SKU kiválasztási stratégiákat fejlesztéshez, staginghez és éles környezethez
- Elemezni tudja a munkaterhelés követelményeit és azokhoz illeszti a megfelelő szolgáltatási rétegeket
- Megvalósítja a költségoptimalizálási stratégiákat intelligens SKU-választással
- Alkalmaz teljesítménytesztelési és érvényesítési technikákat a SKU-választásokhoz
- Beállít automatizált SKU-ajánlásokat és monitorozást

## Tanulási eredmények

A kurzus elvégzése után képes lesz:
- A munkaterhelés követelményei és korlátai alapján kiválasztani a megfelelő Azure szolgáltatási SKU-kat
- Költséghatékony többkörnyezetes architektúrákat tervezni megfelelő rétegkiválasztással
- Teljesítmény-benchmarkok és érvényesítések végrehajtására a SKU-választásokhoz
- Automatizált eszközöket létrehozni SKU-ajánláshoz és költségoptimalizáláshoz
- SKU-migrációs és skálázási stratégiákat tervezni a változó követelményekhez
- Alkalmazni az Azure Well-Architected Framework elveit a szolgáltatási réteg kiválasztásakor

## Tartalomjegyzék

- [Understanding SKUs](../../../../docs/chapter-06-pre-deployment)
- [Environment-Based Selection](../../../../docs/chapter-06-pre-deployment)
- [Service-Specific Guidelines](../../../../docs/chapter-06-pre-deployment)
- [Cost Optimization Strategies](../../../../docs/chapter-06-pre-deployment)
- [Performance Considerations](../../../../docs/chapter-06-pre-deployment)
- [Quick Reference Tables](../../../../docs/chapter-06-pre-deployment)
- [Validation Tools](../../../../docs/chapter-06-pre-deployment)

---

## Understanding SKUs

### Mik azok a SKU-k?

A SKU-k (Stock Keeping Units) különböző szolgáltatási rétegeket és teljesítményszinteket képviselnek az Azure erőforrásoknál. Minden SKU különböző:

- **Teljesítményjellemzők** (CPU, memória, áteresztőképesség)
- **Funkcióelérhetőség** (skálázási lehetőségek, SLA szintek)
- **Árazási modellek** (fogyasztásalapú, fenntartott kapacitás)
- **Regionális elérhetőség** (nem minden SKU érhető el minden régióban)

### A SKU kiválasztásának kulcsfontosságú tényezői

1. **Munkaterhelés követelményei**
   - Várható forgalom/terhelési minták
   - Teljesítménykövetelmények (CPU, memória, I/O)
   - Tárolási igények és hozzáférési minták

2. **Környezettípus**
   - Fejlesztés/tesztelés vs. éles rendszer
   - Elérhetőségi követelmények
   - Biztonsági és megfelelőségi igények

3. **Költségvetési korlátok**
   - Kezdeti költségek vs. üzemeltetési költségek
   - Fenntartott kapacitás kedvezmények
   - Az automatikus skálázás költségvonzatai

4. **Növekedési előrejelzések**
   - Skálázhatósági követelmények
   - Jövőbeli funkcióigények
   - Migrációs összetettség

---

## Environment-Based Selection

### Fejlesztési környezet

**Elsődleges szempontok**: Költségoptimalizálás, alapvető funkcionalitás, egyszerű előállítás/törlés

#### Recommended SKUs
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

#### Jellemzők
- **App Service**: F1 (Free) vagy B1 (Basic) egyszerű teszteléshez
- **Adatbázisok**: Basic szint minimális erőforrásokkal
- **Tárhely**: Standard csak helyi redundanciával
- **Számítás**: Megosztott erőforrások elfogadhatók
- **Hálózat**: Alap konfigurációk

### Előkészítő/tesztelési környezet

**Elsődleges szempontok**: Éleshez hasonló konfiguráció, költség-egyensúly, teljesítménytesztelési képesség

#### Recommended SKUs
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

#### Jellemzők
- **Teljesítmény**: 70-80% az éles kapacitásból
- **Funkciók**: A legtöbb éles funkció engedélyezve
- **Redundancia**: Néhány földrajzi redundancia
- **Skálázás**: Korlátozott automatikus skálázás teszteléshez
- **Monitorozás**: Teljes monitorozási stack

### Éles környezet

**Elsődleges szempontok**: Teljesítmény, elérhetőség, biztonság, megfelelőség, skálázhatóság

#### Recommended SKUs
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

#### Jellemzők
- **Magas rendelkezésre állás**: 99,9%+ SLA követelmények
- **Teljesítmény**: Dedikált erőforrások, nagy áteresztőképesség
- **Biztonság**: Prémium biztonsági funkciók
- **Skálázás**: Teljes automatikus skálázási képességek
- **Monitorozás**: Átfogó megfigyelhetőség

---

## Service-Specific Guidelines

### Azure App Service

#### SKU döntési mátrix

| Használati eset | Ajánlott SKU | Indoklás |
|-----------------|--------------|---------|
| Fejlesztés/tesztelés | F1 (Free) vagy B1 (Basic) | Költséghatékony, elegendő teszteléshez |
| Kis éles alkalmazások | S1 (Standard) | Egyedi domainek, SSL, automatikus skálázás |
| Közepes éles alkalmazások | P1V3 (Premium V3) | Jobb teljesítmény, több funkció |
| Nagy forgalmú alkalmazások | P2V3 vagy P3V3 | Dedikált erőforrások, magas teljesítmény |
| Küldetéskritikus alkalmazások | I1V2 (Isolated V2) | Hálózati izoláció, dedikált hardver |

#### Konfigurációs példák

**Fejlesztés**
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

**Éles**
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

#### SKU kiválasztási keretrendszer

1. **DTU-alapú (Database Transaction Units)**
   - **Basic**: 5 DTU - Fejlesztés/tesztelés
   - **Standard**: S0-S12 (10-3000 DTU) - Általános cél
   - **Premium**: P1-P15 (125-4000 DTU) - Teljesítménykritikus

2. **vCore-alapú** (Ajánlott éles rendszerekhez)
   - **General Purpose**: Kiegyensúlyozott számítás és tárhely
   - **Business Critical**: Alacsony késleltetés, magas IOPS
   - **Hyperscale**: Nagyon skálázható tárhely (akár 100TB-ig)

#### Példa konfigurációk

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

#### Környezettípusok

1. **Fogyasztásalapú**
   - Fizetés használat alapján
   - Alkalmas fejlesztéshez és változó munkaterhelésekhez
   - Megosztott infrastruktúra

2. **Dedikált (Munkaterhelés profilok)**
   - Dedikált számítási erőforrások
   - Megjósolható teljesítmény
   - Jobb éles munkaterhelésekhez

#### Konfigurációs példák

**Fejlesztés (fogyasztásalapú)**
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

**Éles (dedikált)**
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

#### Áteresztőképesség modellek

1. **Manuálisan fenntartott áteresztőképesség**
   - Megjósolható teljesítmény
   - Fenntartott kapacitás kedvezmények
   - Legjobb állandó munkaterhelésekhez

2. **Automatikusan skálázódó fenntartott áteresztőképesség**
   - Használat alapján automatikus skálázás
   - Fizetés a felhasznált mennyiségért (minimum mellett)
   - Jó változó munkaterhelésekhez

3. **Serverless**
   - Fizetés kérésenként
   - Nincs fenntartott áteresztőképesség
   - Ideális fejlesztéshez és időszakos munkaterhelésekhez

#### SKU példák

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

### Azure Storage fiók

#### Tárhelyfiók típusok

1. **Standard_LRS** - Fejlesztés, nem kritikus adatok
2. **Standard_GRS** - Éles, szükséges földrajzi redundancia
3. **Premium_LRS** - Magas teljesítményű alkalmazások
4. **Premium_ZRS** - Magas rendelkezésre állás zóna-redundanciával

#### Teljesítmény rétegek

- **Standard**: Általános cél, költséghatékony
- **Premium**: Magas teljesítmény, alacsony késleltetésű forgatókönyvek

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

## Költségoptimalizálási stratégiák

### 1. Fenntartott kapacitás

Foglaljon le erőforrásokat 1–3 évre jelentős kedvezményekért:

```bash
# Ellenőrizze a foglalási lehetőségeket
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Megfelelő méretezés

Kezdje kisebb SKU-kkal és méretezzen fel a tényleges használat alapján:

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

### 3. Automatikus skálázás konfiguráció

Valóban intelligens skálázást valósítson meg a költségek optimalizálásához:

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

### 4. Ütemezett skálázás

Skálázza vissza a kapacitást nem csúcsidőben:

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

## Teljesítmény szempontok

### Alap teljesítménykövetelmények

Határozza meg egyértelműen a teljesítménykövetelményeket a SKU kiválasztása előtt:

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

### Terheléses tesztelés

Tesztelje a különböző SKU-kat a teljesítmény érvényesítéséhez:

```bash
# Azure terhelésvizsgálati szolgáltatás
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Monitorozás és optimalizálás

Állítson be átfogó monitorozást:

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

## Gyorsreferencia táblázatok

### App Service SKU gyorsreferencia

| SKU | Szint | vCPU | RAM | Tárhely | Ártartomány | Használati eset |
|-----|-------|------|-----|---------|-------------|-----------------|
| F1 | Free | Shared | 1GB | 1GB | Free | Fejlesztés |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Kis alkalmazások |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Éles |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Magas teljesítmény |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Vállalati |

### SQL adatbázis SKU gyorsreferencia

| SKU | Szint | DTU/vCore | Tárhely | Ártartomány | Használati eset |
|-----|-------|-----------|---------|-------------|-----------------|
| Basic | Basic | 5 DTU | 2GB | $ | Fejlesztés |
| S2 | Standard | 50 DTU | 250GB | $$ | Kis éles |
| P2 | Premium | 250 DTU | 1TB | $$$ | Magas teljesítmény |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Kiegyensúlyozott |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Küldetéskritikus |

### Container Apps SKU gyorsreferencia

| Modell | Árazás | CPU/Memória | Használati eset |
|--------|--------|-------------|-----------------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Fejlesztés, változó terhelés |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Éles |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | Magas teljesítmény |

---

## Ellenőrző eszközök

### SKU elérhetőség ellenőrző

```bash
#!/bin/bash
# SKU elérhetőségének ellenőrzése a cél régióban

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

# Használat
check_sku_availability "eastus" "app-service" "P1V3"
```

### Költségbecslő script

```powershell
# PowerShell-szkript költségbecsléshez
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
        
        # Használja az Azure Pricing API-t vagy az árkalkulátort
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Használat
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### Teljesítmény érvényesítés

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

## Legjobb gyakorlatok összefoglalója

### Tennivalók

1. **Kezdje kicsiben, és méretezzen fel** a tényleges használat alapján
2. **Használjon különböző SKU-kat különböző környezetekhez**
3. **Figyelje folyamatosan a teljesítményt és a költségeket**
4. **Használjon fenntartott kapacitást éles munkaterhelésekhez**
5. **Alkalmazzon automatikus skálázást, ahol megfelelő**
6. **Tesztelje a teljesítményt reális munkaterhelésekkel**
7. **Tervezzon növekedésre, de kerülje a túlzott erőforrás biztosítását**
8. **Használjon ingyenes szinteket fejlesztéshez, ha lehetséges**

### Kerülendők

1. **Ne használjon éles SKU-kat fejlesztéshez**
2. **Ne hagyja figyelmen kívül a SKU-k regionális elérhetőségét**
3. **Ne feledkezzen meg az adatátviteli költségekről**
4. **Ne biztosítson túl sok erőforrást indok nélkül**
5. **Ne hagyja figyelmen kívül a függőségek hatását**
6. **Ne állítson túl magas automatikus skálázási korlátokat**
7. **Ne feledkezzen meg a megfelelőségi követelményekről**
8. **Ne hozza döntéseit csak az ár alapján**

---

**Pro tipp**: Használja az Azure Cost Managementet és az Advisor-t, hogy személyre szabott ajánlásokat kapjon a SKU-választások optimalizálásához a tényleges használati minták alapján.

---

**Navigáció**
- **Előző leckéhez**: [Capacity Planning](capacity-planning.md)
- **Következő leckéhez**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősségkizárás**:
Ez a dokumentum az AI fordítószolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő irányadónak. Kritikus jelentőségű információk esetén szakmai, emberi fordítás igénybevétele ajánlott. Nem vállalunk felelősséget az ezen fordítás használatából eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
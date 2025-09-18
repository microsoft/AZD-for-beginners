<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "952ed5af7f5db069c53a6840717e1801",
  "translation_date": "2025-09-18T09:23:55+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "hu"
}
-->
# SKU Kiválasztási Útmutató - Az Azure Szolgáltatási Szintek Megfelelő Kiválasztása

**Fejezet Navigáció:**
- **📚 Kurzus Kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális Fejezet**: 6. fejezet - Telepítés előtti validáció és tervezés
- **⬅️ Előző**: [Kapacitástervezés](capacity-planning.md)
- **➡️ Következő**: [Előzetes ellenőrzések](preflight-checks.md)
- **🚀 Következő Fejezet**: [7. fejezet: Hibakeresés](../troubleshooting/common-issues.md)

## Bevezetés

Ez az átfogó útmutató segít kiválasztani az optimális Azure szolgáltatási SKU-kat (Stock Keeping Units) különböző környezetekhez, munkaterhelésekhez és igényekhez. Ismerje meg, hogyan elemezheti a teljesítményigényeket, költségszempontokat és skálázhatósági követelményeket, hogy a legmegfelelőbb szolgáltatási szinteket válassza az Azure Developer CLI telepítéseihez.

## Tanulási Célok

Az útmutató elvégzésével:
- Megérti az Azure SKU fogalmát, árképzési modelleket és funkcióbeli különbségeket
- Elsajátítja a környezet-specifikus SKU kiválasztási stratégiákat fejlesztéshez, teszteléshez és éles környezethez
- Elemzi a munkaterhelési igényeket, és ezekhez illeszkedő szolgáltatási szinteket választ
- Költségoptimalizálási stratégiákat alkalmaz intelligens SKU kiválasztással
- Teljesítménytesztelési és validációs technikákat alkalmaz a SKU választásokhoz
- Automatizált SKU ajánlásokat és monitorozást konfigurál

## Tanulási Eredmények

Az útmutató elvégzése után képes lesz:
- Az igények és korlátok alapján megfelelő Azure szolgáltatási SKU-kat választani
- Költséghatékony, több környezetet támogató architektúrákat tervezni megfelelő szintválasztással
- Teljesítmény-benchmarkingot és validációt végrehajtani a SKU választásokhoz
- Automatizált eszközöket létrehozni SKU ajánlásokhoz és költségoptimalizáláshoz
- SKU migrációs és skálázási stratégiákat tervezni változó igényekhez
- Az Azure Well-Architected Framework elveit alkalmazni a szolgáltatási szintek kiválasztásában

## Tartalomjegyzék

- [SKU-k megértése](../../../../docs/pre-deployment)
- [Környezet-alapú kiválasztás](../../../../docs/pre-deployment)
- [Szolgáltatás-specifikus irányelvek](../../../../docs/pre-deployment)
- [Költségoptimalizálási stratégiák](../../../../docs/pre-deployment)
- [Teljesítmény szempontok](../../../../docs/pre-deployment)
- [Gyors referencia táblázatok](../../../../docs/pre-deployment)
- [Validációs eszközök](../../../../docs/pre-deployment)

---

## SKU-k megértése

### Mik azok az SKU-k?

Az SKU-k (Stock Keeping Units) az Azure erőforrások különböző szolgáltatási szintjeit és teljesítménykategóriáit képviselik. Minden SKU különböző jellemzőket kínál:

- **Teljesítmény jellemzők** (CPU, memória, átbocsátóképesség)
- **Funkciók elérhetősége** (skálázási opciók, SLA szintek)
- **Árképzési modellek** (fogyasztás-alapú, fenntartott kapacitás)
- **Regionális elérhetőség** (nem minden SKU érhető el minden régióban)

### Kulcsfontosságú tényezők az SKU kiválasztásában

1. **Munkaterhelési igények**
   - Várható forgalom/terhelési minták
   - Teljesítményigények (CPU, memória, I/O)
   - Tárolási igények és hozzáférési minták

2. **Környezet típusa**
   - Fejlesztés/tesztelés vs. éles környezet
   - Elérhetőségi követelmények
   - Biztonsági és megfelelőségi igények

3. **Költségkorlátok**
   - Kezdeti költségek vs. működési költségek
   - Fenntartott kapacitás kedvezmények
   - Automatikus skálázás költségvonzatai

4. **Növekedési előrejelzések**
   - Skálázhatósági követelmények
   - Jövőbeli funkcióigények
   - Migrációs komplexitás

---

## Környezet-alapú kiválasztás

### Fejlesztési környezet

**Prioritások**: Költségoptimalizálás, alapvető funkcionalitás, egyszerű létrehozás/törlés

#### Ajánlott SKU-k
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
- **App Service**: F1 (Ingyenes) vagy B1 (Alap) egyszerű teszteléshez
- **Adatbázisok**: Alap szint minimális erőforrásokkal
- **Tárolás**: Standard, csak helyi redundanciával
- **Számítási kapacitás**: Megosztott erőforrások elfogadhatók
- **Hálózat**: Alap konfigurációk

### Tesztelési/Staging környezet

**Prioritások**: Éles környezethez hasonló konfiguráció, költség-egyensúly, teljesítménytesztelési képesség

#### Ajánlott SKU-k
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
- **Teljesítmény**: Az éles kapacitás 70-80%-a
- **Funkciók**: Az éles környezet funkcióinak többsége engedélyezve
- **Redundancia**: Néhány földrajzi redundancia
- **Skálázás**: Korlátozott automatikus skálázás teszteléshez
- **Monitorozás**: Teljes monitorozási stack

### Éles környezet

**Prioritások**: Teljesítmény, elérhetőség, biztonság, megfelelőség, skálázhatóság

#### Ajánlott SKU-k
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
- **Magas elérhetőség**: 99.9%+ SLA követelmények
- **Teljesítmény**: Dedikált erőforrások, magas átbocsátóképesség
- **Biztonság**: Prémium biztonsági funkciók
- **Skálázás**: Teljes automatikus skálázási képességek
- **Monitorozás**: Átfogó megfigyelhetőség

---

## Szolgáltatás-specifikus irányelvek

### Azure App Service

#### SKU Döntési Mátrix

| Felhasználási eset | Ajánlott SKU | Indoklás |
|--------------------|-------------|----------|
| Fejlesztés/tesztelés | F1 (Ingyenes) vagy B1 (Alap) | Költséghatékony, elegendő teszteléshez |
| Kis éles alkalmazások | S1 (Standard) | Egyedi domainek, SSL, automatikus skálázás |
| Közepes éles alkalmazások | P1V3 (Prémium V3) | Jobb teljesítmény, több funkció |
| Nagy forgalmú alkalmazások | P2V3 vagy P3V3 | Dedikált erőforrások, magas teljesítmény |
| Kritikus alkalmazások | I1V2 (Izolált V2) | Hálózati izoláció, dedikált hardver |

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

**Éles környezet**
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

### Azure SQL Adatbázis

#### SKU Kiválasztási Keretrendszer

1. **DTU-alapú (Adatbázis Tranzakciós Egységek)**
   - **Alap**: 5 DTU - Fejlesztés/tesztelés
   - **Standard**: S0-S12 (10-3000 DTU) - Általános célú
   - **Prémium**: P1-P15 (125-4000 DTU) - Teljesítménykritikus

2. **vCore-alapú** (Ajánlott éles környezethez)
   - **Általános célú**: Kiegyensúlyozott számítási és tárolási kapacitás
   - **Üzleti kritikus**: Alacsony késleltetés, magas IOPS
   - **Hyperscale**: Nagyon skálázható tárolás (akár 100TB)

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

#### Környezet típusok

1. **Fogyasztás-alapú**
   - Használat-alapú árképzés
   - Fejlesztéshez és változó terhelésekhez alkalmas
   - Megosztott infrastruktúra

2. **Dedikált (Munkaterhelési Profilok)**
   - Dedikált számítási erőforrások
   - Kiszámítható teljesítmény
   - Jobb éles környezethez

#### Konfigurációs példák

**Fejlesztés (Fogyasztás)**
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

**Éles környezet (Dedikált)**
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

#### Átbocsátási Modellek

1. **Manuálisan Provisionált Átbocsátás**
   - Kiszámítható teljesítmény
   - Fenntartott kapacitás kedvezmények
   - Legjobb állandó terhelésekhez

2. **Automatikusan Skálázott Átbocsátás**
   - Automatikus skálázás használat alapján
   - Csak a tényleges használatért fizet (minimum mellett)
   - Jó változó terhelésekhez

3. **Szerver nélküli**
   - Kérés-alapú fizetés
   - Nincs provisionált átbocsátás
   - Ideális fejlesztéshez és időszakos terhelésekhez

#### SKU Példák

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

#### Tárolási Fiók Típusok

1. **Standard_LRS** - Fejlesztés, nem kritikus adatok
2. **Standard_GRS** - Éles környezet, földrajzi redundancia szükséges
3. **Premium_LRS** - Nagy teljesítményű alkalmazások
4. **Premium_ZRS** - Magas elérhetőség zónai redundanciával

#### Teljesítmény Szintek

- **Standard**: Általános célú, költséghatékony
- **Prémium**: Nagy teljesítményű, alacsony késleltetésű forgatókönyvek

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

## Költségoptimalizálási Stratégiák

### 1. Fenntartott Kapacitás

Erőforrások fenntartása 1-3 évre jelentős kedvezményekért:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Méretre Igazítás

Kisebb SKU-kkal kezdés, majd skálázás a tényleges használat alapján:

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

### 3. Automatikus Skálázási Konfiguráció

Intelligens skálázás megvalósítása a költségek optimalizálásához:

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

### 4. Ütemezett Skálázás

Skálázás csökkentése csúcsidőn kívül:

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

## Teljesítmény Szempontok

### Alapvető Teljesítménykövetelmények

Világos teljesítménykövetelmények meghatározása az SKU kiválasztás előtt:

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

### Terhelés Tesztelés

Különböző SKU-k tesztelése a teljesítmény validálásához:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Monitorozás és Optimalizálás

Átfogó monitorozás beállítása:

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

## Gyors Referencia Táblázatok

### App Service SKU Gyors Referencia

| SKU | Szint | vCPU | RAM | Tárolás | Árkategória | Felhasználási eset |
|-----|-------|------|-----|---------|-------------|--------------------|
| F1 | Ingyenes | Megosztott | 1GB | 1GB | Ingyenes | Fejlesztés |
| B1 | Alap | 1 | 1.75GB | 10GB | $ | Kis alkalmazások |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Éles környezet |
| P1V3 | Prémium V3 | 2 | 8GB | 250GB | $$$ | Magas teljesítmény |
| I1V2 | Izolált V2 | 2 | 8GB | 1TB | $$$$ | Vállalati |

### SQL Adatbázis SKU Gyors Referencia

| SKU | Szint | DTU/vCore | Tárolás | Árkategória | Felhasználási eset |
|-----|-------|-----------|---------|-------------|--------------------|
| Alap | Alap | 5 DTU | 2GB | $ | Fejlesztés |
| S2 | Standard | 50 DTU | 250GB | $$ | Kis éles környezet |
| P2 | Prémium | 250 DTU | 1TB | $$$ | Magas teljesítmény |
| GP_Gen5_4 | Általános célú | 4 vCore | 4TB | $$$ | Kiegyensúlyozott |
| BC_Gen5_8 | Üzleti kritikus | 8 vCore | 4TB | $$$$ | Kritikus |

### Container Apps SKU Gyors Referencia

| Modell | Árképzés | CPU/Memória | Felhasználási eset |
|--------|---------|-------------|--------------------|
| Fogyasztás | Használat-alapú | 0.25-2 vCPU | Fejlesztés, változó terhelés |
| Dedikált D4 | Fenntartott | 4 vCPU, 16GB | Éles környezet |
| Dedikált D8 | Fenntartott | 8 vCPU, 32GB | Magas teljesítmény |

---

## Validációs Eszközök

### SKU Elérhetőség Ellenőrző

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

### Költségbecslési Script

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

### Teljesítmény Validáció

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

## Legjobb Gyakorlatok Összefoglalója

### Amit érdemes megtenni

1. **Kis mérettel kezdjen, és skálázzon fel** a tényleges használat alapján
2. **Különböző SKU-kat használjon különböző környezetekhez**
3. **Folyamatosan monitorozza a teljesítményt és költségeket**
4. **Fenntartott kapacitást használjon éles környezethez**
5. **Automatikus skálázást valósítson meg, ahol szükséges**
6. **Tesztelje a teljesítményt valós munkaterhelésekkel**
7. **Tervezzen növekedésre, de kerülje a túlméretezést**
8. **Fejlesztéshez használja az ingyenes szinteket, ha lehetséges**

### Amit érdemes elkerülni

1. **Ne használjon éles SKU-kat fejlesztéshez**
2. **Ne hagyja figyelmen kívül a regionális SKU elérhetőséget**
3. **Ne feledkezzen meg az adatátviteli költségekről**
4. **Ne méretezzen túl indokolatlanul**
5. **Ne hagyja figyelmen kívül a függőségek hatását**
6. **Ne állítson túl magas automatikus skálázási korlátokat**
7. **Ne feledkezzen meg a megfelelőségi követelményekről**
8. **Ne hozzon döntéseket kizárólag az ár alapján**

---

**Profi Tipp**: Használja az Azure Cost Management és Advisor eszközöket, hogy személyre szabott ajánlásokat kapjon az SKU kiválasztás optimalizálásához a tényleges használati minták alapján.

---

**Navigáció**
- **Előző Lecke**: [Kapacitástervezés](capacity-planning.md)
- **Következő Lecke**: [Előzetes ellenőrzések](preflight-checks.md)

---

**Felelősség kizárása**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítási szolgáltatás segítségével került lefordításra. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.
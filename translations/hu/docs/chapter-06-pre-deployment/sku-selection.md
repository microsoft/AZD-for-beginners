# SKU kiválasztási útmutató – A megfelelő Azure szolgáltatási rétegek kiválasztása

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 6. fejezet – Telepítés előtti ellenőrzések és tervezés
- **⬅️ Előző**: [Kapacitástervezés](capacity-planning.md)
- **➡️ Következő**: [Előzetes ellenőrzések](preflight-checks.md)
- **🚀 Következő fejezet**: [7. fejezet: Hibajavítás](../chapter-07-troubleshooting/common-issues.md)

## Bevezetés

Ez az átfogó útmutató segít Önnek az optimális Azure szolgáltatás SKU-k (Stock Keeping Units) kiválasztásában különböző környezetek, munkaterhelések és követelmények szerint. Tanulja meg elemezni a teljesítményigényeket, költségszempontokat és skálázhatósági követelményeket, hogy a legmegfelelőbb szolgáltatási rétegeket válassza Azure Developer CLI telepítéseihez.

## Tanulási célok

A útmutató elvégzése után Ön:
- Megérti az Azure SKU fogalmait, árazási modelljeit és a funkciók közötti különbségeket
- Elsajátítja a környezetspecifikus SKU kiválasztási stratégiákat fejlesztéshez, teszteléshez és éles környezethez
- Elemzi a munkaterhelések követelményeit és összehangolja azokat a megfelelő szolgáltatási rétegekkel
- Megvalósítja a költségoptimalizálási stratégiákat intelligens SKU kiválasztás révén
- Alkalmazza a teljesítménytesztelési és validációs technikákat az SKU-k választásához
- Konfigurálja az automatikus SKU-ajánlásokat és monitorozást

## Tanulási eredmények

Az útmutató befejezése után képes lesz:
- A munkaterhelési igények és korlátok alapján megfelelő Azure szolgáltatási SKU-k kiválasztására
- Költséghatékony, többkörnyezeti architektúrák tervezésére megfelelő réteg kiválasztásával
- Teljesítménymérés és validáció megvalósítására az SKU választásokhoz
- Automatizált eszközök létrehozására az SKU-ajánláshoz és költségoptimalizáláshoz
- SKU migrációk és skálázási stratégiák megtervezésére a változó igényekhez
- Az Azure Well-Architected Framework elveinek alkalmazására a szolgáltatási réteg kiválasztásához

## Tartalomjegyzék

- [SKU-k megértése](#understanding-skus)
- [Környezeti alapú kiválasztás](#environment-based-selection)
- [Szolgáltatáshoz kapcsolódó irányelvek](#service-specific-guidelines)
- [Költségoptimalizálási stratégiák](#cost-optimization-strategies)
- [Teljesítmény szempontok](#performance-considerations)
- [Gyorsreferencia táblázatok](#quick-reference-tables)
- [Validációs eszközök](#validation-tools)

---

## SKU-k megértése

> **Példatartomány:** Az alábbi YAML SKU-térképek és teljesítménybeállítások tervezési jegyzetek; nem egy `azure.yaml` séma vagy terheléseszköz konfiguráció. A Bicep blokkok alternatívák/részletek: deklarálják paramétereiket és szülő erőforrásaikat, használjanak egyedi szimbolikus neveket kombináláskor, és kapcsolják modulokként működő projekthez. Az árakat, korlátokat és régiónkénti SKU elérhetőséget a telepítés előtt fel kell mérni az előfizetéséhez.

### Mik azok a SKU-k?

A SKU-k (Stock Keeping Units) az Azure erőforrások különböző szolgáltatási rétegeit és teljesítményszintjeit képviselik. Minden SKU eltérő:

- **Teljesítményjellemzőkkel** (CPU, memória, átbocsátóképesség)
- **Funkcióelérhetőséggel** (skálázási lehetőségek, SLA szintek)
- **Árazási modellekkel** (fogyasztás alapú, fenntartott kapacitás)
- **Régiónkénti elérhetőséggel** (nem minden SKU érhető el minden régióban)

### Fontos tényezők az SKU kiválasztásban

1. **Munkaterhelési követelmények**
   - Várt forgalom/terhelési minták
   - Teljesítménykövetelmények (CPU, memória, I/O)
   - Tárolási igények és hozzáférési minták

2. **Környezeti típus**
   - Fejlesztési/tesztelési vs. éles környezet
   - Elérhetőségi követelmények
   - Biztonsági és megfelelőségi igények

3. **Költségvetési korlátok**
   - Kezdeti költségek vs. működési költségek
   - Fenntartott kapacitás kedvezmények
   - Auto-skálázás költséghatásai

4. **Növekedési előrejelzések**
   - Skálázhatósági követelmények
   - Jövőbeni funkcióigények
   - Migrációs összetettség

---

## Környezeti alapú kiválasztás

### Fejlesztői környezet

**Prioritások**: Költségoptimalizálás, alapvető funkcionalitás, egyszerű előkészítés/törlés

#### Ajánlott SKU-k
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

#### Jellemzők
- **App Service**: F1 (Ingyenes) vagy B1 (Alap) egyszerű teszteléshez
- **Adatbázisok**: Alapszint minimális erőforrásokkal
- **Tárolás**: Standard csak helyi redundanciával
- **Számítási kapacitás**: Megosztott erőforrások elfogadhatóak
- **Hálózat**: Alap konfigurációk

### Tesztelési/köztes környezet

**Prioritások**: Éleshez hasonló konfiguráció, költségek egyensúlya, teljesítménytesztelés

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
- **Teljesítmény**: 70-80%-a az éles kapacitásnak
- **Funkciók**: A legtöbb éles funkció engedélyezve
- **Redundancia**: Néhány földrajzi redundancia
- **Skálázás**: Korlátozott auto-skálázás teszteléshez
- **Monitorozás**: Teljes monitorozó rendszer

### Éles környezet

**Prioritások**: Teljesítmény, elérhetőség, biztonság, megfelelőség, skálázhatóság

#### Ajánlott SKU-k
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

#### Jellemzők
- **Magas rendelkezésre állás**: 99,9%+ SLA követelmények
- **Teljesítmény**: Dedikált erőforrások, magas átbocsátóképesség
- **Biztonság**: Prémium biztonsági funkciók
- **Skálázás**: Teljes auto-skálázási képességek
- **Monitorozás**: Átfogó megfigyelhetőség

---

## Szolgáltatások szerinti irányelvek

### Azure App Service

#### SKU döntési mátrix

| Használati eset | Ajánlott SKU | Indoklás |
|----------|----------------|-----------|
| Fejlesztés/tesztelés | F1 (Ingyenes) vagy B1 (Alap) | Költséghatékony, teszteléshez elegendő |
| Kis éles alkalmazások | S1 (Standard) | Egyéni domainek, SSL, auto-skálázás |
| Közepes éles alkalmazások | P1V3 (Prémium V3) | Jobb teljesítmény, több funkcióval |
| Nagy forgalmú alkalmazások | P2V3 vagy P3V3 | Dedikált erőforrások, magas teljesítmény |
| Küldetéskritikus alkalmazások | I1V2 (Izolált V2) | Hálózati izoláció, dedikált hardver |

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

### Azure SQL adatbázis

#### SKU kiválasztási keretrendszer

1. **DTU-alapú (Database Transaction Units)**
   - **Basic**: 5 DTU – fejlesztés/tesztelés
   - **Standard**: S0–S12 (10–3000 DTU) – általános célú
   - **Premium**: P1–P15 (125–4000 DTU) – teljesítménykritikus

2. **vCore-alapú** (ajánlott éles környezethez)
   - **General Purpose**: kiegyensúlyozott számítás és tárolás
   - **Business Critical**: alacsony késleltetés, magas IOPS
   - **Hyperscale**: Nagy skálázhatóság tárolásban; ellenőrizze a jelenlegi méretkorlátokat és régiós támogatást

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

#### Környezeti típusok

1. **Fogyasztás alapú**
   - Használat alapú díjszabás
   - Fejlesztési és változó munkaterhelésekhez megfelelő
   - Megosztott infrastruktúra

2. **Dedikált (Munkaterhelési profilok)**
   - Dedikált számítási erőforrások
   - Kiszámítható teljesítmény
   - Jobb éles munkaterhelésekhez

#### Konfigurációs példák

**Fejlesztés (fogyasztás alapú)**
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

**Éles (dedikált)**
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

A zónaredundancia támogatott régióinfrastruktúrát és megfelelő VNet/alhálózati konfigurációt is igényel, amely itt nincs részletezve. Ez a példa három dedikált csomópontot tervez; legalább két alkalmazás-replika beállítása javasolt a zónák közti elosztáshoz, és méretezze mind a replikákat, mind a csomópontokat zóna kiesés ellen. Lásd [Container Apps megbízhatósági útmutató](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Alkalmazás hozzárendeléséhez ehhez a profilhoz állítsa be az `workloadProfileName: 'production-profile'` értékét; a profil létrehozása önmagában nem helyezi át az alkalmazásokat.

### Azure Cosmos DB

#### Átbocsátási modellek

1. **Kézi fenntartott átbocsátás**
   - Kiszámítható teljesítmény
   - Fenntartott kapacitás kedvezmények
   - Legjobb állandó munkaterhelésekhez

2. **Automatikus skálázású fenntartott átbocsátás**
   - Használat alapú automatikus skálázás
   - Csak a felhasznált mennyiségért fizet (minimum mellett)
   - Jó változó munkaterhelésekhez

3. **Szerver nélküli**
   - Kérés alapú díjazás
   - Nincs fenntartott átbocsátás
   - Ideális fejlesztési és időszakos munkaterhelésekhez

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

### Azure Storage Account

#### Tárolási fiók típusok

1. **Standard_LRS** – Fejlesztés, nem kritikus adatok
2. **Standard_GRS** – Éles, földrajzi redundancia szükséges
3. **Premium_LRS** – Magas teljesítményű alkalmazások
4. **Premium_ZRS** – Nagy elérhetőség zóna redundanciával

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

Foglaljon le erőforrásokat 1-3 évre jelentős kedvezményekért:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

A foglalási ajánlatok és a jogosult erőforrás típusok eltérők; ellenőrizze a katalógust és a vásárlási feltételeket, ne feltételezze, hogy minden szolgáltatás/SKU támogat fenntartást.

### 2. Megfelelő méretezés

Kezdje kisebb SKU-kkal, és méretezzen felül a tényleges használat alapján:

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

### 3. Auto-skálázási beállítás

Valósítson meg intelligens skálázást a költségek optimalizálásához:

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

### 4. Ütemezett skálázás

Csökkentse a kapacitást nem munkanapokon:

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

Határozza meg egyértelműen a teljesítménykövetelményeket az SKU kiválasztása előtt:

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

Tesztelje különböző SKU-k teljesítményét:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
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

## Gyorsreferencia táblák

### App Service SKU gyorsreferencia

| SKU | Réteg | vCPU | RAM | Tárolás | Ár sáv | Használati eset |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Ingyenes | Megosztott | 1GB | 1GB | Ingyenes | Fejlesztés |
| B1 | Alap | 1 | 1.75GB | 10GB | $ | Kis alkalmazások |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Éles környezet |
| P1V3 | Prémium V3 | 2 | 8GB | 250GB | $$$ | Nagy teljesítmény |
| I1V2 | Izolált V2 | 2 | 8GB | 1TB | $$$$ | Vállalati |

### SQL adatbázis SKU gyorsreferencia

| SKU | Réteg | DTU/vCore | Tárolás | Ár sáv | Használati eset |
|-----|------|-----------|---------|-------------|----------|
| Basic | Alap | 5 DTU | 2GB | $ | Fejlesztés |
| S2 | Standard | 50 DTU | 250GB | $$ | Kis éles környezet |
| P2 | Prémium | 250 DTU | 1TB | $$$ | Nagy teljesítmény |
| GP_Gen5_4 | Általános cél | 4 vCore | 4TB | $$$ | Kiegyensúlyozott |
| BC_Gen5_8 | Üzleti kritikus | 8 vCore | 4TB | $$$$ | Küldetéskritikus |

### Container Apps SKU gyorsreferencia

| Modell | Árazás | CPU/Memória | Használati eset |
|-------|---------|------------|----------|
| Fogyasztás | Használat alapú díj | A támogatott CPU/memória kombinációk a környezettől/profiltól függenek | Fejlesztés vagy éles környezet, változó terhelés |
| Dedikált D4 | Dedikált csomópont számlázás | 4 vCPU, 16GiB csomópontonként | Folyamatos terhelés/izolációs igények |
| Dedikált D8 | Dedikált csomópont számlázás | 8 vCPU, 32GiB csomópontonként | Nagyobb folyamatos terhelés |

---

## Validációs eszközök

### SKU elérhetőség ellenőrző

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

### Költségbecslő szkript

**Csak ál-kód:** az alábbi `Get-ResourceCost` projekt-specifikus függvény, amelyet a jelenlegi régiós/szerződéses árak és használati feltételek alapján kell megvalósítania. Nem PowerShell vagy Azure parancsmag.

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

### Teljesítmény validáció

A következő YAML egy követelményvázlat, **nem** Azure Load Testing, JMeter, Locust vagy k6 bemeneti séma. Alakítsa át a választott eszköze valós konfigurációjára, mielőtt az előző terhelés-tesztelési parancsot használná.

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

### Ajánlott lépések

1. **Kezdje kicsiben és méretezzen felül** a tényleges használatnak megfelelően
2. **Használjon különböző SKU-kat különböző környezetekhez**
3. **Folyamatosan figyelje a teljesítményt és a költségeket**
4. **Használja a fenntartott kapacitást az éles munkaterhelésekhez**
5. **Implementálja az auto-skálázást, ahol megfelelő**
6. **Tesztelje a teljesítményt valós munkaterhelésekkel**
7. **Tervezze meg a növekedést, de kerülje a túlméretezést**
8. **Fejlesztéshez használjon ingyenes szinteket, ahol lehetséges**

### Kerülendő hibák

1. **Ne használjon éles SKU-kat fejlesztéshez**
2. **Ne hagyja figyelmen kívül a régióspecifikus SKU elérhetőséget**
3. **Ne feledkezzen meg az adatforgalmi költségekről**
4. **Ne méretezzen túl indokolatlanul**
5. **Ne hagyja figyelmen kívül a függőségek hatásait**
6. **Ne állítson túl magas auto-skálázási korlátokat**
7. **Ne felejtse el a megfelelőségi követelményeket**
8. **Ne hozzon döntést kizárólag ár alapján**

---

**Pro tipp**: Használja az Azure Költségkezelést és Advisor-t, hogy személyre szabott ajánlásokat kapjon SKU választásainak optimalizálására a tényleges használati minták alapján.

---

**Navigáció**
- **Előző leckéhez**: [Kapacitástervezés](capacity-planning.md)
- **Következő leckéhez**: [Előzetes ellenőrzések](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
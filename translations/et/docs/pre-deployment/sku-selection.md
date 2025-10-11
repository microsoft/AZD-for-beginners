<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "952ed5af7f5db069c53a6840717e1801",
  "translation_date": "2025-10-11T15:58:31+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "et"
}
-->
# SKU valikujuhend - Õige Azure'i teenuse taseme valimine

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 6 - Eelkontroll ja planeerimine
- **⬅️ Eelmine**: [Mahutavuse planeerimine](capacity-planning.md)
- **➡️ Järgmine**: [Eelkontrollid](preflight-checks.md)
- **🚀 Järgmine peatükk**: [Peatükk 7: Tõrkeotsing](../troubleshooting/common-issues.md)

## Sissejuhatus

See põhjalik juhend aitab teil valida optimaalseid Azure'i teenuse SKU-sid (Stock Keeping Units) erinevate keskkondade, töökoormuste ja nõuete jaoks. Õppige analüüsima jõudlusvajadusi, kulutegureid ja skaleeritavuse nõudeid, et valida oma Azure Developer CLI juurutuste jaoks kõige sobivamad teenusetasemed.

## Õpieesmärgid

Selle juhendi läbimise järel:
- Mõistate Azure'i SKU-de kontseptsioone, hinnamudeleid ja funktsioonide erinevusi
- Omandate keskkonnaspetsiifilised SKU-de valimise strateegiad arenduse, testimise ja tootmise jaoks
- Analüüsite töökoormuse nõudeid ja sobitate need sobivate teenusetasemetega
- Rakendate kulude optimeerimise strateegiaid nutika SKU valiku kaudu
- Rakendate jõudluse testimise ja valideerimise tehnikaid SKU valikute jaoks
- Konfigureerite automaatseid SKU soovitusi ja jälgimist

## Õpitulemused

Pärast juhendi läbimist suudate:
- Valida sobivaid Azure'i teenuse SKU-sid töökoormuse nõuete ja piirangute alusel
- Kujundada kulutõhusaid mitmekeskkonna arhitektuure, valides õiged tasemed
- Rakendada jõudluse võrdlust ja valideerimist SKU valikute jaoks
- Luua automatiseeritud tööriistu SKU soovituste ja kulude optimeerimiseks
- Planeerida SKU-de migratsiooni ja skaleerimisstrateegiaid vastavalt muutuvatele nõuetele
- Rakendada Azure'i hästi arhitektuurse raamistiku põhimõtteid teenusetaseme valikul

## Sisukord

- [SKU-de mõistmine](../../../../docs/pre-deployment)
- [Keskkonnapõhine valik](../../../../docs/pre-deployment)
- [Teenusepõhised juhised](../../../../docs/pre-deployment)
- [Kulude optimeerimise strateegiad](../../../../docs/pre-deployment)
- [Jõudluse kaalutlused](../../../../docs/pre-deployment)
- [Kiirviite tabelid](../../../../docs/pre-deployment)
- [Valideerimise tööriistad](../../../../docs/pre-deployment)

---

## SKU-de mõistmine

### Mis on SKU-d?

SKU-d (Stock Keeping Units) tähistavad erinevaid teenusetasemeid ja jõudlustasemeid Azure'i ressursside jaoks. Iga SKU pakub erinevaid:

- **Jõudlusomadusi** (CPU, mälu, läbilaskevõime)
- **Funktsioonide saadavust** (skaleerimisvõimalused, SLA tasemed)
- **Hinnamudeleid** (tarbimispõhine, reserveeritud maht)
- **Piirkondlikku saadavust** (kõik SKU-d pole saadaval kõigis piirkondades)

### Peamised tegurid SKU valikul

1. **Töökoormuse nõuded**
   - Eeldatavad liiklus-/koormusmustrid
   - Jõudlusnõuded (CPU, mälu, I/O)
   - Salvestusvajadused ja juurdepääsumustrid

2. **Keskkonna tüüp**
   - Arendus/testimine vs tootmine
   - Saadavuse nõuded
   - Turvalisuse ja vastavuse vajadused

3. **Eelarve piirangud**
   - Esialgsed kulud vs tegevuskulud
   - Reserveeritud mahu allahindlused
   - Automaatse skaleerimise kulude mõju

4. **Kasvuprognoosid**
   - Skaleeritavuse nõuded
   - Tulevased funktsioonivajadused
   - Migratsiooni keerukus

---

## Keskkonnapõhine valik

### Arenduskeskkond

**Prioriteedid**: Kulude optimeerimine, põhiline funktsionaalsus, lihtne seadistamine ja eemaldamine

#### Soovitatavad SKU-d
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

#### Omadused
- **App Service**: F1 (tasuta) või B1 (põhiline) lihtsaks testimiseks
- **Andmebaasid**: Põhitasemega minimaalsete ressurssidega
- **Salvestusruum**: Standardne ainult kohaliku redundantsusega
- **Arvutusvõimsus**: Jagatud ressursid on vastuvõetavad
- **Võrgustik**: Põhikonfiguratsioonid

### Testimis-/staging-keskkond

**Prioriteedid**: Tootmiskeskkonna sarnane konfiguratsioon, kulude ja jõudluse tasakaal

#### Soovitatavad SKU-d
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

#### Omadused
- **Jõudlus**: 70-80% tootmiskeskkonna võimekusest
- **Funktsioonid**: Enamik tootmiskeskkonna funktsioone lubatud
- **Redundantsus**: Mõningane geograafiline redundantsus
- **Skaleerimine**: Piiratud automaatne skaleerimine testimiseks
- **Jälgimine**: Täielik jälgimissüsteem

### Tootmiskeskkond

**Prioriteedid**: Jõudlus, saadavus, turvalisus, vastavus, skaleeritavus

#### Soovitatavad SKU-d
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

#### Omadused
- **Kõrge saadavus**: 99,9%+ SLA nõuded
- **Jõudlus**: Pühendatud ressursid, kõrge läbilaskevõime
- **Turvalisus**: Premium-turvafunktsioonid
- **Skaleerimine**: Täielikud automaatse skaleerimise võimalused
- **Jälgimine**: Põhjalik jälgitavus

---

## Teenusepõhised juhised

### Azure App Service

#### SKU otsustusmaatriks

| Kasutusjuht | Soovitatav SKU | Põhjendus |
|-------------|----------------|-----------|
| Arendus/testimine | F1 (tasuta) või B1 (põhiline) | Kulutõhus, piisav testimiseks |
| Väikesed tootmisrakendused | S1 (standard) | Kohandatud domeenid, SSL, automaatne skaleerimine |
| Keskmised tootmisrakendused | P1V3 (Premium V3) | Parem jõudlus, rohkem funktsioone |
| Suure liiklusega rakendused | P2V3 või P3V3 | Pühendatud ressursid, kõrge jõudlus |
| Missioonikriitilised rakendused | I1V2 (Isolated V2) | Võrgu isoleerimine, pühendatud riistvara |

#### Konfiguratsiooni näited

**Arendus**
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

**Tootmine**
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

### Azure SQL andmebaas

#### SKU valiku raamistik

1. **DTU-põhine (Database Transaction Units)**
   - **Põhiline**: 5 DTU - Arendus/testimine
   - **Standard**: S0-S12 (10-3000 DTU) - Üldotstarbeline
   - **Premium**: P1-P15 (125-4000 DTU) - Jõudluskriitiline

2. **vCore-põhine** (soovitatav tootmiseks)
   - **Üldotstarbeline**: Tasakaalustatud arvutus- ja salvestusvõimsus
   - **Ärikriitiline**: Madal latentsus, kõrge IOPS
   - **Hüperskaala**: Väga skaleeritav salvestus (kuni 100TB)

#### Näidiskonfiguratsioonid

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

#### Keskkonnatüübid

1. **Tarbimispõhine**
   - Kasutuspõhine hinnakujundus
   - Sobib arenduseks ja muutuvate töökoormuste jaoks
   - Jagatud infrastruktuur

2. **Pühendatud (töökoormuse profiilid)**
   - Pühendatud arvutusressursid
   - Prognoositav jõudlus
   - Sobib paremini tootmiskoormustele

#### Konfiguratsiooni näited

**Arendus (tarbimispõhine)**
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

**Tootmine (pühendatud)**
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

#### Läbilaskevõime mudelid

1. **Käsitsi määratud läbilaskevõime**
   - Prognoositav jõudlus
   - Reserveeritud mahu allahindlused
   - Parim stabiilsete töökoormuste jaoks

2. **Automaatne skaleerimine**
   - Automaatne skaleerimine vastavalt kasutusele
   - Maksate ainult kasutuse eest (minimaalse tasuga)
   - Sobib muutuvate töökoormuste jaoks

3. **Serverless**
   - Maksate päringu alusel
   - Pole määratud läbilaskevõimet
   - Ideaalne arenduseks ja vahelduvate töökoormuste jaoks

#### SKU näited

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

#### Salvestuskonto tüübid

1. **Standard_LRS** - Arendus, mitte-kriitilised andmed
2. **Standard_GRS** - Tootmine, georedundantsus vajalik
3. **Premium_LRS** - Kõrge jõudlusega rakendused
4. **Premium_ZRS** - Kõrge saadavus tsoonilise redundantsusega

#### Jõudlustasemed

- **Standard**: Üldotstarbeline, kulutõhus
- **Premium**: Kõrge jõudlus, madala latentsusega stsenaariumid

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

## Kulude optimeerimise strateegiad

### 1. Reserveeritud maht

Reserveerige ressursid 1-3 aastaks, et saada märkimisväärseid allahindlusi:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Õige suuruse valimine

Alustage väiksemate SKU-dega ja suurendage vastavalt tegelikule kasutusele:

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

### 3. Automaatse skaleerimise seadistamine

Rakendage nutikas skaleerimine kulude optimeerimiseks:

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

### 4. Ajastatud skaleerimine

Vähendage mahtu väljaspool tipptunde:

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

## Jõudluse kaalutlused

### Põhilised jõudlusnõuded

Määratlege selged jõudlusnõuded enne SKU valimist:

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

### Koormustestimine

Testige erinevaid SKU-sid, et valideerida jõudlust:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Jälgimine ja optimeerimine

Seadistage põhjalik jälgimine:

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

## Kiirviite tabelid

### App Service SKU kiirviide

| SKU | Tase | vCPU | RAM | Salvestusruum | Hinnavahemik | Kasutusjuht |
|-----|------|------|-----|---------------|--------------|-------------|
| F1 | Tasuta | Jagatud | 1GB | 1GB | Tasuta | Arendus |
| B1 | Põhiline | 1 | 1.75GB | 10GB | $ | Väikesed rakendused |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Tootmine |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Kõrge jõudlus |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Ettevõtte tasemel |

### SQL andmebaasi SKU kiirviide

| SKU | Tase | DTU/vCore | Salvestusruum | Hinnavahemik | Kasutusjuht |
|-----|------|-----------|---------------|--------------|-------------|
| Basic | Põhiline | 5 DTU | 2GB | $ | Arendus |
| S2 | Standard | 50 DTU | 250GB | $$ | Väike tootmine |
| P2 | Premium | 250 DTU | 1TB | $$$ | Kõrge jõudlus |
| GP_Gen5_4 | Üldotstarbeline | 4 vCore | 4TB | $$$ | Tasakaalustatud |
| BC_Gen5_8 | Ärikriitiline | 8 vCore | 4TB | $$$$ | Missioonikriitiline |

### Container Apps SKU kiirviide

| Mudel | Hinnakujundus | CPU/Mälu | Kasutusjuht |
|-------|---------------|----------|-------------|
| Tarbimispõhine | Maksed kasutuse järgi | 0.25-2 vCPU | Arendus, muutuv koormus |
| Pühendatud D4 | Reserveeritud | 4 vCPU, 16GB | Tootmine |
| Pühendatud D8 | Reserveeritud | 8 vCPU, 32GB | Kõrge jõudlus |

---

## Valideerimise tööriistad

### SKU saadavuse kontrollija

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

### Kulude hindamise skript

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

### Jõudluse valideerimine

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

## Parimate tavade kokkuvõte

### Tee

1. **Alusta väiksemalt ja skaleeri üles** vastavalt tegelikule kasutusele
2. **Kasuta erinevaid SKU-sid erinevates keskkondades**
3. **Jälgi pidevalt jõudlust ja kulusid**
4. **Kasuta reserveeritud mahtu tootmiskoormuste jaoks**
5. **Rakenda automaatset skaleerimist, kui see on asjakohane**
6. **Testi jõudlust realistlike töökoormustega**
7. **Planeeri kasvu, kuid väldi üleprovisjoneerimist**
8. **Kasuta tasuta tasemeid arenduseks, kui võimalik**

### Ära tee

1. **Ära kasuta tootmise SKU-sid arenduseks**
2. **Ära ignoreeri piirkondlikku SKU saadavust**
3. **Ära unusta andmeedastuse kulusid**
4. **Ära üleprovisjoneeri ilma põhjuseta**
5. **Ära ignoreeri sõltuvuste mõju**
6. **Ära sea automaatse skaleerimise piire liiga kõrgeks**
7. **Ära unusta vastavusnõudeid**
8. **Ära tee otsuseid ainult hinna alusel**

---

**Nõuanne**: Kasutage Azure Cost Management ja Advisor tööriistu, et saada isikupärastatud soovitusi SKU valikute optimeerimiseks vastavalt tegelikele kasutusmustritele.

---

**Navigeerimine**
- **Eelmine õppetund**: [Mahutavuse planeerimine](capacity-planning.md)
- **Järgmine õppetund**: [Eelkontrollid](preflight-checks.md)

---

**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.
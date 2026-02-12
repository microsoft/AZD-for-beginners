# SKU valiku juhend - õige Azure teenuse taseme valimine

**Peatükkide navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 6 - Enne juurutamist valideerimine ja planeerimine
- **⬅️ Eelmine**: [Mahutavuse planeerimine](capacity-planning.md)
- **➡️ Järgmine**: [Eelkontrollid](preflight-checks.md)
- **🚀 Järgmine peatükk**: [Peatükk 7: Tõrkeotsing](../chapter-07-troubleshooting/common-issues.md)

## Sissejuhatus

See põhjalik juhend aitab teil valida optimaalsed Azure teenuste SKU-d (Stock Keeping Units) erinevate keskkondade, töökoormuste ja nõuete jaoks. Õppige analüüsima jõudlusnõudeid, kulude kaalutlusi ja skaleeritavuse vajadusi, et valida sobivaimad teenusetasemed oma Azure Developer CLI juurutusteks.

## Õpieesmärgid

Selle juhendi läbimisel suudate:
- Mõista Azure SKU kontseptsioone, hinnamudeleid ja funktsioonide erinevusi
- Valdada keskkonnapõhiseid SKU valikustrateegiaid arenduse, testimise ja tootmise jaoks
- Analüüsida töökoormuse nõudeid ja sobitada need vastavate teenusetasemetega
- Rakendada kulude optimeerimise strateegiaid intelligentse SKU valikuga
- Rakendada jõudlustestimise ja valideerimise tehnikaid SKU valikute jaoks
- Konfigureerida automatiseeritud SKU soovitusi ja monitooringut

## Õpitulemused

Lõpetamisel oskate:
- Valida sobivad Azure teenuse SKU-d töökoormuse nõuete ja piirangute alusel
- Kujundada kuluefektiivseid mitmekeskkondlikke arhitektuure õige taseme valikuga
- Rakendada jõudlusmõõtmist ja valideerimist SKU valikute jaoks
- Luua automatiseeritud tööriistu SKU soovitusteks ja kuluoptimeerimiseks
- Planeerida SKU migratsioone ja skaleerimisstrateegiaid muutuva nõudluse korral
- Rakendada Azure Well-Architected raamistikku teenusetaseme valikul

## Sisukord

- [SKU-de mõistmine](../../../../docs/chapter-06-pre-deployment)
- [Keskkonnapõhine valik](../../../../docs/chapter-06-pre-deployment)
- [Teenusepõhised juhised](../../../../docs/chapter-06-pre-deployment)
- [Kuluoptimeerimise strateegiad](../../../../docs/chapter-06-pre-deployment)
- [Jõudluse kaalutlused](../../../../docs/chapter-06-pre-deployment)
- [Kiirviite tabelid](../../../../docs/chapter-06-pre-deployment)
- [Valideerimise tööriistad](../../../../docs/chapter-06-pre-deployment)

---

## SKU-de mõistmine

### Mis on SKU-d?

SKU-d (Stock Keeping Units) tähistavad erinevaid teenusetasemeid ja jõudluse tasemeid Azure ressursside jaoks. Iga SKU pakub erinevaid:

- **Jõudlusomadused** (CPU, mälu, läbilaskevõime)
- **Funktsioonide kättesaadavus** (skaalimisvalikud, SLA tasemed)
- **Hinnamudelid** (tarbimisbaasil, reserveeritud maht)
- **Regiooniti kättesaadavus** (ei pruugi olla kõik SKU-d kõigis regioonides saadaval)

### Peamised tegurid SKU valikul

1. **Töökoormuse nõuded**
   - Oodatavad liiklus-/koormusmustrid
   - Jõudlusnõuded (CPU, mälu, I/O)
   - Salvestusvajadused ja ligipääsumustrid

2. **Keskkonna tüüp**
   - Arendus/testimine vs tootmine
   - Saadavuse nõuded
   - Turbe- ja nõuetele vastavuse vajadused

3. **Eelarvepiirangud**
   - Esialgsed kulud vs jooksivad kulud
   - Reserveeritud mahu allahindlused
   - Automaatse skaleerimise kuluimplikatsioonid

4. **Kasvu prognoosid**
   - Skaleerimisnõuded
   - Tulevased funktsioonide vajadused
   - Migratsiooni keerukus

---

## Keskkonnapõhine valik

### Arenduskeskkond

**Prioriteedid**: kuluoptimeerimine, põhifunktsionaalsus, lihtne juurutamine/mahavõtmine

#### Soovitatud SKU-d
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
- **App Service**: F1 (Free) or B1 (Basic) for simple testing
- **Andmebaasid**: Basic tase minimaalse ressurssiga
- **Salvestus**: Standard ainult lokaalse redundantsusega
- **Arvutus**: jagatud ressursid vastuvõetavad
- **Võrgustik**: põhilised konfiguratsioonid

### Etapi/testimise keskkond

**Prioriteedid**: tootmise-laadne konfiguratsioon, kulude ja jõudluse tasakaal, testimisvõimekus

#### Soovitatud SKU-d
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
- **Jõudlus**: 70–80% tootmisvõimsusest
- **Funktsioonid**: enamik tootmisfunktsioone lubatud
- **Redundantsus**: mõningane geograafiline redundantsus
- **Skaalimine**: piiratud automaatne skaleerimine testimiseks
- **Monitooring**: täielik monitooringupinu

### Tootmiskeskkond

**Prioriteedid**: jõudlus, saadavus, turvalisus, vastavus, skaleeritavus

#### Soovitatud SKU-d
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
- **Kõrge saadavus**: >99,9% SLA nõuded
- **Jõudlus**: pühendatud ressursid, suur läbilaskevõime
- **Turvalisus**: premium-taseme turbefunktsioonid
- **Skaalimine**: täielikud automaatse skaleerimise võimalused
- **Monitooring**: kõikehõlmav jälgitavus

---

## Teenusepõhised juhised

### Azure App Service

#### SKU otsustusmaatriks

| Kasutusjuhtum | Soovitatud SKU | Põhjendus |
|----------|----------------|-----------|
| Arendus/Testimine | F1 (Free) or B1 (Basic) | Kuluefektiivne, sobib testimiseks |
| Väikesed tootmisrakendused | S1 (Standard) | Kohandatud domeenid, SSL, automaatne skaleerimine |
| Keskmise suurusega tootmisrakendused | P1V3 (Premium V3) | Parema jõudlusega, rohkem funktsioone |
| Suurte liiklusmahtudega rakendused | P2V3 or P3V3 | Pühendatud ressursid, kõrge jõudlus |
| Missioonikriitilised rakendused | I1V2 (Isolated V2) | Võrgueraldatus, pühendatud riistvara |

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

### Azure SQL Database

#### SKU valiku raamistik

1. **DTU-põhine (Database Transaction Units)**
   - **Basic**: 5 DTU - arendus/testimine
   - **Standard**: S0-S12 (10-3000 DTU) - üldotstarbeline
   - **Premium**: P1-P15 (125-4000 DTU) - jõudluskriitiline

2. **vCore-põhine** (soovitatav tootmiseks)
   - **General Purpose**: tasakaalustatud arvutus ja salvestus
   - **Business Critical**: madal latentsus, kõrge IOPS
   - **Hyperscale**: väga skaleeritav salvestus (kuni 100TB)

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

#### Keskkonna tüübid

1. **Tarbimispõhine**
   - Tasu kasutuse järgi
   - Sobib arenduseks ja muutuva koormusega töökoormustele
   - Jagatud infrastruktuur

2. **Pühendatud (töökoormusprofiilid)**
   - Pühendatud arvutusressursid
   - Ennustatav jõudlus
   - Sobivam tootmiskoormustele

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

1. **Käsitsi provisioneeritud läbilaskevõime**
   - Ennustatav jõudlus
   - Reserveeritud mahu allahindlused
   - Parim stabiilsete töökoormuste puhul

2. **Autoscale provisioneeritud läbilaskevõime**
   - Automaatne skaala vastavalt kasutusele
   - Tasud vastavalt kasutusele (miinimumiga)
   - Sobib muutuva koormusega töökoormustele

3. **Serverless**
   - Tasu päringu põhjal
   - Puudub provisioneeritud läbilaskevõime
   - Ideaalne arenduseks ja harvadeks töökoormusteks

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

### Azure Storage konto

#### Salvestuskonto tüübid

1. **Standard_LRS** - arendus, mitte-kriitilised andmed
2. **Standard_GRS** - tootmine, vajatakse geo-redundantsust
3. **Premium_LRS** - kõrge jõudlusega rakendused
4. **Premium_ZRS** - kõrge saadavus tsooni-redudantsusega

#### Jõudluse tasemed

- **Standard**: üldotstarbeline, kuluefektiivne
- **Premium**: kõrge jõudlus, madala latentsusega stsenaariumid

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

## Kuluoptimeerimise strateegiad

### 1. Reserveeritud maht

Reserveeri ressursid 1–3 aastaks märkimisväärsete allahindluste saamiseks:

```bash
# Kontrolli broneerimisvõimalusi
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Õige suuruse valimine

Alusta väiksemate SKU-dega ja skaleeri üles vastavalt reaalsele kasutusele:

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

### 3. Automaatskaalimise konfiguratsioon

Rakenda nutikat skaleerimist kulude optimeerimiseks:

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

Skaleeri alla mitte-kasutusaegadel:

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

### Põhijõudlusnõuded

Määra selged jõudlusnõuded enne SKU valikut:

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

Testi erinevaid SKU-sid jõudluse kinnitamiseks:

```bash
# Azure'i koormustestimise teenus
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Monitooring ja optimeerimine

Seadista kõikehõlmav monitooring:

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

| SKU | Tase | vCPU | RAM | Salvestus | Hinnavahemik | Kasutusjuhtum |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | Arendus |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Väikesed rakendused |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Tootmine |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Kõrge jõudlus |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Ettevõte |

### SQL andmebaasi SKU kiirviide

| SKU | Tase | DTU/vCore | Salvestus | Hinnavahemik | Kasutusjuhtum |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Arendus |
| S2 | Standard | 50 DTU | 250GB | $$ | Väike tootmine |
| P2 | Premium | 250 DTU | 1TB | $$$ | Kõrge jõudlus |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Tasakaalustatud |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Missioonikriitiline |

### Container Apps SKU kiirviide

| Mudel | Hinnastus | CPU/Mälu | Kasutusjuhtum |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Arendus, muutuva koormusega |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Tootmine |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | Kõrge jõudlus |

---

## Valideerimise tööriistad

### SKU Availability Checker

```bash
#!/bin/bash
# Kontrolli SKU saadavust sihtregioonis

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

# Kasutus
check_sku_availability "eastus" "app-service" "P1V3"
```

### Cost Estimation Script

```powershell
# PowerShelli skript kulude hindamiseks
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
        
        # Kasuta Azure'i hinnastamis-API-d või kalkulaatorit
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Kasutamine
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### Performance Validation

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

### Soovitused

1. **Alusta väiksemalt ja skaleeri üles** vastavalt reaalsele kasutusele
2. **Kasuta erinevaid SKU-sid erinevates keskkondades**
3. **Monitoori jõudlust ja kulusid pidevalt**
4. **Kasuta reserveeritud mahtu tootmiskoormuste jaoks**
5. **Rakenda automaatne skaleerimine, kus see asjakohane on**
6. **Testi jõudlust realistlike töökoormustega**
7. **Planeeri kasvu, kuid väldi ülepakkumist**
8. **Kasuta arenduses võimalusel tasuta tasemeid**

### Mida vältida

1. **Ära kasuta tootmis-SKU-sid arenduses**
2. **Ära ignoreeri SKU-de regioonilist kättesaadavust**
3. **Ära unusta andmeedastuse kulusid**
4. **Ära ülepaku põhjuseta**
5. **Ära ignoreeri sõltuvuste mõju**
6. **Ära sea automaatse skaleerimise piiranguid liiga kõrgeks**
7. **Ära unusta nõuetele vastavuse nõudeid**
8. **Ära tee otsuseid ainult hinna põhjal**

---

**Pro näpunäide**: Kasutage Azure Cost Managementit ja Advisorit, et saada personaalseid soovitusi SKU valikute optimeerimiseks vastavalt reaalsele kasutusmudelile.

---

**Navigeerimine**
- **Eelnev õppetükk**: [Mahutavuse planeerimine](capacity-planning.md)
- **Järgmine õppetükk**: [Eelkontrollid](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Lahtiütlus:
See dokument on tõlgitud tehisintellekti tõlketeenuse Co-op Translator (https://github.com/Azure/co-op-translator) abil. Kuigi püüdleme täpsuse poole, arvestage palun, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokumenti selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste ega valetõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
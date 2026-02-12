# SKU pasirinkimo vadovas - Kaip pasirinkti tinkamus Azure paslaugų lygius

**Skyrių naršymas:**
- **📚 Kurso pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 6 skyrius - Išankstinis diegimo tikrinimas ir planavimas
- **⬅️ Ankstesnis**: [Capacity Planning](capacity-planning.md)
- **➡️ Kitas**: [Pre-flight Checks](preflight-checks.md)
- **🚀 Kitas skyrius**: [7 skyrius: Gedimų šalinimas](../chapter-07-troubleshooting/common-issues.md)

## Įvadas

Šis išsamus vadovas padės pasirinkti optimalius Azure paslaugų SKU (Stock Keeping Units) skirtingoms aplinkoms, darbiniams krūviams ir reikalavimams. Išmoksite analizuoti našumo poreikius, kaštų aspektus ir mastelio keitimo reikalavimus, kad pasirinktumėte tinkamiausius paslaugų lygius savo Azure Developer CLI diegimams.

## Mokymosi tikslai

Baigę šį vadovą jūs:
- Suprasite SKU koncepcijas, kainodaros modelius ir funkcijų skirtumus
- Išmoksite aplinkai pritaikytas SKU pasirinkimo strategijas kūrimo, parengimo ir produkcijos etapams
- Analizuosite darbinių krūvių poreikius ir priderinsite juos prie tinkamų paslaugų lygių
- Įgyvendinsite kaštų optimizavimo strategijas protingai renkantis SKU
- Taikysite našumo testavimo ir patvirtinimo technikas SKU pasirinkimams
- Konfigūruosite automatizuotas SKU rekomendacijas ir stebėjimą

## Mokymosi rezultatai

Baigę kursą sugebėsite:
- Pasirinkti tinkamus Azure paslaugų SKU remiantis darbinių krūvių reikalavimais ir apribojimais
- Sukurti ekonomiškas kelių aplinkų architektūras su tinkamu lygių pasirinkimu
- Vykdyti našumo etalonavimą ir patvirtinimą SKU pasirinkimams
- Kurti automatizuotus įrankius SKU rekomendacijoms ir kaštų optimizavimui
- Planuoti SKU migracijas ir skalavimo strategijas keičiantis reikalavimams
- Taikyti Azure Well-Architected Framework principus renkantis paslaugų lygius

## Turinys

- [SKU supratimas](../../../../docs/chapter-06-pre-deployment)
- [Pasirinkimas pagal aplinką](../../../../docs/chapter-06-pre-deployment)
- [Paslaugų specifinės gairės](../../../../docs/chapter-06-pre-deployment)
- [Kaštų optimizavimo strategijos](../../../../docs/chapter-06-pre-deployment)
- [Našumo svarstymai](../../../../docs/chapter-06-pre-deployment)
- [Greitos nuorodos lentelės](../../../../docs/chapter-06-pre-deployment)
- [Patvirtinimo įrankiai](../../../../docs/chapter-06-pre-deployment)

---

## SKU supratimas

### Kas yra SKU?

SKU (Stock Keeping Units) reiškia skirtingus paslaugų lygius ir našumo lygius Azure ištekliams. Kiekvienas SKU siūlo skirtingą:

- **Našumo charakteristikos** (CPU, atmintis, pralaidumas)
- **Funkcijų prieinamumą** (skalavimo galimybės, SLA lygiai)
- **Kainodaros modelius** (mokestis už naudojimą, rezervuota talpa)
- **Regioninę prieinamumą** (ne visi SKU prieinami visuose regionuose)

### Pagrindiniai veiksniai renkantis SKU

1. **Darbinių krūvių reikalavimai**
   - Tikėtini srauto/krūvio modeliai
   - Našumo reikalavimai (CPU, atmintis, I/O)
   - Saugyklos poreikiai ir prieigos modeliai

2. **Aplinkos tipas**
   - Kūrimas/testavimas prieš produkciją
   - Prieinamumo reikalavimai
   - Saugumo ir atitikties (compliance) poreikiai

3. **Biudžeto apribojimai**
   - Pradinės išlaidos vs. veikimo kaštai
   - Nuolaidos rezervuotai talpai
   - Automatinio skalavimo kaštų pasekmės

4. **Augimo prognozės**
   - Mastelio keitimo reikalavimai
   - Ateities funkcijų poreikiai
   - Migracijos sudėtingumas

---

## Pasirinkimas pagal aplinką

### Kūrimo aplinka

**Prioritetai**: Kaštų optimizavimas, pagrindinė funkcionalumas, paprastas teikimas/atšaukimas

#### Rekomenduojami SKU
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

#### Charakteristikos
- **App Service**: F1 (Nemokama) arba B1 (Basic) paprastam testavimui
- **Duomenų bazės**: Basic lygis su minimaliomis resursų reikmėmis
- **Saugykla**: Standard su vietiniu redundantiškumu
- **Skaičiavimas**: Galimi bendrinami resursai
- **Tinklai**: Pagrindinės konfigūracijos

### Parengimo/Testavimo aplinka

**Prioritetai**: Produkcijos panaši konfigūracija, kaštų balansas, našumo testavimo galimybė

#### Rekomenduojami SKU
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

#### Charakteristikos
- **Našumas**: 70–80% produkcijos pajėgumo
- **Funkcijos**: Dauguma produkcijos funkcijų įjungtos
- **Atsarginis kopijavimas**: Tam tikras geografinis redundantiškumas
- **Skalavimas**: Ribotas automatinis skalavimas testavimui
- **Stebėjimas**: Pilnas stebėjimo paketas

### Produkcijos aplinka

**Prioritetai**: Našumas, prieinamumas, saugumas, atitiktis, mastelio keitimas

#### Rekomenduojami SKU
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

#### Charakteristikos
- **Aukšta prieinamybė**: 99.9%+ SLA reikalavimai
- **Našumas**: Dedikuoti resursai, didelis pralaidumas
- **Saugumas**: Premium saugumo funkcijos
- **Skalavimas**: Pilnas automatinio skalavimo palaikymas
- **Stebėjimas**: Išsami stebėsena ir stebėjimo įrankiai

---

## Paslaugų specifinės gairės

### Azure App Service

#### SKU sprendimų matrica

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | Cost-effective, sufficient for testing |
| Small production apps | S1 (Standard) | Custom domains, SSL, auto-scaling |
| Medium production apps | P1V3 (Premium V3) | Better performance, more features |
| High-traffic apps | P2V3 or P3V3 | Dedicated resources, high performance |
| Mission-critical apps | I1V2 (Isolated V2) | Network isolation, dedicated hardware |

#### Konfigūracijos pavyzdžiai

**Kūrimas**
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

**Produkcija**
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

#### SKU pasirinkimo sistema

1. **DTU pagrindu (Database Transaction Units)**
   - **Basic**: 5 DTU - Kūrimas/testavimas
   - **Standard**: S0-S12 (10-3000 DTU) - Bendrosios paskirties
   - **Premium**: P1-P15 (125-4000 DTU) - Kritiniam našumui

2. **vCore pagrindu** (rekomenduojama produkcijai)
   - **General Purpose**: Subalansuoti skaičiavimo ir saugyklos resursai
   - **Business Critical**: Mažas vėlavimas, didelis IOPS
   - **Hyperscale**: Labai išplečiama saugykla (iki 100TB)

#### Pavyzdinės konfigūracijos

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

#### Aplinkos tipai

1. **Vartojimo pagrindu**
   - Mokestis už naudojimą
   - Tinka kūrimui ir kintamiems darbiniams krūviams
   - Bendrinė infrastruktūra

2. **Dedikuota (darbinių krūvių profiliai)**
   - Dedikuoti skaičiavimo resursai
   - Prognozuojamas našumas
   - Geriau tinka produkcijos darbiniams krūviams

#### Konfigūracijos pavyzdžiai

**Kūrimas (Vartojimas)**
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

**Produkcija (Dedikuota)**
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

#### Pralaidumo modeliai

1. **Rankiniu būdu nustatytas pralaidumas**
   - Prognozuojamas našumas
   - Nuolaidos rezervuotai talpai
   - Geriausia stabiliems darbiniams krūviams

2. **Automatinis skalavimas su nustatytu pralaidumu**
   - Automatinis skalavimas pagal naudojimą
   - Mokama už tai, ką naudojate (su minimalia riba)
   - Tinka kintamiems darbiniams krūviams

3. **Be serverių**
   - Mokestis už užklausą
   - Nėra rezervuoto pralaidumo
   - Idealu kūrimui ir retkarčiais dirbantiems darbiniams krūviams

#### SKU pavyzdžiai

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

#### Saugyklos paskyros tipai

1. **Standard_LRS** - Kūrimas, ne kritiniai duomenys
2. **Standard_GRS** - Produkcija, reikalingas geo-redundantiškumas
3. **Premium_LRS** - Aukšto našumo aplikacijos
4. **Premium_ZRS** - Aukštas prieinamumas su zoniniu redundantiškumu

#### Veikimo lygiai

- **Standard**: Bendrosios paskirties, ekonomiškas
- **Premium**: Aukšto našumo, mažo vėlavimo scenarijai

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

## Kaštų optimizavimo strategijos

### 1. Rezervuota talpa

Rezervuokite resursus 1–3 metams reikšmingoms nuolaidoms:

```bash
# Patikrinkite rezervavimo parinktis
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Tinkamas dydis (Right-Sizing)

Pradėkite nuo mažesnių SKU ir didinkite pagal faktinį naudojimą:

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

### 3. Automatinio skalavimo konfigūracija

Įdiekite intelektualų skalavimą kaštams optimizuoti:

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

### 4. Tvarkaraščio skalavimas

Sumažinkite resursus neaktyviais laikotarpiais:

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

## Našumo svarstymai

### Baziniai našumo reikalavimai

Apibrėžkite aiškius našumo reikalavimus prieš renkantis SKU:

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

### Apkrovos testavimas

Išbandykite skirtingus SKU, kad patvirtintumėte našumą:

```bash
# Azure apkrovos testavimo paslauga
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Stebėjimas ir optimizavimas

Nustatykite išsamų stebėjimą:

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

## Greitos nuorodos lentelės

### App Service SKU greita nuoroda

| SKU | Lygis | vCPU | RAM | Saugykla | Kainų intervalas | Naudojimo atvejis |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Nemokama | Bendrinė | 1GB | 1GB | Nemokama | Kūrimas |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Mažos aplikacijos |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Produkcija |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Aukštas našumas |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Įmonės lygio |

### SQL Database SKU greita nuoroda

| SKU | Lygis | DTU/vCore | Saugykla | Kainų intervalas | Naudojimo atvejis |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Kūrimas |
| S2 | Standard | 50 DTU | 250GB | $$ | Maža produkcija |
| P2 | Premium | 250 DTU | 1TB | $$$ | Aukštas našumas |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Subalansuota |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Kritinė verslui |

### Container Apps SKU greita nuoroda

| Model | Kainodara | CPU/Atmintis | Naudojimo atvejis |
|-------|---------|------------|----------|
| Consumption | Mokestis už naudojimą | 0.25-2 vCPU | Kūrimas, kintamas krūvis |
| Dedicated D4 | Rezervuota | 4 vCPU, 16GB | Produkcija |
| Dedicated D8 | Rezervuota | 8 vCPU, 32GB | Aukštas našumas |

---

## Patvirtinimo įrankiai

### SKU prieinamumo tikrintuvas

```bash
#!/bin/bash
# Patikrinti SKU prieinamumą tiksliniame regione

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

# Naudojimas
check_sku_availability "eastus" "app-service" "P1V3"
```

### Kaštų skaičiavimo skriptas

```powershell
# PowerShell scenarijus sąnaudų įvertinimui
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
        
        # Naudokite Azure Pricing API arba skaičiuoklę
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Naudojimas
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### Našumo patvirtinimas

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

## Geriausios praktikos santrauka

### Ką daryti

1. **Pradėkite nuo mažo ir didinkite** pagal faktinį naudojimą
2. **Naudokite skirtingus SKU skirtingoms aplinkoms**
3. **Nuolat stebėkite našumą ir kaštus**
4. **Pasinaudokite rezervuotos talpos nuolaidomis produkcijoje**
5. **Įdiekite automatinį skalavimą, kai tai tinkama**
6. **Testuokite našumą su realistiškais darbais**
7. **Planuokite augimą, bet venkite perteklinio resursų skyrimo**
8. **Naudokite nemokamus lygius kūrimui, kai įmanoma**

### Ko nedaryti

1. **Nenaudokite produkcijos SKU kūrimui**
2. **Nenumokite ranka į regioninį SKU prieinamumą**
3. **Neužmirškite apie duomenų perdavimo kaštus**
4. **Neskirkite perteklinių resursų be pagrindo**
5. **Neignoruokite priklausomybių poveikio**
6. **Nenurodykite per didelių automatinio skalavimo ribų**
7. **Neužmirškite apie atitikties (compliance) reikalavimus**
8. **Nerinkite sprendimų vien tik pagal kainą**

---

**Patarimas**: Naudokite Azure Cost Management ir Advisor, kad gautumėte suasmenintas rekomendacijas, kaip optimizuoti SKU pasirinkimus pagal faktinius naudojimo modelius.

---

**Naršymas**
- **Ankstesnė pamoka**: [Capacity Planning](capacity-planning.md)
- **Kita pamoka**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Atsakomybės apribojimas:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl kritinės informacijos rekomenduojamas profesionalus žmogaus atliktas vertimas. Mes neatsakome už jokius nesusipratimus ar neteisingas interpretacijas, kylančias dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
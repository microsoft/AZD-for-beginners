# SKU pasirinkimo vadovas – kaip pasirinkti tinkamas Azure paslaugų lygius

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 6 skyrius – Išankstinis patikrinimas ir planavimas prieš diegiant
- **⬅️ Ankstesnis**: [Talpos planavimas](capacity-planning.md)
- **➡️ Kitas**: [Išankstiniai patikrinimai](preflight-checks.md)
- **🚀 Kitas skyrius**: [7 skyrius: Problemų šalinimas](../chapter-07-troubleshooting/common-issues.md)

## Įvadas

Šis išsamus vadovas padės jums parinkti optimalias Azure paslaugų SKU (atsargų vienetus) įvairioms aplinkoms, darbo krūviams ir reikalavimams. Išmoksite analizuoti našumo poreikius, kainų aspektus ir keičiamumo reikalavimus, kad pasirinktumėte tinkamiausius paslaugų lygius savo Azure Developer CLI diegimams.

## Mokymosi tikslai

Baigę šį vadovą jūs:
- Suprasite Azure SKU sąvokas, kainodaros modelius ir funkcijų skirtumus
- Įvaldysite aplinkai specifines SKU pasirinkimo strategijas kūrimo, bandymo ir gamybos etapams
- Analizuosite darbo krūvių reikalavimus ir pritaikysite juos tinkamiems paslaugų lygiams
- Įgyvendinsite sąnaudų optimizavimo strategijas protingai pasirinkdami SKU
- Taikysite našumo testavimo ir patikrinimo metodus SKU pasirinkimams
- Konfigūruosite automatines SKU rekomendacijas ir stebėjimą

## Mokymosi rezultatai

Baigę šį vadovą galėsite:
- Pasirinkti tinkamus Azure paslaugų SKU pagal darbo krūvio reikalavimus ir apribojimus
- Sukurti ekonomiškas daugiaaplinkes architektūras su tinkamu lygių parinkimu
- Įgyvendinti našumo matavimus ir patikrinimus dėl SKU pasirinkimų
- Kurti automatines priemones SKU rekomendacijoms ir sąnaudų optimizavimui
- Planavimas SKU migracijas ir keitimo strategijas keičiantis poreikiams
- Taikyti Azure Gerai suprojektuoto karkaso principus pasirenkant paslaugų lygius

## Turinys

- [SKU supratimas](#understanding-skus)
- [Pasirinkimas pagal aplinką](#environment-based-selection)
- [Paslaugų specifinės gairės](#service-specific-guidelines)
- [Sąnaudų optimizavimo strategijos](#cost-optimization-strategies)
- [Našumo aspektai](#performance-considerations)
- [Greitos nuorodos lentelės](#quick-reference-tables)
- [Patikrinimo įrankiai](#validation-tools)

---

## SKU supratimas

> **Pavyzdžio apimtis:** Žemiau pateikti YAML SKU žemėlapiai ir našumo konfigūracijos yra dizaino pastabos, o ne `azure.yaml` schema arba apkrovos įrankio konfigūracija. Bicep blokai yra alternatyvos/frakcijos: deklaruokite jų parametrus ir pagrindinius išteklius, naudokite unikalius simbolinius pavadinimus juos derindami ir sujunkite modulius į veikiančią projektą. Kainos, apribojimai ir regiono/SKU prieinamumas turi būti patikrinti jūsų prenumeratai prieš diegiant.

### Kas yra SKU?

SKU (atsargų vienetai) reiškia skirtingus paslaugų lygius ir našumo pakopas Azure ištekliams. Kiekvienas SKU siūlo skirtingus:

- **Našumo charakteristikas** (CPU, atmintis, pralaidumas)
- **Funkcijų prieinamumą** (skalavimo galimybės, SLA lygiai)
- **Kainodaros modelius** (pagal sunaudojimą, rezervuota talpa)
- **Regiono prieinamumą** (ne visi SKU prieinami visuose regionuose)

### Svarbiausi veiksniai pasirenkant SKU

1. **Darbo krūvio reikalavimai**
   - Tikėtinas srautas/apkrova
   - Našumo reikalavimai (CPU, atmintis, įvestis/išvestis)
   - Saugyklos poreikiai ir prieigos modeliai

2. **Aplinkos tipas**
   - Kūrimo/testavimo prieš gamybą
   - Prieinamumo reikalavimai
   - Saugumo ir atitikties poreikiai

3. **Biudžeto apribojimai**
   - Pradinės sąnaudos prieš veiklos sąnaudas
   - Rezervuotos talpos nuolaidos
   - Automatinio skalavimo sąnaudų poveikis

4. **Augimo prognozės**
   - Skalavimo reikalavimai
   - Ateities funkcijų poreikiai
   - Migracijos sudėtingumas

---

## Pasirinkimas pagal aplinką

### Kūrimo aplinka

**Prioritetai**: Sąnaudų optimizavimas, pagrindinė funkcija, paprastas išteklių suteikimas/paėmimas

#### Rekomenduojami SKU
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

#### Charakteristikos
- **App Service**: F1 (Nemokama) arba B1 (Pagrindinė) paprastam testavimui
- **Duomenų bazės**: Pagrindinis lygis su minimaliomis resursų sąnaudomis
- **Saugykla**: Standartinė su vietine atsparumu tik
- **Skaičiavimas**: Leidžiami bendri ištekliai
- **Tinklai**: Pagrindinės konfigūracijos

### Paruošimo/testavimo aplinka

**Prioritetai**: Gamybai artima konfigūracija, kainos balansas, našumo testavimo galimybės

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
- **Našumas**: 70-80 % gamybos pajėgumo
- **Funkcijos**: Dauguma gamybos funkcijų įjungta
- **Atsparumas**: Dalinis geografinis atsparumas
- **Skalavimas**: Ribotas automatinis skalavimas testavimui
- **Stebėsena**: Pilnas stebėjimo paketas

### Gamybinė aplinka

**Prioritetai**: Našumas, prieinamumas, saugumas, atitiktis, skalavimas

#### Rekomenduojami SKU
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

#### Charakteristikos
- **Aukštas prieinamumas**: 99.9%+ SLA reikalavimai
- **Našumas**: Dedikuoti ištekliai, aukštas pralaidumas
- **Saugumas**: Premium saugumo funkcijos
- **Skalavimas**: Pilnas automatinis skalavimas
- **Stebėsena**: Išsami stebėjimo galimybė

---

## Paslaugų specifinės gairės

### Azure App Service

#### SKU sprendimų matrica

| Panaudojimo atvejis | Rekomenduojamas SKU | Priežastis |
|----------|----------------|-----------|
| Kūrimas/testavimas | F1 (Nemokama) arba B1 (Pagrindinė) | Ekonomiškas, tinkamas testavimui |
| Mažos gamybos programos | S1 (Standartinė) | Pasirinktini domenai, SSL, automatinis skalavimas |
| Vidutinės gamybos programos | P1V3 (Premium V3) | Geresnis našumas, daugiau funkcijų |
| Didelio srauto programos | P2V3 arba P3V3 | Dedikuoti ištekliai, aukštas našumas |
| Misijos kritinės programos | I1V2 (Izoliuota V2) | Tinklo izoliacija, dedikuota techninė įranga |

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

**Gamyba**
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

### Azure SQL duomenų bazė

#### SKU pasirinkimo sistema

1. **Pagal DTU (duomenų bazės tranzakcijų vienetai)**
   - **Pagrindinis**: 5 DTU – Kūrimui/testavimui
   - **Standartinis**: S0-S12 (10-3000 DTU) – Bendriems poreikiams
   - **Premium**: P1-P15 (125-4000 DTU) – Našumo kritinėms programoms

2. **Pagal vCore** (rekomenduojama gamybai)
   - **Bendrasis tikslas**: Subalansuotas skaičiavimas ir saugykla
   - **Verslo kritinis**: Mažas delsos laikas, didelis IOPS
   - **Hiperskalė**: Labai skaliuojama saugykla; patikrinkite dabartinius ribojimus ir regioninę palaikymą

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

1. **Pagal vartojimą**
   - Mokėjimas už naudojimą
   - Tinka kūrimui ir kintamiems darbo krūviams
   - Bendras infrastruktūros naudojimas

2. **Dedikuotas (darbo krūvio profiliai)**
   - Dedikuoti skaičiavimo ištekliai
   - Prognozuojamas našumas
   - Geriau gamybos darbo krūviams

#### Konfigūracijos pavyzdžiai

**Kūrimas (pagal vartojimą)**
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

**Gamyba (dedikuotas)**
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

Zoninis atsparumas taip pat reikalauja palaikomų regionų infrastruktūros ir tinkamo VNet/potinklio konfigūracijos, čia neįtraukta. Šiame pavyzdyje numatyti trys dedikuoti mazgai; konfigūruokite bent dvi programų kopijas zonų paskirstymui ir nustatykite kopijų bei mazgų dydį zonų gedimui. Žr. [Container Apps patikimumo gairės](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Norėdami priskirti programą šiam profiliui, nustatykite jos `workloadProfileName: 'production-profile'`; tik sukūrus profilį programos į jį neperkelia.

### Azure Cosmos DB

#### Pralaidumo modeliai

1. **Rankinis pralaidumo rezervavimas**
   - Prognozuojamas našumas
   - Rezervuotos talpos nuolaidos
   - Geriausia stabiliems darbo krūviams

2. **Automatinis pralaidumo skalavimas**
   - Automatinis skalavimas pagal naudojimą
   - Mokėjimas už panaudotą kiekį (su minimu)
   - Tinka kintamiems darbo krūviams

3. **Serverless**
   - Mokėjimas už užklausą
   - Be rezervuoto pralaidumo
   - Idealu kūrimui ir retkarčiais naudojamoms užduotims

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

### Azure saugyklos paskyra

#### Saugyklos paskyros tipai

1. **Standard_LRS** – Kūrimas, nesvarbūs duomenys
2. **Standard_GRS** – Gamyba, reikalinga geografinė atsparumas
3. **Premium_LRS** – Aukšto našumo programėlės
4. **Premium_ZRS** – Aukštas prieinamumas su zoniniu atsparumu

#### Našumo lygiai

- **Standartinis**: Bendrasis tikslas, ekonomiškas
- **Premium**: Aukšto našumo, mažo delsos scenarijai

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

## Sąnaudų optimizavimo strategijos

### 1. Rezervuotos talpos pirkimas

Rezervuokite išteklius 1-3 metams ir gaukite reikšmingas nuolaidas:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Rezervavimo pasiūlymai ir tinkamų išteklių tipai gali skirtis; peržiūrėkite katalogą ir pirkimo sąlygas, o nesitikėkite, kad visos paslaugos/SKU palaiko rezervavimą.

### 2. Tinkama apimtis (Right-Sizing)

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

Įdiekite protingą skalavimą siekiant sąnaudų optimizavimo:

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

### 4. Grafikuotas skalavimas

Skalavimas žemyn ne darbo valandomis:

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

## Našumo aspektai

### Pagrindiniai našumo reikalavimai

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
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### Stebėsena ir optimizavimas

Įdiekite išsamią stebėseną:

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

## Greitos nuorodos lentelės

### App Service SKU greitos nuorodos

| SKU | Lygis | vCPU | RAM | Saugykla | Kainos diapazonas | Panaudojimo atvejis |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Nemokama | Bendras | 1GB | 1GB | Nemokama | Kūrimas |
| B1 | Pagrindinė | 1 | 1.75GB | 10GB | $ | Mažos programėlės |
| S1 | Standartinė | 1 | 1.75GB | 50GB | $$ | Gamyba |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Aukštas našumas |
| I1V2 | Izoliuota V2 | 2 | 8GB | 1TB | $$$$ | Įmonių lygis |

### SQL duomenų bazės SKU greitos nuorodos

| SKU | Lygis | DTU/vCore | Saugykla | Kainos diapazonas | Panaudojimo atvejis |
|-----|------|-----------|---------|-------------|----------|
| Basic | Pagrindinis | 5 DTU | 2GB | $ | Kūrimas |
| S2 | Standartinis | 50 DTU | 250GB | $$ | Maža gamyba |
| P2 | Premium | 250 DTU | 1TB | $$$ | Aukštas našumas |
| GP_Gen5_4 | Bendras tikslas | 4 vCore | 4TB | $$$ | Subalansuotas |
| BC_Gen5_8 | Verslo kritinis | 8 vCore | 4TB | $$$$ | Misijos kritinis |

### Container Apps SKU greitos nuorodos

| Modelis | Kainodara | CPU/Atmintis | Panaudojimo atvejis |
|-------|---------|------------|----------|
| Pagal vartojimą | Mokestis už naudojimą | Palaikomi CPU/atminties deriniai priklauso nuo aplinkos/profilio | Kūrimas arba gamyba, kintamas darbo krūvis |
| Dedikuotas D4 | Apmokestinimas už dedikuotą mazgą | 4 vCPU, 16GiB vienam mazgui | Nuolatinė apkrova/izoliacijos poreikiai |
| Dedikuotas D8 | Apmokestinimas už dedikuotą mazgą | 8 vCPU, 32GiB vienam mazgui | Didesnė nuolatinė apkrova |

---

## Patikrinimo įrankiai

### SKU prieinamumo tikrintuvas

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

### Sąnaudų vertinimo skriptas

**Tik pseudokodas:** `Get-ResourceCost` žemiau yra projektinė funkcija, kurią turite įgyvendinti naudodami esamas regionines/kainų sutarties sąlygas ir naudojimo prielaidas. Tai nėra PowerShell ar Azure komanda.

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

### Našumo patvirtinimas

Žemiau pateiktas YAML yra reikalavimų apžvalga, **ne** Azure Load Testing, JMeter, Locust ar k6 įvesties schema. Prieš naudodami aukščiau esančią apkrovos testavimo komandą, konvertuokite ją į pasirinktą įrankio konfigūraciją.

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

1. **Pradėkite nuo mažo ir didinkite pagal faktinį naudojimą**
2. **Naudokite skirtingus SKU skirtingoms aplinkoms**
3. **Nuolat stebėkite našumą ir sąnaudas**
4. **Gamybos darbams pasinaudokite rezervuota talpa**
5. **Vietose, kur tinka, įgyvendinkite automatinį skalavimą**
6. **Testuokite našumą su realiomis apkrovomis**
7. **Planuokite augimą, bet venkite per daug išteklių rezervavimo**
8. **Kai įmanoma, naudokite nemokamus lygius kūrimui**

### Ko nedaryti

1. **Nenaudokite gamybos SKU kūrimui**
2. **Nenumokite ranka į regiono SKU prieinamumą**
3. **Nepamirškite duomenų perdavimo sąnaudų**
4. **Nerezervuokite per daug išteklių be pagrindo**
5. **Nenumokite ranka į priklausomybių poveikį**
6. **Nekelkite automatinio skalavimo apribojimų per aukštai**
7. **Nepamirškite atitikimo reikalavimų**
8. **Nepasirinkite tik pagal kainą**

---

**Patyręs patarimas**: Naudokitės Azure Cost Management ir Advisor, kad gautumėte suasmenintas rekomendacijas, kaip optimizuoti SKU pasirinkimus pagal faktinius naudojimo modelius.

---

**Navigacija**
- **Ankstesnė pamoka**: [Talpos planavimas](capacity-planning.md)
- **Kita pamoka**: [Išankstiniai patikrinimai](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
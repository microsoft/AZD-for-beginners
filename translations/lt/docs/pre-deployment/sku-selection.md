<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7c000a3a8f4a04aa85c6d35714e3dee0",
  "translation_date": "2025-09-10T06:56:46+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "lt"
}
-->
# SKU Pasirinkimo Vadovas - Kaip Pasirinkti Tinkamus Azure Paslaugų Lygius

## Įvadas

Šis išsamus vadovas padės jums pasirinkti optimalias Azure paslaugų SKU (prekių vienetus) skirtingoms aplinkoms, darbo krūviams ir poreikiams. Sužinokite, kaip analizuoti našumo poreikius, kaštų aspektus ir mastelio reikalavimus, kad pasirinktumėte tinkamiausius paslaugų lygius savo Azure Developer CLI diegimams.

## Mokymosi Tikslai

Baigę šį vadovą, jūs:
- Suprasite Azure SKU sąvokas, kainodaros modelius ir funkcijų skirtumus
- Įvaldysite aplinkai pritaikytas SKU pasirinkimo strategijas kūrimui, testavimui ir gamybai
- Analizuosite darbo krūvių poreikius ir suderinsite juos su tinkamais paslaugų lygiais
- Įgyvendinsite kaštų optimizavimo strategijas per protingą SKU pasirinkimą
- Taikysite našumo testavimo ir validavimo metodus SKU pasirinkimams
- Konfigūruosite automatizuotas SKU rekomendacijas ir stebėjimą

## Mokymosi Rezultatai

Baigę šį vadovą, jūs galėsite:
- Pasirinkti tinkamus Azure paslaugų SKU pagal darbo krūvių poreikius ir apribojimus
- Sukurti ekonomiškai efektyvias daugiaplinkes architektūras su tinkamu lygių pasirinkimu
- Įgyvendinti našumo testavimą ir validavimą SKU pasirinkimams
- Kurti automatizuotus įrankius SKU rekomendacijoms ir kaštų optimizavimui
- Planuoti SKU migracijas ir mastelio strategijas keičiantis poreikiams
- Taikyti Azure Well-Architected Framework principus paslaugų lygių pasirinkimui

## Turinys

- [SKU Supratimas](../../../../docs/pre-deployment)
- [Pasirinkimas Pagal Aplinką](../../../../docs/pre-deployment)
- [Paslaugų Specifinės Rekomendacijos](../../../../docs/pre-deployment)
- [Kaštų Optimizavimo Strategijos](../../../../docs/pre-deployment)
- [Našumo Aspektai](../../../../docs/pre-deployment)
- [Greitos Nuorodų Lentelės](../../../../docs/pre-deployment)
- [Validavimo Įrankiai](../../../../docs/pre-deployment)

---

## SKU Supratimas

### Kas yra SKU?

SKU (prekių vienetai) atspindi skirtingus Azure paslaugų lygius ir našumo lygius. Kiekvienas SKU siūlo skirtingus:

- **Našumo parametrus** (CPU, atmintis, pralaidumas)
- **Funkcijų prieinamumą** (mastelio galimybės, SLA lygiai)
- **Kainodaros modelius** (pagal naudojimą, rezervuota talpa)
- **Regioninį prieinamumą** (ne visi SKU prieinami visuose regionuose)

### Pagrindiniai Veiksniai Renkantis SKU

1. **Darbo Krūvių Poreikiai**
   - Tikėtini srauto/krūvio modeliai
   - Našumo poreikiai (CPU, atmintis, I/O)
   - Saugojimo poreikiai ir prieigos modeliai

2. **Aplinkos Tipas**
   - Kūrimas/testavimas vs. gamyba
   - Prieinamumo reikalavimai
   - Saugumo ir atitikties poreikiai

3. **Biudžeto Apribojimai**
   - Pradinės išlaidos vs. veiklos išlaidos
   - Rezervuotos talpos nuolaidos
   - Automatinio mastelio kaštų poveikis

4. **Augimo Prognozės**
   - Mastelio poreikiai
   - Būsimos funkcijų reikmės
   - Migracijos sudėtingumas

---

## Pasirinkimas Pagal Aplinką

### Kūrimo Aplinka

**Prioritetai**: Kaštų optimizavimas, pagrindinė funkcionalumas, lengvas paruošimas/pašalinimas

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
- **App Service**: F1 (nemokamas) arba B1 (pagrindinis) paprastam testavimui
- **Duomenų Bazės**: Pagrindinis lygis su minimaliais resursais
- **Saugykla**: Standartinė su vietiniu pertekliniu saugojimu
- **Skaičiavimai**: Bendri resursai priimtini
- **Tinklas**: Pagrindinės konfigūracijos

### Testavimo Aplinka

**Prioritetai**: Konfigūracija artima gamybai, kaštų ir našumo balansas

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
- **Našumas**: 70-80% gamybos pajėgumų
- **Funkcijos**: Dauguma gamybos funkcijų įjungtos
- **Perteklinis saugojimas**: Kai kuri geografinė perteklė
- **Mastelis**: Ribotas automatinis mastelis testavimui
- **Stebėjimas**: Pilnas stebėjimo rinkinys

### Gamybos Aplinka

**Prioritetai**: Našumas, prieinamumas, saugumas, atitiktis, mastelio galimybės

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
- **Aukštas prieinamumas**: 99.9%+ SLA reikalavimai
- **Našumas**: Dedikuoti resursai, didelis pralaidumas
- **Saugumas**: Aukščiausio lygio saugumo funkcijos
- **Mastelis**: Pilnos automatinio mastelio galimybės
- **Stebėjimas**: Išsamus stebėjimas

---

## Paslaugų Specifinės Rekomendacijos

### Azure App Service

#### SKU Sprendimų Matrica

| Naudojimo Atvejis | Rekomenduojamas SKU | Pagrindimas |
|-------------------|---------------------|-------------|
| Kūrimas/Testavimas | F1 (nemokamas) arba B1 (pagrindinis) | Ekonomiškas, pakankamas testavimui |
| Mažos gamybos programos | S1 (standartinis) | Tinkinti domenai, SSL, automatinis mastelis |
| Vidutinės gamybos programos | P1V3 (Premium V3) | Geresnis našumas, daugiau funkcijų |
| Didelio srauto programos | P2V3 arba P3V3 | Dedikuoti resursai, aukštas našumas |
| Kritinės programos | I1V2 (Isolated V2) | Tinklo izoliacija, dedikuota įranga |

#### Konfigūracijos Pavyzdžiai

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

### Azure SQL Duomenų Bazė

#### SKU Pasirinkimo Sistema

1. **DTU pagrindu (Duomenų Bazės Transakcijų Vienetai)**
   - **Pagrindinis**: 5 DTU - Kūrimas/testavimas
   - **Standartinis**: S0-S12 (10-3000 DTU) - Bendros paskirties
   - **Premium**: P1-P15 (125-4000 DTU) - Kritinio našumo

2. **vCore pagrindu** (Rekomenduojama gamybai)
   - **Bendros paskirties**: Subalansuoti skaičiavimai ir saugykla
   - **Kritinis verslui**: Maža delsena, didelis IOPS
   - **Hyperscale**: Labai mastelio saugykla (iki 100TB)

#### Konfigūracijų Pavyzdžiai

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

#### Aplinkos Tipai

1. **Pagal Naudojimą**
   - Mokestis už naudojimą
   - Tinka kūrimui ir kintamiems darbo krūviams
   - Bendroji infrastruktūra

2. **Dedikuota (Darbo Profiliai)**
   - Dedikuoti skaičiavimo resursai
   - Prognozuojamas našumas
   - Geriau gamybos darbo krūviams

#### Konfigūracijų Pavyzdžiai

**Kūrimas (Pagal Naudojimą)**
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

**Gamyba (Dedikuota)**
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

#### Pralaidumo Modeliai

1. **Rankiniu būdu Nustatytas Pralaidumas**
   - Prognozuojamas našumas
   - Rezervuotos talpos nuolaidos
   - Geriausia pastoviems darbo krūviams

2. **Automatinis Pralaidumo Nustatymas**
   - Automatinis mastelis pagal naudojimą
   - Mokestis už naudojimą (su minimaliu)
   - Tinka kintamiems darbo krūviams

3. **Serverless**
   - Mokestis už užklausą
   - Nėra nustatyto pralaidumo
   - Idealu kūrimui ir protarpiniams darbo krūviams

#### SKU Pavyzdžiai

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

### Azure Saugyklos Paskyra

#### Saugyklos Paskyrų Tipai

1. **Standard_LRS** - Kūrimas, nekritiniai duomenys
2. **Standard_GRS** - Gamyba, reikalingas geografinis perteklė
3. **Premium_LRS** - Aukšto našumo programos
4. **Premium_ZRS** - Aukštas prieinamumas su zoniniu perteklumu

#### Našumo Lygiai

- **Standartinis**: Bendros paskirties, ekonomiškas
- **Premium**: Aukšto našumo, mažos delsos scenarijai

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

## Kaštų Optimizavimo Strategijos

### 1. Rezervuota Talpa

Rezervuokite resursus 1-3 metams, kad gautumėte reikšmingas nuolaidas:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Tinkamo Dydžio Parinkimas

Pradėkite nuo mažesnių SKU ir masteliuokite pagal faktinį naudojimą:

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

### 3. Automatinio Mastelio Konfigūracija

Įgyvendinkite protingą mastelį kaštų optimizavimui:

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

### 4. Planuotas Mastelis

Masteliuokite žemyn ne darbo valandomis:

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

## Našumo Aspektai

### Pagrindiniai Našumo Reikalavimai

Aiškiai apibrėžkite našumo reikalavimus prieš SKU pasirinkimą:

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

### Apkrovos Testavimas

Testuokite skirtingus SKU, kad patvirtintumėte našumą:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Stebėjimas ir Optimizavimas

Įdiekite išsamų stebėjimą:

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

## Greitos Nuorodų Lentelės

### App Service SKU Greita Nuoroda

| SKU | Lygis | vCPU | RAM | Saugykla | Kainų Diapazonas | Naudojimo Atvejis |
|-----|-------|------|-----|----------|------------------|-------------------|
| F1 | Nemokamas | Bendras | 1GB | 1GB | Nemokamas | Kūrimas |
| B1 | Pagrindinis | 1 | 1.75GB | 10GB | $ | Mažos programos |
| S1 | Standartinis | 1 | 1.75GB | 50GB | $$ | Gamyba |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Aukštas našumas |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Įmonės |

### SQL Duomenų Bazės SKU Greita Nuoroda

| SKU | Lygis | DTU/vCore | Saugykla | Kainų Diapazonas | Naudojimo Atvejis |
|-----|-------|-----------|----------|------------------|-------------------|
| Pagrindinis | Pagrindinis | 5 DTU | 2GB | $ | Kūrimas |
| S2 | Standartinis | 50 DTU | 250GB | $$ | Maža gamyba |
| P2 | Premium | 250 DTU | 1TB | $$$ | Aukštas našumas |
| GP_Gen5_4 | Bendros paskirties | 4 vCore | 4TB | $$$ | Subalansuotas |
| BC_Gen5_8 | Kritinis verslui | 8 vCore | 4TB | $$$$ | Kritinis |

### Container Apps SKU Greita Nuoroda

| Modelis | Kainodara | CPU/Atmintis | Naudojimo Atvejis |
|---------|-----------|--------------|-------------------|
| Pagal Naudojimą | Mokestis už naudojimą | 0.25-2 vCPU | Kūrimas, kintamas krūvis |
| Dedikuotas D4 | Rezervuotas | 4 vCPU, 16GB | Gamyba |
| Dedikuotas D8 | Rezervuotas | 8 vCPU, 32GB | Aukštas našumas |

---

## Validavimo Įrankiai

### SKU Prieinamumo Tikrintuvas

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

### Kaštų Įvertinimo Skriptas

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

### Našumo Validacija

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

## Geriausios Praktikos Santrauka

### Darykite

1. **Pradėkite nuo mažo ir masteliuokite aukštyn** pagal faktinį naudojimą
2. **Naudokite skirtingus SKU skirtingoms aplinkoms**
3. **Nuolat stebėkite našumą ir kaštus**
4. **Naudokite rezervuotą talpą gamybos darbo krūviams**
5. **Įgyvendinkite automatinį mastelį, kur tinkama**
6. **Testuokite našumą su realistiškais darbo krūviais**
7. **Planuokite augimą, bet venkite per didelio resursų skyrimo**
8. **Naudokite nemokamus lygius kūrimui, kai įmanoma**

### Nedarykite

1. **Nenaudokite gamybos SKU kūrimui**
2. **Nepamirškite regioninio SKU prieinamumo**
3. **Nepamirškite duomenų perdavimo kaštų**
4. **Neskirkite per daug resursų be pagrindimo**
5. **Nepamirškite priklausomybių poveikio**
6. **Nenustatykite automatinio mastelio ribų per aukštai**
7. **Nepamirškite atitikties reikalavimų**
8. **Nesirinkite tik pagal kainą**

---

**Profesionalo Patarimas**: Naudokite Azure Cost Management ir Advisor, kad gautumėte personalizuotas rekomendacijas SKU pasirinkimui optimizuoti pagal faktinius naudojimo modelius.

---

**Navigacija**
- **Ankstesnė Pamoka**: [Talpos Planavimas](capacity-planning.md)
- **Kita Pamoka**: [Priešskrydžio Patikrinimai](preflight-checks.md)

---

**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus interpretavimus, atsiradusius dėl šio vertimo naudojimo.
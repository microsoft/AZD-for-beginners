# Vodič za odabir SKU-ova - Odabir odgovarajućih razina usluga za Azure

**Navigacija poglavljima:**
- **📚 Početna tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 6 - Provjera i planiranje prije implementacije
- **⬅️ Prethodno**: [Planiranje kapaciteta](capacity-planning.md)
- **➡️ Sljedeće**: [Preflight Checks](preflight-checks.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 7: Rješavanje problema](../chapter-07-troubleshooting/common-issues.md)

## Uvod

Ovaj sveobuhvatni vodič pomaže vam odabrati optimalne Azure SKU-ove (Stock Keeping Units) za različita okruženja, radna opterećenja i zahtjeve. Naučite kako analizirati potrebe za performansama, financijske aspekte i zahtjeve za skalabilnošću kako biste odabrali najprikladnije razine usluga za vaše implementacije pomoću Azure Developer CLI-a.

## Ciljevi učenja

Po završetku ovog vodiča, moći ćete:
- Razumjeti koncepte SKU-ova, modele cijena i razlike u značajkama
- Savladati strategije odabira SKU-ova specifičnih za okruženje za razvoj, staging i produkciju
- Analizirati zahtjeve radnog opterećenja i uskladiti ih s odgovarajućim razinama usluga
- Implementirati strategije optimizacije troškova kroz inteligentan odabir SKU-ova
- Primijeniti tehnike testiranja performansi i validacije za odabir SKU-ova
- Konfigurirati automatizirane preporuke SKU-ova i nadzor

## Ishodi učenja

Nakon završetka, moći ćete:
- Odabrati odgovarajuće Azure SKU-ove na temelju zahtjeva i ograničenja radnog opterećenja
- Dizajnirati isplative arhitekture s više okruženja uz odgovarajući odabir razina
- Implementirati usporedna testiranja performansi i validaciju za odabrane SKU-ove
- Kreirati automatizirane alate za preporuke SKU-ova i optimizaciju troškova
- Planirati migracije SKU-ova i strategije skaliranja za promjenjive zahtjeve
- Primijeniti principe Azure Well-Architected Frameworka pri odabiru razina usluga

## Sadržaj

- [Understanding SKUs](../../../../docs/chapter-06-pre-deployment)
- [Environment-Based Selection](../../../../docs/chapter-06-pre-deployment)
- [Service-Specific Guidelines](../../../../docs/chapter-06-pre-deployment)
- [Cost Optimization Strategies](../../../../docs/chapter-06-pre-deployment)
- [Performance Considerations](../../../../docs/chapter-06-pre-deployment)
- [Quick Reference Tables](../../../../docs/chapter-06-pre-deployment)
- [Validation Tools](../../../../docs/chapter-06-pre-deployment)

---

## Understanding SKUs

### Što su SKU-ovi?

SKU-ovi (Stock Keeping Units) predstavljaju različite razine usluga i razine performansi za Azure resurse. Svaki SKU nudi različito:

- **Karakteristike performansi** (CPU, memorija, propusnost)
- **Dostupnost značajki** (opcije skaliranja, razine SLA-e)
- **Modeli cijena** (na temelju potrošnje, rezervirani kapacitet)
- **Regionalna dostupnost** (nisu svi SKU-ovi dostupni u svim regijama)

### Ključni čimbenici pri odabiru SKU-a

1. **Zahtjevi radnog opterećenja**
   - Očekivani promet/uzorci opterećenja
   - Zahtjevi za performansama (CPU, memorija, I/O)
   - Potrebe za pohranom i obrasci pristupa

2. **Vrsta okruženja**
   - Razvoj/testiranje naspram produkcije
   - Zahtjevi dostupnosti
   - Sigurnosne i usklađenosti potrebe

3. **Ograničenja budžeta**
   - Početni troškovi naspram operativnih troškova
   - Popusti za rezervirani kapacitet
   - Posljedice automatskog skaliranja na troškove

4. **Projekcije rasta**
   - Zahtjevi za skalabilnošću
   - Potrebe za budućim značajkama
   - Kompleksnost migracije

---

## Environment-Based Selection

### Razvojno okruženje

**Prioriteti**: Optimizacija troškova, osnovna funkcionalnost, jednostavno provisioniranje/deprovisioniranje

#### Preporučeni SKU-ovi
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

#### Karakteristike
- **App Service**: F1 (Besplatno) ili B1 (Osnovno) za jednostavno testiranje
- **Baze podataka**: Osnovni sloj s minimalnim resursima
- **Pohrana**: Standardno s lokalnom redundancijom
- **Računalstvo**: Dijeljeni resursi prihvatljivi
- **Mreža**: Osnovne konfiguracije

### Staging/Testiranje okruženje

**Prioriteti**: Konfiguracija slična produkciji, balans troškova, mogućnost testiranja performansi

#### Preporučeni SKU-ovi
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

#### Karakteristike
- **Performanse**: 70-80% produkcijskog kapaciteta
- **Značajke**: Većina produkcijskih značajki omogućena
- **Redundancija**: Djelomična geografska redundancija
- **Skaliranje**: Ograničeno automatsko skaliranje za testiranje
- **Nadzor**: Potpuni paket nadzora

### Produkcijsko okruženje

**Prioriteti**: Performanse, dostupnost, sigurnost, usklađenost, skalabilnost

#### Preporučeni SKU-ovi
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

#### Karakteristike
- **Visoka dostupnost**: Zahtjevi SLA-e od 99.9%+
- **Performanse**: Namjenski resursi, visoka propusnost
- **Sigurnost**: Premium sigurnosne značajke
- **Skaliranje**: Puna mogućnost automatskog skaliranja
- **Nadzor**: Sveobuhvatna promatljivost

---

## Service-Specific Guidelines

### Azure App Service

#### Matrica odluke o SKU-ovima

| Primjena | Preporučeni SKU | Obrazloženje |
|----------|----------------|-----------|
| Razvoj/Testiranje | F1 (Besplatno) ili B1 (Osnovno) | Isplativo, dovoljno za testiranje |
| Male produkcijske aplikacije | S1 (Standardno) | Prilagođene domene, SSL, automatsko skaliranje |
| Srednje produkcijske aplikacije | P1V3 (Premium V3) | Bolja izvedba, više značajki |
| Aplikacije s velikim prometom | P2V3 ili P3V3 | Namjenski resursi, visoke performanse |
| Aplikacije kritične za poslovanje | I1V2 (Isolated V2) | Izolacija mreže, namjenska oprema |

#### Primjeri konfiguracija

**Razvoj**
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

#### Okvir za odabir SKU-a

1. **DTU-based (Database Transaction Units)**
   - **Basic**: 5 DTU - Razvoj/testiranje
   - **Standard**: S0-S12 (10-3000 DTU) - Opće namjene
   - **Premium**: P1-P15 (125-4000 DTU) - Kritično za performanse

2. **vCore-based** (Preporučeno za produkciju)
   - **General Purpose**: Uravnoteženo računanje i pohrana
   - **Business Critical**: Niska latencija, visok IOPS
   - **Hyperscale**: Visoko skalabilna pohrana (do 100TB)

#### Primjeri konfiguracija

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

#### Vrste okruženja

1. **Na temelju potrošnje**
   - Plaćanje po korištenju
   - Pogodno za razvoj i varijabilna opterećenja
   - Dijeljena infrastruktura

2. **Namjenski (Workload Profiles)**
   - Namjenski računalni resursi
   - Predvidljive performanse
   - Bolje za produkcijska opterećenja

#### Primjeri konfiguracija

**Razvoj (potrošnja)**
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

**Produkcija (namjenski)**
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

#### Modeli propusnosti

1. **Manualno provisionirana propusnost**
   - Predvidljive performanse
   - Popusti za rezervirani kapacitet
   - Najbolje za stabilna opterećenja

2. **Autoscale provisionirana propusnost**
   - Automatsko skaliranje na temelju korištenja
   - Plaćate prema potrošnji (s minimalom)
   - Dobra za varijabilna opterećenja

3. **Serverless**
   - Plaćanje po zahtjevu
   - Nema provisionirane propusnosti
   - Idealno za razvoj i prekinuta opterećenja

#### Primjeri SKU-ova

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

#### Vrste storage računa

1. **Standard_LRS** - Razvoj, nekritični podaci
2. **Standard_GRS** - Produkcija, potrebna geo-redundancija
3. **Premium_LRS** - Aplikacije visokih performansi
4. **Premium_ZRS** - Visoka dostupnost s zonalnom redundancijom

#### Tiers performansi

- **Standardno**: Opće namjene, isplativo
- **Premium**: Visoke performanse, scenariji s niskom latencijom

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

## Strategije optimizacije troškova

### 1. Rezervirani kapacitet

Rezervirajte resurse na 1-3 godine za značajne popuste:

```bash
# Provjerite opcije rezervacije
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Prilagođavanje veličine

Počnite s manjim SKU-ovima i skalirajte prema stvarnoj upotrebi:

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

### 3. Konfiguracija automatskog skaliranja

Implementirajte inteligentno skaliranje za optimizaciju troškova:

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

### 4. Zakazano skaliranje

Smanjite kapacitete izvan radnog vremena:

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

## Razmatranja performansi

### Osnovni zahtjevi performansi

Definirajte jasne zahtjeve performansi prije odabira SKU-a:

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

### Testiranje opterećenja

Testirajte različite SKU-ove kako biste potvrdili performanse:

```bash
# Azure usluga za testiranje opterećenja
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Nadzor i optimizacija

Postavite sveobuhvatan nadzor:

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

## Brze referentne tablice

### Brza referenca za App Service SKU-ove

| SKU | Razina | vCPU | RAM | Pohrana | Raspon cijena | Primjena |
|-----|--------|------|-----|---------|---------------|----------|
| F1 | Besplatno | Dijeljeno | 1GB | 1GB | Besplatno | Razvoj |
| B1 | Osnovno | 1 | 1.75GB | 10GB | $ | Male aplikacije |
| S1 | Standardno | 1 | 1.75GB | 50GB | $$ | Produkcija |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Visoke performanse |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### Brza referenca za SQL Database SKU-ove

| SKU | Razina | DTU/vCore | Pohrana | Raspon cijena | Primjena |
|-----|--------|-----------|---------|---------------|----------|
| Basic | Osnovno | 5 DTU | 2GB | $ | Razvoj |
| S2 | Standardno | 50 DTU | 250GB | $$ | Mala produkcija |
| P2 | Premium | 250 DTU | 1TB | $$$ | Visoke performanse |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Uravnoteženo |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Kritično za poslovanje |

### Brza referenca za Container Apps SKU-ove

| Model | Cijena | CPU/Memorija | Primjena |
|-------|--------|--------------|----------|
| Consumption | Plaćanje po korištenju | 0.25-2 vCPU | Razvoj, varijabilno opterećenje |
| Dedicated D4 | Rezervirano | 4 vCPU, 16GB | Produkcija |
| Dedicated D8 | Rezervirano | 8 vCPU, 32GB | Visoke performanse |

---

## Alati za provjeru

### Provjeritelj dostupnosti SKU-ova

```bash
#!/bin/bash
# Provjeri dostupnost SKU-a u ciljanoj regiji

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

# Upotreba
check_sku_availability "eastus" "app-service" "P1V3"
```

### Skripta za procjenu troškova

```powershell
# PowerShell skripta za procjenu troškova
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
        
        # Koristite Azure Pricing API ili kalkulator
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Korištenje
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### Validacija performansi

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

## Sažetak najboljih praksi

### Što raditi

1. **Počnite malo i skalirajte gore** na temelju stvarne upotrebe
2. **Koristite različite SKU-ove za različita okruženja**
3. **Kontinuirano pratite performanse i troškove**
4. **Iskoristite rezervirani kapacitet za produkcijska opterećenja**
5. **Implementirajte automatsko skaliranje gdje je primjereno**
6. **Testirajte performanse s realističnim opterećenjima**
7. **Planirajte rast, ali izbjegavajte prekomjerno provisioniranje**
8. **Koristite besplatne razine za razvoj kad je moguće**

### Što ne raditi

1. **Ne koristite produkcijske SKU-ove za razvoj**
2. **Ne ignorirajte regionalnu dostupnost SKU-ova**
3. **Ne zaboravite troškove prijenosa podataka**
4. **Ne prekomjerno provisionirajte bez opravdanja**
5. **Ne zanemarujte utjecaj ovisnosti**
6. **Ne postavljajte prevelike granice automatskog skaliranja**
7. **Ne zaboravite na zahtjeve usklađenosti**
8. **Ne donosite odluke isključivo na temelju cijene**

---

**Savjet**: Koristite Azure Cost Management i Advisor kako biste dobili personalizirane preporuke za optimizaciju odabira SKU-ova na temelju stvarnih obrazaca korištenja.

---

**Navigacija**
- **Prethodna lekcija**: [Planiranje kapaciteta](capacity-planning.md)
- **Sljedeća lekcija**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Odricanje odgovornosti:
Ovaj je dokument preveden pomoću AI prevoditeljskog servisa Co-op Translator (https://github.com/Azure/co-op-translator). Iako nastojimo biti točni, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba se smatrati mjerodavnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakve nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
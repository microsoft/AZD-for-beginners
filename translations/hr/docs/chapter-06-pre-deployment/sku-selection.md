# Vodič za odabir SKU-a - Odabir pravih Azure uslužnih slojeva

**Navigacija poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 6 - Validacija i planiranje prije implementacije
- **⬅️ Prethodno**: [Planiranje kapaciteta](capacity-planning.md)
- **➡️ Sljedeće**: [Provjere prije polijetanja](preflight-checks.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 7: Rješavanje problema](../chapter-07-troubleshooting/common-issues.md)

## Uvod

Ovaj detaljan vodič pomaže vam u odabiru optimalnih Azure uslužnih SKU-ova (jedinica za praćenje zaliha) za različita okruženja, radna opterećenja i zahtjeve. Naučite kako analizirati potrebe za performansama, troškovne čimbenike i zahtjeve za skalabilnošću kako biste odabrali najprikladnije uslužne slojeve za svoje Azure Developer CLI okoline.

## Ciljevi učenja

Završetkom ovog vodiča ćete:
- Razumjeti koncepte Azure SKU-a, modele cijena i razlike u značajkama
- Ovladati strategijama odabira SKU-a prilagođenim okruženju za razvoj, testiranje i produkciju
- Analizirati zahtjeve radnog opterećenja i uskladiti ih s odgovarajućim uslužnim slojevima
- Implementirati strategije optimizacije troškova kroz pametan odabir SKU-a
- Primijeniti metode testiranja performansi i validacije odabira SKU-a
- Konfigurirati automatizirane preporuke i nadzor SKU-a

## Ishodi učenja

Nakon završetka, moći ćete:
- Odabrati prikladne Azure uslužne SKU-ove temeljeno na zahtjevima i ograničenjima radnog opterećenja
- Dizajnirati isplative višekratne okoline s pravilnim odabirom slojeva
- Provesti testiranje performansi i validaciju za odabir SKU-a
- Kreirati automatizirane alate za preporuke SKU-a i optimizaciju troškova
- Planirati migracije SKU-a i strategije skaliranja za promjenjive zahtjeve
- Primijeniti principe Azure Well-Architected Frameworka pri odabiru uslužnog sloja

## Pregled sadržaja

- [Razumijevanje SKU-ova](#understanding-skus)
- [Odabir temeljen na okruženju](#environment-based-selection)
- [Smjernice specifične za uslugu](#service-specific-guidelines)
- [Strategije za optimizaciju troškova](#cost-optimization-strategies)
- [Razmatranja performansi](#performance-considerations)
- [Brze referentne tablice](#quick-reference-tables)
- [Alati za validaciju](#validation-tools)

---

## Razumijevanje SKU-ova

> **Primjer opsega:** YAML mape SKU-ova i konfiguracije performansi u nastavku su dizajnerske bilješke, a ne `azure.yaml` shema ili konfiguracija alata za opterećenje. Bicep blokovi su alternative/fragmenti: definirajte njihove parametre i nadređene resurse, koristite jedinstvene simboličke nazive pri kombiniranju i povežite module u funkcionalni projekt. Cijene, ograničenja te regionalna/sku dostupnost treba provjeriti za vašu pretplatu prije implementacije.

### Što su SKU-ovi?

SKU-ovi (jedinice za praćenje zaliha) predstavljaju različite uslužne slojeve i razine performansi za Azure resurse. Svaki SKU nudi različite:

- **Karakteristike performansi** (CPU, memorija, propusnost)
- **Dostupnost značajki** (opcije skaliranja, razine SLA)
- **Modeli cijena** (na potrošnju, rezervirani kapacitet)
- **Regionalna dostupnost** (nisu svi SKU-ovi dostupni u svim regijama)

### Ključni čimbenici u odabiru SKU-a

1. **Zahtjevi radnog opterećenja**
   - Očekivani promet/uzorci opterećenja
   - Zahtjevi za performansama (CPU, memorija, I/O)
   - Potrebe za pohranom i obrasci pristupa

2. **Vrsta okruženja**
   - Razvoj/testiranje nasuprot produkciji
   - Zahtjevi za dostupnost
   - Sigurnosne i usklađenosti potrebe

3. **Budžetska ograničenja**
   - Početni troškovi nasuprot operativnim troškovima
   - Popusti za rezervirani kapacitet
   - Troškovi automatskog skaliranja

4. **Projekcije rasta**
   - Zahtjevi skalabilnosti
   - Potrebe za budućim značajkama
   - Kompleksnost migracije

---

## Odabir temeljen na okruženju

### Razvojno okruženje

**Prioriteti**: Optimizacija troškova, osnovna funkcionalnost, jednostavna priprema i ukidanje

#### Preporučeni SKU-ovi
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

#### Značajke
- **App Service**: F1 (Besplatno) ili B1 (Osnovno) za jednostavno testiranje
- **Baze podataka**: Osnovni sloj s minimalnim resursima
- **Pohrana**: Standardna s lokalnom redundancijom
- **Računanje**: Dijeljeni resursi prihvatljivi
- **Mreža**: Osnovne konfiguracije

### Okruženje za postavljanje/testiranje

**Prioriteti**: Konfiguracija slična produkciji, uravnoteženost troškova, mogućnost testiranja performansi

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

#### Značajke
- **Performanse**: 70-80% kapaciteta produkcije
- **Značajke**: Većina značajki produkcije omogućena
- **Redundancija**: Djelomična geografska redundancija
- **Skaliranje**: Ograničeno automatsko skaliranje za testiranje
- **Nadzor**: Potpuni nadzor

### Produkcijsko okruženje

**Prioriteti**: Performanse, dostupnost, sigurnost, usklađenost, skalabilnost

#### Preporučeni SKU-ovi
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

#### Značajke
- **Visoka dostupnost**: Zahtjevi SLA-a 99,9%+
- **Performanse**: Namjenski resursi, visoka propusnost
- **Sigurnost**: Premium sigurnosne značajke
- **Skaliranje**: Potpune mogućnosti automatskog skaliranja
- **Nadzor**: Sveobuhvatna vidljivost

---

## Smjernice specifične za uslugu

### Azure App Service

#### Matrica odluke o SKU-u

| Primjer upotrebe | Preporučeni SKU | Obrazloženje |
|-----------------|-----------------|-------------|
| Razvoj/Testiranje | F1 (Besplatno) ili B1 (Osnovno) | Isplativo, dovoljno za testiranje |
| Male produkcijske aplikacije | S1 (Standard) | Prilagođene domene, SSL, automatsko skaliranje |
| Srednje produkcijske aplikacije | P1V3 (Premium V3) | Bolje performanse, više značajki |
| Aplikacije s velikim prometom | P2V3 ili P3V3 | Namjenski resursi, visoke performanse |
| Aplikacije kritične za misiju | I1V2 (Izolirani V2) | Mrežna izolacija, namjenski hardver |

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

### Azure SQL baza podataka

#### Okvir za odabir SKU-a

1. **DTU-bazirano (Database Transaction Units)**
   - **Osnovno**: 5 DTU - razvoj/testiranje
   - **Standardno**: S0-S12 (10-3000 DTU) - opća namjena
   - **Premium**: P1-P15 (125-4000 DTU) - za kritične performanse

2. **vCore-bazirano** (preporučeno za produkciju)
   - **Opća namjena**: uravnoteženi računski kapacitet i pohrana
   - **Poslovno kritično**: niska latencija, visoke IOPS
   - **Hyperscale**: visoko skalabilna pohrana; provjerite trenutna ograničenja veličine i regionalnu podršku

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

1. **Na bazi potrošnje**
   - Plaćanje po korištenju
   - Prikladno za razvoj i promjenjiva opterećenja
   - Dijeljena infrastruktura

2. **Namjenski (profili radnog opterećenja)**
   - Namjenski računski resursi
   - Predvidive performanse
   - Bolje za produkcijsko opterećenje

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

**Produkcija (namjenski)**
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

Zona redundancije također zahtijeva infrastrukturu u podržanoj regiji i odgovarajuću konfiguraciju VNet/podmreže, što je ovdje izostavljeno. Ovaj primjer planira tri namjenska čvora; konfigurirajte najmanje dvije replike aplikacije za unakrsnu distribuciju po zonama i prilagodite veličinu replika i čvorova za moguće neuspjehe zone. Pogledajte [smjernice za pouzdanost Container Apps](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Za postavljanje aplikacije na ovaj profil, postavite njen `workloadProfileName: 'production-profile'`; samo stvaranje profila ne premješta aplikacije na njega.

### Azure Cosmos DB

#### Modeli propusnosti

1. **Ručno dodijeljena propusnost**
   - Predvidive performanse
   - Popusti za rezervirani kapacitet
   - Najbolje za stabilna opterećenja

2. **Automatski skalirana propusnost**
   - Automatsko skaliranje prema upotrebi
   - Plaćate prema stvarnoj potrošnji (uz minimalno)
   - Dobro za promjenjiva opterećenja

3. **Serverless**
   - Plaćanje po zahtjevu
   - Bez rezervirane propusnosti
   - Idealno za razvoj i povremena opterećenja

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

### Azure Storage račun

#### Vrste Storage računa

1. **Standard_LRS** - razvoj, nekritični podaci
2. **Standard_GRS** - produkcija, potrebna geo-redundancija
3. **Premium_LRS** - aplikacije s visokim performansama
4. **Premium_ZRS** - visoka dostupnost sa zonskom redundancijom

#### Slojevi performansi

- **Standardni**: opća namjena, isplativo
- **Premium**: visokih performansi, scenariji s niskom latencijom

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
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Ponude rezervacija i vrste prihvatljivih resursa variraju; provjerite katalog i uvjete kupnje umjesto pretpostavke da svaki servis/SKU podržava rezervaciju.

### 2. Pravilna veličina

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

### 4. Planirano skaliranje

Skalirajte prema dolje tijekom neaktivnih sati:

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

Testirajte različite SKU-ove za validaciju performansi:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### Nadzor i optimizacija

Postavite sveobuhvatan sustav nadzora:

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

## Brze referentne tablice

### Brza referenca za App Service SKU-ove

| SKU | Sloj | vCPU | RAM | Pohrana | Raspon cijena | Primjer upotrebe |
|-----|------|------|-----|---------|-------------|-----------------|
| F1 | Besplatno | Dijeljeno | 1GB | 1GB | Besplatno | Razvoj |
| B1 | Osnovno | 1 | 1.75GB | 10GB | $ | Male aplikacije |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Produkcija |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Visoke performanse |
| I1V2 | Izolirani V2 | 2 | 8GB | 1TB | $$$$ | Poduzeće |

### Brza referenca za SQL Database SKU-ove

| SKU | Sloj | DTU/vCore | Pohrana | Raspon cijena | Primjer upotrebe |
|-----|------|-----------|---------|-------------|-----------------|
| Basic | Osnovno | 5 DTU | 2GB | $ | Razvoj |
| S2 | Standard | 50 DTU | 250GB | $$ | Mala produkcija |
| P2 | Premium | 250 DTU | 1TB | $$$ | Visoke performanse |
| GP_Gen5_4 | Opća namjena | 4 vCore | 4TB | $$$ | Uravnoteženo |
| BC_Gen5_8 | Poslovno kritično | 8 vCore | 4TB | $$$$ | Kritično za misiju |

### Brza referenca za Container Apps SKU-ove

| Model | Cijena | CPU/Memorija | Primjer upotrebe |
|-------|--------|--------------|-----------------|
| Potrošnja | Plaćanje po korištenju | Podržane kombinacije CPU/memorije ovise o okruženju/profilu | Razvoj ili produkcija, promjenjivo opterećenje |
| Namjenski D4 | Fakturiranje po namjenskom čvoru | 4 vCPU, 16GiB po čvoru | Potrebe za trajnim opterećenjem/izolacijom |
| Namjenski D8 | Fakturiranje po namjenskom čvoru | 8 vCPU, 32GiB po čvoru | Veće trajno opterećenje |

---

## Alati za validaciju

### Provjera dostupnosti SKU-a

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

### Skripta za procjenu troškova

**Samo pseudokod:** `Get-ResourceCost` u nastavku je funkcija specifična za projekt koju morate implementirati koristeći aktualne regionalne/cjenovne ugovore i pretpostavke o upotrebi. Nije PowerShell ni Azure cmdlet.

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

### Validacija performansi

Sljedeći YAML je skica zahtjeva, **ne** ulazna shema za Azure Load Testing, JMeter, Locust ili k6. Prije uporabe naredbe za test opterećenja prevedite ga u stvarnu konfiguraciju odabranog alata.

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

### Što treba raditi

1. **Počnite s malim i skalirajte prema gore** prema stvarnoj upotrebi
2. **Koristite različite SKU-ove za različita okruženja**
3. **Neprestano pratite performanse i troškove**
4. **Iskoristite rezervirani kapacitet za produkcijska opterećenja**
5. **Implementirajte automatsko skaliranje gdje je primjereno**
6. **Testirajte performanse s realnim opterećenjima**
7. **Planirajte rast, ali izbjegavajte prekomjernu pripremu**
8. **Koristite besplatne slojeve za razvoj kad je moguće**

### Što treba izbjegavati

1. **Nemojte koristiti produkcijske SKU-ove za razvoj**
2. **Nemojte zanemariti regionalnu dostupnost SKU-ova**
3. **Nemojte zaboraviti na troškove prijenosa podataka**
4. **Nemojte prekomjerno pripremati bez opravdanja**
5. **Nemojte zanemariti utjecaj ovisnosti**
6. **Nemojte postavljati previše visoke limite automatskog skaliranja**
7. **Nemojte zaboraviti zahtjeve usklađenosti**
8. **Nemojte donositi odluke samo na temelju cijene**

---

**Profesionalni savjet**: Koristite Azure Cost Management i Advisor za dobivanje personaliziranih preporuka za optimizaciju odabira SKU-ova temeljenih na stvarnim obrascima korištenja.

---

**Navigacija**
- **Prethodna lekcija**: [Planiranje kapaciteta](capacity-planning.md)
- **Sljedeća lekcija**: [Provjere prije polijetanja](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
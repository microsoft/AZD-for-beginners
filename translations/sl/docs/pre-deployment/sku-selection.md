<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7c000a3a8f4a04aa85c6d35714e3dee0",
  "translation_date": "2025-09-10T06:54:19+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "sl"
}
-->
# Vodnik za izbiro SKU-jev - Izbira pravih ravni storitev Azure

## Uvod

Ta obsežen vodnik vam pomaga izbrati optimalne SKU-je (Stock Keeping Units) storitev Azure za različna okolja, delovne obremenitve in zahteve. Naučite se analizirati potrebe po zmogljivosti, stroškovne vidike in zahteve po razširljivosti, da izberete najprimernejše ravni storitev za vaše namestitve Azure Developer CLI.

## Cilji učenja

Z dokončanjem tega vodnika boste:
- Razumeli koncepte SKU-jev Azure, cenovne modele in razlike v funkcijah
- Obvladali strategije izbire SKU-jev, specifične za okolje, za razvoj, testiranje in produkcijo
- Analizirali zahteve delovnih obremenitev in jih uskladili z ustreznimi ravnmi storitev
- Uvedli strategije optimizacije stroškov z inteligentno izbiro SKU-jev
- Uporabili tehnike testiranja zmogljivosti in validacije za izbiro SKU-jev
- Konfigurirali avtomatizirana priporočila in spremljanje SKU-jev

## Rezultati učenja

Po zaključku boste lahko:
- Izbrali ustrezne SKU-je storitev Azure na podlagi zahtev in omejitev delovnih obremenitev
- Oblikovali stroškovno učinkovite arhitekture za več okolij z ustrezno izbiro ravni
- Izvedli primerjalno testiranje zmogljivosti in validacijo za izbiro SKU-jev
- Ustvarili avtomatizirana orodja za priporočila SKU-jev in optimizacijo stroškov
- Načrtovali migracije SKU-jev in strategije razširljivosti za spreminjajoče se zahteve
- Uporabili načela Azure Well-Architected Framework za izbiro ravni storitev

## Kazalo vsebine

- [Razumevanje SKU-jev](../../../../docs/pre-deployment)
- [Izbira na podlagi okolja](../../../../docs/pre-deployment)
- [Smernice za specifične storitve](../../../../docs/pre-deployment)
- [Strategije optimizacije stroškov](../../../../docs/pre-deployment)
- [Vidiki zmogljivosti](../../../../docs/pre-deployment)
- [Hitre referenčne tabele](../../../../docs/pre-deployment)
- [Orodja za validacijo](../../../../docs/pre-deployment)

---

## Razumevanje SKU-jev

### Kaj so SKU-ji?

SKU-ji (Stock Keeping Units) predstavljajo različne ravni storitev in zmogljivosti za vire Azure. Vsak SKU ponuja različne:

- **Značilnosti zmogljivosti** (CPU, pomnilnik, prepustnost)
- **Razpoložljivost funkcij** (možnosti razširljivosti, ravni SLA)
- **Cenovne modele** (na podlagi porabe, rezervirane zmogljivosti)
- **Regionalno razpoložljivost** (vsi SKU-ji niso na voljo v vseh regijah)

### Ključni dejavniki pri izbiri SKU-jev

1. **Zahteve delovne obremenitve**
   - Pričakovani vzorci prometa/obremenitve
   - Zahteve po zmogljivosti (CPU, pomnilnik, I/O)
   - Potrebe po shranjevanju in vzorci dostopa

2. **Vrsta okolja**
   - Razvoj/testiranje proti produkciji
   - Zahteve po razpoložljivosti
   - Potrebe po varnosti in skladnosti

3. **Proračunske omejitve**
   - Začetni stroški proti operativnim stroškom
   - Popusti za rezervirano zmogljivost
   - Stroškovni vplivi samodejnega skaliranja

4. **Projekcije rasti**
   - Zahteve po razširljivosti
   - Prihodnje potrebe po funkcijah
   - Kompleksnost migracije

---

## Izbira na podlagi okolja

### Razvojno okolje

**Prioritete**: Optimizacija stroškov, osnovna funkcionalnost, enostavno zagotavljanje/odstranjevanje

#### Priporočeni SKU-ji
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

#### Značilnosti
- **App Service**: F1 (brezplačno) ali B1 (osnovno) za preprosto testiranje
- **Baze podatkov**: Osnovna raven z minimalnimi viri
- **Shranjevanje**: Standardno z lokalno redundanco
- **Računalništvo**: Skupni viri so sprejemljivi
- **Omrežje**: Osnovne konfiguracije

### Testno okolje

**Prioritete**: Konfiguracija podobna produkciji, ravnovesje stroškov, zmogljivost za testiranje

#### Priporočeni SKU-ji
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

#### Značilnosti
- **Zmogljivost**: 70-80 % zmogljivosti produkcije
- **Funkcije**: Večina funkcij produkcije omogočenih
- **Redundanca**: Nekaj geografske redundance
- **Skaliranje**: Omejeno samodejno skaliranje za testiranje
- **Spremljanje**: Celoten nabor orodij za spremljanje

### Produkcijsko okolje

**Prioritete**: Zmogljivost, razpoložljivost, varnost, skladnost, razširljivost

#### Priporočeni SKU-ji
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

#### Značilnosti
- **Visoka razpoložljivost**: Zahteve SLA 99,9 %+
- **Zmogljivost**: Namenski viri, visoka prepustnost
- **Varnost**: Premium varnostne funkcije
- **Skaliranje**: Polne zmogljivosti samodejnega skaliranja
- **Spremljanje**: Celovita opazljivost

---

## Smernice za specifične storitve

### Azure App Service

#### Matrika odločanja za SKU-je

| Uporaba | Priporočeni SKU | Razlog |
|---------|-----------------|--------|
| Razvoj/testiranje | F1 (brezplačno) ali B1 (osnovno) | Stroškovno učinkovito, dovolj za testiranje |
| Majhne produkcijske aplikacije | S1 (standardno) | Lastne domene, SSL, samodejno skaliranje |
| Srednje velike aplikacije | P1V3 (Premium V3) | Boljša zmogljivost, več funkcij |
| Aplikacije z visokim prometom | P2V3 ali P3V3 | Namenski viri, visoka zmogljivost |
| Kritične aplikacije | I1V2 (Izolirano V2) | Omrežna izolacija, namenski strojni viri |

#### Primeri konfiguracij

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

#### Okvir za izbiro SKU-jev

1. **Na podlagi DTU (enote transakcij baze podatkov)**
   - **Osnovno**: 5 DTU - Razvoj/testiranje
   - **Standardno**: S0-S12 (10-3000 DTU) - Splošni namen
   - **Premium**: P1-P15 (125-4000 DTU) - Kritične zmogljivosti

2. **Na podlagi vCore** (priporočljivo za produkcijo)
   - **Splošni namen**: Uravnoteženo računalništvo in shranjevanje
   - **Poslovno kritično**: Nizka zakasnitev, visoki IOPS
   - **Hyperscale**: Zelo razširljivo shranjevanje (do 100 TB)

#### Primeri konfiguracij

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

#### Vrste okolij

1. **Na podlagi porabe**
   - Plačilo po uporabi
   - Primerno za razvoj in spremenljive obremenitve
   - Skupna infrastruktura

2. **Namensko (profili obremenitve)**
   - Namenski računalniški viri
   - Predvidljiva zmogljivost
   - Boljše za produkcijske obremenitve

#### Primeri konfiguracij

**Razvoj (poraba)**
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

**Produkcija (namensko)**
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

#### Modeli prepustnosti

1. **Ročno določena prepustnost**
   - Predvidljiva zmogljivost
   - Popusti za rezervirano zmogljivost
   - Najboljše za stabilne obremenitve

2. **Samodejno skaliranje prepustnosti**
   - Samodejno skaliranje glede na uporabo
   - Plačilo glede na uporabo (z minimalno porabo)
   - Dobro za spremenljive obremenitve

3. **Serverless**
   - Plačilo na zahtevo
   - Brez določene prepustnosti
   - Idealno za razvoj in občasne obremenitve

#### Primeri SKU-jev

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

#### Vrste računov za shranjevanje

1. **Standard_LRS** - Razvoj, nekritični podatki
2. **Standard_GRS** - Produkcija, potrebna geografska redundanca
3. **Premium_LRS** - Aplikacije z visoko zmogljivostjo
4. **Premium_ZRS** - Visoka razpoložljivost z redundanco po conah

#### Zmogljivostne ravni

- **Standardno**: Splošni namen, stroškovno učinkovito
- **Premium**: Visoka zmogljivost, nizka zakasnitev

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

## Strategije optimizacije stroškov

### 1. Rezervirana zmogljivost

Rezervirajte vire za 1-3 leta za znatne popuste:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Prilagajanje velikosti

Začnite z manjšimi SKU-ji in povečajte glede na dejansko uporabo:

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

### 3. Konfiguracija samodejnega skaliranja

Uvedite inteligentno skaliranje za optimizacijo stroškov:

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

### 4. Načrtovano skaliranje

Zmanjšajte zmogljivost v času manjše uporabe:

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

## Vidiki zmogljivosti

### Osnovne zahteve zmogljivosti

Določite jasne zahteve zmogljivosti pred izbiro SKU-jev:

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

### Testiranje obremenitve

Preizkusite različne SKU-je za validacijo zmogljivosti:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Spremljanje in optimizacija

Vzpostavite celovito spremljanje:

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

## Hitre referenčne tabele

### Hitri pregled SKU-jev za App Service

| SKU | Raven | vCPU | RAM | Shranjevanje | Cenovni razpon | Uporaba |
|-----|-------|------|-----|--------------|----------------|---------|
| F1 | Brezplačno | Skupno | 1GB | 1GB | Brezplačno | Razvoj |
| B1 | Osnovno | 1 | 1.75GB | 10GB | $ | Majhne aplikacije |
| S1 | Standardno | 1 | 1.75GB | 50GB | $$ | Produkcija |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Visoka zmogljivost |
| I1V2 | Izolirano V2 | 2 | 8GB | 1TB | $$$$ | Podjetniško |

### Hitri pregled SKU-jev za SQL Database

| SKU | Raven | DTU/vCore | Shranjevanje | Cenovni razpon | Uporaba |
|-----|-------|-----------|--------------|----------------|---------|
| Osnovno | Osnovno | 5 DTU | 2GB | $ | Razvoj |
| S2 | Standardno | 50 DTU | 250GB | $$ | Majhna produkcija |
| P2 | Premium | 250 DTU | 1TB | $$$ | Visoka zmogljivost |
| GP_Gen5_4 | Splošni namen | 4 vCore | 4TB | $$$ | Uravnoteženo |
| BC_Gen5_8 | Poslovno kritično | 8 vCore | 4TB | $$$$ | Kritično |

### Hitri pregled SKU-jev za Container Apps

| Model | Cenovni model | CPU/Pomnilnik | Uporaba |
|-------|---------------|---------------|---------|
| Poraba | Plačilo po uporabi | 0.25-2 vCPU | Razvoj, spremenljive obremenitve |
| Namensko D4 | Rezervirano | 4 vCPU, 16GB | Produkcija |
| Namensko D8 | Rezervirano | 8 vCPU, 32GB | Visoka zmogljivost |

---

## Orodja za validacijo

### Preverjevalnik razpoložljivosti SKU-jev

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

### Skripta za oceno stroškov

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

### Validacija zmogljivosti

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

## Povzetek najboljših praks

### Kaj storiti

1. **Začnite z manjšimi SKU-ji in povečajte** glede na dejansko uporabo
2. **Uporabljajte različne SKU-je za različna okolja**
3. **Nenehno spremljajte zmogljivost in stroške**
4. **Izkoristite rezervirano zmogljivost za produkcijske obremenitve**
5. **Uvedite samodejno skaliranje, kjer je primerno**
6. **Testirajte zmogljivost z realističnimi obremenitvami**
7. **Načrtujte rast, vendar se izogibajte prekomernemu zagotavljanju virov**
8. **Za razvoj uporabite brezplačne ravni, kadar je to mogoče**

### Česa ne storiti

1. **Ne uporabljajte produkcijskih SKU-jev za razvoj**
2. **Ne ignorirajte regionalne razpoložljivosti SKU-jev**
3. **Ne pozabite na stroške prenosa podatkov**
4. **Ne zagotavljajte prekomernih virov brez utemeljitve**
5. **Ne ignorirajte vpliva odvisnosti**
6. **Ne nastavite omejitev samodejnega skaliranja previsoko**
7. **Ne pozabite na zahteve skladnosti**
8. **Ne odločajte se samo na podlagi cene**

---

**Nasvet**: Uporabite Azure Cost Management in Advisor za pridobitev prilagojenih priporočil za optimizacijo izbire SKU-jev na podlagi dejanskih vzorcev uporabe.

---

**Navigacija**
- **Prejšnja lekcija**: [Načrtovanje zmogljivosti](capacity-planning.md)
- **Naslednja lekcija**: [Preverjanje pred zagonom](preflight-checks.md)

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za strojno prevajanje [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo strokovno človeško prevajanje. Ne prevzemamo odgovornosti za morebitna nesporazumevanja ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
# Vodnik za izbiro SKU - Izbira pravih ravni storitev Azure

**Navigacija po poglavjih:**
- **📚 Domov za tečaj**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 6 - Preverjanje in načrtovanje pred začetkom namestitve
- **⬅️ Prejšnje**: [Načrtovanje zmogljivosti](capacity-planning.md)
- **➡️ Naslednje**: [Preverjanja pred zagonom](preflight-checks.md)
- **🚀 Naslednje poglavje**: [Poglavje 7: Odpravljanje težav](../chapter-07-troubleshooting/common-issues.md)

## Uvod

Ta obsežen vodnik vam pomaga izbrati optimalne Azure storitvene SKU-je (enote za sledenje zalogi) za različna okolja, delovne obremenitve in zahteve. Naučite se analizirati potrebe po zmogljivosti, stroške in zahteve po razširljivosti, da izberete najbolj primerne ravni storitev za vaše namestitve Azure Developer CLI.

## Cilji učenja

Po zaključku tega vodnika boste:
- Razumeli koncepte Azure SKU-jev, modele cen in razlike med funkcijami
- Obvladali strategije izbire SKU-jev, prilagojene okolju za razvoj, testiranje in produkcijo
- Analizirali zahteve delovnih obremenitev in jih uskladili z ustreznimi ravnmi storitev
- Uvedli strategije optimizacije stroškov z inteligentno izbiro SKU-jev
- Uporabili tehnike testiranja zmogljivosti za preverjanje izbire SKU-jev
- Konfigurirali avtomatizirana priporočila in spremljanje SKU-jev

## Rezultati učenja

Po zaključku boste znali:
- Izbrati ustrezne Azure storitvene SKU-je glede na zahteve delovnih obremenitev in omejitve
- Načrtovati stroškovno učinkovite arhitekture za več okolij s pravilno izbiro ravni
- Izvesti merjenje zmogljivosti in preverjanje za izbiro SKU-jev
- Ustvariti avtomatizirana orodja za priporočila SKU-jev in optimizacijo stroškov
- Načrtovati migracije SKU-jev in strategije skaliranja glede na spreminjajoče se zahteve
- Uporabiti principe Azure Well-Architected Framework pri izbiri ravni storitev

## Kazalo vsebine

- [Razumevanje SKU-jev](#understanding-skus)
- [Izbira glede na okolje](#environment-based-selection)
- [Smernice za posamezne storitve](#service-specific-guidelines)
- [Strategije optimizacije stroškov](#cost-optimization-strategies)
- [Razmisleki o zmogljivosti](#performance-considerations)
- [Hitra referenčna poglavja](#quick-reference-tables)
- [Orodja za preverjanje](#validation-tools)

---

## Razumevanje SKU-jev

> **Primer obsega:** YAML zemljevidi SKU-jev in konfiguracije zmogljivosti spodaj so oblikovalske opombe, ne shema `azure.yaml` ali konfiguracija orodja za obremenitev. Bloki Bicep so alternative/fragmente: razglasite njihove parametre in nadrejene vire, uporabljajte unikatna simbolna imena pri kombiniranju in povežite module v delujoč projekt. Cene, omejitve in regionalna/dostopnost SKU-jev je treba preveriti za vaš naročniški načrt pred namestitvijo.

### Kaj so SKU-ji?

SKU-ji (enote za sledenje zalogi) predstavljajo različne ravni storitev in zmogljivostne stopnje za vire Azure. Vsak SKU ponuja različne:

- **Zmogljivostne značilnosti** (CPU, pomnilnik, prepustnost)
- **Razpoložljivost funkcij** (možnosti skaliranja, ravni SLA)
- **Modeli cen** (poraba, rezervirana zmogljivost)
- **Regionalna razpoložljivost** (vsi SKU-ji niso na voljo v vseh regijah)

### Ključni dejavniki pri izbiri SKU-jev

1. **Zahteve delovne obremenitve**
   - Pričakovani promet/obremenitve
   - Zahteve glede zmogljivosti (CPU, pomnilnik, I/O)
   - Potrebe po shranjevanju in vzorci dostopa

2. **Vrsta okolja**
   - Razvoj/testiranje v primerjavi s produkcijo
   - Zahteve glede razpoložljivosti
   - Varnostne in skladnostne zahteve

3. **Proračunske omejitve**
   - Začetni stroški proti obratovalnim stroškom
   - Popusti za rezervirano kapaciteto
   - Stroški avtomatskega skaliranja

4. **Napovedi rasti**
   - Zahteve glede skalabilnosti
   - Prihodnje potrebe po funkcijah
   - Kompleksnost migracije

---

## Izbira glede na okolje

### Razvojno okolje

**Prioritete**: Optimizacija stroškov, osnovna funkcionalnost, enostavno vzpostavljanje/odstranjevanje

#### Priporočeni SKU-ji
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

#### Značilnosti
- **App Service**: F1 (brezplačno) ali B1 (osnovno) za preprosto testiranje
- **Podatkovne baze**: Osnovna raven z minimalnimi viri
- **Shranjevanje**: Standardno z le lokalno redundanco
- **Računalništvo**: Dovoljeni skupni viri
- **Omrežje**: Osnovne konfiguracije

### Preizkusno/testno okolje

**Prioritete**: Konfiguracija podobna produkciji, uravnoteženost stroškov, zmogljivosti za testiranje

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
- **Zmogljivost**: 70-80 % produkcijske zmogljivosti
- **Funkcije**: Večina produkcijskih funkcij omogočena
- **Redundanca**: Nekaj geografske redundance
- **Skaliranje**: Omejeno avtomatsko skaliranje za testiranje
- **Spremljanje**: Popoln paket za spremljanje

### Produkcijsko okolje

**Prioritete**: Zmogljivost, razpoložljivost, varnost, skladnost, razširljivost

#### Priporočeni SKU-ji
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

#### Značilnosti
- **Visoka razpoložljivost**: Zahteve SLA nad 99,9 %
- **Zmogljivost**: Namenjeni viri, visoka prepustnost
- **Varnost**: Premium varnostne funkcije
- **Skaliranje**: Polne zmogljivosti avtomatskega skaliranja
- **Spremljanje**: Celovita opaznost

---

## Smernice za posamezne storitve

### Azure App Service

#### Matrika odločitev za SKU-je

| Primer uporabe | Priporočeni SKU | Razlog |
|----------|----------------|-----------|
| Razvoj/testiranje | F1 (brezplačno) ali B1 (osnovno) | Stroškovno učinkovito, zadostno za testiranje |
| Majhne produkcijske aplikacije | S1 (standardno) | Prilagojene domene, SSL, avtomatsko skaliranje |
| Srednje produkcijske aplikacije | P1V3 (Premium V3) | Boljša zmogljivost, več funkcij |
| Aplikacije z velikim prometom | P2V3 ali P3V3 | Namenjeni viri, visoka zmogljivost |
| Kritične aplikacije | I1V2 (izolirano V2) | Omrežna izolacija, namenski strojni viri |

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

1. **Na osnovi DTU (enote za transakcije v podatkovnih bazah)**
   - **Basic (osnovni)**: 5 DTU - razvoj/testiranje
   - **Standard**: S0-S12 (10-3000 DTU) - splošna raba
   - **Premium**: P1-P15 (125-4000 DTU) - zmogljivostno kritično

2. **Na osnovi vCore** (priporočeno za produkcijo)
   - **General Purpose (splošna raba)**: Uravnoteženi računalniški viri in shranjevanje
   - **Business Critical (poslovno kritično)**: Nizka zakasnitev, visoki IOPS
   - **Hyperscale**: Zelo razširljivo shranjevanje; preverite trenutne omejitve velikosti in podporo regije

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

#### Vrste okolja

1. **Na osnovi porabe**
   - Plačilo glede na uporabo
   - Primeren za razvoj in spremenljive delovne obremenitve
   - Skupna infrastruktura

2. **Namenjeni (delovni profili)**
   - Namenjeni računalniški viri
   - Predvidljiva zmogljivost
   - Boljši za produkcijske delovne obremenitve

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

**Produkcija (namenjeno)**
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

Zona redundanca zahteva tudi infrastrukturo v podpornih regijah in ustrezno konfiguracijo VNet/podomrežja, ki je tukaj izpuščena. Ta primer predvideva tri namenski vozli; konfigurirajte vsaj dve repliki aplikacije za porazdelitev preko con in velikost obeh repliki in vozli za odpoved cone. Oglejte si [navodila za zanesljivost Container Apps](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Če želite aplikacijo postaviti na ta profil, nastavite njen `workloadProfileName: 'production-profile'`; ustvarjanje profila samo po sebi ne premakne aplikacij nanj.

### Azure Cosmos DB

#### Modeli prepustnosti

1. **Ročno določena prepustnost**
   - Predvidljiva zmogljivost
   - Popusti za rezervirano zmogljivost
   - Najboljše za stalne delovne obremenitve

2. **Avtomatsko skalirana prepustnost**
   - Samodejno skaliranje glede na uporabo
   - Plačilo za dejansko uporabo (z minimalno vrednostjo)
   - Dobro za spremenljive delovne obremenitve

3. **Brez strežnika (serverless)**
   - Plačilo na zahtevo
   - Brez vnaprej določene prepustnosti
   - Idealno za razvoj in občasne delovne obremenitve

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

1. **Standard_LRS** - razvoj, manj kritični podatki
2. **Standard_GRS** - produkcija, potrebna geo-redundanca
3. **Premium_LRS** - aplikacije z visoko zmogljivostjo
4. **Premium_ZRS** - visoka razpoložljivost z redundanco con

#### Razine zmogljivosti

- **Standardna**: Splošna raba, stroškovno učinkovito
- **Premium**: Visoka zmogljivost, nizke zakasnitve

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

### 1. Rezervirana kapaciteta

Rezervirajte vire za 1-3 leta za znatne popuste:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Ponudbe rezervacij in upravičeni tipi virov se razlikujejo; namesto predpostavke, da vsaka storitev/SKU podpira rezervacijo, preglejte katalog in pogoje nakupa.

### 2. Prava velikost

Začnite z manjšimi SKU-ji in skalirajte glede na dejansko uporabo:

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

### 3. Konfiguracija avtomatskega skaliranja

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

### 4. Načrtovano skaliranje

Zmanjšajte obremenitev izven delovnega časa:

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

## Razmisleki o zmogljivosti

### Osnovne zahteve glede zmogljivosti

Določite jasne zahteve glede zmogljivosti pred izbiro SKU-ja:

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

Testirajte različne SKU-je za preverjanje zmogljivosti:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### Spremljanje in optimizacija

Nastavite celovito spremljanje:

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

## Hitra referenčna poglavja

### Hitro referenčno poglavje za App Service SKU

| SKU | Raven | vCPU | RAM | Shramba | Cenovni razpon | Primer uporabe |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Brezplačno | Deljeno | 1GB | 1GB | Brezplačno | Razvoj |
| B1 | Osnovno | 1 | 1,75GB | 10GB | $ | Majhne aplikacije |
| S1 | Standardno | 1 | 1,75GB | 50GB | $$ | Produkcija |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Visoka zmogljivost |
| I1V2 | Izolirano V2 | 2 | 8GB | 1TB | $$$$ | Podjetja |

### Hitro referenčno poglavje za SQL Database SKU

| SKU | Raven | DTU/vCore | Shramba | Cenovni razpon | Primer uporabe |
|-----|------|-----------|---------|-------------|----------|
| Basic | Osnovno | 5 DTU | 2GB | $ | Razvoj |
| S2 | Standardno | 50 DTU | 250GB | $$ | Majhna produkcija |
| P2 | Premium | 250 DTU | 1TB | $$$ | Visoka zmogljivost |
| GP_Gen5_4 | Splošna raba | 4 vCore | 4TB | $$$ | Uravnoteženo |
| BC_Gen5_8 | Poslovno kritično | 8 vCore | 4TB | $$$$ | Misijska kritičnost |

### Hitro referenčno poglavje za Container Apps SKU

| Model | Cenitev | CPU/Pomnilnik | Primer uporabe |
|-------|---------|------------|----------|
| Poraba | Plačilo glede na uporabo | Podprte kombinacije CPU/pomnilnika so odvisne od okolja/profila | Razvoj ali produkcija, spremenljiva obremenitev |
| Namenjeno D4 | Zaračunavanje namenjenih vozlišč | 4 vCPU, 16GiB na vozlišče | Trajna obremenitev/izolacija |
| Namenjeno D8 | Zaračunavanje namenjenih vozlišč | 8 vCPU, 32GiB na vozlišče | Višja trajna obremenitev |

---

## Orodja za preverjanje

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

### Skripta za oceno stroškov

**Samo psevdokoda:** `Get-ResourceCost` spodaj je projektno specifična funkcija, ki jo morate implementirati z aktualnimi regionalnimi/oglednimi cenami in predpostavkami o uporabi. Ni PowerShell ukaz ali Azure cmdlet.

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

### Preverjanje zmogljivosti

Spodnji YAML je osnutek zahtev, **ne** je vhodna shema za Azure Load Testing, JMeter, Locust ali k6. Pred uporabo zgornjega ukaza za testiranje obremenitve ga pretvorite v resnično konfiguracijo izbranega orodja.

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

1. **Začnite z malim in skalirajte navzgor** glede na dejansko uporabo
2. **Uporabljajte različne SKU-je za različna okolja**
3. **Neprestano spremljajte zmogljivost in stroške**
4. **Izkoristite rezervirano kapaciteto za produkcijske obremenitve**
5. **Uvedite avtomatsko skaliranje, kjer je smiselno**
6. **Testirajte zmogljivost z realističnimi obremenitvami**
7. **Načrtujte rast, a se izogibajte prekomernemu rezerviranju**
8. **Uporabljajte brezplačne ravni za razvoj, kjer je mogoče**

### Česa ne delati

1. **Ne uporabljajte produkcijskih SKU-jev za razvoj**
2. **Ne ignorirajte regionalne razpoložljivosti SKU-jev**
3. **Ne pozabite na stroške prenosa podatkov**
4. **Ne rezervirajte preveč brez utemeljitve**
5. **Ne ignorirajte vpliva odvisnosti**
6. **Ne nastavite meja avtomatskega skaliranja previsoko**
7. **Ne pozabite na zahteve skladnosti**
8. **Ne odločajte samo na podlagi cene**

---

**Nasvet strokovnjaka**: Uporabljajte Azure Cost Management in Advisor za osebna priporočila za optimizacijo izbire SKU-jev glede na dejanske vzorce uporabe.

---

**Navigacija**
- **Prejšnja lekcija**: [Načrtovanje zmogljivosti](capacity-planning.md)
- **Naslednja lekcija**: [Preverjanja pred zagonom](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
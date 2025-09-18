<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "952ed5af7f5db069c53a6840717e1801",
  "translation_date": "2025-09-18T12:05:02+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "hr"
}
-->
# Vodič za odabir SKU-a - Odabir pravih razina usluga Azurea

**Navigacija poglavljem:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 6 - Validacija i planiranje prije implementacije
- **⬅️ Prethodno**: [Planiranje kapaciteta](capacity-planning.md)
- **➡️ Sljedeće**: [Provjere prije implementacije](preflight-checks.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 7: Rješavanje problema](../troubleshooting/common-issues.md)

## Uvod

Ovaj sveobuhvatni vodič pomaže vam u odabiru optimalnih SKU-ova (jedinica za praćenje zaliha) usluga Azurea za različita okruženja, radna opterećenja i zahtjeve. Naučite analizirati potrebe za performansama, troškovne čimbenike i zahtjeve za skalabilnošću kako biste odabrali najprikladnije razine usluga za implementacije pomoću Azure Developer CLI-a.

## Ciljevi učenja

Nakon završetka ovog vodiča, naučit ćete:
- Razumjeti koncepte SKU-ova Azurea, modele cijena i razlike u značajkama
- Ovladati strategijama odabira SKU-ova specifičnih za okruženje za razvoj, testiranje i produkciju
- Analizirati zahtjeve radnog opterećenja i povezati ih s odgovarajućim razinama usluga
- Implementirati strategije optimizacije troškova kroz inteligentan odabir SKU-ova
- Primijeniti tehnike testiranja performansi i validacije za odabrane SKU-ove
- Konfigurirati automatizirane preporuke SKU-ova i praćenje

## Ishodi učenja

Po završetku, moći ćete:
- Odabrati odgovarajuće SKU-ove usluga Azurea na temelju zahtjeva i ograničenja radnog opterećenja
- Dizajnirati isplative arhitekture za više okruženja s pravilnim odabirom razina usluga
- Implementirati testiranje performansi i validaciju za odabrane SKU-ove
- Kreirati automatizirane alate za preporuke SKU-ova i optimizaciju troškova
- Planirati migracije SKU-ova i strategije skaliranja za promjenjive zahtjeve
- Primijeniti principe Azure Well-Architected Frameworka na odabir razina usluga

## Sadržaj

- [Razumijevanje SKU-ova](../../../../docs/pre-deployment)
- [Odabir temeljen na okruženju](../../../../docs/pre-deployment)
- [Smjernice specifične za usluge](../../../../docs/pre-deployment)
- [Strategije optimizacije troškova](../../../../docs/pre-deployment)
- [Razmatranja performansi](../../../../docs/pre-deployment)
- [Tablice za brzu referencu](../../../../docs/pre-deployment)
- [Alati za validaciju](../../../../docs/pre-deployment)

---

## Razumijevanje SKU-ova

### Što su SKU-ovi?

SKU-ovi (jedinice za praćenje zaliha) predstavljaju različite razine usluga i razine performansi za resurse Azurea. Svaki SKU nudi različite:

- **Karakteristike performansi** (CPU, memorija, propusnost)
- **Dostupnost značajki** (opcije skaliranja, razine SLA-a)
- **Modele cijena** (temeljene na potrošnji, rezervirani kapacitet)
- **Regionalnu dostupnost** (neki SKU-ovi nisu dostupni u svim regijama)

### Ključni čimbenici u odabiru SKU-ova

1. **Zahtjevi radnog opterećenja**
   - Očekivani obrasci prometa/opterećenja
   - Zahtjevi za performansama (CPU, memorija, I/O)
   - Potrebe za pohranom i obrasci pristupa

2. **Vrsta okruženja**
   - Razvoj/testiranje naspram produkcije
   - Zahtjevi za dostupnošću
   - Sigurnosni i usklađenostni zahtjevi

3. **Ograničenja budžeta**
   - Početni troškovi naspram operativnih troškova
   - Popusti za rezervirani kapacitet
   - Implicirani troškovi automatskog skaliranja

4. **Projekcije rasta**
   - Zahtjevi za skalabilnošću
   - Buduće potrebe za značajkama
   - Složenost migracije

---

## Odabir temeljen na okruženju

### Razvojno okruženje

**Prioriteti**: Optimizacija troškova, osnovna funkcionalnost, jednostavno postavljanje/uklanjanje

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
- **App Service**: F1 (besplatno) ili B1 (osnovno) za jednostavno testiranje
- **Baze podataka**: Osnovni nivo s minimalnim resursima
- **Pohrana**: Standardna s lokalnom redundancijom
- **Računalni resursi**: Prihvatljivi zajednički resursi
- **Mreža**: Osnovne konfiguracije

### Testno okruženje

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
- **Performanse**: 70-80% kapaciteta produkcije
- **Značajke**: Većina značajki produkcije omogućena
- **Redundancija**: Djelomična geografska redundancija
- **Skaliranje**: Ograničeno automatsko skaliranje za testiranje
- **Praćenje**: Potpuni sustav praćenja

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
- **Visoka dostupnost**: Zahtjevi SLA-a od 99,9%+
- **Performanse**: Namjenski resursi, visoka propusnost
- **Sigurnost**: Premium sigurnosne značajke
- **Skaliranje**: Potpune mogućnosti automatskog skaliranja
- **Praćenje**: Sveobuhvatna vidljivost

---

## Smjernice specifične za usluge

### Azure App Service

#### Matrica odluka o SKU-ovima

| Upotreba | Preporučeni SKU | Obrazloženje |
|----------|----------------|--------------|
| Razvoj/testiranje | F1 (besplatno) ili B1 (osnovno) | Isplativo, dovoljno za testiranje |
| Male produkcijske aplikacije | S1 (standardno) | Prilagođene domene, SSL, automatsko skaliranje |
| Srednje produkcijske aplikacije | P1V3 (Premium V3) | Bolje performanse, više značajki |
| Aplikacije s velikim prometom | P2V3 ili P3V3 | Namjenski resursi, visoke performanse |
| Kritične aplikacije | I1V2 (Isolated V2) | Izolacija mreže, namjenski hardver |

#### Primjeri konfiguracije

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

#### Okvir za odabir SKU-ova

1. **Temeljeno na DTU (jedinice transakcija baze podataka)**
   - **Osnovno**: 5 DTU - Razvoj/testiranje
   - **Standardno**: S0-S12 (10-3000 DTU) - Opća namjena
   - **Premium**: P1-P15 (125-4000 DTU) - Kritične performanse

2. **Temeljeno na vCore-u** (preporučeno za produkciju)
   - **Opća namjena**: Uravnoteženi računalni resursi i pohrana
   - **Poslovno kritično**: Niska latencija, visoki IOPS
   - **Hyperscale**: Visoko skalabilna pohrana (do 100TB)

#### Primjeri konfiguracije

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

1. **Temeljeno na potrošnji**
   - Cijena po upotrebi
   - Pogodno za razvoj i promjenjiva opterećenja
   - Zajednička infrastruktura

2. **Namjenski (profili opterećenja)**
   - Namjenski računalni resursi
   - Predvidive performanse
   - Bolje za produkcijska opterećenja

#### Primjeri konfiguracije

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

1. **Ručno dodijeljena propusnost**
   - Predvidive performanse
   - Popusti za rezervirani kapacitet
   - Najbolje za stabilna opterećenja

2. **Automatsko skaliranje dodijeljene propusnosti**
   - Automatsko skaliranje prema upotrebi
   - Plaćanje prema upotrebi (s minimalnim)
   - Dobro za promjenjiva opterećenja

3. **Serverless**
   - Plaćanje po zahtjevu
   - Bez dodijeljene propusnosti
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

### Azure Storage Account

#### Vrste računa za pohranu

1. **Standard_LRS** - Razvoj, nekritični podaci
2. **Standard_GRS** - Produkcija, potrebna geo-redundancija
3. **Premium_LRS** - Aplikacije visokih performansi
4. **Premium_ZRS** - Visoka dostupnost sa zonalnom redundancijom

#### Razine performansi

- **Standardno**: Opća namjena, isplativo
- **Premium**: Visoke performanse, scenariji niske latencije

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
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Prilagodba veličine

Započnite s manjim SKU-ovima i skalirajte prema stvarnoj upotrebi:

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

### 4. Skaliranje prema rasporedu

Smanjite kapacitet tijekom neaktivnih sati:

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

### Osnovni zahtjevi za performanse

Definirajte jasne zahtjeve za performanse prije odabira SKU-ova:

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

Testirajte različite SKU-ove kako biste validirali performanse:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Praćenje i optimizacija

Postavite sveobuhvatno praćenje:

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

## Tablice za brzu referencu

### Brza referenca SKU-ova za App Service

| SKU | Razina | vCPU | RAM | Pohrana | Raspon cijena | Upotreba |
|-----|-------|------|-----|---------|---------------|----------|
| F1 | Besplatno | Zajednički | 1GB | 1GB | Besplatno | Razvoj |
| B1 | Osnovno | 1 | 1.75GB | 10GB | $ | Male aplikacije |
| S1 | Standardno | 1 | 1.75GB | 50GB | $$ | Produkcija |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Visoke performanse |
| I1V2 | Izolirano V2 | 2 | 8GB | 1TB | $$$$ | Korporativno |

### Brza referenca SKU-ova za SQL Database

| SKU | Razina | DTU/vCore | Pohrana | Raspon cijena | Upotreba |
|-----|-------|-----------|---------|---------------|----------|
| Osnovno | Osnovno | 5 DTU | 2GB | $ | Razvoj |
| S2 | Standardno | 50 DTU | 250GB | $$ | Mala produkcija |
| P2 | Premium | 250 DTU | 1TB | $$$ | Visoke performanse |
| GP_Gen5_4 | Opća namjena | 4 vCore | 4TB | $$$ | Uravnoteženo |
| BC_Gen5_8 | Poslovno kritično | 8 vCore | 4TB | $$$$ | Kritično |

### Brza referenca SKU-ova za Container Apps

| Model | Cijena | CPU/Memorija | Upotreba |
|-------|-------|--------------|----------|
| Potrošnja | Plaćanje po upotrebi | 0.25-2 vCPU | Razvoj, promjenjivo opterećenje |
| Namjenski D4 | Rezervirano | 4 vCPU, 16GB | Produkcija |
| Namjenski D8 | Rezervirano | 8 vCPU, 32GB | Visoke performanse |

---

## Alati za validaciju

### Provjera dostupnosti SKU-ova

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

### Skripta za procjenu troškova

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

### Što učiniti

1. **Započnite s manjim SKU-ovima i skalirajte prema stvarnoj upotrebi**
2. **Koristite različite SKU-ove za različita okruženja**
3. **Kontinuirano pratite performanse i troškove**
4. **Iskoristite rezervirani kapacitet za produkcijska opterećenja**
5. **Implementirajte automatsko skaliranje gdje je prikladno**
6. **Testirajte performanse s realističnim opterećenjima**
7. **Planirajte rast, ali izbjegavajte prekomjerno dodjeljivanje resursa**
8. **Koristite besplatne razine za razvoj kad god je moguće**

### Što ne učiniti

1. **Nemojte koristiti produkcijske SKU-ove za razvoj**
2. **Nemojte ignorirati regionalnu dostupnost SKU-ova**
3. **Nemojte zaboraviti na troškove prijenosa podataka**
4. **Nemojte prekomjerno dodjeljivati resurse bez opravdanja**
5. **Nemojte ignorirati utjecaj ovisnosti**
6. **Nemojte postavljati granice automatskog skaliranja previsoko**
7. **Nemojte zaboraviti na zahtjeve za usklađenost**
8. **Nemojte donositi odluke samo na temelju cijene**

---

**Savjet**: Koristite Azure Cost Management i Advisor za personalizirane preporuke za optimizaciju odabira SKU-ova na temelju stvarnih obrazaca upotrebe.

---

**Navigacija**
- **Prethodna lekcija**: [Planiranje kapaciteta](capacity-planning.md)
- **Sljedeća lekcija**: [Provjere prije implementacije](preflight-checks.md)

---

**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane čovjeka. Ne preuzimamo odgovornost za bilo kakva nesporazuma ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
# SKU Selection Guide - Choosing the Right Azure Service Tiers

**Chapter Navigation:**
- **📚 Domov tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Chapter 6 - Pre-Deployment Validation & Planning
- **⬅️ Prejšnje**: [Capacity Planning](capacity-planning.md)
- **➡️ Naslednje**: [Pre-flight Checks](preflight-checks.md)
- **🚀 Naslednje poglavje**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

## Uvod

Ta celovit vodič vam pomaga izbrati optimalne SKU-je (Stock Keeping Units) za različna Azure okolja, delovne obremenitve in zahteve. Naučite se analizirati potrebe glede zmogljivosti, stroškovne vidike in zahteve po razširljivosti, da izberete najprimernejše storitvene ravni za vaše Azure Developer CLI namestitve.

## Cilji učenja

Z dokončanjem tega vodiča boste:
- Razumeli koncepte SKU-jev v Azure, modele določanja cen in razlike v funkcijah
- Obvladali strategije izbire SKU-jev glede na okolje (razvoj, staging, produkcija)
- Analizirali zahteve delovnih obremenitev in jih uskladili s primernimi storitvenimi ravnmi
- Uvedli strategije optimizacije stroškov s pametno izbiro SKU-jev
- Uporabljali tehnike testiranja zmogljivosti in validacije za izbiro SKU-jev
- Konfigurirali avtomatizirane priporočila za SKU-je in nadzor

## Rezultati učenja

Po končani vsebini boste sposobni:
- Izbrati ustrezne SKU-je Azure storitev glede na zahteve in omejitve delovne obremenitve
- Načrtovati stroškovno učinkovite arhitekture z več okolji z ustrezno izbiro stopenj
- Izvesti merjenje zmogljivosti in validacijo za izbiro SKU-jev
- Ustvariti avtomatizirana orodja za priporočila SKU-jev in optimizacijo stroškov
- Načrtovati migracije SKU-jev in strategije skaliranja za spreminjajoče se zahteve
- Uporabljati načela Azure Well-Architected Framework pri izbiri storitvenih stopenj

## Kazalo

- [Razumevanje SKU-jev](../../../../docs/chapter-06-pre-deployment)
- [Izbira glede na okolje](../../../../docs/chapter-06-pre-deployment)
- [Smernice za posamezne storitve](../../../../docs/chapter-06-pre-deployment)
- [Strategije optimizacije stroškov](../../../../docs/chapter-06-pre-deployment)
- [Vidiki zmogljivosti](../../../../docs/chapter-06-pre-deployment)
- [Hitre referenčne tabele](../../../../docs/chapter-06-pre-deployment)
- [Orodja za preverjanje](../../../../docs/chapter-06-pre-deployment)

---

## Razumevanje SKU-jev

### Kaj so SKU-ji?

SKU-ji (Stock Keeping Units) predstavljajo različne storitvene ravni in stopnje zmogljivosti za Azure vire. Vsak SKU ponuja različne:

- **Značilnosti zmogljivosti** (CPU, pomnilnik, prepustnost)
- **Razpoložljivost funkcij** (možnosti skaliranja, ravni SLA)
- **Modele cen** (na porabo, rezervirana zmogljivost)
- **Regionalno razpoložljivost** (ne vsi SKU-ji so na voljo v vseh regijah)

### Ključni dejavniki pri izbiri SKU-jev

1. **Zahteve delovne obremenitve**
   - Pričakovani vzorci prometa/obremenitve
   - Zahteve glede zmogljivosti (CPU, pomnilnik, I/O)
   - Potrebe po shrambi in vzorci dostopa

2. **Vrsta okolja**
   - Razvoj/testiranje proti produkciji
   - Zahteve glede razpoložljivosti
   - Varnostne in skladnostne potrebe

3. **Omejitve proračuna**
   - Začetni stroški proti obratovalnim stroškom
   - Popusti za rezervirano zmogljivost
   - Posledice stroškov avtomatskega skaliranja

4. **Projekcije rasti**
   - Zahteve po skalabilnosti
   - Prihodnje potrebe po funkcijah
   - Kompleksnost migracij

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
  cosmos_db: "Free"          # Free tier (400 RU/s)
  key_vault: "Standard"      # Standard pricing tier
  application_insights: "Free" # First 5GB free
```

#### Značilnosti
- **App Service**: F1 (Free) ali B1 (Basic) za enostavno testiranje
- **Databases**: Basic raven z minimalnimi viri
- **Storage**: Standard z le lokalno redundantnostjo
- **Compute**: Deljeni viri so sprejemljivi
- **Networking**: Osnovne konfiguracije

### Predprodukcijsko/testno okolje

**Prioritete**: Konfiguracija podobna produkciji, ravnotežje stroškov, zmogljivost za testiranje

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
- **Zmogljivost**: 70–80% proizvodne kapacitete
- **Funkcije**: Večina produkcijskih funkcij omogočena
- **Redundantnost**: Nekaj geografske redundantnosti
- **Skaliranje**: Omejeno samodejno skaliranje za testiranje
- **Nadzor**: Celoten sklop nadzora

### Produkcijsko okolje

**Prioritete**: Zmogljivost, razpoložljivost, varnost, skladnost, skalabilnost

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
- **Visoka razpoložljivost**: Zahteve SLA 99,9%+
- **Zmogljivost**: Namenjeni viri, visoka prepustnost
- **Varnost**: Premium varnostne funkcije
- **Skaliranje**: Polne zmogljivosti samodejnega skaliranja
- **Nadzor**: Celovita opaznost

---

## Smernice za posamezne storitve

### Azure App Service

#### Odločitvena matrika SKU-jev

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | Cost-effective, sufficient for testing |
| Small production apps | S1 (Standard) | Custom domains, SSL, auto-scaling |
| Medium production apps | P1V3 (Premium V3) | Better performance, more features |
| High-traffic apps | P2V3 or P3V3 | Dedicated resources, high performance |
| Mission-critical apps | I1V2 (Isolated V2) | Network isolation, dedicated hardware |

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

1. **Na osnovi DTU (Database Transaction Units)**
   - **Basic**: 5 DTU - Razvoj/testiranje
   - **Standard**: S0-S12 (10-3000 DTU) - Splošna raba
   - **Premium**: P1-P15 (125-4000 DTU) - Kritično za zmogljivost

2. **Na osnovi vCore** (priporočeno za produkcijo)
   - **General Purpose**: Uravnotežena računalniška moč in shramba
   - **Business Critical**: Nizek zakasnitev, visoki IOPS
   - **Hyperscale**: Zelo razširljiva shramba (do 100TB)

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

1. **Na osnovi porabe (Consumption-based)**
   - Plačilo po uporabi
   - Primerno za razvoj in spremenljive delovne obremenitve
   - Deljena infrastruktura

2. **Dodeljeno (Dedicated)**
   - Namenjeni računalniški viri
   - Predvidljiva zmogljivost
   - Primerneje za produkcijske delovne obremenitve

#### Primeri konfiguracij

**Razvoj (Consumption)**
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

**Produkcija (Dedicated)**
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

1. **Ročno predvidena prepustnost**
   - Predvidljiva zmogljivost
   - Popusti za rezervirano zmogljivost
   - Najbolje za stalne obremenitve

2. **Autoscale predvidena prepustnost**
   - Samodejno skaliranje glede na uporabo
   - Plačate glede na porabo (z minimalno ravnjo)
   - Dobro za spremenljive obremenitve

3. **Serverless**
   - Plačilo na zahtevo
   - Brez predvidene prepustnosti
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

1. **Standard_LRS** - Razvoj, neneodločilni podatki
2. **Standard_GRS** - Producent, potrebna geo-redundantnost
3. **Premium_LRS** - Visoko zmogljive aplikacije
4. **Premium_ZRS** - Visoka razpoložljivost z zonalno redundantnostjo

#### Raven zmogljivosti

- **Standard**: Splošna raba, stroškovno učinkovito
- **Premium**: Visoke zmogljivosti, scenariji z nizko zakasnitvijo

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

Rezervirajte vire za 1–3 let za znatne popuste:

```bash
# Preverite možnosti rezervacije
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Pravilna dimenzionacija

Začnite z manjšimi SKU-ji in povečujte glede na dejansko uporabo:

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

Zmanjšajte zmogljivost med neaktivnimi urami:

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

### Osnovne zahteve za zmogljivost

Določite jasne zahteve za zmogljivost pred izbiro SKU-jev:

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

### Obremenitveno testiranje

Testirajte različne SKU-je za validacijo zmogljivosti:

```bash
# Azure storitev za testiranje obremenitve
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Nadzor in optimizacija

Vzpostavite celovit nadzor:

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

### Hitra referenca SKU-jev za App Service

| SKU | Tier | vCPU | RAM | Storage | Price Range | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | Development |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Small apps |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Production |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | High performance |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### Hitra referenca SKU-jev za SQL Database

| SKU | Tier | DTU/vCore | Storage | Price Range | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Development |
| S2 | Standard | 50 DTU | 250GB | $$ | Small production |
| P2 | Premium | 250 DTU | 1TB | $$$ | High performance |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Balanced |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Mission critical |

### Hitra referenca za Container Apps

| Model | Pricing | CPU/Memory | Use Case |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Development, variable load |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Production |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | High performance |

---

## Orodja za preverjanje

### SKU Availability Checker

```bash
#!/bin/bash
# Preveri razpoložljivost SKU v ciljni regiji

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

# Uporaba
check_sku_availability "eastus" "app-service" "P1V3"
```

### Cost Estimation Script

```powershell
# PowerShell skripta za oceno stroškov
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
        
        # Uporabi Azure Pricing API ali kalkulator
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Uporaba
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

## Povzetek dobrih praks

### Priporočila

1. **Začnite majhno in povečujte** glede na dejansko uporabo
2. **Uporabite različne SKU-je za različna okolja**
3. **Neprestano spremljajte zmogljivost in stroške**
4. **Izkoristite rezervirano zmogljivost za produkcijska delovna obremenitve**
5. **Uvedite samodejno skaliranje, kjer je primerno**
6. **Testirajte zmogljivost z realističnimi obremenitvami**
7. **Načrtujte rast, vendar se izogibajte prekomerni dodelitvi virov**
8. **Za razvoj, kjer je mogoče, uporabite brezplačne ravni**

### Kaj ne delati

1. **Ne uporabljajte produkcijskih SKU-jev za razvoj**
2. **Ne prezrite regionalne razpoložljivosti SKU-jev**
3. **Ne pozabite na stroške prenosa podatkov**
4. **Ne dodeljujte preveč virov brez utemeljitve**
5. **Ne zanemarite vpliva odvisnosti**
6. **Ne nastavite omejitev samodejnega skaliranja previsoko**
7. **Ne pozabite na zahteve glede skladnosti**
8. **Ne sprejemajte odločitev samo na podlagi cene**

---

**Namig strokovnjaka**: Uporabite Azure Cost Management in Advisor za pridobitev osebnih priporočil za optimizacijo izbire SKU-jev glede na dejanske vzorce uporabe.

---

**Navigacija**
- **Prejšnja lekcija**: [Capacity Planning](capacity-planning.md)
- **Naslednja lekcija**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v izvirnem jeziku velja za uradni vir. Za kritične informacije priporočamo strokovni človeški prevod. Za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda, ne sprejemamo odgovornosti.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
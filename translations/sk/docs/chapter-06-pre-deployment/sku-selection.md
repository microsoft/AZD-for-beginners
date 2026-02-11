# Príručka výberu SKU - Výber správnych úrovní služieb Azure

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 6 - Overenie a plánovanie pred nasadením
- **⬅️ Predchádzajúca**: [Plánovanie kapacity](capacity-planning.md)
- **➡️ Ďalšia**: [Predletové kontroly](preflight-checks.md)
- **🚀 Ďalšia kapitola**: [Kapitola 7: Riešenie problémov](../chapter-07-troubleshooting/common-issues.md)

## Úvod

Táto komplexná príručka vám pomôže vybrať optimálne SKU (Stock Keeping Units) Azure služieb pre rôzne prostredia, pracovné záťaže a požiadavky. Naučíte sa analyzovať výkonové potreby, náklady a požiadavky na škálovateľnosť, aby ste zvolili najvhodnejšie úrovne služieb pre nasadenia s Azure Developer CLI.

## Ciele učenia

Po dokončení tejto príručky budete:
- Rozumieť konceptom SKU v Azure, modelom cien a rozdielom vo funkciách
- Ovládať stratégie výberu SKU špecifické pre prostredie (vývoj, staging, produkcia)
- Analyzovať požiadavky pracovných záťaží a priradiť ich k vhodným úrovniam služieb
- Implementovať stratégie optimalizácie nákladov inteligentným výberom SKU
- Aplikovať techniky testovania výkonu a overenia pre výber SKU
- Konfigurovať automatizované odporúčania SKU a monitorovanie

## Výsledky učenia

Po dokončení budete schopní:
- Vybrať vhodné SKU Azure služieb na základe požiadaviek a obmedzení pracovnej záťaže
- Navrhnúť nákladovo efektívnu architektúru pre viacero prostredí so správnym výberom úrovní
- Implementovať benchmarkovanie výkonu a overenie pre výber SKU
- Vytvoriť automatizované nástroje na odporúčanie SKU a optimalizáciu nákladov
- Plánovať migrácie SKU a stratégie škálovania pri meniacich sa požiadavkách
- Aplikovať princípy Azure Well-Architected Framework pri výbere úrovní služieb

## Obsah

- [Understanding SKUs](../../../../docs/chapter-06-pre-deployment)
- [Environment-Based Selection](../../../../docs/chapter-06-pre-deployment)
- [Service-Specific Guidelines](../../../../docs/chapter-06-pre-deployment)
- [Cost Optimization Strategies](../../../../docs/chapter-06-pre-deployment)
- [Performance Considerations](../../../../docs/chapter-06-pre-deployment)
- [Quick Reference Tables](../../../../docs/chapter-06-pre-deployment)
- [Validation Tools](../../../../docs/chapter-06-pre-deployment)

---

## Understanding SKUs

### Čo sú SKU?

SKU (Stock Keeping Units) predstavujú rôzne úrovne služieb a výkonové stupne pre Azure zdroje. Každé SKU ponúka odlišné:

- **Výkonové charakteristiky** (CPU, pamäť, priepustnosť)
- **Dostupnosť funkcií** (možnosti škálovania, úrovne SLA)
- **Modely cien** (platba podľa spotreby, rezervovaná kapacita)
- **Regionálne dostupnosť** (nie všetky SKU sú dostupné vo všetkých regiónoch)

### Kľúčové faktory pri výbere SKU

1. **Požiadavky pracovnej záťaže**
   - Očakávané vzory prevádzky / zaťaženia
   - Výkonové požiadavky (CPU, pamäť, I/O)
   - Potreby úložiska a vzory prístupu

2. **Typ prostredia**
   - Vývoj/testovanie vs. produkcia
   - Požiadavky na dostupnosť
   - Požiadavky na bezpečnosť a súlad

3. **Obmedzenia rozpočtu**
   - Počiatočné náklady vs. prevádzkové náklady
   - Zľavy za rezervovanú kapacitu
   - Dopady automatického škálovania na náklady

4. **Projekcie rastu**
   - Požiadavky na škálovateľnosť
   - Budúce potreby funkcií
   - Zložitosť migrácie

---

## Environment-Based Selection

### Vývojové prostredie

**Priority**: Optimalizácia nákladov, základná funkcionalita, jednoduché nasadenie/odstránenie

#### Odporúčané SKU
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

#### Charakteristiky
- **App Service**: F1 (Free) alebo B1 (Basic) pre jednoduché testovanie
- **Databázy**: Základná úroveň s minimálnymi zdrojmi
- **Úložisko**: Standard s lokálnou redundanciou
- **Výpočtové zdroje**: Zdieľané zdroje sú akceptovateľné
- **Sieťovanie**: Základné konfigurácie

### Staging/Testovacie prostredie

**Priority**: Konfigurácia podobná produkcii, vyváženie nákladov, možnosť testovania výkonu

#### Odporúčané SKU
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

#### Charakteristiky
- **Výkon**: 70-80 % produkčnej kapacity
- **Funkcie**: Väčšina produkčných funkcií povolená
- **Redundancia**: Niektorá geografická redundancia
- **Škálovanie**: Obmedzené automatické škálovanie pre testovanie
- **Monitorovanie**: Plný monitoring stack

### Produkčné prostredie

**Priority**: Výkon, dostupnosť, bezpečnosť, súlad, škálovateľnosť

#### Odporúčané SKU
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

#### Charakteristiky
- **Vysoká dostupnosť**: Požiadavky SLA 99,9 %+
- **Výkon**: Dedikované zdroje, vysoká priepustnosť
- **Bezpečnosť**: Prémiové bezpečnostné funkcie
- **Škálovanie**: Plné schopnosti automatického škálovania
- **Monitorovanie**: Komplexná pozorovateľnosť

---

## Service-Specific Guidelines

### Azure App Service

#### Matica rozhodovania SKU

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | Nákladovo efektívne, postačuje na testovanie |
| Small production apps | S1 (Standard) | Vlastné domény, SSL, automatické škálovanie |
| Medium production apps | P1V3 (Premium V3) | Lepší výkon, viac funkcií |
| High-traffic apps | P2V3 or P3V3 | Dedikované zdroje, vysoký výkon |
| Mission-critical apps | I1V2 (Isolated V2) | Sieťová izolácia, dedikovaný hardvér |

#### Príklady konfigurácií

**Development**
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

**Production**
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

#### Rámec výberu SKU

1. **DTU-based (Database Transaction Units)**
   - **Basic**: 5 DTU - Vývoj/testovanie
   - **Standard**: S0-S12 (10-3000 DTU) - Všeobecné použitie
   - **Premium**: P1-P15 (125-4000 DTU) - Výkonovo kritické

2. **vCore-based** (Odporúčané pre produkciu)
   - **General Purpose**: Vyvážený výpočet a úložisko
   - **Business Critical**: Nízka latencia, vysoké IOPS
   - **Hyperscale**: Vysoko škálovateľné úložisko (až do 100 TB)

#### Príkladové konfigurácie

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

#### Typy prostredí

1. **Consumption-based**
   - Platba za použitie
   - Vhodné pre vývoj a variabilné záťaže
   - Zdieľaná infraštruktúra

2. **Dedicated (Workload Profiles)**
   - Dedikované výpočtové zdroje
   - Predvídateľný výkon
   - Lepšie pre produkčné záťaže

#### Príklady konfigurácií

**Development (Consumption)**
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

**Production (Dedicated)**
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

#### Modely priepustnosti

1. **Manuálne predpísaná priepustnosť**
   - Predvídateľný výkon
   - Zľavy za rezervovanú kapacitu
   - Najlepšie pre stabilné záťaže

2. **Autoscale predpísaná priepustnosť**
   - Automatické škálovanie podľa využitia
   - Platíte za to, čo použijete (s minimom)
   - Dobré pre variabilné záťaže

3. **Serverless**
   - Platba za požiadavku
   - Žiadna predpísaná priepustnosť
   - Ideálne pre vývoj a prerušované záťaže

#### Príklady SKU

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

#### Typy účtov úložiska

1. **Standard_LRS** - Vývoj, nekritické dáta
2. **Standard_GRS** - Produkcia, potreba geo-redundancie
3. **Premium_LRS** - Aplikácie s vysokým výkonom
4. **Premium_ZRS** - Vysoká dostupnosť so zónovou redundanciou

#### Výkonové úrovne

- **Standard**: Všeobecné použitie, nákladovo efektívne
- **Premium**: Vysoký výkon, scenáre s nízkou latenciou

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

## Stratégie optimalizácie nákladov

### 1. Rezervovaná kapacita

Rezervujte zdroje na 1-3 roky pre výrazné zľavy:

```bash
# Skontrolovať možnosti rezervácie
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Správna veľkosť (Right-Sizing)

Začnite s menšími SKU a škálujte podľa skutočného využitia:

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

### 3. Konfigurácia automatického škálovania

Implementujte inteligentné škálovanie na optimalizáciu nákladov:

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

### 4. Naplánované škálovanie

Znižujte kapacity mimo špičky:

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

## Výkonové úvahy

### Základné výkonové požiadavky

Definujte jasné výkonové požiadavky pred výberom SKU:

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

### Testovanie záťaže

Otestujte rôzne SKU na overenie výkonu:

```bash
# Služba Azure Load Testing
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Monitorovanie a optimalizácia

Nastavte komplexné monitorovanie:

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

## Rýchle referenčné tabuľky

### Rýchla referencia SKU pre App Service

| SKU | Úroveň | vCPU | RAM | Úložisko | Cenové rozpätie | Použitie |
|-----|--------|------|-----|---------|-----------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | Vývoj |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Malé aplikácie |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Produkcia |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Vysoký výkon |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### Rýchla referencia SKU pre SQL Database

| SKU | Úroveň | DTU/vCore | Úložisko | Cenové rozpätie | Použitie |
|-----|--------|-----------|---------|-----------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Vývoj |
| S2 | Standard | 50 DTU | 250GB | $$ | Malá produkcia |
| P2 | Premium | 250 DTU | 1TB | $$$ | Vysoký výkon |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Vyvážené |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Kritické pre misiu |

### Rýchla referencia SKU pre Container Apps

| Model | Cenový model | CPU/Pamäť | Použitie |
|-------|--------------|-----------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Vývoj, variabilné zaťaženie |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Produkcia |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | Vysoký výkon |

---

## Nástroje na overenie

### Kontrola dostupnosti SKU

```bash
#!/bin/bash
# Skontrolujte dostupnosť SKU v cieľovom regióne

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

# Použitie
check_sku_availability "eastus" "app-service" "P1V3"
```

### Skript odhadu nákladov

```powershell
# PowerShell skript na odhad nákladov
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
        
        # Použite Azure Pricing API alebo kalkulačku
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Použitie
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### Overenie výkonu

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

## Súhrn osvedčených postupov

### Čo robiť

1. **Začnite s malým a škálujte nahor** na základe skutočného využitia
2. **Používajte rôzne SKU pre rôzne prostredia**
3. **Nepretržite monitorujte výkon a náklady**
4. **Využívajte rezervovanú kapacitu pre produkčné záťaže**
5. **Implementujte automatické škálovanie tam, kde je to vhodné**
6. **Testujte výkon s realistickými pracovnými zaťaženiami**
7. **Plánujte rast, ale vyvarujte sa nadmerného rezervovania zdrojov**
8. **Pre vývoj použite bezplatné úrovne, keď je to možné**

### Čo nerobiť

1. **Nepoužívajte produkčné SKU pre vývoj**
2. **Neignorujte regionálnu dostupnosť SKU**
3. **Nezabúdajte na náklady na prenos dát**
4. **Neprovádzajte nadmerné zabezpečenie zdrojov bez odôvodnenia**
5. **Neignorujte vplyv závislostí**
6. **Nastavte limity automatického škálovania príliš vysoko**
7. **Nezabúdajte na požiadavky súladu**
8. **Nerušte rozhodnutia založené len na cene**

---

**Užitočný tip**: Použite Azure Cost Management a Advisor na získanie personalizovaných odporúčaní na optimalizáciu výberu SKU na základe skutočných vzorov využitia.

---

**Navigácia**
- **Predchádzajúca lekcia**: [Plánovanie kapacity](capacity-planning.md)
- **Ďalšia lekcia**: [Predletové kontroly](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vylúčenie zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa usilujeme o presnosť, uvedomte si prosím, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku treba považovať za rozhodujúci zdroj. Pre kritické informácie sa odporúča profesionálny preklad vykonaný človekom. Nezodpovedáme za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
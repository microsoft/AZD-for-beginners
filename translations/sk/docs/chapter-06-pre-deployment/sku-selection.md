# Sprievodca výberom SKU - Výber správnych úrovní služieb Azure

**Navigácia v kapitole:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 6 - Overenie a plánovanie pred nasadením
- **⬅️ Predchádzajúca**: [Plánovanie kapacity](capacity-planning.md)
- **➡️ Nasledujúca**: [Kontroly pred letom](preflight-checks.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 7: Riešenie problémov](../chapter-07-troubleshooting/common-issues.md)

## Úvod

Tento komplexný sprievodca vám pomôže vybrať optimálne SKU služieb Azure (jednotky skladového evidencia) pre rôzne prostredia, pracovné zaťaženia a požiadavky. Naučíte sa analyzovať potreby výkonu, nákladové úvahy a požiadavky na škálovateľnosť na výber najvhodnejších úrovní služieb pre vaše nasadenia pomocou Azure Developer CLI.

## Ciele učenia

Po dokončení tohto sprievodcu budete:
- Rozumieť konceptom SKU Azure, cenovým modelom a rozdielom vo funkciách
- Ovládať stratégie výberu SKU špecifické pre prostredie pre vývoj, testovanie a produkciu
- Analyzovať požiadavky pracovných zaťažení a priradiť ich k vhodným úrovniam služieb
- Implementovať stratégie optimalizácie nákladov prostredníctvom inteligentného výberu SKU
- Použiť techniky testovania výkonu a overovania pre výber SKU
- Nastaviť automatizované odporúčania SKU a monitorovanie

## Výsledky učenia

Po dokončení budete schopní:
- Vybrať vhodné SKU služieb Azure na základe požiadaviek a obmedzení pracovného zaťaženia
- Navrhnúť nákladovo efektívne viac-prostredné architektúry s vhodným výberom úrovní
- Implementovať benchmarking výkonu a jeho overovanie pri výbere SKU
- Vytvárať automatizované nástroje na odporúčanie SKU a optimalizáciu nákladov
- Plánovať migrácie SKU a stratégie škálovania pri meniacich sa požiadavkách
- Použiť princípy Azure Well-Architected Framework pri výbere úrovní služieb

## Obsah

- [Pochopenie SKU](#understanding-skus)
- [Výber podľa prostredia](#environment-based-selection)
- [Pokyny špecifické pre služby](#service-specific-guidelines)
- [Stratégie optimalizácie nákladov](#cost-optimization-strategies)
- [Úvahy o výkone](#performance-considerations)
- [Rýchle tabuľky referencií](#quick-reference-tables)
- [Nástroje na overovanie](#validation-tools)

---

## Pochopenie SKU

> **Príklad rozsahu:** YAML mapy SKU a konfiguračné nastavenia výkonu nižšie sú poznámkami k dizajnu, nie schémou `azure.yaml` alebo konfiguráciou nástroja na zaťaženie. Bicep bloky sú alternatívy/fragmenty: deklarujte ich parametre a nadradené zdroje, používajte unikátne symbolické názvy pri ich kombinovaní a prepájajte moduly do funkčného projektu. Ceny, limity a dostupnosť regiónu/SKU treba pred nasadením skontrolovať pre vaše predplatné.

### Čo sú SKU?

SKU (Stock Keeping Units) predstavujú rôzne úrovne služieb a výkonnostné úrovne pre zdroje Azure. Každé SKU ponúka iné:

- **Výkonnostné vlastnosti** (CPU, pamäť, priepustnosť)
- **Dostupnosť funkcií** (možnosti škálovania, úrovne SLA)
- **Cenové modely** (spotrebné, rezervovaná kapacita)
- **Regionálna dostupnosť** (nie všetky SKU sú dostupné vo všetkých regiónoch)

### Kľúčové faktory pri výbere SKU

1. **Požiadavky pracovného zaťaženia**
   - Očakávané vzory prevádzky/zaťaženia
   - Výkonnostné požiadavky (CPU, pamäť, I/O)
   - Potreba úložiska a vzory prístupu

2. **Typ prostredia**
   - Vývoj/testovanie verzus produkcia
   - Požiadavky na dostupnosť
   - Požiadavky na bezpečnosť a súlad

3. **Rozpočtové obmedzenia**
   - Počiatočné náklady verzus prevádzkové náklady
   - Zľavy za rezervovanú kapacitu
   - Dôsledky automatického škálovania na náklady

4. **Projekcie rastu**
   - Požiadavky na škálovateľnosť
   - Budúce potreby funkcií
   - Zložitosť migrácie

---

## Výber podľa prostredia

### Vývojové prostredie

**Priority**: Optimalizácia nákladov, základná funkčnosť, jednoduché zriaďovanie/zrušovanie

#### Odporúčané SKU
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

#### Charakteristiky
- **App Service**: F1 (bezplatný) alebo B1 (základný) pre jednoduché testovanie
- **Databázy**: Základná úroveň s minimálnymi zdrojmi
- **Úložisko**: Štandardné s lokálnou redundanciou iba
- **Výpočty**: Sdielané zdroje prijateľné
- **Sieťovanie**: Základné konfigurácie

### Testovacie/Stagingové prostredie

**Priority**: Konfigurácia blízka produkcii, rovnováha nákladov, možnosť testovania výkonu

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
- **Funkcie**: Väčšina produkčných funkcií zapnutá
- **Redundancia**: Niektorá geografická redundancia
- **Škálovanie**: Obmedzené automatické škálovanie na testovanie
- **Monitorovanie**: Plný monitorovací stack

### Produkčné prostredie

**Priority**: Výkon, dostupnosť, bezpečnosť, súlad, škálovateľnosť

#### Odporúčané SKU
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

#### Charakteristiky
- **Vysoká dostupnosť**: Požiadavky SLA 99,9 %+
- **Výkon**: Dedikované zdroje, vysoká priepustnosť
- **Bezpečnosť**: Prémiové bezpečnostné funkcie
- **Škálovanie**: Plné automatické škálovanie
- **Monitorovanie**: Komplexná observabilita

---

## Pokyny špecifické pre služby

### Azure App Service

#### Matica rozhodovania SKU

| Použitie | Odporúčané SKU | Odôvodnenie |
|----------|----------------|-----------|
| Vývoj/Testovanie | F1 (bezplatný) alebo B1 (základný) | Nákladovo efektívne, postačujúce na testovanie |
| Malé produkčné aplikácie | S1 (štandard) | Vlastné domény, SSL, automatické škálovanie |
| Stredné produkčné aplikácie | P1V3 (prémiový V3) | Lepší výkon, viac funkcií |
| Aplikácie s vysokou návštevnosťou | P2V3 alebo P3V3 | Dedikované zdroje, vysoký výkon |
| Kritické aplikácie | I1V2 (izolovaný V2) | Sieťová izolácia, dedikovaný hardvér |

#### Príklady konfigurácie

**Vývoj**
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

**Produkcia**
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

1. **Na základe DTU (Database Transaction Units)**
   - **Basic**: 5 DTU - vývoj/testovanie
   - **Standard**: S0-S12 (10-3000 DTU) - všeobecné účely
   - **Premium**: P1-P15 (125-4000 DTU) - kriticky náročné na výkon

2. **Na základe vCore** (odporúčané pre produkciu)
   - **General Purpose**: Vyvážený výpočet a úložisko
   - **Business Critical**: Nízka latencia, vysoké IOPS
   - **Hyperscale**: Veľmi škálovateľné úložisko; overte aktuálne limity veľkosti a regionálnu podporu

#### Príklady konfigurácie

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

1. **Spotrebné (Consumption-based)**
   - Platíte podľa použitia
   - Vhodné pre vývoj a variabilné zaťaženia
   - Sdielaná infraštruktúra

2. **Dedikované (Profil pracovného zaťaženia)**
   - Dedikované výpočtové zdroje
   - Predvídateľný výkon
   - Lepšie pre produkčné zaťaženia

#### Príklady konfigurácie

**Vývoj (Spotreba)**
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

**Produkcia (Dedikované)**
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

Zónová redundancia tiež vyžaduje infraštruktúru v podporovanom regióne a vhodnú konfiguráciu VNet/subnetu, ktoré nie sú tu uvedené. Tento príklad plánuje tri dedikované uzly; nakonfigurujte aspoň dve repliky aplikácie pre rozloženie naprieč zónami a nastavte veľkosť replík aj uzlov na zónový výpadok. Viac na [Návody na spoľahlivosť Container Apps](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Pre priradenie aplikácie k tomuto profilu nastavte jej `workloadProfileName: 'production-profile'`; vytvorenie profilu samo o sebe aplikácie nepresunie.

### Azure Cosmos DB

#### Modely priepustnosti

1. **Manuálne priradená priepustnosť**
   - Predvídateľný výkon
   - Zľavy za rezervovanú kapacitu
   - Najlepšie pre stabilné pracovné zaťaženia

2. **Automatické škálovanie priepustnosti**
   - Automatické škálovanie podľa používania
   - Platíte len za to, čo použijete (s minimom)
   - Dobré pre variabilné pracovné zaťaženia

3. **Serverless**
   - Platite za požiadavku
   - Bez priradenej priepustnosti
   - Ideálne pre vývoj a prerušované zaťaženia

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

#### Typy úložných účtov

1. **Standard_LRS** - Vývoj, nekritické dáta
2. **Standard_GRS** - Produkcia, potreba geo-redundancie
3. **Premium_LRS** - Aplikácie s vysokým výkonom
4. **Premium_ZRS** - Vysoká dostupnosť so zónovou redundanciou

#### Výkonnostné úrovne

- **Standard**: Všeobecné účely, nákladovo efektívne
- **Premium**: Vysoký výkon, nízke latencie

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
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Ponuky rezervácií a typy oprávnených zdrojov sa líšia; skontrolujte katalóg a podmienky nákupu namiesto predpokladu, že každá služba/SKU podporuje rezerváciu.

### 2. Správna veľkosť (Right-Sizing)

Začnite s menšími SKU a škálujte podľa skutočného používania:

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

### 4. Plánované škálovanie

Zmenšujte kapacitu počas nepracovných hodín:

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

## Úvahy o výkone

### Základné požiadavky na výkon

Definujte jasné požiadavky na výkon pred výberom SKU:

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

### Testovanie zaťaženia

Testujte rôzne SKU na overenie výkonu:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
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

## Rýchle tabuľky referencií

### Rýchla referencia pre SKU App Service

| SKU | Úroveň | vCPU | RAM | Úložisko | Cenové rozpätie | Použitie |
|-----|--------|------|-----|----------|-----------------|----------|
| F1 | Bezplatná | Sdielané | 1GB | 1GB | Zdarma | Vývoj |
| B1 | Základná | 1 | 1,75GB | 10GB | $ | Malé aplikácie |
| S1 | Štandardná | 1 | 1,75GB | 50GB | $$ | Produkcia |
| P1V3 | Prémiová V3 | 2 | 8GB | 250GB | $$$ | Vysoký výkon |
| I1V2 | Izolovaná V2 | 2 | 8GB | 1TB | $$$$ | Podniková |

### Rýchla referencia SKU SQL Database

| SKU | Úroveň | DTU/vCore | Úložisko | Cenové rozpätie | Použitie |
|-----|--------|----------|----------|-----------------|----------|
| Basic | Základná | 5 DTU | 2GB | $ | Vývoj |
| S2 | Štandardná | 50 DTU | 250GB | $$ | Malá produkcia |
| P2 | Prémiová | 250 DTU | 1TB | $$$ | Vysoký výkon |
| GP_Gen5_4 | Všeobecné účely | 4 vCore | 4TB | $$$ | Vyvážené |
| BC_Gen5_8 | Podniková kritická | 8 vCore | 4TB | $$$$ | Misiou kritické |

### Rýchla referencia SKU Container Apps

| Model | Ceny | CPU/Pamäť | Použitie |
|-------|-------|-----------|-----------|
| Spotreba | Platíte podľa spotreby | Podporované kombinácie CPU/pamäte závisia od prostredia/profilu | Vývoj alebo produkcia, variabilné zaťaženie |
| Dedikovaný D4 | Fakturácia dedikovaných uzlov | 4 vCPU, 16GiB na uzol | Pretrvávajúce zaťaženie/izolácia |
| Dedikovaný D8 | Fakturácia dedikovaných uzlov | 8 vCPU, 32GiB na uzol | Vyššie trvalé zaťaženie |

---

## Nástroje na overovanie

### Kontrola dostupnosti SKU

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

### Skript na odhad nákladov

**Len pseudokód:** `Get-ResourceCost` nižšie je funkcia špecifická pre projekt, ktorú musíte implementovať pomocou aktuálnych regionálnych/cenových zmluvných údajov a predpokladov využitia. Nie je to PowerShell alebo Azure cmdlet.

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

### Overovanie výkonu

Nižšie uvedené YAML je náčrt požiadaviek, **nie** schéma vstupu pre Azure Load Testing, JMeter, Locust alebo k6. Preložte ho do konfigurácie vybraného nástroja pred použitím príkazu load-test vyššie.

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

## Zhrnutie najlepších postupov

### Čo robiť

1. **Začíname s malými SKU a škálujeme podľa skutočného využitia**
2. **Používajte rôzne SKU pre rôzne prostredia**
3. **Neustále sledujte výkon a náklady**
4. **Využite rezervovanú kapacitu pre produkčné zaťaženia**
5. **Implementujte automatické škálovanie tam, kde je vhodné**
6. **Testujte výkon s realistickými záťažami**
7. **Plánujte rast, ale vyhnite sa nadmernému priraďovaniu zdrojov**
8. **Používajte bezplatné úrovne pre vývoj, ak je to možné**

### Čomu sa vyhnúť

1. **Nepoužívajte produkčné SKU pre vývoj**
2. **Neignorujte regionálnu dostupnosť SKU**
3. **Nezabúdajte na náklady na prenos dát**
4. **Nenadmerne nepriraďujte zdroje bez dôvodu**
5. **Neignorujte vplyv závislostí**
6. **Nenastavujte príliš vysoké limity automatického škálovania**
7. **Nezabúdajte na požiadavky súladu**
8. **Nerobte rozhodnutia len na základe ceny**

---

**Profesionálny tip**: Použite Azure Cost Management a Advisor pre získanie personalizovaných odporúčaní na optimalizáciu výberu SKU na základe skutočných vzorov využitia.

---

**Navigácia**
- **Predchádzajúca lekcia**: [Plánovanie kapacity](capacity-planning.md)
- **Nasledujúca lekcia**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
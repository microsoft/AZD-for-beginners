<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7c000a3a8f4a04aa85c6d35714e3dee0",
  "translation_date": "2025-09-10T06:50:20+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "sk"
}
-->
# Sprievodca výberom SKU - Výber správnych úrovní služieb Azure

## Úvod

Tento komplexný sprievodca vám pomôže vybrať optimálne SKU (Stock Keeping Units) služieb Azure pre rôzne prostredia, pracovné zaťaženia a požiadavky. Naučte sa analyzovať potreby výkonu, náklady a požiadavky na škálovateľnosť, aby ste si vybrali najvhodnejšie úrovne služieb pre nasadenia Azure Developer CLI.

## Ciele učenia

Po dokončení tohto sprievodcu budete:
- Rozumieť konceptom SKU Azure, modelom cien a rozdielom vo funkciách
- Ovládať stratégie výberu SKU špecifické pre prostredie, ako je vývoj, testovanie a produkcia
- Analyzovať požiadavky pracovného zaťaženia a priradiť ich k vhodným úrovniam služieb
- Implementovať stratégie optimalizácie nákladov prostredníctvom inteligentného výberu SKU
- Používať techniky testovania výkonu a validácie pre výber SKU
- Konfigurovať automatizované odporúčania SKU a monitorovanie

## Výsledky učenia

Po dokončení budete schopní:
- Vybrať vhodné SKU služieb Azure na základe požiadaviek a obmedzení pracovného zaťaženia
- Navrhnúť nákladovo efektívne architektúry pre viac prostredí s vhodným výberom úrovní
- Implementovať benchmarking výkonu a validáciu pre výber SKU
- Vytvoriť automatizované nástroje na odporúčanie SKU a optimalizáciu nákladov
- Plánovať migrácie SKU a stratégie škálovania pre meniace sa požiadavky
- Používať princípy Azure Well-Architected Framework pri výbere úrovní služieb

## Obsah

- [Porozumenie SKU](../../../../docs/pre-deployment)
- [Výber na základe prostredia](../../../../docs/pre-deployment)
- [Pokyny špecifické pre služby](../../../../docs/pre-deployment)
- [Stratégie optimalizácie nákladov](../../../../docs/pre-deployment)
- [Úvahy o výkone](../../../../docs/pre-deployment)
- [Tabuľky rýchleho odkazu](../../../../docs/pre-deployment)
- [Nástroje validácie](../../../../docs/pre-deployment)

---

## Porozumenie SKU

### Čo sú SKU?

SKU (Stock Keeping Units) predstavujú rôzne úrovne služieb a výkonnostné úrovne pre zdroje Azure. Každé SKU ponúka rôzne:

- **Výkonnostné charakteristiky** (CPU, pamäť, priepustnosť)
- **Dostupnosť funkcií** (možnosti škálovania, úrovne SLA)
- **Modely cien** (na základe spotreby, rezervovanej kapacity)
- **Regionálna dostupnosť** (nie všetky SKU sú dostupné vo všetkých regiónoch)

### Kľúčové faktory pri výbere SKU

1. **Požiadavky pracovného zaťaženia**
   - Očakávané vzory prevádzky/záťaže
   - Požiadavky na výkon (CPU, pamäť, I/O)
   - Potreby úložiska a vzory prístupu

2. **Typ prostredia**
   - Vývoj/testovanie vs. produkcia
   - Požiadavky na dostupnosť
   - Potreby bezpečnosti a súladu

3. **Obmedzenia rozpočtu**
   - Počiatočné náklady vs. prevádzkové náklady
   - Zľavy na rezervovanú kapacitu
   - Dopady nákladov na automatické škálovanie

4. **Projekcie rastu**
   - Požiadavky na škálovateľnosť
   - Budúce potreby funkcií
   - Zložitosť migrácie

---

## Výber na základe prostredia

### Prostredie vývoja

**Priority**: Optimalizácia nákladov, základná funkcionalita, jednoduché zriadenie/zrušenie

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
- **Úložisko**: Štandardné s lokálnou redundanciou
- **Výpočty**: Zdieľané zdroje sú prijateľné
- **Sieť**: Základné konfigurácie

### Prostredie testovania/stagingu

**Priority**: Konfigurácia podobná produkcii, rovnováha nákladov, schopnosť testovania výkonu

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
- **Výkon**: 70-80% kapacity produkcie
- **Funkcie**: Väčšina funkcií produkcie povolená
- **Redundancia**: Niektorá geografická redundancia
- **Škálovanie**: Obmedzené automatické škálovanie na testovanie
- **Monitorovanie**: Kompletný monitorovací balík

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
- **Vysoká dostupnosť**: Požiadavky SLA 99.9%+
- **Výkon**: Dedikované zdroje, vysoká priepustnosť
- **Bezpečnosť**: Prémiové bezpečnostné funkcie
- **Škálovanie**: Kompletné možnosti automatického škálovania
- **Monitorovanie**: Komplexná pozorovateľnosť

---

## Pokyny špecifické pre služby

### Azure App Service

#### Matica rozhodovania SKU

| Použitie | Odporúčané SKU | Dôvod |
|----------|----------------|-------|
| Vývoj/testovanie | F1 (Free) alebo B1 (Basic) | Nákladovo efektívne, dostatočné na testovanie |
| Malé produkčné aplikácie | S1 (Standard) | Vlastné domény, SSL, automatické škálovanie |
| Stredné produkčné aplikácie | P1V3 (Premium V3) | Lepší výkon, viac funkcií |
| Aplikácie s vysokou prevádzkou | P2V3 alebo P3V3 | Dedikované zdroje, vysoký výkon |
| Kritické aplikácie | I1V2 (Isolated V2) | Izolácia siete, dedikovaný hardvér |

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
   - **Basic**: 5 DTU - Vývoj/testovanie
   - **Standard**: S0-S12 (10-3000 DTU) - Všeobecné použitie
   - **Premium**: P1-P15 (125-4000 DTU) - Kritický výkon

2. **Na základe vCore** (Odporúčané pre produkciu)
   - **General Purpose**: Vyvážené výpočty a úložisko
   - **Business Critical**: Nízka latencia, vysoké IOPS
   - **Hyperscale**: Vysoko škálovateľné úložisko (až 100TB)

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

1. **Na základe spotreby**
   - Ceny za použitie
   - Vhodné pre vývoj a variabilné pracovné zaťaženia
   - Zdieľaná infraštruktúra

2. **Dedikované (Workload Profiles)**
   - Dedikované výpočtové zdroje
   - Predvídateľný výkon
   - Lepšie pre produkčné pracovné zaťaženia

#### Príklady konfigurácie

**Vývoj (spotreba)**
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

**Produkcia (dedikované)**
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

1. **Manuálne nastavená priepustnosť**
   - Predvídateľný výkon
   - Zľavy na rezervovanú kapacitu
   - Najlepšie pre stabilné pracovné zaťaženia

2. **Automatické škálovanie priepustnosti**
   - Automatické škálovanie na základe použitia
   - Platba za použitie (s minimom)
   - Dobré pre variabilné pracovné zaťaženia

3. **Serverless**
   - Platba za požiadavku
   - Bez nastavenej priepustnosti
   - Ideálne pre vývoj a prerušované pracovné zaťaženia

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
2. **Standard_GRS** - Produkcia, potrebná geografická redundancia
3. **Premium_LRS** - Aplikácie s vysokým výkonom
4. **Premium_ZRS** - Vysoká dostupnosť so zónovou redundanciou

#### Výkonnostné úrovne

- **Standard**: Všeobecné použitie, nákladovo efektívne
- **Premium**: Vysoký výkon, nízka latencia

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

Rezervujte zdroje na 1-3 roky pre významné zľavy:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Správne dimenzovanie

Začnite s menšími SKU a škálujte na základe skutočného použitia:

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

### 4. Plánované škálovanie

Znížte škálovanie počas neaktívnych hodín:

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

### Testovanie záťaže

Testujte rôzne SKU na validáciu výkonu:

```bash
# Azure Load Testing service
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

## Tabuľky rýchleho odkazu

### Rýchly odkaz na SKU App Service

| SKU | Úroveň | vCPU | RAM | Úložisko | Cenové rozpätie | Použitie |
|-----|--------|------|-----|----------|-----------------|----------|
| F1 | Free | Zdieľané | 1GB | 1GB | Free | Vývoj |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Malé aplikácie |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Produkcia |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Vysoký výkon |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Podnikové |

### Rýchly odkaz na SKU SQL Database

| SKU | Úroveň | DTU/vCore | Úložisko | Cenové rozpätie | Použitie |
|-----|--------|-----------|----------|-----------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Vývoj |
| S2 | Standard | 50 DTU | 250GB | $$ | Malá produkcia |
| P2 | Premium | 250 DTU | 1TB | $$$ | Vysoký výkon |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Vyvážené |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Kritické |

### Rýchly odkaz na SKU Container Apps

| Model | Ceny | CPU/Pamäť | Použitie |
|-------|------|-----------|----------|
| Spotreba | Platba za použitie | 0.25-2 vCPU | Vývoj, variabilná záťaž |
| Dedikované D4 | Rezervované | 4 vCPU, 16GB | Produkcia |
| Dedikované D8 | Rezervované | 8 vCPU, 32GB | Vysoký výkon |

---

## Nástroje validácie

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

### Skript na odhad nákladov

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

### Validácia výkonu

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

## Zhrnutie najlepších praktík

### Čo robiť

1. **Začnite s malými SKU a škálujte** na základe skutočného použitia
2. **Používajte rôzne SKU pre rôzne prostredia**
3. **Nepretržite monitorujte výkon a náklady**
4. **Využívajte rezervovanú kapacitu pre produkčné pracovné zaťaženia**
5. **Implementujte automatické škálovanie tam, kde je to vhodné**
6. **Testujte výkon s realistickými pracovnými zaťaženiami**
7. **Plánujte rast, ale vyhnite sa nadmernej kapacite**
8. **Používajte bezplatné úrovne pre vývoj, keď je to možné**

### Čo nerobiť

1. **Nepoužívajte produkčné SKU pre vývoj**
2. **Neignorujte regionálnu dostupnosť SKU**
3. **Nezabúdajte na náklady na prenos dát**
4. **Nepreťažujte bez opodstatnenia**
5. **Neignorujte dopad závislostí**
6. **Nenastavujte limity automatického škálovania príliš vysoko**
7. **Nezabúdajte na požiadavky na súlad**
8. **Nerobte rozhodnutia len na základe ceny**

---

**Tip**: Používajte Azure Cost Management a Advisor na získanie personalizovaných odporúčaní na optimalizáciu výberu SKU na základe skutočných vzorov použitia.

---

**Navigácia**
- **Predchádzajúca lekcia**: [Plánovanie kapacity](capacity-planning.md)
- **Nasledujúca lekcia**: [Kontroly pred nasadením](preflight-checks.md)

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby na automatický preklad [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, upozorňujeme, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre dôležité informácie sa odporúča profesionálny ľudský preklad. Nezodpovedáme za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
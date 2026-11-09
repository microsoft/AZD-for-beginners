# Průvodce výběrem SKU - Jak vybrat správné úrovně služeb Azure

**Navigace kapitolou:**
- **📚 Domů kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 6 - Validace a plánování před nasazením
- **⬅️ Předchozí**: [Plánování kapacity](capacity-planning.md)
- **➡️ Další**: [Předběžné kontroly](preflight-checks.md)
- **🚀 Další kapitola**: [Kapitola 7: Řešení problémů](../chapter-07-troubleshooting/common-issues.md)

## Úvod

Tento ucelený průvodce vám pomůže vybrat optimální SKU (jednotky skladové evidence) Azure služeb pro různá prostředí, zátěže a požadavky. Naučíte se analyzovat potřeby výkonu, cenové faktory a požadavky na škálovatelnost, abyste mohli zvolit nejvhodnější úrovně služeb pro nasazení pomocí Azure Developer CLI.

## Výukové cíle

Po dokončení tohoto průvodce budete schopni:
- Porozumět konceptům SKU Azure, cenovým modelům a rozdílům ve funkcích
- Ovládnout strategie výběru SKU specifické pro prostředí (vývoj, staging, produkce)
- Analyzovat požadavky zátěže a přiřadit je k vhodným úrovním služeb
- Implementovat strategie optimalizace nákladů prostřednictvím inteligentního výběru SKU
- Aplikovat techniky testování výkonu a validace výběru SKU
- Konfigurovat automatizovaná doporučení SKU a monitorování

## Výsledky učení

Po dokončení budete schopni:
- Vybrat vhodné SKU Azure služeb na základě požadavků a omezení zátěže
- Navrhnout nákladově efektivní architektury pro více prostředí se správným výběrem úrovní
- Implementovat testování výkonu a validaci pro výběr SKU
- Vytvářet automatizované nástroje pro doporučení SKU a optimalizaci nákladů
- Plánovat migrace SKU a škálovací strategie na základě měnících se požadavků
- Aplikovat principy Azure Well-Architected Framework pro výběr úrovně služby

## Obsah

- [Porozumění SKU](#understanding-skus)
- [Výběr podle prostředí](#environment-based-selection)
- [Pokyny pro konkrétní služby](#service-specific-guidelines)
- [Strategie optimalizace nákladů](#cost-optimization-strategies)
- [Úvahy o výkonu](#performance-considerations)
- [Rychlé referenční tabulky](#quick-reference-tables)
- [Nástroje pro validaci](#validation-tools)

---

## Porozumění SKU

> **Příklad rozsahu:** YAML mapy SKU a konfigurace výkonu níže jsou návrhové poznámky, nikoli schematu `azure.yaml` nebo konfigurace nástroje pro zatížení. Bloky Bicep jsou alternativy/fragmenty: deklarujte jejich parametry a nadřazené zdroje, používejte jedinečné symbolické názvy při jejich kombinování a propojujte moduly do funkčního projektu. Ceny, limity a dostupnost regio/sku je třeba před nasazením ověřit pro váš předplatný účet.

### Co jsou SKU?

SKU (jednotky skladové evidence) představují různé úrovně služby a úrovně výkonu pro zdroje Azure. Každé SKU nabízí různé:

- **Výkonové charakteristiky** (CPU, paměť, propustnost)
- **Dostupnost funkcí** (možnosti škálování, úrovně SLA)
- **Cenové modely** (na základě spotřeby, rezervované kapacity)
- **Regionální dostupnost** (ne všechna SKU jsou dostupná ve všech regionech)

### Klíčové faktory při výběru SKU

1. **Požadavky zátěže**
   - Očekávané vzory provozu/zátěže
   - Požadavky na výkon (CPU, paměť, I/O)
   - Potřeby úložiště a způsoby přístupu

2. **Typ prostředí**
   - Vývoj/testování vs. produkce
   - Požadavky na dostupnost
   - Požadavky na bezpečnost a soulad s předpisy

3. **Rozpočtová omezení**
   - Počáteční náklady vs. provozní náklady
   - Slevy za rezervovanou kapacitu
   - Dopady nákladů autoškálování

4. **Projekce růstu**
   - Požadavky na škálovatelnost
   - Budoucí potřeby funkcí
   - Složitost migrace

---

## Výběr podle prostředí

### Vývojové prostředí

**Priority**: Optimalizace nákladů, základní funkcionalita, snadné zprovoznění/odprovoznění

#### Doporučená SKU
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
- **App Service**: F1 (zdarma) nebo B1 (základní) pro jednoduché testování
- **Databáze**: základní úroveň s minimálními zdroji
- **Úložiště**: standardní s místní redundancí pouze
- **Výpočet**: sdílené zdroje jsou přijatelné
- **Síťování**: základní konfigurace

### Staging/Testovací prostředí

**Priority**: konfigurace podobná produkci, rovnováha nákladů, schopnost testování výkonu

#### Doporučená SKU
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
- **Výkon**: 70-80 % produkční kapacity
- **Funkce**: Většina produkčních funkcí povolena
- **Redundance**: Některá geografická redundance
- **Škálování**: Omezené autoškálování pro testování
- **Monitorování**: Plný monitorovací stack

### Produkční prostředí

**Priority**: Výkon, dostupnost, bezpečnost, soulad, škálovatelnost

#### Doporučená SKU
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
- **Vysoká dostupnost**: požadavky na SLA 99,9 % a více
- **Výkon**: vyhrazené zdroje, vysoká propustnost
- **Bezpečnost**: prémiové bezpečnostní funkce
- **Škálování**: plné schopnosti autoškálování
- **Monitorování**: komplexní pozorovatelnost

---

## Pokyny pro konkrétní služby

### Azure App Service

#### Matice rozhodování o SKU

| Použití | Doporučená SKU | Odůvodnění |
|----------|----------------|-----------|
| Vývoj/Testování | F1 (zdarma) nebo B1 (základní) | Nákladově efektivní, dostačující pro testování |
| Malé produkční aplikace | S1 (standard) | Vlastní domény, SSL, autoškálování |
| Střední produkční aplikace | P1V3 (prémiová V3) | Lepší výkon, více funkcí |
| Aplikace s vysokou návštěvností | P2V3 nebo P3V3 | Vyhrazené zdroje, vysoký výkon |
| Kritické aplikace | I1V2 (izolovaná V2) | Síťová izolace, vyhrazený hardware |

#### Příklady konfigurací

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

**Produkce**
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

#### Rámec pro výběr SKU

1. **Na základě DTU (Databázové transakční jednotky)**
   - **Basic**: 5 DTU - vývoj/testování
   - **Standard**: S0-S12 (10-3000 DTU) - obecné použití
   - **Premium**: P1-P15 (125-4000 DTU) - kritický výkon

2. **Na základě vCore** (doporučeno pro produkci)
   - **General Purpose**: vyvážený výpočet a úložiště
   - **Business Critical**: nízká latence, vysoké IOPS
   - **Hyperscale**: vysoce škálovatelné úložiště; ověřte aktuální limity velikosti a regionální podporu

#### Příklad konfigurací

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

#### Typy prostředí

1. **Na základě spotřeby**
   - Platba podle využití
   - Vhodné pro vývoj a proměnlivé zátěže
   - Sdílená infrastruktura

2. **Vyhrazené (profil zátěže)**
   - Vyhrazené výpočetní zdroje
   - Předvídatelný výkon
   - Vhodnější pro produkční zátěže

#### Příklady konfigurací

**Vývoj (Spotřeba)**
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

**Produkce (Vyhrazené)**
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

Zona redundance rovněž vyžaduje infrastrukturu podporující regiony a vhodnou konfiguraci VNet/podsíť, které jsou zde vynechány. Tento příklad plánuje tři vyhrazené uzly; nastavte alespoň dva repliky aplikace pro přesazení mezi zónami a velikost replik i uzlů optimalizujte pro selhání zóny. Viz [Pokyny pro spolehlivost Container Apps](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Pro přidání aplikace na tento profil nastavte její `workloadProfileName: 'production-profile'`; vytvoření profilu samo o sobě aplikace na něj nepřesune.

### Azure Cosmos DB

#### Modely propustnosti

1. **Manuálně nakonfigurovaná propustnost**
   - Předvídatelný výkon
   - Slevy za rezervovanou kapacitu
   - Nejlepší pro stabilní zátěže

2. **Autoškálovaná propustnost**
   - Automatické škálování na základě využití
   - Platba za využití (s minimem)
   - Vhodné pro proměnlivé zátěže

3. **Serverless**
   - Platba za požadavek
   - Žádná rezervovaná propustnost
   - Ideální pro vývoj a občasné zátěže

#### Příklady SKU

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

#### Typy účtů úložiště

1. **Standard_LRS** - vývoj, méně kritická data
2. **Standard_GRS** - produkce, potřeba geo-redundance
3. **Premium_LRS** - vysoce výkonné aplikace
4. **Premium_ZRS** - vysoká dostupnost se zonální redundancí

#### Výkonové úrovně

- **Standardní**: obecné použití, nákladově efektivní
- **Prémiové**: vysoce výkonné, nízká latence

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

## Strategie optimalizace nákladů

### 1. Rezervovaná kapacita

Rezervujte zdroje na 1-3 roky pro výrazné slevy:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Nabídky rezervací a způsobilé typy zdrojů se liší; prohlédněte si katalog a podmínky nákupu, nevyvozujte, že každá služba/SKU podporuje rezervaci.

### 2. Správná velikost

Začněte s menšími SKU a škálujte nahoru na základě skutečného využití:

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

### 3. Konfigurace autoškálování

Zavádějte inteligentní škálování pro optimalizaci nákladů:

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

### 4. Plánované škálování

Snižujte škálu během nešpičkových hodin:

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

## Úvahy o výkonu

### Základní požadavky na výkon

Definujte jasné požadavky na výkon před výběrem SKU:

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

### Testování zátěže

Testujte různé SKU pro ověření výkonu:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### Monitorování a optimalizace

Nastavte komplexní monitorování:

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

## Rychlé referenční tabulky

### Rychlý přehled SKU App Service

| SKU | Úroveň | vCPU | RAM | Úložiště | Cenové rozpětí | Použití |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Zdarma | Sdílený | 1GB | 1GB | Zdarma | Vývoj |
| B1 | Základní | 1 | 1.75GB | 10GB | $ | Malé aplikace |
| S1 | Standardní | 1 | 1.75GB | 50GB | $$ | Produkce |
| P1V3 | Prémiová V3 | 2 | 8GB | 250GB | $$$ | Vysoký výkon |
| I1V2 | Izolovaná V2 | 2 | 8GB | 1TB | $$$$ | Podniková |

### Rychlý přehled SKU SQL Database

| SKU | Úroveň | DTU/vCore | Úložiště | Cenové rozpětí | Použití |
|-----|------|-----------|---------|-------------|----------|
| Basic | Základní | 5 DTU | 2GB | $ | Vývoj |
| S2 | Standardní | 50 DTU | 250GB | $$ | Malá produkce |
| P2 | Prémiová | 250 DTU | 1TB | $$$ | Vysoký výkon |
| GP_Gen5_4 | Obecné použití | 4 vCore | 4TB | $$$ | Vyvážené |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Kritické aplikace |

### Rychlý přehled SKU Container Apps

| Model | Cena | CPU/Paměť | Použití |
|-------|---------|------------|----------|
| Spotřeba | Platba za použití | Podporované kombinace CPU/paměť závisí na prostředí/profilu | Vývoj nebo produkce, proměnlivá zátěž |
| Vyhrazený D4 | Účtování vyhrazeného uzlu | 4 vCPU, 16GiB na uzel | Nepřetržitá zátěž/požadavky na izolaci |
| Vyhrazený D8 | Účtování vyhrazeného uzlu | 8 vCPU, 32GiB na uzel | Vyšší nepřetržitá zátěž |

---

## Nástroje pro validaci

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

### Skript pro odhad nákladů

**Pouze pseudokód:** `Get-ResourceCost` níže je specifická funkce projektu, kterou musíte implementovat pomocí aktuálních regionálních/cenových údajů a předpokladů použití. Není to PowerShell nebo Azure cmdlet.

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

### Validace výkonu

Následující YAML je náčrtek požadavků, **nikoli** vstupní schema Azure Load Testing, JMeter, Locust nebo k6. Přeložte jej do konfigurace vámi zvoleného nástroje před použitím příkazu load-test výše.

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

## Souhrn osvědčených postupů

### Co dělat

1. **Začněte s malým a škálujte nahoru** na základě skutečného využití
2. **Používejte různé SKU pro různá prostředí**
3. **Průběžně monitorujte výkon a náklady**
4. **Využívejte rezervovanou kapacitu pro produkční zátěže**
5. **Implementujte autoškálování tam, kde je to vhodné**
6. **Testujte výkon s realistickými zátěžemi**
7. **Plánujte růst, ale vyhněte se nadměrnému přidělení zdrojů**
8. **Používejte bezplatné úrovně pro vývoj, pokud je to možné**

### Čemu se vyhnout

1. **Nepoužívejte produkční SKU pro vývoj**
2. **Neignorujte regionální dostupnost SKU**
3. **Nezapomínejte na náklady na přenos dat**
4. **Nepřidělujte zdroje bez dostatečného odůvodnění**
5. **Neignorujte vliv závislostí**
6. **Nenastavujte příliš vysoké limity autoškálování**
7. **Nezapomínejte na požadavky na soulad s předpisy**
8. **Nedělejte rozhodnutí pouze na základě ceny**

---

**Profesionální tip**: Použijte Azure Cost Management a Advisor pro získání personalizovaných doporučení na optimalizaci výběru SKU na základě skutečných vzorů využití.

---

**Navigace**
- **Předchozí lekce**: [Plánování kapacity](capacity-planning.md)
- **Další lekce**: [Předběžné kontroly](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Průvodce výběrem SKU - Výběr správných úrovní služeb Azure

**Navigace kapitolou:**
- **📚 Domů kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 6 - Ověření a plánování před nasazením
- **⬅️ Předchozí**: [Plánování kapacity](capacity-planning.md)
- **➡️ Další**: [Kontroly před nasazením](preflight-checks.md)
- **🚀 Další kapitola**: [Kapitola 7: Řešení problémů](../chapter-07-troubleshooting/common-issues.md)

## Úvod

Tento komplexní průvodce vám pomůže vybrat optimální SKU (Stock Keeping Units) služeb Azure pro různá prostředí, pracovní zatížení a požadavky. Naučíte se analyzovat požadavky na výkon, zvážit náklady a požadavky na škálovatelnost, abyste vybrali nejvhodnější úrovně služeb pro nasazení pomocí Azure Developer CLI.

## Cíle učení

Po dokončení tohoto průvodce budete:
- Rozumět konceptům SKU v Azure, modelům cen a rozdílům ve funkcích
- Ovládat strategie výběru SKU podle prostředí pro vývoj, staging a produkci
- Analyzovat požadavky pracovního zatížení a přiřazovat je k vhodným úrovním služeb
- Implementovat strategie optimalizace nákladů prostřednictvím inteligentního výběru SKU
- Používat techniky testování výkonu a ověřování pro volbu SKU
- Konfigurovat automatizovaná doporučení SKU a monitorování

## Výsledky učení

Po dokončení budete schopni:
- Vybrat vhodné SKU služeb Azure na základě požadavků a omezení pracovního zatížení
- Navrhnout nákladově efektivní architektury pro více prostředí s vhodným výběrem úrovní
- Implementovat benchmarkování výkonu a ověřování pro volbu SKU
- Vytvořit automatizované nástroje pro doporučení SKU a optimalizaci nákladů
- Plánovat migrace SKU a strategie škálování pro měnící se požadavky
- Aplikovat principy Azure Well-Architected Framework při výběru úrovní služeb

## Obsah

- [Porozumění SKU](../../../../docs/chapter-06-pre-deployment)
- [Výběr podle prostředí](../../../../docs/chapter-06-pre-deployment)
- [Pokyny specifické pro služby](../../../../docs/chapter-06-pre-deployment)
- [Strategie optimalizace nákladů](../../../../docs/chapter-06-pre-deployment)
- [Výkonové úvahy](../../../../docs/chapter-06-pre-deployment)
- [Rychlé referenční tabulky](../../../../docs/chapter-06-pre-deployment)
- [Nástroje pro ověření](../../../../docs/chapter-06-pre-deployment)

---

## Porozumění SKU

### Co jsou SKU?

SKU (Stock Keeping Units) představují různé úrovně služeb a výkonnostní profily pro zdroje Azure. Každé SKU nabízí odlišné:

- **Výkonové charakteristiky** (CPU, paměť, propustnost)
- **Dostupnost funkcí** (možnosti škálování, úrovně SLA)
- **Modely cen** (na základě spotřeby, rezervovaná kapacita)
- **Regionální dostupnost** (ne všechny SKU jsou dostupné ve všech regionech)

### Klíčové faktory při výběru SKU

1. **Požadavky pracovního zatížení**
   - Očekávané vzorce provozu/zátěže
   - Požadavky na výkon (CPU, paměť, I/O)
   - Potřeby úložiště a přístupové vzorce

2. **Typ prostředí**
   - Vývoj/testování vs. produkce
   - Požadavky na dostupnost
   - Požadavky na bezpečnost a shodu

3. **Finanční omezení**
   - Počáteční náklady vs. provozní náklady
   - Slevy za rezervovanou kapacitu
   - Dopady automatického škálování na náklady

4. **Projekce růstu**
   - Požadavky na škálovatelnost
   - Budoucí potřeby funkcí
   - Složitost migrace

---

## Výběr podle prostředí

### Vývojové prostředí

**Priority**: Optimalizace nákladů, základní funkčnost, snadné zřizování a odstraňování

#### Doporučené SKU
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
- **App Service**: F1 (Free) nebo B1 (Basic) pro jednoduché testování
- **Databáze**: Základní úroveň s minimálními prostředky
- **Úložiště**: Standardní s lokální redundancí pouze
- **Výpočet**: Sdílené prostředky jsou přijatelné
- **Síťování**: Základní konfigurace

### Testovací/staging prostředí

**Priority**: Konfigurace podobná produkci, vyvážení nákladů, možnost testovat výkon

#### Doporučené SKU
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
- **Výkon**: 70–80 % produkční kapacity
- **Funkce**: Většina produkčních funkcí povolena
- **Redundance**: Částečná geografická redundance
- **Škálování**: Omezené automatické škálování pro testování
- **Monitorování**: Plný monitorovací stack

### Produkční prostředí

**Priority**: Výkon, dostupnost, bezpečnost, shoda, škálovatelnost

#### Doporučené SKU
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
- **Vysoká dostupnost**: Požadavky SLA 99,9 %+
- **Výkon**: Vyhrazené prostředky, vysoká propustnost
- **Bezpečnost**: Prémiové bezpečnostní funkce
- **Škálování**: Plné možnosti automatického škálování
- **Monitorování**: Komplexní observabilita

---

## Pokyny specifické pro služby

### Azure App Service

#### Matice rozhodování SKU

| Případ použití | Doporučené SKU | Odůvodnění |
|----------|----------------|-----------|
| Vývoj/Testování | F1 (Free) nebo B1 (Basic) | Nákladově efektivní, postačující pro testování |
| Malé produkční aplikace | S1 (Standard) | Vlastní domény, SSL, automatické škálování |
| Středně velké produkční aplikace | P1V3 (Premium V3) | Lepší výkon, více funkcí |
| Aplikace s vysokou návštěvností | P2V3 nebo P3V3 | Vyhrazené prostředky, vysoký výkon |
| Kritické aplikace | I1V2 (Isolated V2) | Izolace sítě, vyhrazený hardware |

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

#### Rámec výběru SKU

1. **Na bázi DTU (Database Transaction Units)**
   - **Basic**: 5 DTU - Vývoj/testování
   - **Standard**: S0-S12 (10-3000 DTU) - Obecné použití
   - **Premium**: P1-P15 (125-4000 DTU) - Výkonově kritické

2. **Na bázi vCore (doporučeno pro produkci)**
   - **General Purpose**: Vyvážený výpočet a úložiště
   - **Business Critical**: Nízká latence, vysoké IOPS
   - **Hyperscale**: Vysoce škálovatelné úložiště (až 100 TB)

#### Příklady konfigurací

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
   - Platba za použití
   - Vhodné pro vývoj a proměnlivá pracovní zatížení
   - Sdílená infrastruktura

2. **Vyhrazené (Workload Profiles)**
   - Vyhrazené výpočetní prostředky
   - Předvídatelný výkon
   - Lepší pro produkční zátěže

#### Příklady konfigurací

**Vývoj (spotřební)**
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

**Produkce (vyhrazené)**
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

#### Modely propustnosti

1. **Ručně zajištěná propustnost**
   - Předvídatelný výkon
   - Slevy za rezervovanou kapacitu
   - Nejlepší pro stabilní pracovní zatížení

2. **Autoscale provisioned throughput**
   - Automatické škálování podle využití
   - Platíte za to, co použijete (s minimem)
   - Vhodné pro proměnlivá zatížení

3. **Serverless**
   - Platba za požadavek
   - Žádná zajištěná propustnost
   - Ideální pro vývoj a přerušované zatížení

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

1. **Standard_LRS** - Vývoj, nekritická data
2. **Standard_GRS** - Produkce, potřeba geo-redundance
3. **Premium_LRS** - Aplikace s vysokým výkonem
4. **Premium_ZRS** - Vysoká dostupnost s redundancí zón

#### Výkonové úrovně

- **Standard**: Obecné použití, nákladově efektivní
- **Premium**: Vysoký výkon, scénáře s nízkou latencí

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

Rezervujte prostředky na 1–3 roky pro významné slevy:

```bash
# Zkontrolujte možnosti rezervace
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Správná velikost

Začněte s menšími SKU a škálujte na základě skutečného využití:

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

### 3. Konfigurace automatického škálování

Implementujte inteligentní škálování pro optimalizaci nákladů:

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

### 4. Plánované škálování

Snižte škálování mimo špičku:

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

Otestujte různé SKU pro ověření výkonu:

```bash
# Služba Azure pro testování zátěže
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
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

## Rychlé referenční tabulky

### Rychlá reference SKU pro App Service

| SKU | Úroveň | vCPU | RAM | Storage | Rozsah cen | Použití |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Zdarma | Sdílené | 1GB | 1GB | Zdarma | Vývoj |
| B1 | Základní | 1 | 1.75GB | 10GB | $ | Malé aplikace |
| S1 | Standardní | 1 | 1.75GB | 50GB | $$ | Produkce |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Vysoký výkon |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Podnikové |

### Rychlá reference SKU pro SQL Database

| SKU | Úroveň | DTU/vCore | Storage | Rozsah cen | Použití |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Vývoj |
| S2 | Standard | 50 DTU | 250GB | $$ | Malá produkce |
| P2 | Premium | 250 DTU | 1TB | $$$ | Vysoký výkon |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Vyvážené |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Kritické |

### Rychlá reference SKU pro Container Apps

| Model | Ceník | CPU/Paměť | Použití |
|-------|---------|------------|----------|
| Consumption | Platba za použití | 0.25-2 vCPU | Vývoj, proměnlivé zatížení |
| Dedicated D4 | Rezervované | 4 vCPU, 16GB | Produkce |
| Dedicated D8 | Rezervované | 8 vCPU, 32GB | Vysoký výkon |

---

## Nástroje pro ověření

### Kontrola dostupnosti SKU

```bash
#!/bin/bash
# Zkontrolujte dostupnost SKU v cílovém regionu

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

# Použití
check_sku_availability "eastus" "app-service" "P1V3"
```

### Skript pro odhad nákladů

```powershell
# PowerShell skript pro odhad nákladů
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
        
        # Použijte Azure Pricing API nebo kalkulačku
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Použití
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### Ověření výkonu

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

## Shrnutí nejlepších postupů

### Co dělat

1. **Začněte s malým a škálujte nahoru** na základě skutečného využití
2. **Používejte různé SKU pro různá prostředí**
3. **Průběžně sledujte výkon a náklady**
4. **Využijte rezervovanou kapacitu pro produkční zátěže**
5. **Implementujte automatické škálování tam, kde je vhodné**
6. **Testujte výkon s realistickými zátěžemi**
7. **Plánujte růst, ale vyvarujte se nadměrného přidělování prostředků**
8. **Používejte bezplatné úrovně pro vývoj, kdykoli je to možné**

### Čemu se vyhnout

1. **Nepoužívejte produkční SKU pro vývoj**
2. **Neignorujte regionální dostupnost SKU**
3. **Nezapomínejte na náklady na přenos dat**
4. **Nepřidělujte nadměrné prostředky bez odůvodnění**
5. **Neignorujte vliv závislostí**
6. **Nedávejte příliš vysoké limity automatického škálování**
7. **Nezapomínejte na požadavky na shodu**
8. **Nedělejte rozhodnutí pouze na základě ceny**

---

**Tip**: Použijte Azure Cost Management a Advisor pro získání personalizovaných doporučení pro optimalizaci vašich výběrů SKU na základě skutečných vzorců používání.

---

**Navigace**
- **Předchozí lekce**: [Plánování kapacity](capacity-planning.md)
- **Další lekce**: [Kontroly před nasazením](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Prohlášení o vyloučení odpovědnosti:
Tento dokument byl přeložen pomocí AI překladatelské služby Co‑op Translator (https://github.com/Azure/co-op-translator). Ačkoli usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho originálním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakákoli nedorozumění nebo chybné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
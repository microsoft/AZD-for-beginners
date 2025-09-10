<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7c000a3a8f4a04aa85c6d35714e3dee0",
  "translation_date": "2025-09-09T22:03:06+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "sv"
}
-->
# Guide för SKU-val - Välja rätt Azure-tjänstenivåer

## Introduktion

Denna omfattande guide hjälper dig att välja optimala Azure-tjänste-SKU:er (Stock Keeping Units) för olika miljöer, arbetsbelastningar och krav. Lär dig att analysera prestandabehov, kostnadsöverväganden och skalbarhetskrav för att välja de mest lämpliga tjänstenivåerna för dina Azure Developer CLI-distributioner.

## Lärandemål

Genom att slutföra denna guide kommer du att:
- Förstå Azure SKU-koncept, prismodeller och funktionsskillnader
- Behärska miljöspecifika strategier för SKU-val för utveckling, staging och produktion
- Analysera arbetsbelastningskrav och matcha dem med lämpliga tjänstenivåer
- Implementera kostnadsoptimeringsstrategier genom intelligent SKU-val
- Använda prestandatestning och valideringstekniker för SKU-val
- Konfigurera automatiska SKU-rekommendationer och övervakning

## Läranderesultat

Efter att ha slutfört guiden kommer du att kunna:
- Välja lämpliga Azure-tjänste-SKU:er baserat på arbetsbelastningskrav och begränsningar
- Designa kostnadseffektiva arkitekturer för flera miljöer med korrekt nivåval
- Implementera prestandabenchmarking och validering för SKU-val
- Skapa automatiserade verktyg för SKU-rekommendationer och kostnadsoptimering
- Planera SKU-migreringar och skalningsstrategier för förändrade krav
- Tillämpa principer från Azure Well-Architected Framework för val av tjänstenivåer

## Innehållsförteckning

- [Förstå SKU:er](../../../../docs/pre-deployment)
- [Miljöbaserat val](../../../../docs/pre-deployment)
- [Tjänstespecifika riktlinjer](../../../../docs/pre-deployment)
- [Kostnadsoptimeringsstrategier](../../../../docs/pre-deployment)
- [Prestandaöverväganden](../../../../docs/pre-deployment)
- [Snabbreferenstabeller](../../../../docs/pre-deployment)
- [Valideringsverktyg](../../../../docs/pre-deployment)

---

## Förstå SKU:er

### Vad är SKU:er?

SKU:er (Stock Keeping Units) representerar olika tjänstenivåer och prestandanivåer för Azure-resurser. Varje SKU erbjuder olika:

- **Prestandaegenskaper** (CPU, minne, genomströmning)
- **Funktionsmöjligheter** (skalningsalternativ, SLA-nivåer)
- **Prismodeller** (förbrukningsbaserad, reserverad kapacitet)
- **Regional tillgänglighet** (alla SKU:er är inte tillgängliga i alla regioner)

### Viktiga faktorer vid val av SKU

1. **Arbetsbelastningskrav**
   - Förväntade trafik-/belastningsmönster
   - Prestandakrav (CPU, minne, I/O)
   - Lagringsbehov och åtkomstmönster

2. **Miljötyp**
   - Utveckling/testning kontra produktion
   - Tillgänglighetskrav
   - Säkerhets- och efterlevnadsbehov

3. **Budgetbegränsningar**
   - Initiala kostnader kontra driftskostnader
   - Rabatter för reserverad kapacitet
   - Kostnadsimplikationer för autoskalning

4. **Tillväxtprognoser**
   - Skalbarhetskrav
   - Framtida funktionsbehov
   - Migreringskomplexitet

---

## Miljöbaserat val

### Utvecklingsmiljö

**Prioriteringar**: Kostnadsoptimering, grundläggande funktionalitet, enkel provisionering/deprovisionering

#### Rekommenderade SKU:er
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

#### Egenskaper
- **App Service**: F1 (Gratis) eller B1 (Basic) för enkel testning
- **Databaser**: Grundläggande nivå med minimala resurser
- **Lagring**: Standard med endast lokal redundans
- **Beräkning**: Delade resurser är acceptabla
- **Nätverk**: Grundläggande konfigurationer

### Staging-/testmiljö

**Prioriteringar**: Produktionsliknande konfiguration, kostnadsbalans, prestandatestningskapacitet

#### Rekommenderade SKU:er
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

#### Egenskaper
- **Prestanda**: 70-80% av produktionskapaciteten
- **Funktioner**: De flesta produktionsfunktioner aktiverade
- **Redundans**: Viss geografisk redundans
- **Skalning**: Begränsad autoskalning för testning
- **Övervakning**: Fullständig övervakningsstack

### Produktionsmiljö

**Prioriteringar**: Prestanda, tillgänglighet, säkerhet, efterlevnad, skalbarhet

#### Rekommenderade SKU:er
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

#### Egenskaper
- **Hög tillgänglighet**: 99,9%+ SLA-krav
- **Prestanda**: Dedikerade resurser, hög genomströmning
- **Säkerhet**: Premiumsäkerhetsfunktioner
- **Skalning**: Fullständiga autoskalningsmöjligheter
- **Övervakning**: Omfattande observabilitet

---

## Tjänstespecifika riktlinjer

### Azure App Service

#### SKU-beslutsmatris

| Användningsfall | Rekommenderad SKU | Motivering |
|-----------------|-------------------|------------|
| Utveckling/testning | F1 (Gratis) eller B1 (Basic) | Kostnadseffektivt, tillräckligt för testning |
| Små produktionsappar | S1 (Standard) | Anpassade domäner, SSL, autoskalning |
| Medelstora produktionsappar | P1V3 (Premium V3) | Bättre prestanda, fler funktioner |
| Appar med hög trafik | P2V3 eller P3V3 | Dedikerade resurser, hög prestanda |
| Kritiska appar | I1V2 (Isolerad V2) | Nätverksisolering, dedikerad hårdvara |

#### Konfigurationsexempel

**Utveckling**
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

**Produktion**
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

#### Ramverk för SKU-val

1. **DTU-baserad (Database Transaction Units)**
   - **Basic**: 5 DTU - Utveckling/testning
   - **Standard**: S0-S12 (10-3000 DTU) - Allmän användning
   - **Premium**: P1-P15 (125-4000 DTU) - Prestandakritisk

2. **vCore-baserad** (Rekommenderas för produktion)
   - **General Purpose**: Balanserad beräkning och lagring
   - **Business Critical**: Låg latens, hög IOPS
   - **Hyperscale**: Mycket skalbar lagring (upp till 100TB)

#### Exempelkonfigurationer

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

#### Miljötyper

1. **Förbrukningsbaserad**
   - Betala per användning
   - Lämplig för utveckling och variabla arbetsbelastningar
   - Delad infrastruktur

2. **Dedikerad (Arbetsbelastningsprofiler)**
   - Dedikerade beräkningsresurser
   - Förutsägbar prestanda
   - Bättre för produktionsarbetsbelastningar

#### Konfigurationsexempel

**Utveckling (Förbrukning)**
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

**Produktion (Dedikerad)**
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

#### Genomströmningsmodeller

1. **Manuellt provisionerad genomströmning**
   - Förutsägbar prestanda
   - Rabatter för reserverad kapacitet
   - Bäst för stabila arbetsbelastningar

2. **Autoskalad provisionerad genomströmning**
   - Automatisk skalning baserat på användning
   - Betala för det du använder (med minimum)
   - Bra för variabla arbetsbelastningar

3. **Serverlös**
   - Betala per begäran
   - Ingen provisionerad genomströmning
   - Perfekt för utveckling och intermittent arbetsbelastning

#### SKU-exempel

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

#### Typer av lagringskonton

1. **Standard_LRS** - Utveckling, icke-kritisk data
2. **Standard_GRS** - Produktion, geo-redundans behövs
3. **Premium_LRS** - Högpresterande applikationer
4. **Premium_ZRS** - Hög tillgänglighet med zonredundans

#### Prestandanivåer

- **Standard**: Allmän användning, kostnadseffektivt
- **Premium**: Hög prestanda, låg latens

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

## Kostnadsoptimeringsstrategier

### 1. Reserverad kapacitet

Reservera resurser för 1-3 år för betydande rabatter:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Rätt dimensionering

Börja med mindre SKU:er och skala upp baserat på faktisk användning:

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

### 3. Autoskalningskonfiguration

Implementera intelligent skalning för att optimera kostnader:

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

### 4. Schemalagd skalning

Skala ner under lågtrafikperioder:

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

## Prestandaöverväganden

### Grundläggande prestandakrav

Definiera tydliga prestandakrav innan SKU-val:

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

### Belastningstestning

Testa olika SKU:er för att validera prestanda:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Övervakning och optimering

Ställ in omfattande övervakning:

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

## Snabbreferenstabeller

### App Service SKU Snabbreferens

| SKU | Nivå | vCPU | RAM | Lagring | Prisintervall | Användningsfall |
|-----|------|------|-----|---------|---------------|-----------------|
| F1 | Gratis | Delad | 1GB | 1GB | Gratis | Utveckling |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Små appar |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Produktion |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Hög prestanda |
| I1V2 | Isolerad V2 | 2 | 8GB | 1TB | $$$$ | Företag |

### SQL Database SKU Snabbreferens

| SKU | Nivå | DTU/vCore | Lagring | Prisintervall | Användningsfall |
|-----|------|-----------|---------|---------------|-----------------|
| Basic | Basic | 5 DTU | 2GB | $ | Utveckling |
| S2 | Standard | 50 DTU | 250GB | $$ | Små produktioner |
| P2 | Premium | 250 DTU | 1TB | $$$ | Hög prestanda |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Balanserad |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Kritisk |

### Container Apps SKU Snabbreferens

| Modell | Prissättning | CPU/Minne | Användningsfall |
|--------|--------------|-----------|-----------------|
| Förbrukning | Betala per användning | 0.25-2 vCPU | Utveckling, variabel belastning |
| Dedikerad D4 | Reserverad | 4 vCPU, 16GB | Produktion |
| Dedikerad D8 | Reserverad | 8 vCPU, 32GB | Hög prestanda |

---

## Valideringsverktyg

### SKU-tillgänglighetskontroll

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

### Kostnadsberäkningsskript

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

### Prestandavalidering

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

## Sammanfattning av bästa praxis

### Gör detta

1. **Börja smått och skala upp** baserat på faktisk användning
2. **Använd olika SKU:er för olika miljöer**
3. **Övervaka prestanda och kostnader kontinuerligt**
4. **Utnyttja reserverad kapacitet för produktionsarbetsbelastningar**
5. **Implementera autoskalning där det är lämpligt**
6. **Testa prestanda med realistiska arbetsbelastningar**
7. **Planera för tillväxt men undvik överprovisionering**
8. **Använd gratisnivåer för utveckling när det är möjligt**

### Undvik detta

1. **Använd inte produktions-SKU:er för utveckling**
2. **Ignorera inte regional SKU-tillgänglighet**
3. **Glöm inte bort kostnader för dataöverföring**
4. **Överprovisionera inte utan motivering**
5. **Ignorera inte påverkan av beroenden**
6. **Ställ inte autoskalningsgränser för högt**
7. **Glöm inte bort efterlevnadskrav**
8. **Gör inte beslut baserade enbart på pris**

---

**Tips**: Använd Azure Cost Management och Advisor för att få personliga rekommendationer för att optimera dina SKU-val baserat på faktiska användningsmönster.

---

**Navigering**
- **Föregående lektion**: [Kapacitetsplanering](capacity-planning.md)
- **Nästa lektion**: [Förkontroller](preflight-checks.md)

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör det noteras att automatiska översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.
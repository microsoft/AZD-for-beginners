# SKU-valguide - Välja rätt Azure-tjänstnivåer

**Kapitelnavigering:**
- **📚 Kursstart**: [AZD For Beginners](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 6 - Förvalidering och planering inför distribution
- **⬅️ Föregående**: [Kapacitetsplanering](capacity-planning.md)
- **➡️ Nästa**: [Kontroller före driftsättning](preflight-checks.md)
- **🚀 Nästa kapitel**: [Kapitel 7: Felsökning](../chapter-07-troubleshooting/common-issues.md)

## Introduktion

Denna omfattande guide hjälper dig att välja optimala Azure-tjänst-SKUs (Stock Keeping Units) för olika miljöer, arbetsbelastningar och krav. Lär dig att analysera prestandabehov, kostnadsöverväganden och skalbarhetskrav för att välja de mest lämpliga tjänstenivåerna för dina Azure Developer CLI-distributioner.

## Lärandemål

Genom att slutföra denna guide kommer du att:
- Förstå begreppen kring Azure SKU:er, prissättningsmodeller och funktionsskillnader
- Bemästra miljöspecifika strategier för val av SKU för utveckling, staging och produktion
- Analysera arbetsbelastningskrav och matcha dem till lämpliga tjänstenivåer
- Implementera kostnadsoptimeringsstrategier genom intelligent val av SKU
- Tillämpa tekniker för prestandatestning och validering av SKU-val
- Konfigurera automatiska SKU-rekommendationer och övervakning

## Läranderesultat

Efter slutförandet kommer du att kunna:
- Välja lämpliga Azure-tjänst-SKU:er baserat på arbetsbelastningskrav och begränsningar
- Designa kostnadseffektiva flermiljöarkitekturer med korrekt val av nivåer
- Implementera prestandamätning och validering för SKU-val
- Skapa automatiserade verktyg för SKU-rekommendation och kostnadsoptimering
- Planera migreringar av SKU och skalningsstrategier för förändrade krav
- Applicera Azure Well-Architected Framework-principer på valet av tjänstenivå

## Innehållsförteckning

- [Förstå SKU:er](../../../../docs/chapter-06-pre-deployment)
- [Val baserat på miljö](../../../../docs/chapter-06-pre-deployment)
- [Tjänstespecifika riktlinjer](../../../../docs/chapter-06-pre-deployment)
- [Kostnadsoptimeringsstrategier](../../../../docs/chapter-06-pre-deployment)
- [Prestandaöverväganden](../../../../docs/chapter-06-pre-deployment)
- [Snabbreferenstabeller](../../../../docs/chapter-06-pre-deployment)
- [Valideringsverktyg](../../../../docs/chapter-06-pre-deployment)

---

## Förstå SKU:er

### Vad är SKU:er?

SKU:er (Stock Keeping Units) representerar olika tjänstenivåer och prestandanivåer för Azure-resurser. Varje SKU erbjuder olika:

- **Prestandakaraktäristik** (CPU, minne, genomströmning)
- **Funktionstillgänglighet** (skalningsalternativ, SLA-nivåer)
- **Prissättningsmodeller** (förbrukningsbaserad, reserverad kapacitet)
- **Regional tillgänglighet** (inte alla SKU:er finns i alla regioner)

### Nyckelfaktorer vid val av SKU

1. **Arbetsbelastningskrav**
   - Förväntade trafik-/belastningsmönster
   - Prestandakrav (CPU, minne, I/O)
   - Lagringsbehov och åtkomstmönster

2. **Miljötyp**
   - Utveckling/test vs. produktion
   - Tillgänglighetskrav
   - Säkerhets- och efterlevnadskrav

3. **Budgetbegränsningar**
   - Initiala kostnader vs. driftkostnader
   - Rabatter för reserverad kapacitet
   - Kostnadskonsekvenser av automatisk skalning

4. **Tillväxtprognoser**
   - Skalbarhetskrav
   - Framtida funktionsbehov
   - Migreringskomplexitet

---

## Val baserat på miljö

### Utvecklingsmiljö

**Prioriteringar**: Kostnadsoptimering, grundläggande funktionalitet, enkel provisioning/deprovisioning

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

#### Karaktäristika
- **App Service**: F1 (Free) eller B1 (Basic) för enkel testning
- **Databaser**: Grundnivå med minimala resurser
- **Lagring**: Standard med endast lokal redundans
- **Beräkning**: Delade resurser är acceptabla
- **Nätverk**: Grundläggande konfigurationer

### Staging/Testmiljö

**Prioriteringar**: Produktionslik konfiguration, kostnadsbalans, kapacitet för prestandatestning

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

#### Karaktäristika
- **Prestanda**: 70–80% av produktionskapacitet
- **Funktioner**: De flesta produktionsfunktioner aktiverade
- **Redundans**: Viss geografisk redundans
- **Skalning**: Begränsad automatisk skalning för tester
- **Övervakning**: Full övervakningsstack

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

#### Karaktäristika
- **Hög tillgänglighet**: 99.9%+ SLA-krav
- **Prestanda**: Dedikerade resurser, hög genomströmning
- **Säkerhet**: Premium säkerhetsfunktioner
- **Skalning**: Fulla automatisk skalningsmöjligheter
- **Övervakning**: Omfattande observability

---

## Tjänstespecifika riktlinjer

### Azure App Service

#### Beslutsmatris för SKU

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | Cost-effective, sufficient for testing |
| Small production apps | S1 (Standard) | Custom domains, SSL, auto-scaling |
| Medium production apps | P1V3 (Premium V3) | Better performance, more features |
| High-traffic apps | P2V3 or P3V3 | Dedicated resources, high performance |
| Mission-critical apps | I1V2 (Isolated V2) | Network isolation, dedicated hardware |

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

#### Ramverk för val av SKU

1. **DTU-baserat (Database Transaction Units)**
   - **Basic**: 5 DTU - Utveckling/test
   - **Standard**: S0-S12 (10-3000 DTU) - Allmänt ändamål
   - **Premium**: P1-P15 (125-4000 DTU) - Prestandakritiskt

2. **vCore-baserat** (Rekommenderas för produktion)
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

1. **Consumption-based**
   - Betala per användning
   - Lämplig för utveckling och varierande arbetsbelastningar
   - Delad infrastruktur

2. **Dedicated (Workload Profiles)**
   - Dedikerade beräkningsresurser
   - Förutsägbar prestanda
   - Bättre för produktionsarbetsbelastningar

#### Konfigurationsexempel

**Utveckling (Consumption)**
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

**Produktion (Dedicated)**
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

1. **Manual Provisioned Throughput**
   - Förutsägbar prestanda
   - Rabatter för reserverad kapacitet
   - Bäst för stabila arbetsbelastningar

2. **Autoscale Provisioned Throughput**
   - Automatisk skalning baserat på användning
   - Betala för det du använder (med minimum)
   - Bra för varierande arbetsbelastningar

3. **Serverless**
   - Betala per förfrågan
   - Ingen provisionerad genomströmning
   - Idealiskt för utveckling och intermittenta arbetsbelastningar

#### Exempel på SKU:er

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

1. **Standard_LRS** - Utveckling, icke-kritiska data
2. **Standard_GRS** - Produktion, när geo-redundans behövs
3. **Premium_LRS** - Högprestandaapplikationer
4. **Premium_ZRS** - Hög tillgänglighet med zonredundans

#### Prestandanivåer

- **Standard**: Allmänt ändamål, kostnadseffektivt
- **Premium**: Hög prestanda, låg latens-scenarier

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

Reservera resurser för 1–3 år för betydande rabatter:

```bash
# Kontrollera bokningsalternativ
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Rättdimensionering

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

### 3. Konfiguration för automatisk skalning

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

Skala ner under lågtrafiktider:

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

### Baslinje för prestandakrav

Definiera tydliga prestandakrav innan val av SKU:

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
# Azure Load Testing-tjänst
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Övervakning och optimering

Konfigurera omfattande övervakning:

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

| SKU | Nivå | vCPU | RAM | Lagring | Prisklass | Användningsfall |
|-----|------|------|-----|---------|-----------|-----------------|
| F1 | Free | Shared | 1GB | 1GB | Free | Development |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Small apps |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Production |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | High performance |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### SQL Database SKU Snabbreferens

| SKU | Nivå | DTU/vCore | Lagring | Prisklass | Användningsfall |
|-----|------|-----------|---------|-----------|-----------------|
| Basic | Basic | 5 DTU | 2GB | $ | Development |
| S2 | Standard | 50 DTU | 250GB | $$ | Small production |
| P2 | Premium | 250 DTU | 1TB | $$$ | High performance |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Balanced |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Mission critical |

### Container Apps SKU Snabbreferens

| Model | Pricing | CPU/Memory | Användningsfall |
|-------|---------|------------|-----------------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Development, variable load |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Production |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | High performance |

---

## Valideringsverktyg

### SKU-tillgänglighetskontrollant

```bash
#!/bin/bash
# Kontrollera SKU-tillgänglighet i målregionen

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

# Användning
check_sku_availability "eastus" "app-service" "P1V3"
```

### Kostnadsuppskattningsskript

```powershell
# PowerShell-skript för kostnadsuppskattning
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
        
        # Använd Azure Pricing API eller prisräknaren
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Användning
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

### Gör

1. **Börja litet och skala upp** baserat på faktisk användning
2. **Använd olika SKU:er för olika miljöer**
3. **Övervaka prestanda och kostnader kontinuerligt**
4. **Utnyttja reserverad kapacitet för produktionsarbetsbelastningar**
5. **Implementera automatisk skalning där det är lämpligt**
6. **Testa prestanda med realistiska arbetsbelastningar**
7. **Planera för tillväxt men undvik överprovisionering**
8. **Använd gratisnivåer för utveckling när det är möjligt**

### Gör inte

1. **Använd inte produktions-SKU:er för utveckling**
2. **Ignorera inte regional tillgänglighet för SKU:er**
3. **Glöm inte bort kostnader för dataöverföring**
4. **Överprovisionera inte utan motivering**
5. **Ignorera inte påverkan av beroenden**
6. **Sätt inte automatiska skalningsgränser för högt**
7. **Glöm inte efterlevnadskrav**
8. **Fatta inte beslut baserat enbart på pris**

---

**Proffstips**: Använd Azure Cost Management och Advisor för att få personliga rekommendationer för att optimera dina SKU-val baserat på faktisk användningsdata.

---

**Navigering**
- **Föregående lektion**: [Kapacitetsplanering](capacity-planning.md)
- **Nästa lektion**: [Kontroller före driftsättning](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, observera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess källspråk bör anses vara den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
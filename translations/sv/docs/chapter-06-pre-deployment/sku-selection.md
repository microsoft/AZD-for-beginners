# SKU-valguide – Välja rätt Azure-tjänstnivåer

**Kapitelnavigering:**
- **📚 Kursstart**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande Kapitel**: Kapitel 6 - Förvalidering och Planering före distribution
- **⬅️ Föregående**: [Kapacitetsplanering](capacity-planning.md)
- **➡️ Nästa**: [Förflygningskontroller](preflight-checks.md)
- **🚀 Nästa Kapitel**: [Kapitel 7: Felsökning](../chapter-07-troubleshooting/common-issues.md)

## Introduktion

Denna omfattande guide hjälper dig att välja optimala Azure-tjänst-SKU:er (lagerenheter) för olika miljöer, arbetsbelastningar och krav. Lär dig analysera prestandabehov, kostnadsöverväganden och skalbarhetskrav för att välja de mest lämpliga tjänstenivåerna för dina Azure Developer CLI-distributioner.

## Lärandemål

När du slutfört denna guide kommer du att:
- Förstå Azure SKU-koncept, prismodeller och funktionsskillnader
- Bemästra miljöspecifika strategier för SKU-val vid utveckling, staging och produktion
- Analysera arbetsbelastningskrav och matcha dem med rätt tjänstenivåer
- Implementera kostnadsoptimeringsstrategier genom intelligent SKU-val
- Använda prestandatestning och valideringstekniker för SKU-val
- Konfigurera automatiserade SKU-rekommendationer och övervakning

## Läranderesultat

Efter genomförandet kommer du att kunna:
- Välja lämpliga Azure-tjänst-SKU:er baserade på arbetsbelastningskrav och begränsningar
- Designa kostnadseffektiva arkitekturer för flera miljöer med korrekt nivåval
- Implementera prestandamätning och validering för SKU-val
- Skapa automatiserade verktyg för SKU-rekommendation och kostnadsoptimering
- Planera SKU-migreringar och skalningsstrategier enligt förändrade krav
- Tillämpa principer från Azure Well-Architected Framework vid val av tjänstenivå

## Innehållsförteckning

- [Förstå SKUs](#understanding-skus)
- [Val baserat på miljö](#environment-based-selection)
- [Riktlinjer för specifika tjänster](#service-specific-guidelines)
- [Kostnadsoptimeringsstrategier](#cost-optimization-strategies)
- [Prestandaöverväganden](#performance-considerations)
- [Snabbreferenser](#quick-reference-tables)
- [Valideringsverktyg](#validation-tools)

---

## Förstå SKUs

> **Exempelscope:** YAML SKU-kartor och prestandakonfigurationer nedan är designanteckningar, inte ett `azure.yaml` schema eller en konfiguration för belastningsverktyg. Bicep-block är alternativ/delfragment: deklarera deras parametrar och överordnade resurser, använd unika symboliska namn när de kombineras, och koppla moduler i ett fungerande projekt. Priser, begränsningar och region-/SKU-tillgänglighet måste kontrolleras för din prenumeration innan distribution.

### Vad är SKUs?

SKU:er (lagerenheter) representerar olika tjänstenivåer och prestandanivåer för Azure-resurser. Varje SKU erbjuder olika:

- **Prestandakarakteristika** (CPU, minne, genomströmning)
- **Tillgänglighet av funktioner** (skalningsalternativ, SLA-nivåer)
- **Prismodeller** (förbrukningsbaserad, reserverad kapacitet)
- **Regional tillgänglighet** (alla SKU:er finns inte i alla regioner)

### Viktiga faktorer vid SKU-val

1. **Arbetsbelastningskrav**
   - Förväntade trafik-/belastningsmönster
   - Prestandakrav (CPU, minne, I/O)
   - Lagringsbehov och åtkomstmönster

2. **Miljötyp**
   - Utveckling/testning kontra produktion
   - Tillgänglighetskrav
   - Säkerhets- och efterlevnadskrav

3. **Budgetbegränsningar**
   - Initiala kostnader kontra driftskostnader
   - Rabatter vid reserverad kapacitet
   - Kostnader för automatisk skalning

4. **Tillväxtprognoser**
   - Skalbarhetskrav
   - Framtida funktionsbehov
   - Migreringskomplexitet

---

## Val baserat på miljö

### Utvecklingsmiljö

**Prioriteringar**: Kostnadsoptimering, grundläggande funktionalitet, enkel tilldelning/avslutning

#### Rekommenderade SKU:er
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

#### Karakteristika
- **App Service**: F1 (Gratis) eller B1 (Bas) för enkel testning
- **Databaser**: Grundläggande nivå med minimala resurser
- **Lagring**: Standard med lokal redundans endast
- **Beräkning**: Delade resurser accepteras
- **Nätverk**: Grundläggande konfigurationer

### Staging-/Testmiljö

**Prioriteringar**: Produktionsliknande konfiguration, kostnadsbalans, prestandatestningsmöjlighet

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

#### Karakteristika
- **Prestanda**: 70-80 % av produktionskapaciteten
- **Funktioner**: De flesta produktionsfunktioner aktiverade
- **Redundans**: Viss geografisk redundans
- **Skalning**: Begränsad automatisk skalning för tester
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
  storage: "Standard_GRS"    # Geo-redundant; Premium_GRS is not a storage SKU
  cosmos_db: "Provisioned"   # Dedicated throughput
  container_apps: "Dedicated" # Dedicated environment
  key_vault: "Premium"       # Premium with HSM
```

#### Karakteristika
- **Hög tillgänglighet**: SLA-krav 99,9 %+
- **Prestanda**: Dedikerade resurser, hög genomströmning
- **Säkerhet**: Premium säkerhetsfunktioner
- **Skalning**: Fullständiga auto-skalningsmöjligheter
- **Övervakning**: Omfattande observabilitet

---

## Tjänstspezifika riktlinjer

### Azure App Service

#### SKU-beslutsmatris

| Användningsfall | Rekommenderad SKU | Motivering |
|----------|----------------|-----------|
| Utveckling/Testning | F1 (Gratis) eller B1 (Bas) | Kostnadseffektivt, tillräckligt för testning |
| Små produktionsappar | S1 (Standard) | Egna domäner, SSL, auto-skalning |
| Medelstora produktionsappar | P1V3 (Premium V3) | Bättre prestanda, fler funktioner |
| Applikationer med hög trafik | P2V3 eller P3V3 | Dedikerade resurser, hög prestanda |
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

### Azure SQL-databas

#### SKU-valramverk

1. **DTU-baserad (Databashandel-enheter)**
   - **Basic**: 5 DTU – Utveckling/testning
   - **Standard**: S0-S12 (10-3000 DTU) – Allmänt ändamål
   - **Premium**: P1-P15 (125-4000 DTU) – Prestandakritiskt

2. **vCore-baserad** (Rekommenderas för produktion)
   - **General Purpose**: Balanserad beräkning och lagring
   - **Business Critical**: Låg latens, hög IOPS
   - **Hyperscale**: Mycket skalbar lagring; verifiera nuvarande storleksgränser och regionalt stöd

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
   - Prissättning per användning
   - Passar utveckling och varierande arbetsbelastningar
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

**Produktion (Dedikerad)**
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

Zonredundans kräver också infrastruktur i stödda regioner och lämplig VNet-/subnet-konfiguration, utelämnad här. Detta exempel budgeterar för tre dedikerade noder; konfigurera minst två app-repliker för distribution över zoner och dimensionera både repliker och noder för zonfel. Se [Container Apps pålitlighetsanvisningar](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). För att placera en app på denna profil, ange dess `workloadProfileName: 'production-profile'`; att endast skapa profilen flyttar inte appar dit.

### Azure Cosmos DB

#### Genomströmningsmodeller

1. **Manuellt tilldelad genomströmning**
   - Förutsägbar prestanda
   - Rabatter vid reserverad kapacitet
   - Bäst för stabila arbetsbelastningar

2. **Autoskalad tilldelad genomströmning**
   - Automatisk skalning baserad på användning
   - Betala för det du använder (med minimum)
   - Bra för varierande arbetsbelastningar

3. **Serverless**
   - Betala per förfrågan
   - Ingen tilldelad genomströmning
   - Idealisk för utveckling och intermittenta arbetsbelastningar

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

#### Typ av lagringskonton

1. **Standard_LRS** - Utveckling, icke-kritiska data
2. **Standard_GRS** - Produktion, kräver geo-redundans
3. **Premium_LRS** - Högpresterande applikationer
4. **Premium_ZRS** - Hög tillgänglighet med zonredundans

#### Prestandanivåer

- **Standard**: Allmänt ändamål, kostnadseffektivt
- **Premium**: Högprestanda, låg latens för scenario

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
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Reserveringserbjudanden och berättigade resurstyper varierar; kontrollera katalogen och köpvillkoren istället för att anta att varje tjänst/SKU stöder reservation.

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

### 3. Auto-skaleringskonfiguration

Implementera intelligent skalering för kostnadsoptimering:

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

### 4. Schemalagd skalning

Skala ned under off-tider:

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

Definiera tydliga prestandakrav före SKU-val:

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
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### Övervakning och optimering

Upprätta omfattande övervakning:

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

## Snabbreferenstabeller

### App Service SKU Snabbreferens

| SKU | Nivå | vCPU | RAM | Lagring | Prisspann | Användningsfall |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Gratis | Delad | 1GB | 1GB | Gratis | Utveckling |
| B1 | Bas | 1 | 1.75GB | 10GB | $ | Små appar |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Produktion |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Hög prestanda |
| I1V2 | Isolerad V2 | 2 | 8GB | 1TB | $$$$ | Företag |

### SQL Database SKU Snabbreferens

| SKU | Nivå | DTU/vCore | Lagring | Prisspann | Användningsfall |
|-----|------|-----------|---------|-------------|----------|
| Basic | Bas | 5 DTU | 2GB | $ | Utveckling |
| S2 | Standard | 50 DTU | 250GB | $$ | Liten produktion |
| P2 | Premium | 250 DTU | 1TB | $$$ | Hög prestanda |
| GP_Gen5_4 | Allmänt ändamål | 4 vCore | 4TB | $$$ | Balanserad |
| BC_Gen5_8 | Affärskritiskt | 8 vCore | 4TB | $$$$ | Kritiska |

### Container Apps SKU Snabbreferens

| Modell | Prissättning | CPU/Minne | Användningsfall |
|-------|---------|------------|----------|
| Förbrukning | Betala per användning | Stödda CPU/minneskombinationer beror på miljö/profil | Utveckling eller produktion, variabel belastning |
| Dedikerad D4 | Dedikerad node-fakturering | 4 vCPU, 16GiB per nod | Uthållig belastning/isoleringsbehov |
| Dedikerad D8 | Dedikerad node-fakturering | 8 vCPU, 32GiB per nod | Högre uthållig belastning |

---

## Valideringsverktyg

### SKU-tillgänglighetskontrollant

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

### Kostnadsuppskattningsskript

**Pseudo-kod endast:** `Get-ResourceCost` nedan är en projektspecifik funktion som du måste implementera med aktuell regional/prissättnings- och användningsdata. Det är inte ett PowerShell- eller Azure-cmdlet.

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

Följande YAML är en kravskiss, **inte** ett inmatningsschema för Azure Load Testing, JMeter, Locust eller k6. Översätt det till ditt valda verkygs riktiga konfiguration innan du använder belastningstestkommandot ovan.

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

### Gör så här

1. **Börja smått och skala upp** baserat på faktisk användning
2. **Använd olika SKU:er för olika miljöer**
3. **Övervaka prestanda och kostnader kontinuerligt**
4. **Utnyttja reserverad kapacitet för produktionsbelastningar**
5. **Implementera auto-skalning där det är lämpligt**
6. **Testa prestanda med realistiska arbetsbelastningar**
7. **Planera för tillväxt men undvik överdimensionering**
8. **Använd gratisnivåer för utveckling när det är möjligt**

### Gör inte så här

1. **Använd inte produktions-SKU:er för utveckling**
2. **Ignorera inte regional SKU-tillgänglighet**
3. **Glöm inte kostnader för dataöverföring**
4. **Överdimensionera inte utan giltig anledning**
5. **Ignorera inte påverkan av beroenden**
6. **Sätt inte auto-skalningsgränser för högt**
7. **Glöm inte efterlevnadskrav**
8. **Basera inte beslut enbart på pris**

---

**Proffstips**: Använd Azure Cost Management och Advisor för att få personliga rekommendationer för att optimera dina SKU-val baserat på faktiska användningsmönster.

---

**Navigering**
- **Föregående Lektion**: [Kapacitetsplanering](capacity-planning.md)
- **Nästa Lektion**: [Förflygningskontroller](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# SKU-udvælgelsesguide - Vælg de rigtige Azure-serviceniveauer

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD For Begyndere](../../README.md)
- **📖 Aktuelt kapitel**: Kapitel 6 - Forvalidering & planlægning før udrulning
- **⬅️ Forrige**: [Kapacitetsplanlægning](capacity-planning.md)
- **➡️ Næste**: [Forudgående tjek](preflight-checks.md)
- **🚀 Næste kapitel**: [Kapitel 7: Fejlfinding](../chapter-07-troubleshooting/common-issues.md)

## Introduktion

Denne omfattende guide hjælper dig med at vælge optimale Azure-service-SKUs (Stock Keeping Units) til forskellige miljøer, arbejdsbelastninger og krav. Lær at analysere ydelsesbehov, omkostningshensyn og skaleringskrav for at vælge de mest passende serviceniveauer til dine Azure Developer CLI-udrulninger.

## Læringsmål

Når du har gennemført denne guide, vil du:
- Forstå Azure SKU-koncepter, prismodeller og funktionsforskelle
- Mestre miljøspecifikke strategier for valg af SKU til udvikling, staging og produktion
- Analysere arbejdsbelastningskrav og matche dem til passende serviceniveauer
- Implementere omkostningsoptimeringsstrategier gennem intelligent SKU-udvælgelse
- Anvende ydelsetest- og valideringsteknikker for SKU-valg
- Konfigurere automatiserede SKU-anbefalinger og overvågning

## Læringsresultater

Ved afslutning vil du være i stand til at:
- Vælge passende Azure-service-SKUs baseret på arbejdsbelastningskrav og begrænsninger
- Designe omkostningseffektive multi-miljøarkitekturer med korrekt niveauvalg
- Implementere ydelsesbenchmarking og validering for SKU-valg
- Oprette automatiserede værktøjer til SKU-anbefaling og omkostningsoptimering
- Planlægge SKU-migrationer og skaleringsstrategier ved ændrede krav
- Anvende Azure Well-Architected Framework-principper til valg af serviceniveau

## Indholdsfortegnelse

- [Forståelse af SKUs](../../../../docs/chapter-06-pre-deployment)
- [Miljøbaseret udvælgelse](../../../../docs/chapter-06-pre-deployment)
- [Tjenestespecifikke retningslinjer](../../../../docs/chapter-06-pre-deployment)
- [Strategier for omkostningsoptimering](../../../../docs/chapter-06-pre-deployment)
- [Ydelsesovervejelser](../../../../docs/chapter-06-pre-deployment)
- [Hurtige referencetabeller](../../../../docs/chapter-06-pre-deployment)
- [Valideringsværktøjer](../../../../docs/chapter-06-pre-deployment)

---

## Forståelse af SKUs

### Hvad er SKUs?

SKUs (Stock Keeping Units) repræsenterer forskellige serviceniveauer og ydelsesniveauer for Azure-ressourcer. Hver SKU tilbyder forskellige:

- **Ydelseskarakteristika** (CPU, hukommelse, gennemstrømning)
- **Funktionstilgængelighed** (skaléringsmuligheder, SLA-niveauer)
- **Prisstrukturer** (forbrugsbaseret, reserveret kapacitet)
- **Regional tilgængelighed** (ikke alle SKUs er tilgængelige i alle regioner)

### Vigtige faktorer ved valg af SKU

1. **Belastningskrav**
   - Forventet trafik/belastningsmønstre
   - Ydelseskrav (CPU, hukommelse, I/O)
   - Lagringsbehov og adgangsmønstre

2. **Miljøtype**
   - Udvikling/test vs. produktion
   - Tilgængelighedskrav
   - Sikkerheds- og overholdelsesbehov

3. **Budgetbegrænsninger**
   - Initiale omkostninger vs. driftsomkostninger
   - Rabatter ved reserveret kapacitet
   - Omkostningsimplikationer ved autoskalering

4. **Vækstprognoser**
   - Skaleringskrav
   - Fremtidige funktionsbehov
   - Migreringskompleksitet

---

## Miljøbaseret udvælgelse

### Udviklingsmiljø

**Prioriteter**: Omkostningsoptimering, grundlæggende funktionalitet, nem igangsættelse og afvikling

#### Recommended SKUs
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

#### Karakteristika
- **App Service**: F1 (Free) eller B1 (Basic) til enkel testning
- **Databaser**: Basic-tier med minimale ressourcer
- **Storage**: Standard med kun lokal redundans
- **Compute**: Delte ressourcer er acceptable
- **Networking**: Grundlæggende konfigurationer

### Staging/testmiljø

**Prioriteter**: Produktionslignende konfiguration, omkostningsbalance, evne til ydelsestest

#### Recommended SKUs
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
- **Ydelse**: 70-80% af produktionskapaciteten
- **Funktioner**: De fleste produktionsfunktioner aktiveret
- **Redundans**: Nogen geografisk redundans
- **Skalering**: Begrænset autoskalering til test
- **Overvågning**: Fuldt overvågningsstack

### Produktionsmiljø

**Prioriteter**: Ydelse, tilgængelighed, sikkerhed, overholdelse, skalerbarhed

#### Recommended SKUs
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

#### Karakteristika
- **Høj tilgængelighed**: 99,9%+ SLA-krav
- **Ydelse**: Dedikerede ressourcer, høj gennemstrømning
- **Sikkerhed**: Premium-sikkerhedsfunktioner
- **Skalering**: Fuld autoskaleringskapacitet
- **Overvågning**: Omfattende observabilitet

---

## Tjenestespecifikke retningslinjer

### Azure App Service

#### SKU beslutningsmatrix

| Brugstilfælde | Anbefalet SKU | Begrundelse |
|----------|----------------|-----------|
| Udvikling/Test | F1 (Free) eller B1 (Basic) | Omkostningseffektivt, tilstrækkeligt til test |
| Små produktionsapps | S1 (Standard) | Egendefinerede domæner, SSL, autoskalering |
| Mellemstore produktionsapps | P1V3 (Premium V3) | Bedre ydeevne, flere funktioner |
| Apps med høj trafik | P2V3 eller P3V3 | Dedikerede ressourcer, høj ydeevne |
| Mission-kritiske apps | I1V2 (Isolated V2) | Netværksisolation, dedikeret hardware |

#### Konfigurationseksempler

**Udvikling**
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

#### Ramme for valg af SKU

1. **DTU-baseret (Database Transaction Units)**
   - **Basic**: 5 DTU - Udvikling/test
   - **Standard**: S0-S12 (10-3000 DTU) - Generelt formål
   - **Premium**: P1-P15 (125-4000 DTU) - Ydelseskritisk

2. **vCore-baseret** (Anbefalet til produktion)
   - **General Purpose**: Balanseret beregningsressourcer og lager
   - **Business Critical**: Lav latenstid, høj IOPS
   - **Hyperscale**: Meget skalerbart lager (op til 100TB)

#### Eksempelkonfigurationer

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

#### Miljøtyper

1. **Forbrugsbaseret**
   - Betal-per-brug prissætning
   - Velegnet til udvikling og variable arbejdsbelastninger
   - Delt infrastruktur

2. **Dedikeret (arbejdsbelastningsprofiler)**
   - Dedikerede beregningsressourcer
   - Forudsigelig ydeevne
   - Bedre til produktionsarbejdsbelastninger

#### Konfigurationseksempler

**Udvikling (Forbrug)**
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

**Produktion (Dedikeret)**
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

#### Gennemstrømningsmodeller

1. **Manuel provisioneret gennemstrømning**
   - Forudsigelig ydeevne
   - Rabatter for reserveret kapacitet
   - Bedst for stabile arbejdsbelastninger

2. **Autoskalering provisioneret gennemstrømning**
   - Automatisk skalering baseret på forbrug
   - Betal for hvad du bruger (med minimum)
   - God til variable arbejdsbelastninger

3. **Serverless**
   - Betal-per-anmodning
   - Ingen provisioneret gennemstrømning
   - Ideel til udvikling og intermittent arbejdsbelastning

#### SKU-eksempler

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

#### Typer af Storage-konti

1. **Standard_LRS** - Udvikling, ikke-kritiske data
2. **Standard_GRS** - Produktion, behov for geo-redundans
3. **Premium_LRS** - Højtydende applikationer
4. **Premium_ZRS** - Høj tilgængelighed med zoneredundans

#### Ydelsestrin

- **Standard**: Generelt formål, omkostningseffektivt
- **Premium**: Højtydende, lav-latens scenarier

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

## Strategier for omkostningsoptimering

### 1. Reserveret kapacitet

Reserver ressourcer i 1-3 år for betydelige rabatter:

```bash
# Tjek reservationsmuligheder
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Korrekt dimensionering

Start med mindre SKUs og skaler op baseret på faktisk brug:

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

### 3. Autoskaleringskonfiguration

Implementér intelligent skalering for at optimere omkostningerne:

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

### 4. Planlagt skalering

Skaler ned i perioder uden aktivitet:

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

## Ydelsesovervejelser

### Grundlæggende ydeevnekrav

Definér klare ydeevnekrav før valg af SKU:

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

### Belastningstest

Test forskellige SKUs for at validere ydeevne:

```bash
# Azure Load Testing-tjeneste
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Overvågning og optimering

Opsæt omfattende overvågning:

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

## Hurtige referencetabeller

### App Service SKU - hurtig reference

| SKU | Niveau | vCPU | RAM | Storage | Prisklasse | Anvendelsestilfælde |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | Udvikling |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Små apps |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Produktion |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Høj ydeevne |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### SQL Database SKU - hurtig reference

| SKU | Niveau | DTU/vCore | Lager | Prisklasse | Anvendelsestilfælde |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Udvikling |
| S2 | Standard | 50 DTU | 250GB | $$ | Lille produktion |
| P2 | Premium | 250 DTU | 1TB | $$$ | Høj ydeevne |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Balanseret |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Missionkritisk |

### Container Apps - hurtig reference

| Model | Prissætning | CPU/Hukommelse | Anvendelsestilfælde |
|-------|---------|------------|----------|
| Consumption | Betal-per-brug | 0.25-2 vCPU | Udvikling, variabel belastning |
| Dedicated D4 | Reserveret | 4 vCPU, 16GB | Produktion |
| Dedicated D8 | Reserveret | 8 vCPU, 32GB | Høj ydeevne |

---

## Valideringsværktøjer

### SKU-tilgængelighedskontrol

```bash
#!/bin/bash
# Kontroller SKU-tilgængelighed i målregionen

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

# Brug
check_sku_availability "eastus" "app-service" "P1V3"
```

### Omkostningsestimeringsscript

```powershell
# PowerShell-script til estimering af omkostninger
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
        
        # Brug Azure Pricing-API eller prisberegner
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Brug
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### Ydelsesvalidering

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

## Opsummering af bedste praksis

### Gør

1. **Start småt og skaler op** baseret på faktisk brug
2. **Brug forskellige SKUs til forskellige miljøer**
3. **Overvåg løbende ydeevne og omkostninger**
4. **Udnyt reserveret kapacitet til produktionsarbejdsbelastninger**
5. **Implementér autoskalering hvor det er passende**
6. **Test ydeevne med realistiske arbejdsbelastninger**
7. **Planlæg for vækst, men undgå overprovisionering**
8. **Brug gratis niveauer til udvikling, når det er muligt**

### Undgå

1. **Brug ikke produktions-SKUs til udvikling**
2. **Ignorer ikke regional SKU-tilgængelighed**
3. **Glem ikke dataoverførselsomkostninger**
4. **Overprovisionér ikke uden begrundelse**
5. **Ignorer ikke afhængigheders indvirkning**
6. **Sæt ikke autoskaleringsgrænser for højt**
7. **Glem ikke krav til overholdelse**
8. **Tag ikke beslutninger udelukkende baseret på pris**

---

**Pro Tip**: Brug Azure Cost Management og Advisor til at få personlige anbefalinger til at optimere dine SKU-valg baseret på faktiske brugsdata.

---

**Navigation**
- **Forrige lektion**: [Kapacitetsplanlægning](capacity-planning.md)
- **Næste lektion**: [Forudgående tjek](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritiske oplysninger anbefales en professionel, menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, som opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
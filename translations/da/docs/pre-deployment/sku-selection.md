# Vejledning til SKU-valg - Sådan vælger du de rette Azure-serviceniveauer

**Kapiteloversigt:**
- **📚 Kursushjem**: [AZD For Beginners](../../README.md)
- **📖 Aktuelt kapitel**: Kapitel 6 - Validering og planlægning før implementering
- **⬅️ Forrige**: [Kapacitetsplanlægning](capacity-planning.md)
- **➡️ Næste**: [Pre-flight Checks](preflight-checks.md)
- **🚀 Næste kapitel**: [Kapitel 7: Fejlfinding](../troubleshooting/common-issues.md)

## Introduktion

Denne omfattende vejledning hjælper dig med at vælge optimale Azure SKU'er (Stock Keeping Units) til forskellige miljøer, arbejdsbelastninger og krav. Lær at analysere behov for ydeevne, omkostningshensyn og skalerbarhed for at vælge de mest passende serviceniveauer til dine Azure Developer CLI-implementeringer.

## Læringsmål

Ved at gennemføre denne vejledning vil du:
- Forstå Azure SKU-konceptet, prisstrukturer og forskelle i funktioner
- Mestre strategier for SKU-valg baseret på miljøer som udvikling, staging og produktion
- Analysere arbejdsbelastningskrav og matche dem med passende serviceniveauer
- Implementere omkostningsoptimeringsstrategier gennem intelligent SKU-valg
- Anvende ydeevnetest og valideringsteknikker for SKU-valg
- Konfigurere automatiske SKU-anbefalinger og overvågning

## Læringsresultater

Efter afslutning vil du være i stand til at:
- Vælge passende Azure SKU'er baseret på arbejdsbelastningskrav og begrænsninger
- Designe omkostningseffektive arkitekturer med korrekt niveauvalg for flere miljøer
- Implementere ydeevnebenchmarking og validering for SKU-valg
- Oprette automatiserede værktøjer til SKU-anbefalinger og omkostningsoptimering
- Planlægge SKU-migreringer og skaleringsstrategier for ændrede krav
- Anvende principper fra Azure Well-Architected Framework til valg af serviceniveauer

## Indholdsfortegnelse

- [Forståelse af SKU'er](../../../../docs/pre-deployment)
- [Miljøbaseret valg](../../../../docs/pre-deployment)
- [Specifikke retningslinjer for tjenester](../../../../docs/pre-deployment)
- [Strategier for omkostningsoptimering](../../../../docs/pre-deployment)
- [Overvejelser om ydeevne](../../../../docs/pre-deployment)
- [Hurtige referencetabeller](../../../../docs/pre-deployment)
- [Valideringsværktøjer](../../../../docs/pre-deployment)

---

## Forståelse af SKU'er

### Hvad er SKU'er?

SKU'er (Stock Keeping Units) repræsenterer forskellige serviceniveauer og ydeevne for Azure-ressourcer. Hver SKU tilbyder forskellige:

- **Ydeevneegenskaber** (CPU, hukommelse, gennemløb)
- **Funktionalitet** (skaleringsmuligheder, SLA-niveauer)
- **Prisstrukturer** (forbrugsbaseret, reserveret kapacitet)
- **Regional tilgængelighed** (ikke alle SKU'er er tilgængelige i alle regioner)

### Vigtige faktorer i SKU-valg

1. **Arbejdsbelastningskrav**
   - Forventede trafik-/belastningsmønstre
   - Krav til ydeevne (CPU, hukommelse, I/O)
   - Lagerbehov og adgangsmønstre

2. **Miljøtype**
   - Udvikling/test vs. produktion
   - Tilgængelighedskrav
   - Sikkerheds- og compliancebehov

3. **Budgetbegrænsninger**
   - Startomkostninger vs. driftsomkostninger
   - Rabatter for reserveret kapacitet
   - Omkostningsimplikationer ved autoskalering

4. **Vækstprojektioner**
   - Skaleringskrav
   - Fremtidige funktionsbehov
   - Migreringskompleksitet

---

## Miljøbaseret valg

### Udviklingsmiljø

**Prioriteter**: Omkostningsoptimering, grundlæggende funktionalitet, nem provisionering/deprovisionering

#### Anbefalede SKU'er
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
- **App Service**: F1 (Gratis) eller B1 (Basic) til simpel test
- **Databaser**: Grundlæggende niveau med minimale ressourcer
- **Lagring**: Standard med kun lokal redundans
- **Compute**: Delte ressourcer er acceptable
- **Netværk**: Grundlæggende konfigurationer

### Staging/testmiljø

**Prioriteter**: Produktion-lignende konfiguration, balancerede omkostninger, kapacitet til ydeevnetest

#### Anbefalede SKU'er
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
- **Ydeevne**: 70-80% af produktionskapacitet
- **Funktioner**: De fleste produktionsfunktioner aktiveret
- **Redundans**: Nogle geografiske redundansmuligheder
- **Skalering**: Begrænset autoskalering til test
- **Overvågning**: Fuld overvågningspakke

### Produktionsmiljø

**Prioriteter**: Ydeevne, tilgængelighed, sikkerhed, compliance, skalerbarhed

#### Anbefalede SKU'er
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
- **Ydeevne**: Dedikerede ressourcer, høj gennemløb
- **Sikkerhed**: Premium sikkerhedsfunktioner
- **Skalering**: Fuld autoskalering
- **Overvågning**: Omfattende observabilitet

---

## Specifikke retningslinjer for tjenester

### Azure App Service

#### SKU-beslutningsmatrix

| Brugsscenarie | Anbefalet SKU | Begrundelse |
|---------------|---------------|-------------|
| Udvikling/test | F1 (Gratis) eller B1 (Basic) | Omkostningseffektivt, tilstrækkeligt til test |
| Små produktionsapps | S1 (Standard) | Tilpassede domæner, SSL, autoskalering |
| Mellemstore produktionsapps | P1V3 (Premium V3) | Bedre ydeevne, flere funktioner |
| Højtrafikapps | P2V3 eller P3V3 | Dedikerede ressourcer, høj ydeevne |
| Kritiske apps | I1V2 (Isolated V2) | Netværksisolering, dedikeret hardware |

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

#### Framework for SKU-valg

1. **DTU-baseret (Database Transaction Units)**
   - **Basic**: 5 DTU - Udvikling/test
   - **Standard**: S0-S12 (10-3000 DTU) - Generelt formål
   - **Premium**: P1-P15 (125-4000 DTU) - Ydeevnekritisk

2. **vCore-baseret** (Anbefales til produktion)
   - **General Purpose**: Balanceret compute og lager
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
   - Betal pr. brug
   - Velegnet til udvikling og variable arbejdsbelastninger
   - Delte infrastrukturer

2. **Dedikeret (Workload Profiles)**
   - Dedikerede compute-ressourcer
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

#### Gennemløbsmodeller

1. **Manuelt provisioneret gennemløb**
   - Forudsigelig ydeevne
   - Rabatter for reserveret kapacitet
   - Bedst til stabile arbejdsbelastninger

2. **Autoskalering af provisioneret gennemløb**
   - Automatisk skalering baseret på brug
   - Betal kun for det, du bruger (med minimum)
   - Godt til variable arbejdsbelastninger

3. **Serverless**
   - Betal pr. anmodning
   - Ingen provisioneret gennemløb
   - Ideelt til udvikling og intermitterende arbejdsbelastninger

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

#### Typer af lagerkonti

1. **Standard_LRS** - Udvikling, ikke-kritiske data
2. **Standard_GRS** - Produktion, behov for geo-redundans
3. **Premium_LRS** - Højtydende applikationer
4. **Premium_ZRS** - Høj tilgængelighed med zone-redundans

#### Ydeevneniveauer

- **Standard**: Generelt formål, omkostningseffektivt
- **Premium**: Høj ydeevne, lav latenstidsscenarier

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
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Rigtig dimensionering

Start med mindre SKU'er og skaler op baseret på faktisk brug:

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

### 3. Autoskalering

Implementer intelligent skalering for at optimere omkostninger:

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

Skaler ned i perioder med lav belastning:

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

## Overvejelser om ydeevne

### Grundlæggende ydeevnekrav

Definér klare ydeevnekrav før SKU-valg:

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

Test forskellige SKU'er for at validere ydeevne:

```bash
# Azure Load Testing service
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

### App Service SKU Hurtig Reference

| SKU | Niveau | vCPU | RAM | Lager | Prisinterval | Brugsscenarie |
|-----|--------|------|-----|-------|--------------|---------------|
| F1 | Gratis | Delt | 1GB | 1GB | Gratis | Udvikling |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Små apps |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Produktion |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Høj ydeevne |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### SQL Database SKU Hurtig Reference

| SKU | Niveau | DTU/vCore | Lager | Prisinterval | Brugsscenarie |
|-----|--------|-----------|-------|--------------|---------------|
| Basic | Basic | 5 DTU | 2GB | $ | Udvikling |
| S2 | Standard | 50 DTU | 250GB | $$ | Små produktioner |
| P2 | Premium | 250 DTU | 1TB | $$$ | Høj ydeevne |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Balanceret |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Kritisk |

### Container Apps SKU Hurtig Reference

| Model | Prisstruktur | CPU/Hukommelse | Brugsscenarie |
|-------|--------------|----------------|---------------|
| Forbrug | Betal pr. brug | 0.25-2 vCPU | Udvikling, variabel belastning |
| Dedikeret D4 | Reserveret | 4 vCPU, 16GB | Produktion |
| Dedikeret D8 | Reserveret | 8 vCPU, 32GB | Høj ydeevne |

---

## Valideringsværktøjer

### SKU Tilgængelighedstjekker

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

### Omkostningsestimeringsscript

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

### Ydeevnevalidering

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

### Do's

1. **Start småt og skaler op** baseret på faktisk brug
2. **Brug forskellige SKU'er til forskellige miljøer**
3. **Overvåg ydeevne og omkostninger løbende**
4. **Udnyt reserveret kapacitet til produktionsarbejdsbelastninger**
5. **Implementer autoskalering, hvor det er passende**
6. **Test ydeevne med realistiske arbejdsbelastninger**
7. **Planlæg vækst, men undgå overprovisionering**
8. **Brug gratis niveauer til udvikling, når det er muligt**

### Don'ts

1. **Brug ikke produktions-SKU'er til udvikling**
2. **Ignorér ikke regional SKU-tilgængelighed**
3. **Glem ikke dataoverførselsomkostninger**
4. **Overprovisionér ikke uden begrundelse**
5. **Ignorér ikke afhængigheders indvirkning**
6. **Sæt ikke autoskaleringsgrænser for højt**
7. **Glem ikke compliancekrav**
8. **Tag ikke beslutninger baseret kun på pris**

---

**Pro Tip**: Brug Azure Cost Management og Advisor til at få personlige anbefalinger til optimering af dine SKU-valg baseret på faktiske brugsmønstre.

---

**Navigation**
- **Forrige lektion**: [Kapacitetsplanlægning](capacity-planning.md)
- **Næste lektion**: [Preflight Checks](preflight-checks.md)

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på at opnå nøjagtighed, skal det bemærkes, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os ikke ansvar for misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.
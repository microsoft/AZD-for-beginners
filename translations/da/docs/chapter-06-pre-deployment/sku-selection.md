# SKU-udvalgsguide - Vælg de rigtige Azure-tjenesteniveauer

**Kapitelnavigation:**
- **📚 Kursushjem**: [AZD For Beginners](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 6 - Forudinstallationsvalidering og planlægning
- **⬅️ Forrige**: [Kapacitetsplanlægning](capacity-planning.md)
- **➡️ Næste**: [Forudkontroller](preflight-checks.md)
- **🚀 Næste kapitel**: [Kapitel 7: Fejlfinding](../chapter-07-troubleshooting/common-issues.md)

## Introduktion

Denne omfattende guide hjælper dig med at vælge optimale Azure-tjeneste-SKU'er (Stock Keeping Units) til forskellige miljøer, arbejdsbelastninger og krav. Lær at analysere ydeevnebehov, omkostningshensyn og skaleringskrav for at vælge de mest passende tjenesteniveauer til dine Azure Developer CLI-udrulninger.

## Læringsmål

Når du har gennemført denne guide, vil du:
- Forstå Azure SKU-koncepter, prismodeller og funktionsforskelle
- Mestre miljøspecifikke SKU-udvælgelsesstrategier til udvikling, staging og produktion
- Analysere arbejdsbelastningskrav og matche dem med passende tjenesteniveauer
- Implementere omkostningsoptimeringsstrategier gennem intelligent SKU-udvælgelse
- Anvende ydeevnetest- og valideringsteknikker for SKU-valg
- Konfigurere automatiserede SKU-anbefalinger og overvågning

## Læringsresultater

Når du har gennemført guiden, vil du kunne:
- Vælge passende Azure-tjeneste-SKU'er baseret på arbejdsbelastningskrav og begrænsninger
- Designe omkostningseffektive multi-miljøarkitekturer med korrekt niveaubeskrivelse
- Implementere ydeevnemåling og validering for SKU-valg
- Oprette automatiserede værktøjer til SKU-anbefaling og omkostningsoptimering
- Planlægge SKU-migrationer og skaleringsstrategier til ændrende krav
- Anvende principperne i Azure Well-Architected Framework til tjenesteniveauvalg

## Indholdsfortegnelse

- [Forstå SKUs](#understanding-skus)
- [Miljøbaseret udvælgelse](#environment-based-selection)
- [Tjenestespecifikke retningslinjer](#service-specific-guidelines)
- [Omkostningsoptimeringsstrategier](#cost-optimization-strategies)
- [Ydeevnehensyn](#performance-considerations)
- [Hurtig reference-tabeller](#quick-reference-tables)
- [Valideringsværktøjer](#validation-tools)

---

## Forstå SKUs

> **Eksempelmål:** YAML SKU-kort og ydeevnekonfigurationer nedenfor er designnotater, ikke en `azure.yaml`-skema eller en load-tool-konfiguration. Bicep-blokke er alternativer/fragmenter: deklarer deres parametre og overordnede ressourcer, brug unikke symbolske navne, når du kombinerer dem, og sammenkobl moduler i et fungerende projekt. Priser, grænser og regional/SKU-tilgængelighed skal tjekkes for dit abonnement inden udrulning.

### Hvad er SKUs?

SKUs (Stock Keeping Units) repræsenterer forskellige tjenesteniveauer og ydeevneniveauer for Azure-ressourcer. Hver SKU tilbyder forskellig:

- **Ydeevnekarakteristika** (CPU, hukommelse, gennemstrømning)
- **Funktionstilgængelighed** (skaleringsmuligheder, SLA-niveauer)
- **Prismodeller** (forbrugsbaseret, reserveret kapacitet)
- **Regional tilgængelighed** (ikke alle SKUs er tilgængelige i alle regioner)

### Vigtige faktorer i SKU-udvælgelse

1. **Arbejdsbelastningskrav**
   - Forventede trafik-/belastningsmønstre
   - Ydeevnekrav (CPU, hukommelse, I/O)
   - Lagringsbehov og adgangsmønstre

2. **Miljøtype**
   - Udvikling/test vs. produktion
   - Tilgængelighedskrav
   - Sikkerheds- og overholdelsesbehov

3. **Budgetbegrænsninger**
   - Initiale omkostninger vs. driftsomkostninger
   - Rabatter for reserveret kapacitet
   - Omkostningsimplikationer ved autoskalering

4. **Vækstforventninger**
   - Skaleringskrav
   - Fremtidige funktionsbehov
   - Migreringskompleksitet

---

## Miljøbaseret udvælgelse

### Udviklingsmiljø

**Prioriteter**: Omkostningsoptimering, grundlæggende funktionalitet, nem provisioning/deprovisioning

#### Anbefalede SKUs
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

#### Egenskaber
- **App Service**: F1 (gratis) eller B1 (grundlæggende) til simpel testning
- **Databaser**: Grundlæggende niveau med minimale ressourcer
- **Storage**: Standard med kun lokal redundans
- **Compute**: Delte ressourcer acceptable
- **Netværk**: Grundlæggende konfigurationer

### Staging/testmiljø

**Prioriteter**: Produktionslignende konfiguration, omkostningsbalance, mulighed for ydeevnetest

#### Anbefalede SKUs
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

#### Egenskaber
- **Ydeevne**: 70-80 % af produktionskapaciteten
- **Funktioner**: Flertallet af produktionsfunktioner aktiveret
- **Redundans**: Nogen geografisk redundans
- **Skalering**: Begrænset autoskalering til testformål
- **Overvågning**: Fuld overvågningsstack

### Produktionsmiljø

**Prioriteter**: Ydeevne, tilgængelighed, sikkerhed, overholdelse, skalerbarhed

#### Anbefalede SKUs
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

#### Egenskaber
- **Høj tilgængelighed**: 99,9 %+ SLA-krav
- **Ydeevne**: Dedikerede ressourcer, høj gennemstrømning
- **Sikkerhed**: Premium sikkerhedsfunktioner
- **Skalering**: Fuld autoskaleringsevne
- **Overvågning**: Omfattende observabilitet

---

## Tjenestespecifikke retningslinjer

### Azure App Service

#### SKU-beslutningsmatrix

| Anvendelsestilfælde | Anbefalet SKU | Begrundelse |
|-------------------|--------------|------------|
| Udvikling/test | F1 (gratis) eller B1 (grundlæggende) | Omkostningseffektivt, tilstrækkeligt til testning |
| Små produktionsapps | S1 (standard) | Brugerdefinerede domæner, SSL, autoskalering |
| Mellemstore produktionsapps | P1V3 (Premium V3) | Bedre ydeevne, flere funktioner |
| Højtrafik-apps | P2V3 eller P3V3 | Dedikerede ressourcer, høj ydeevne |
| Mission-kritiske apps | I1V2 (Isoleret V2) | Netværksisolering, dedikeret hardware |

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

#### SKU-udvælgelsesramme

1. **DTU-baseret (Database Transaction Units)**
   - **Basic**: 5 DTU - Udvikling/test
   - **Standard**: S0-S12 (10-3000 DTU) - Generelt formål
   - **Premium**: P1-P15 (125-4000 DTU) - Ydeevnekritisk

2. **vCore-baseret** (Anbefales til produktion)
   - **General Purpose**: Balanceret compute og storage
   - **Business Critical**: Lav latenstid, høj IOPS
   - **Hyperscale**: Meget skalerbar storage; verificer aktuelle størrelsesbegrænsninger og regional support

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
   - Egnet til udvikling og variable arbejdsbelastninger
   - Delt infrastruktur

2. **Dedikeret (Arbejdsbelastningsprofiler)**
   - Dedikerede compute-ressourcer
   - Forudsigelig ydeevne
   - Bedre til produktionsarbejdsbelastninger

#### Konfigurationseksempler

**Udvikling (forbrug)**
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

**Produktion (dedikeret)**
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

Zoneredundans kræver også understøttet regionsinfrastruktur og passende VNet/subnet-konfiguration, som er udeladt her. Dette eksempel budgetterer med tre dedikerede noder; konfigurer mindst to app-replikater til kryds-zone distribution og dimensioner både replikater og noder til zonesvigt. Se [Container Apps pålidelighedsguide](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). For at placere en app på denne profil, indstil dens `workloadProfileName: 'production-profile'`; selve oprettelsen af profilen flytter ikke apps til den.

### Azure Cosmos DB

#### Gennemstrømningsmodeller

1. **Manuelt provisioneret gennemstrømning**
   - Forudsigelig ydeevne
   - Rabatter for reserveret kapacitet
   - Bedst til stabile arbejdsbelastninger

2. **Autoskalering med provisioneret gennemstrømning**
   - Automatisk skalering baseret på brug
   - Betal for det, du bruger (med minimum)
   - God til variable arbejdsbelastninger

3. **Serverless**
   - Betal pr. forespørgsel
   - Ingen provisioneret gennemstrømning
   - Ideel til udvikling og intermittent belastning

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

#### Storage-kontotyper

1. **Standard_LRS** - Udvikling, ikke-kritiske data
2. **Standard_GRS** - Produktion, behov for geo-redundans
3. **Premium_LRS** - Højtydende applikationer
4. **Premium_ZRS** - Høj tilgængelighed med zoneredundans

#### Ydeevneniveauer

- **Standard**: Generelt formål, omkostningseffektivt
- **Premium**: Højtydende, lav latenstid scenarier

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

## Omkostningsoptimeringsstrategier

### 1. Reserveret kapacitet

Reservér ressourcer i 1-3 år for betydelige rabatter:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Tilbudsformer og kvalificerede ressourcetyper varierer; undersøg kataloget og købsbetingelserne i stedet for at antage, at hver tjeneste/SKU understøtter reservation.

### 2. Rettidig dimensionering

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

### 4. Planlagt skalering

Skaler ned i lavtrafiktider:

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

## Ydeevnehensyn

### Baseline-ydeevnekrav

Definer klare ydeevnekrav før SKU-udvælgelse:

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
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
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

## Hurtige referencetabeller

### App Service SKU Hurtig Reference

| SKU | Niveau | vCPU | RAM | Storage | Prisklasse | Brugstilfælde |
|-----|--------|------|-----|---------|------------|--------------|
| F1 | Gratis | Delt | 1GB | 1GB | Gratis | Udvikling |
| B1 | Grundlæggende | 1 | 1,75GB | 10GB | $ | Små apps |
| S1 | Standard | 1 | 1,75GB | 50GB | $$ | Produktion |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Høj ydeevne |
| I1V2 | Isoleret V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### SQL Database SKU Hurtig Reference

| SKU | Niveau | DTU/vCore | Storage | Prisklasse | Brugstilfælde |
|-----|--------|-----------|---------|------------|--------------|
| Basic | Grundlæggende | 5 DTU | 2GB | $ | Udvikling |
| S2 | Standard | 50 DTU | 250GB | $$ | Lille produktion |
| P2 | Premium | 250 DTU | 1TB | $$$ | Høj ydeevne |
| GP_Gen5_4 | Generelt formål | 4 vCore | 4TB | $$$ | Balanseret |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Mission-critical |

### Container Apps SKU Hurtig Reference

| Model | Prisfastsættelse | CPU/Hukommelse | Brugstilfælde |
|-------|-----------------|---------------|--------------|
| Forbrug | Betal pr. brug | Understøttede CPU/hukommelseskombinationer afhænger af miljø/profil | Udvikling eller produktion, variabel belastning |
| Dedikeret D4 | Fakturering pr. dedikeret node | 4 vCPU, 16GiB pr. node | Vedvarende belastning/isoleringsbehov |
| Dedikeret D8 | Fakturering pr. dedikeret node | 8 vCPU, 32GiB pr. node | Højere vedvarende belastning |

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

### Omkostningsestimeringsscript

**Pseudokode kun:** `Get-ResourceCost` nedenfor er en projektspecifik funktion, du skal implementere ved hjælp af aktuelle regionale/kontraktmæssige priser og brugsantagelser. Det er ikke en PowerShell- eller Azure-cmdlet.

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

Følgende YAML er et kravsskema, **ikke** et Azure Load Testing-, JMeter-, Locust- eller k6-inputskema. Oversæt det til dit valgte værktøjs reelle konfiguration, før du bruger load-test-kommandoen ovenfor.

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

## Resumé af bedste praksis

### Gør's

1. **Start småt og skaler op** baseret på faktisk brug
2. **Brug forskellige SKUs til forskellige miljøer**
3. **Overvåg ydeevne og omkostninger løbende**
4. **Udnyt reserveret kapacitet til produktionsbelastninger**
5. **Implementer autoskalering, hvor det er relevant**
6. **Test ydeevne med realistiske arbejdsbelastninger**
7. **Planlæg for vækst, men undgå overprovisionering**
8. **Brug gratis niveauer til udvikling, når det er muligt**

### Don'ts

1. **Brug ikke produktions-SKUs til udvikling**
2. **Ignorer ikke regional SKU-tilgængelighed**
3. **Glem ikke omkostninger ved dataoverførsel**
4. **Overprovisioner ikke uden begrundelse**
5. **Ignorer ikke afhængigheders indvirkning**
6. **Sæt ikke autoskaleringgrænser for højt**
7. **Glem ikke overholdelseskrav**
8. **Træf ikke beslutninger baseret kun på pris**

---

**Pro tip**: Brug Azure Cost Management og Advisor til at få personlige anbefalinger for at optimere dine SKU-valg baseret på faktiske brugsmønstre.

---

**Navigation**
- **Forrige lektion**: [Kapacitetsplanlægning](capacity-planning.md)
- **Næste lektion**: [Forudkontroller](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# SKU-utvalgsguide - Velge riktige Azure-tjenestenivåer

**Kapittelnavigering:**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 6 - Forhåndsvalidering og planlegging før distribusjon
- **⬅️ Forrige**: [Kapasitetsplanlegging](capacity-planning.md)
- **➡️ Neste**: [Pre-flight Sjekker](preflight-checks.md)
- **🚀 Neste Kapittel**: [Kapittel 7: Feilsøking](../chapter-07-troubleshooting/common-issues.md)

## Introduksjon

Denne omfattende guiden hjelper deg med å velge optimale Azure tjeneste-SKUer (lagerenheter) for forskjellige miljøer, arbeidsbelastninger og krav. Lær å analysere ytelsesbehov, kostnadsbetraktninger og skaleringskrav for å velge de mest passende tjenestenivåene for dine Azure Developer CLI-distribusjoner.

## Læringsmål

Etter å ha fullført denne guiden vil du:
- Forstå Azure SKU-konsepter, prismodeller og funksjonsforskjeller
- Mestre miljøspesifikke SKU-valgstrategier for utvikling, staging og produksjon
- Analysere arbeidsbelastningskrav og matche dem med passende tjenestenivåer
- Implementere kostnadsoptimaliseringsstrategier gjennom intelligent SKU-valg
- Anvende ytelsestesting og valideringsteknikker for SKU-valg
- Konfigurere automatiske SKU-anbefalinger og overvåking

## Læringsutbytte

Når du er ferdig, vil du kunne:
- Velge passende Azure tjeneste-SKUer basert på arbeidsbelastningskrav og begrensninger
- Designe kostnadseffektive multi-miljø arkitekturer med riktig nivåvalg
- Implementere ytelsesbenchmarking og validering for SKU-valg
- Lage automatiserte verktøy for SKU-anbefaling og kostnadsoptimalisering
- Planlegge SKU-migrasjoner og skaleringsstrategier for endrede krav
- Anvende Azure Well-Architected Framework-prinsipper for tjenestenivåvalg

## Innholdsfortegnelse

- [Forstå SKUs](#understanding-skus)
- [Miljøbasert valg](#environment-based-selection)
- [Tjenestespesifikke retningslinjer](#service-specific-guidelines)
- [Kostnadsoptimaliseringsstrategier](#cost-optimization-strategies)
- [Ytelsesbetraktninger](#performance-considerations)
- [Hurtigreferansetabeller](#quick-reference-tables)
- [Valideringsverktøy](#validation-tools)

---

## Forstå SKUs

> **Eksempelområde:** YAML SKU-kart og ytelseskonfigurasjoner nedenfor er designnotater, ikke et `azure.yaml` skjema eller en last-verktøykonfigurasjon. Bicep-blokker er alternativer/fragmenter: deklarer deres parametere og overordnede ressurser, bruk unike symbolske navn når du kombinerer dem, og koble moduler inn i et fungerende prosjekt. Priser, grenser og region/SKU-tilgjengelighet må sjekkes for ditt abonnement før distribusjon.

### Hva er SKUs?

SKUs (lagerenheter) representerer forskjellige tjenestenivåer og ytelsesnivåer for Azure-ressurser. Hver SKU tilbyr forskjellige:

- **Ytelseskarakteristikker** (CPU, minne, gjennomstrømming)
- **Funksjonstilstedeværelse** (skaleringsalternativer, SLA-nivåer)
- **Prismodeller** (forbruk, reservert kapasitet)
- **Regional tilgjengelighet** (ikke alle SKUer er tilgjengelige i alle regioner)

### Nøkkelfaktorer i SKU-valg

1. **Arbeidsbelastningskrav**
   - Forventede trafikk-/lastmønstre
   - Ytelseskrav (CPU, minne, I/O)
   - Lagringsbehov og tilgangsmønstre

2. **Miljøtype**
   - Utvikling/testing kontra produksjon
   - Tilgjengelighetskrav
   - Sikkerhets- og samsvarskrav

3. **Budsjettbegrensninger**
   - Startkostnader vs. driftskostnader
   - Reservasjonsrabatter
   - Kostnadsimplikasjoner ved auto-skaler

4. **Vekstprognoser**
   - Skaleringskrav
   - Fremtidige funksjonsbehov
   - Migrasjonskompleksitet

---

## Miljøbasert valg

### Utviklingsmiljø

**Prioriteringer**: Kostnadsoptimalisering, grunnleggende funksjonalitet, enkel provisjonering/de-provisjonering

#### Anbefalte SKUer
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

#### Karakteristikker
- **App Service**: F1 (Gratis) eller B1 (Grunnleggende) for enkel testing
- **Databaser**: Grunnleggende nivå med minimale ressurser
- **Lagring**: Standard med lokal redundans kun
- **Kalkulering**: Delte ressurser akseptabelt
- **Nettverk**: Grunnleggende konfigurasjoner

### Staging-/testmiljø

**Prioriteringer**: Produksjonslignende konfigurasjon, kostnadsbalanse, mulighet for ytelsestesting

#### Anbefalte SKUer
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

#### Karakteristikker
- **Ytelse**: 70–80 % av produksjonskapasitet
- **Funksjoner**: De fleste produksjonsfunksjoner aktivert
- **Redundans**: Noe geografisk redundans
- **Skalering**: Begrenset auto-skaler for testing
- **Overvåking**: Full overvåkingsstabel

### Produksjonsmiljø

**Prioriteringer**: Ytelse, tilgjengelighet, sikkerhet, samsvar, skalerbarhet

#### Anbefalte SKUer
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

#### Karakteristikker
- **Høy tilgjengelighet**: 99,9 %+ SLA-krav
- **Ytelse**: Dedikerte ressurser, høy gjennomstrømming
- **Sikkerhet**: Premium sikkerhetsfunksjoner
- **Skalering**: Full auto-skaleringskapasitet
- **Overvåking**: Omfattende observabilitet

---

## Tjenestespesifikke retningslinjer

### Azure App Service

#### SKU beslutningsmatrise

| Brukstilfelle | Anbefalt SKU | Begrunnelse |
|----------|----------------|-----------|
| Utvikling/testing | F1 (Gratis) eller B1 (Grunnleggende) | Kostnadseffektivt, tilstrekkelig for testing |
| Små produksjonsapper | S1 (Standard) | Tilpassede domener, SSL, auto-skaler |
| Middels store produksjonsapper | P1V3 (Premium V3) | Bedre ytelse, flere funksjoner |
| Apper med høy trafikk | P2V3 eller P3V3 | Dedikerte ressurser, høy ytelse |
| Kritiske apper | I1V2 (Isolert V2) | Nettverksisolasjon, dedikert maskinvare |

#### Konfigurasjonseksempler

**Utvikling**
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

**Produksjon**
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

#### SKU-valg rammeverk

1. **DTU-basert (Database Transaction Units)**
   - **Basic**: 5 DTU - Utvikling/testing
   - **Standard**: S0-S12 (10-3000 DTU) - Generell bruk
   - **Premium**: P1-P15 (125-4000 DTU) - Ytelseskritisk

2. **vCore-basert** (Anbefalt for produksjon)
   - **Generell bruk**: Balansert kalkulering og lagring
   - **Business Critical**: Lav ventetid, høy IOPS
   - **Hyperscale**: Høyt skalerbar lagring; verifiser nåværende størrelsesgrenser og regional støtte

#### Eksempelkonstruksjoner

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

1. **Forbruksbasert**
   - Betal per bruk
   - Egnet for utvikling og variable arbeidsbelastninger
   - Delt infrastruktur

2. **Dedikert (Arbeidsbelastningsprofil)**
   - Dedikerte beregningsressurser
   - Forutsigbar ytelse
   - Bedre for produksjonsarbeidsbelastninger

#### Konfigurasjonseksempler

**Utvikling (Forbruk)**
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

**Produksjon (Dedikert)**
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

Sonesredundans krever også støttet regionsinfrastruktur og egnet VNet/subnet-konfigurasjon, utelatt her. Dette eksempelet budsjetterer tre dedikerte noder; konfigurer minst to appreplikater for kryss-sone distribusjon og dimensjoner både replikaer og noder for sonefeil. Se [Container Apps pålitelighetsveiledning](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). For å plassere en app på denne profilen, sett dens `workloadProfileName: 'production-profile'`; å opprette profilen alene flytter ikke apper til den.

### Azure Cosmos DB

#### Gjennomstrømmingsmodeller

1. **Manuelt tildelt gjennomstrømning**
   - Forutsigbar ytelse
   - Reservasjonsrabatter
   - Best for jevne arbeidsbelastninger

2. **Autoskalert tildelt gjennomstrømning**
   - Automatisk skalering basert på bruk
   - Betal for det du bruker (med minimum)
   - Godt for variable arbeidsbelastninger

3. **Serverløs**
   - Betal-per-forespørsel
   - Ingen tildelt gjennomstrømning
   - Ideell for utvikling og sporadiske arbeidsbelastninger

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

#### Lagringskontotyper

1. **Standard_LRS** - Utvikling, ikke-kritiske data
2. **Standard_GRS** - Produksjon, behov for geo-redundans
3. **Premium_LRS** - Høyytelsesapplikasjoner
4. **Premium_ZRS** - Høy tilgjengelighet med soneredundans

#### Ytelsesnivåer

- **Standard**: Allmenn bruk, kostnadseffektivt
- **Premium**: Høyytelses-, lav-latens scenarier

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

## Kostnadsoptimaliseringsstrategier

### 1. Reservert kapasitet

Reserver ressurser for 1-3 år for betydelige rabatter:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Reservasjonstilbud og kvalifiserte ressurstyper varierer; inspiser katalogen og kjøpsbetingelser i stedet for å anta at hver tjeneste/SKU støtter reservasjon.

### 2. Riktig dimensjonering

Start med mindre SKUer og skaler opp basert på faktisk bruk:

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

### 3. Auto-skaleringskonfigurasjon

Implementer intelligent skalering for å optimalisere kostnader:

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

Skaler ned i perioder med mindre aktivitet:

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

## Ytelsesbetraktninger

### Grunnleggende ytelseskrav

Definer klare ytelseskrav før SKU-valg:

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

### Lasttesting

Test ulike SKUer for å validere ytelse:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### Overvåking og optimalisering

Sett opp omfattende overvåking:

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

## Hurtigreferansetabeller

### App Service SKU hurtigreferanse

| SKU | Nivå | vCPU | RAM | Lagring | Prisspenn | Brukstilfelle |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Gratis | Delt | 1GB | 1GB | Gratis | Utvikling |
| B1 | Grunnleggende | 1 | 1,75GB | 10GB | $ | Små apper |
| S1 | Standard | 1 | 1,75GB | 50GB | $$ | Produksjon |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Høy ytelse |
| I1V2 | Isolert V2 | 2 | 8GB | 1TB | $$$$ | Firma |

### SQL Database SKU hurtigreferanse

| SKU | Nivå | DTU/vCore | Lagring | Prisspenn | Brukstilfelle |
|-----|------|-----------|---------|-------------|----------|
| Basic | Grunnleggende | 5 DTU | 2GB | $ | Utvikling |
| S2 | Standard | 50 DTU | 250GB | $$ | Liten produksjon |
| P2 | Premium | 250 DTU | 1TB | $$$ | Høy ytelse |
| GP_Gen5_4 | Generell bruk | 4 vCore | 4TB | $$$ | Balansert |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Kritisk |

### Container Apps SKU hurtigreferanse

| Modell | Pris | CPU/Minne | Brukstilfelle |
|-------|---------|------------|----------|
| Forbruk | Betal per bruk | Støttede CPU/minne-kombinasjoner avhenger av miljø/profil | Utvikling eller produksjon, variabel belastning |
| Dedikert D4 | Fakturering per dedikert node | 4 vCPU, 16GiB per node | Vedvarende belastning/isolasjon behov |
| Dedikert D8 | Fakturering per dedikert node | 8 vCPU, 32GiB per node | Høyere vedvarende belastning |

---

## Valideringsverktøy

### SKU Tilgjengelighetssjekker

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

### Kostnadsestimeringsskript

**Pseudokode kun:** `Get-ResourceCost` nedenfor er en prosjektspesifikk funksjon som du må implementere med nåværende regional/priskontrakt og brukstilpasninger. Det er ikke en PowerShell- eller Azure cmdlet.

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

### Ytelsesvalidering

Følgende YAML er et kravskisse, **ikke** et Azure Load Testing, JMeter, Locust eller k6 inndata-skjema. Oversett det til ditt valgte verktøys reelle konfigurasjon før du bruker last-test-kommandoen ovenfor.

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

## Oppsummering av beste praksis

### Gjør's

1. **Start smått og skaler opp** basert på faktisk bruk
2. **Bruk forskjellige SKUer for ulike miljøer**
3. **Overvåk ytelse og kostnader kontinuerlig**
4. **Utnytt reservert kapasitet for produksjonsarbeidsbelastninger**
5. **Implementer auto-skaleringsfunksjoner der det passer**
6. **Test ytelse med realistiske arbeidsbelastninger**
7. **Planlegg for vekst, men unngå overdimensjonering**
8. **Bruk gratisnivåer for utvikling når mulig**

### Ikke gjør's

1. **Ikke bruk produksjons-SKUer for utvikling**
2. **Ikke ignorer regional SKU-tilgjengelighet**
3. **Ikke glem dataoverføringskostnader**
4. **Ikke overdimensjoner uten begrunnelse**
5. **Ikke overse virkningen av avhengigheter**
6. **Ikke sett auto-skaleringsgrenser for høyt**
7. **Ikke glem samsvarskrav**
8. **Ikke ta avgjørelser kun basert på pris**

---

**Proftips**: Bruk Azure Cost Management og Advisor for å få personlige anbefalinger for å optimalisere dine SKU-valg basert på faktiske bruksmønstre.

---

**Navigering**
- **Forrige leksjon**: [Kapasitetsplanlegging](capacity-planning.md)
- **Neste leksjon**: [Preflight Sjekker](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
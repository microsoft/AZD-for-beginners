# SKU-utvelgelsesguide - Velge riktige Azure-tjenestenivåer

**Chapter Navigation:**
- **📚 Kurs Hjem**: [AZD For Beginners](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 6 - Validering og planlegging før distribusjon
- **⬅️ Forrige**: [Kapasitetsplanlegging](capacity-planning.md)
- **➡️ Neste**: [Forhåndssjekker](preflight-checks.md)
- **🚀 Neste Kapittel**: [Kapittel 7: Feilsøking](../chapter-07-troubleshooting/common-issues.md)

## Introduksjon

Denne omfattende veiledningen hjelper deg med å velge optimale Azure-tjeneste-SKU-er (lagerføringsenheter) for ulike miljøer, arbeidsbelastninger og krav. Lær å analysere ytelsesbehov, kostnadsbetraktninger og skalerbarhetskrav for å velge de mest passende tjenestenivåene for dine Azure Developer CLI-distribusjoner.

## Læringsmål

Ved å fullføre denne veiledningen vil du:
- Forstå SKU-konsepter i Azure, prismodeller og funksjonsforskjeller
- Mestre miljøspesifikke strategier for valg av SKU for utvikling, staging og produksjon
- Analysere arbeidsbelastningskrav og matche dem til passende tjenestenivåer
- Implementere kostnadsoptimaliseringsstrategier gjennom intelligent SKU-utvelgelse
- Bruke ytelsestesting og valideringsteknikker for SKU-valg
- Konfigurere automatiserte SKU-anbefalinger og overvåking

## Læringsutbytte

Etter fullføring vil du kunne:
- Velge passende Azure-tjeneste-SKU-er basert på arbeidsbelastningskrav og begrensninger
- Designe kostnadseffektive fler-miljø-arkitekturer med riktig nivåvalg
- Implementere ytelsesbenchmarking og validering for SKU-valg
- Lage automatiserte verktøy for SKU-anbefaling og kostnadsoptimalisering
- Planlegge SKU-migrasjoner og skaleringsstrategier for endrede krav
- Anvende prinsippene fra Azure Well-Architected Framework ved valg av tjenestenivå

## Innholdsfortegnelse

- [Forståelse av SKU-er](../../../../docs/chapter-06-pre-deployment)
- [Miljøbasert valg](../../../../docs/chapter-06-pre-deployment)
- [Tjenestespesifikke retningslinjer](../../../../docs/chapter-06-pre-deployment)
- [Kostnadsoptimaliseringsstrategier](../../../../docs/chapter-06-pre-deployment)
- [Ytelsesbetraktninger](../../../../docs/chapter-06-pre-deployment)
- [Hurtigreferansetabeller](../../../../docs/chapter-06-pre-deployment)
- [Valideringsverktøy](../../../../docs/chapter-06-pre-deployment)

---

## Forståelse av SKU-er

### Hva er SKU-er?

SKU-er (lagerføringsenheter) representerer ulike tjenestenivåer og ytelsesnivåer for Azure-ressurser. Hver SKU tilbyr forskjellige:

- **Ytelsestrekk** (CPU, minne, gjennomstrømning)
- **Tilgjengelighet av funksjoner** (skaleringalternativer, SLA-nivåer)
- **Prismodeller** (forbruk-basert, reservert kapasitet)
- **Regional tilgjengelighet** (ikke alle SKU-er er tilgjengelige i alle regioner)

### Viktige faktorer ved SKU-valg

1. **Arbeidsbelastningskrav**
   - Forventet trafikk-/lastmønstre
   - Ytelseskrav (CPU, minne, I/O)
   - Lagringsbehov og tilgangsmønstre

2. **Miljøtype**
   - Utvikling/test versus produksjon
   - Tilgjengelighetskrav
   - Sikkerhets- og samsvarskrav

3. **Budsjettbegrensninger**
   - Initielle kostnader versus driftskostnader
   - Rabatt for reservert kapasitet
   - Kostnadsimplikasjoner ved autoskalering

4. **Vekstprognoser**
   - Skalerbarhetskrav
   - Fremtidige funksjonsbehov
   - Migrasjonskompleksitet

---

## Miljøbasert valg

### Utviklingsmiljø

**Prioriteringer**: Kostnadsoptimalisering, grunnleggende funksjonalitet, enkel provisjonering/avprovisjonering

#### Anbefalte SKU-er
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

#### Kjennetegn
- **App Service**: F1 (Free) eller B1 (Basic) for enkel testing
- **Databaser**: Basic-nivå med minimale ressurser
- **Lagring**: Standard med kun lokal redundans
- **Compute**: Delte ressurser akseptabelt
- **Nettverk**: Grunnleggende konfigurasjoner

### Staging/testmiljø

**Prioriteringer**: Produksjonslignende konfigurasjon, kostnadsbalanse, mulighet for ytelsestesting

#### Anbefalte SKU-er
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

#### Kjennetegn
- **Ytelse**: 70-80% av produksjonskapasitet
- **Funksjoner**: De fleste produksjonsfunksjoner aktivert
- **Redundans**: Noe geografisk redundans
- **Skalering**: Begrenset autoskalering for testing
- **Overvåking**: Full overvåkingsstack

### Produksjonsmiljø

**Prioriteringer**: Ytelse, tilgjengelighet, sikkerhet, samsvar, skalerbarhet

#### Anbefalte SKU-er
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

#### Kjennetegn
- **Høy tilgjengelighet**: 99,9%+ SLA-krav
- **Ytelse**: Dedikerte ressurser, høy gjennomstrømning
- **Sikkerhet**: Premium sikkerhetsfunksjoner
- **Skalering**: Full autoskalering tilgjengelig
- **Overvåking**: Omfattende observabilitet

---

## Tjenestespesifikke retningslinjer

### Azure App Service

#### SKU-beslutningsmatrise

| Bruksområde | Anbefalt SKU | Begrunnelse |
|----------|----------------|-----------|
| Utvikling/Testing | F1 (Free) or B1 (Basic) | Kostnadseffektivt, tilstrekkelig for testing |
| Små produksjonsapper | S1 (Standard) | Egne domener, SSL, autoskalering |
| Middels produksjonsapper | P1V3 (Premium V3) | Bedre ytelse, flere funksjoner |
| Apper med høy trafikk | P2V3 eller P3V3 | Dedikerte ressurser, høy ytelse |
| Kritiske apper | I1V2 (Isolated V2) | Nettverksisolasjon, dedikert maskinvare |

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

#### Rammeverk for SKU-valg

1. **DTU-basert (Database Transaction Units)**
   - **Basic**: 5 DTU - Utvikling/testing
   - **Standard**: S0-S12 (10-3000 DTU) - Generelle formål
   - **Premium**: P1-P15 (125-4000 DTU) - Ytelseskritisk

2. **vCore-basert** (Anbefales for produksjon)
   - **General Purpose**: Balansert CPU og lagring
   - **Business Critical**: Lav latens, høy IOPS
   - **Hyperscale**: Svært skalerbar lagring (opptil 100TB)

#### Eksempelkonfigurasjoner

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
   - Egnet for utvikling og varierende arbeidsbelastninger
   - Delt infrastruktur

2. **Dedikert (arbeidsbelastningsprofiler)**
   - Dedikerte beregningsressurser
   - Forutsigbar ytelse
   - Bedre for produksjonsarbeidsbelastninger

#### Konfigurasjonseksempler

**Utvikling (forbruksbasert)**
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

**Produksjon (Dedikert)**
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

#### Gjennomstrømmingsmodeller

1. **Manuell provisjonert gjennomstrømning**
   - Forutsigbar ytelse
   - Rabatt for reservert kapasitet
   - Best for stabile arbeidsbelastninger

2. **Autoskalert provisjonert gjennomstrømning**
   - Automatisk skalering basert på bruk
   - Betal for det du bruker (med minimum)
   - Godt for variable arbeidsbelastninger

3. **Serverløs**
   - Betal per forespørsel
   - Ingen provisjonert gjennomstrømning
   - Ideelt for utvikling og sporadiske arbeidsbelastninger

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

#### Typer lagringskontoer

1. **Standard_LRS** - Utvikling, ikke-kritiske data
2. **Standard_GRS** - Produksjon, geo-redundans nødvendig
3. **Premium_LRS** - Høyytelsesapplikasjoner
4. **Premium_ZRS** - Høy tilgjengelighet med sone-redundans

#### Ytelsesnivåer

- **Standard**: Allsidig, kostnadseffektivt
- **Premium**: Høy ytelse, lav-latens scenarier

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
# Sjekk reservasjonsalternativer
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Riktig dimensjonering

Start med mindre SKU-er og skaler opp basert på faktisk bruk:

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

### 3. Konfigurasjon av autoskalering

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

Skaler ned i lavtrafikkperioder:

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

## Ytelsesvurderinger

### Grunnleggende ytelseskrav

Definer klare ytelseskrav før valg av SKU:

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

### Belastningstesting

Test ulike SKU-er for å validere ytelsen:

```bash
# Azure Load Testing-tjeneste
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
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

## Hurtigreferansetabeller

### App Service SKU - hurtigreferanse

| SKU | Nivå | vCPU | RAM | Lagring | Prisnivå | Bruksområde |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | Utvikling |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Små apper |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Produksjon |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Høy ytelse |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### SQL Database SKU - hurtigreferanse

| SKU | Nivå | DTU/vCore | Lagring | Prisnivå | Bruksområde |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Utvikling |
| S2 | Standard | 50 DTU | 250GB | $$ | Små produksjoner |
| P2 | Premium | 250 DTU | 1TB | $$$ | Høy ytelse |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Balansert |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Kritisk for virksomheten |

### Container Apps SKU - hurtigreferanse

| Modell | Pris | CPU/minne | Bruksområde |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Utvikling, variabel last |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Produksjon |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | Høy ytelse |

---

## Valideringsverktøy

### SKU-tilgjengelighetssjekk

```bash
#!/bin/bash
# Sjekk SKU-tilgjengelighet i målregionen

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

# Bruk
check_sku_availability "eastus" "app-service" "P1V3"
```

### Kostnadsestimeringsskript

```powershell
# PowerShell-skript for kostnadsestimering
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
        
        # Bruk Azure Pricing API eller kalkulator
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Bruk
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### Ytelsesvalidering

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

## Sammendrag av beste praksis

### Gjør

1. **Start smått og skaler opp** basert på faktisk bruk
2. **Bruk forskjellige SKU-er for ulike miljøer**
3. **Overvåk ytelse og kostnader kontinuerlig**
4. **Utnytt reservert kapasitet for produksjonsarbeidsbelastninger**
5. **Implementer autoskalering der det er passende**
6. **Test ytelse med realistiske arbeidsbelastninger**
7. **Planlegg for vekst, men unngå overprovisjonering**
8. **Bruk gratisnivåer for utvikling når mulig**

### Ikke gjør

1. **Ikke bruk produksjons-SKU-er for utvikling**
2. **Ikke overse regional tilgjengelighet av SKU-er**
3. **Ikke glem omkostninger ved dataoverføring**
4. **Ikke overprovisjoner uten begrunnelse**
5. **Ikke ignorer påvirkningen fra avhengigheter**
6. **Ikke sett autoskaleringsgrenser for høyt**
7. **Ikke glem samsvarskrav**
8. **Ikke baser beslutninger kun på pris**

---

**Pro tip**: Bruk Azure Cost Management og Advisor for å få personlige anbefalinger for å optimalisere SKU-valgene dine basert på faktiske bruksmønstre.

---

**Navigation**
- **Previous Lesson**: [Kapasitetsplanlegging](capacity-planning.md)
- **Next Lesson**: [Forhåndssjekker](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket bør betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som følge av bruken av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
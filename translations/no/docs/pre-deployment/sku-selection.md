<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "952ed5af7f5db069c53a6840717e1801",
  "translation_date": "2025-09-18T06:19:25+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "no"
}
-->
# Veiledning for SKU-valg - Velg riktig Azure-tjenestenivå

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 6 - Validering og planlegging før utrulling
- **⬅️ Forrige**: [Kapasitetsplanlegging](capacity-planning.md)
- **➡️ Neste**: [Sjekk før utrulling](preflight-checks.md)
- **🚀 Neste Kapittel**: [Kapittel 7: Feilsøking](../troubleshooting/common-issues.md)

## Introduksjon

Denne omfattende veiledningen hjelper deg med å velge optimale Azure-tjeneste-SKUer (Stock Keeping Units) for ulike miljøer, arbeidsbelastninger og krav. Lær å analysere ytelsesbehov, kostnadshensyn og skalerbarhetskrav for å velge de mest passende tjenestenivåene for dine Azure Developer CLI-utrullinger.

## Læringsmål

Ved å fullføre denne veiledningen vil du:
- Forstå Azure SKU-konsepter, prismodeller og funksjonsforskjeller
- Mestre miljøspesifikke SKU-valgstrategier for utvikling, staging og produksjon
- Analysere arbeidsbelastningskrav og matche dem med passende tjenestenivåer
- Implementere kostnadsoptimaliseringsstrategier gjennom intelligent SKU-valg
- Bruke ytelsestesting og valideringsteknikker for SKU-valg
- Konfigurere automatiserte SKU-anbefalinger og overvåking

## Læringsutbytte

Etter fullføring vil du kunne:
- Velge passende Azure-tjeneste-SKUer basert på arbeidsbelastningskrav og begrensninger
- Designe kostnadseffektive arkitekturer for flere miljøer med riktig nivåvalg
- Implementere ytelsesbenchmarking og validering for SKU-valg
- Lage automatiserte verktøy for SKU-anbefaling og kostnadsoptimalisering
- Planlegge SKU-migreringer og skaleringsstrategier for endrede krav
- Bruke prinsippene fra Azure Well-Architected Framework til tjenestenivåvalg

## Innholdsfortegnelse

- [Forstå SKUer](../../../../docs/pre-deployment)
- [Miljøbasert valg](../../../../docs/pre-deployment)
- [Tjenestespesifikke retningslinjer](../../../../docs/pre-deployment)
- [Kostnadsoptimaliseringsstrategier](../../../../docs/pre-deployment)
- [Ytelseshensyn](../../../../docs/pre-deployment)
- [Hurtigreferansetabeller](../../../../docs/pre-deployment)
- [Valideringsverktøy](../../../../docs/pre-deployment)

---

## Forstå SKUer

### Hva er SKUer?

SKUer (Stock Keeping Units) representerer ulike tjenestenivåer og ytelsesnivåer for Azure-ressurser. Hver SKU tilbyr ulike:

- **Ytelsesegenskaper** (CPU, minne, gjennomstrømning)
- **Funksjonstilgjengelighet** (skaleringsalternativer, SLA-nivåer)
- **Prismodeller** (forbruksbasert, reservert kapasitet)
- **Regional tilgjengelighet** (ikke alle SKUer er tilgjengelige i alle regioner)

### Viktige faktorer i SKU-valg

1. **Arbeidsbelastningskrav**
   - Forventede trafikk-/belastningsmønstre
   - Ytelseskrav (CPU, minne, I/O)
   - Lagringsbehov og tilgangsmønstre

2. **Miljøtype**
   - Utvikling/testing vs. produksjon
   - Tilgjengelighetskrav
   - Sikkerhets- og samsvarskrav

3. **Budsjettbegrensninger**
   - Startkostnader vs. driftskostnader
   - Rabatter for reservert kapasitet
   - Kostnadsimplikasjoner ved autoskalering

4. **Vekstprognoser**
   - Skalerbarhetskrav
   - Fremtidige funksjonsbehov
   - Migrasjonskompleksitet

---

## Miljøbasert valg

### Utviklingsmiljø

**Prioriteter**: Kostnadsoptimalisering, grunnleggende funksjonalitet, enkel klargjøring/de-klargjøring

#### Anbefalte SKUer
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
- **App Service**: F1 (Gratis) eller B1 (Basic) for enkel testing
- **Databaser**: Grunnleggende nivå med minimale ressurser
- **Lagring**: Standard med kun lokal redundans
- **Databehandling**: Delte ressurser er akseptable
- **Nettverk**: Enkle konfigurasjoner

### Staging-/testmiljø

**Prioriteter**: Produksjonslignende konfigurasjon, kostnadsbalanse, ytelsestestingskapasitet

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

#### Kjennetegn
- **Ytelse**: 70-80% av produksjonskapasitet
- **Funksjoner**: De fleste produksjonsfunksjoner aktivert
- **Redundans**: Noe geografisk redundans
- **Skalering**: Begrenset autoskalering for testing
- **Overvåking**: Full overvåkingspakke

### Produksjonsmiljø

**Prioriteter**: Ytelse, tilgjengelighet, sikkerhet, samsvar, skalerbarhet

#### Anbefalte SKUer
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
- **Skalering**: Full autoskaleringsevne
- **Overvåking**: Omfattende observasjon

---

## Tjenestespesifikke retningslinjer

### Azure App Service

#### SKU-beslutningsmatrise

| Bruksområde | Anbefalt SKU | Begrunnelse |
|-------------|-------------|-------------|
| Utvikling/testing | F1 (Gratis) eller B1 (Basic) | Kostnadseffektivt, tilstrekkelig for testing |
| Små produksjonsapper | S1 (Standard) | Egendomener, SSL, autoskalering |
| Mellomstore produksjonsapper | P1V3 (Premium V3) | Bedre ytelse, flere funksjoner |
| Høyt trafikkerte apper | P2V3 eller P3V3 | Dedikerte ressurser, høy ytelse |
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

#### SKU-valgsrammeverk

1. **DTU-basert (Database Transaction Units)**
   - **Basic**: 5 DTU - Utvikling/testing
   - **Standard**: S0-S12 (10-3000 DTU) - Generelt formål
   - **Premium**: P1-P15 (125-4000 DTU) - Ytelseskritisk

2. **vCore-basert** (Anbefalt for produksjon)
   - **Generelt formål**: Balansert databehandling og lagring
   - **Forretningskritisk**: Lav ventetid, høy IOPS
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
   - Betal per bruk-prising
   - Egnet for utvikling og variable arbeidsbelastninger
   - Delt infrastruktur

2. **Dedikert (Arbeidsbelastningsprofiler)**
   - Dedikerte databehandlingsressurser
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

1. **Manuelt klargjort gjennomstrømming**
   - Forutsigbar ytelse
   - Rabatter for reservert kapasitet
   - Best for jevne arbeidsbelastninger

2. **Autoskalering av klargjort gjennomstrømming**
   - Automatisk skalering basert på bruk
   - Betal for det du bruker (med minimum)
   - Bra for variable arbeidsbelastninger

3. **Serverløs**
   - Betal per forespørsel
   - Ingen klargjort gjennomstrømming
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

- **Standard**: Generelt formål, kostnadseffektivt
- **Premium**: Høy ytelse, lav ventetidsscenarier

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
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

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

### 3. Autoskalering-konfigurasjon

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

Skaler ned utenom arbeidstid:

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

## Ytelseshensyn

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

### Belastningstesting

Test ulike SKUer for å validere ytelse:

```bash
# Azure Load Testing service
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

### App Service SKU Hurtigreferanse

| SKU | Nivå | vCPU | RAM | Lagring | Prisklasse | Bruksområde |
|-----|------|------|-----|---------|------------|-------------|
| F1 | Gratis | Delt | 1GB | 1GB | Gratis | Utvikling |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Små apper |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Produksjon |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Høy ytelse |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Bedrift |

### SQL Database SKU Hurtigreferanse

| SKU | Nivå | DTU/vCore | Lagring | Prisklasse | Bruksområde |
|-----|------|-----------|---------|------------|-------------|
| Basic | Basic | 5 DTU | 2GB | $ | Utvikling |
| S2 | Standard | 50 DTU | 250GB | $$ | Små produksjoner |
| P2 | Premium | 250 DTU | 1TB | $$$ | Høy ytelse |
| GP_Gen5_4 | Generelt formål | 4 vCore | 4TB | $$$ | Balansert |
| BC_Gen5_8 | Forretningskritisk | 8 vCore | 4TB | $$$$ | Kritisk |

### Container Apps SKU Hurtigreferanse

| Modell | Prising | CPU/Minne | Bruksområde |
|--------|---------|-----------|-------------|
| Forbruk | Betal per bruk | 0.25-2 vCPU | Utvikling, variabel belastning |
| Dedikert D4 | Reservert | 4 vCPU, 16GB | Produksjon |
| Dedikert D8 | Reservert | 8 vCPU, 32GB | Høy ytelse |

---

## Valideringsverktøy

### SKU-tilgjengelighetssjekker

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

### Kostnadsestimeringsskript

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

### Gjør dette

1. **Start smått og skaler opp** basert på faktisk bruk
2. **Bruk ulike SKUer for ulike miljøer**
3. **Overvåk ytelse og kostnader kontinuerlig**
4. **Utnytt reservert kapasitet for produksjonsarbeidsbelastninger**
5. **Implementer autoskalering der det er hensiktsmessig**
6. **Test ytelse med realistiske arbeidsbelastninger**
7. **Planlegg for vekst, men unngå overdimensjonering**
8. **Bruk gratisnivåer for utvikling når det er mulig**

### Unngå dette

1. **Ikke bruk produksjons-SKUer for utvikling**
2. **Ikke ignorer regional SKU-tilgjengelighet**
3. **Ikke glem kostnader for datatransport**
4. **Ikke overdimensjoner uten begrunnelse**
5. **Ikke ignorer påvirkningen av avhengigheter**
6. **Ikke sett autoskaleringsgrenser for høyt**
7. **Ikke glem samsvarskrav**
8. **Ikke ta beslutninger basert kun på pris**

---

**Tips**: Bruk Azure Cost Management og Advisor for å få personlige anbefalinger for optimalisering av SKU-valg basert på faktiske bruksmønstre.

---

**Navigasjon**
- **Forrige leksjon**: [Kapasitetsplanlegging](capacity-planning.md)
- **Neste leksjon**: [Sjekk før utrulling](preflight-checks.md)

---

**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
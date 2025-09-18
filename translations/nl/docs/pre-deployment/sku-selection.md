<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "952ed5af7f5db069c53a6840717e1801",
  "translation_date": "2025-09-18T06:55:15+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "nl"
}
-->
# SKU Selectiegids - Het kiezen van de juiste Azure servicelagen

**Hoofdstuk Navigatie:**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 6 - Validatie & Planning vóór implementatie
- **⬅️ Vorige**: [Capaciteitsplanning](capacity-planning.md)
- **➡️ Volgende**: [Pre-flight Checks](preflight-checks.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 7: Problemen oplossen](../troubleshooting/common-issues.md)

## Introductie

Deze uitgebreide gids helpt je bij het selecteren van optimale Azure service SKUs (Stock Keeping Units) voor verschillende omgevingen, workloads en vereisten. Leer hoe je prestatiebehoeften, kostenoverwegingen en schaalbaarheidsvereisten kunt analyseren om de meest geschikte servicelagen te kiezen voor je Azure Developer CLI-implementaties.

## Leerdoelen

Door deze gids te voltooien, leer je:
- Begrip van Azure SKU-concepten, prijsmodellen en functievergelijkingen
- Strategieën voor SKU-selectie per omgeving voor ontwikkeling, staging en productie
- Workloadvereisten analyseren en koppelen aan geschikte servicelagen
- Kostenoptimalisatiestrategieën implementeren door slimme SKU-selectie
- Prestatie testen en validatietechnieken toepassen voor SKU-keuzes
- Geautomatiseerde SKU-aanbevelingen en monitoring configureren

## Leerresultaten

Na voltooiing kun je:
- Geschikte Azure service SKUs selecteren op basis van workloadvereisten en beperkingen
- Kosteneffectieve architecturen voor meerdere omgevingen ontwerpen met de juiste laagselectie
- Prestatiebenchmarking en validatie implementeren voor SKU-keuzes
- Geautomatiseerde tools maken voor SKU-aanbevelingen en kostenoptimalisatie
- SKU-migraties en schaalstrategieën plannen voor veranderende vereisten
- Principes van het Azure Well-Architected Framework toepassen op servicelaagselectie

## Inhoudsopgave

- [Begrip van SKUs](../../../../docs/pre-deployment)
- [Selectie op basis van omgeving](../../../../docs/pre-deployment)
- [Richtlijnen per service](../../../../docs/pre-deployment)
- [Kostenoptimalisatiestrategieën](../../../../docs/pre-deployment)
- [Prestatieoverwegingen](../../../../docs/pre-deployment)
- [Snelle referentietabellen](../../../../docs/pre-deployment)
- [Validatietools](../../../../docs/pre-deployment)

---

## Begrip van SKUs

### Wat zijn SKUs?

SKUs (Stock Keeping Units) vertegenwoordigen verschillende servicelagen en prestatieniveaus voor Azure-resources. Elke SKU biedt verschillende:

- **Prestatiekenmerken** (CPU, geheugen, doorvoer)
- **Functie beschikbaarheid** (schaalopties, SLA-niveaus)
- **Prijsmodellen** (verbruik-gebaseerd, gereserveerde capaciteit)
- **Regionale beschikbaarheid** (niet alle SKUs zijn beschikbaar in alle regio's)

### Belangrijke factoren bij SKU-selectie

1. **Workloadvereisten**
   - Verwachte verkeers-/belastingpatronen
   - Prestatievereisten (CPU, geheugen, I/O)
   - Opslagbehoeften en toegangsmodellen

2. **Type omgeving**
   - Ontwikkeling/testen versus productie
   - Beschikbaarheidsvereisten
   - Beveiligings- en nalevingsbehoeften

3. **Budgetbeperkingen**
   - Initiële kosten versus operationele kosten
   - Kortingen voor gereserveerde capaciteit
   - Kostenimplicaties van automatisch schalen

4. **Groei voorspellingen**
   - Schaalbaarheidsvereisten
   - Toekomstige functiebehoeften
   - Migratiecomplexiteit

---

## Selectie op basis van omgeving

### Ontwikkelomgeving

**Prioriteiten**: Kostenoptimalisatie, basisfunctionaliteit, eenvoudige provisioning/de-provisioning

#### Aanbevolen SKUs
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

#### Kenmerken
- **App Service**: F1 (Gratis) of B1 (Basic) voor eenvoudig testen
- **Databases**: Basistier met minimale resources
- **Opslag**: Standaard met alleen lokale redundantie
- **Compute**: Gedeelde resources zijn acceptabel
- **Netwerken**: Basisconfiguraties

### Staging/Testomgeving

**Prioriteiten**: Productie-achtige configuratie, kostenbalans, prestatietestmogelijkheden

#### Aanbevolen SKUs
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

#### Kenmerken
- **Prestatie**: 70-80% van productiecapaciteit
- **Functies**: Meeste productiefuncties ingeschakeld
- **Redundantie**: Enige geografische redundantie
- **Schalen**: Beperkt automatisch schalen voor testen
- **Monitoring**: Volledige monitoringstack

### Productieomgeving

**Prioriteiten**: Prestatie, beschikbaarheid, beveiliging, naleving, schaalbaarheid

#### Aanbevolen SKUs
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

#### Kenmerken
- **Hoge beschikbaarheid**: 99,9%+ SLA-vereisten
- **Prestatie**: Toegewijde resources, hoge doorvoer
- **Beveiliging**: Premium beveiligingsfuncties
- **Schalen**: Volledige mogelijkheden voor automatisch schalen
- **Monitoring**: Uitgebreide observatie

---

## Richtlijnen per service

### Azure App Service

#### SKU Beslissingsmatrix

| Gebruiksscenario | Aanbevolen SKU | Reden |
|------------------|----------------|-------|
| Ontwikkeling/Testen | F1 (Gratis) of B1 (Basic) | Kosteneffectief, voldoende voor testen |
| Kleine productie-apps | S1 (Standaard) | Aangepaste domeinen, SSL, automatisch schalen |
| Middelgrote productie-apps | P1V3 (Premium V3) | Betere prestaties, meer functies |
| Apps met veel verkeer | P2V3 of P3V3 | Toegewijde resources, hoge prestaties |
| Missie-kritieke apps | I1V2 (Geïsoleerd V2) | Netwerkisolatie, toegewijde hardware |

#### Configuratievoorbeelden

**Ontwikkeling**
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

**Productie**
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

#### SKU Selectiekader

1. **DTU-gebaseerd (Database Transaction Units)**
   - **Basic**: 5 DTU - Ontwikkeling/testen
   - **Standaard**: S0-S12 (10-3000 DTU) - Algemeen gebruik
   - **Premium**: P1-P15 (125-4000 DTU) - Prestatiekritisch

2. **vCore-gebaseerd** (Aanbevolen voor productie)
   - **Algemeen Doel**: Gebalanceerde compute en opslag
   - **Bedrijfskritisch**: Lage latentie, hoge IOPS
   - **Hyperscale**: Zeer schaalbare opslag (tot 100TB)

#### Voorbeeldconfiguraties

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

#### Omgevingstypen

1. **Verbruik-gebaseerd**
   - Prijs per gebruik
   - Geschikt voor ontwikkeling en variabele workloads
   - Gedeelde infrastructuur

2. **Toegewijd (Workload Profielen)**
   - Toegewijde compute resources
   - Voorspelbare prestaties
   - Beter voor productie workloads

#### Configuratievoorbeelden

**Ontwikkeling (Verbruik)**
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

**Productie (Toegewijd)**
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

#### Doorvoermodellen

1. **Handmatig Geprovisioneerde Doorvoer**
   - Voorspelbare prestaties
   - Kortingen voor gereserveerde capaciteit
   - Beste voor stabiele workloads

2. **Autoscale Geprovisioneerde Doorvoer**
   - Automatisch schalen op basis van gebruik
   - Betalen voor wat je gebruikt (met minimum)
   - Goed voor variabele workloads

3. **Serverloos**
   - Betalen per aanvraag
   - Geen geprovisioneerde doorvoer
   - Ideaal voor ontwikkeling en intermitterende workloads

#### SKU Voorbeelden

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

#### Opslagaccounttypen

1. **Standard_LRS** - Ontwikkeling, niet-kritieke gegevens
2. **Standard_GRS** - Productie, geo-redundantie nodig
3. **Premium_LRS** - Hoge prestaties toepassingen
4. **Premium_ZRS** - Hoge beschikbaarheid met zone-redundantie

#### Prestatie Tiers

- **Standaard**: Algemeen gebruik, kosteneffectief
- **Premium**: Hoge prestaties, lage latentie scenario's

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

## Kostenoptimalisatiestrategieën

### 1. Gereserveerde Capaciteit

Reserveer resources voor 1-3 jaar voor aanzienlijke kortingen:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Juiste Grootte

Begin met kleinere SKUs en schaal op basis van daadwerkelijk gebruik:

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

### 3. Configuratie voor Automatisch Schalen

Implementeer intelligent schalen om kosten te optimaliseren:

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

### 4. Geplande Schaling

Schakel terug tijdens daluren:

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

## Prestatieoverwegingen

### Basisvereisten voor prestaties

Definieer duidelijke prestatievereisten vóór SKU-selectie:

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

### Belastings testen

Test verschillende SKUs om prestaties te valideren:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Monitoring en optimalisatie

Stel uitgebreide monitoring in:

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

## Snelle referentietabellen

### App Service SKU Snelle Referentie

| SKU | Tier | vCPU | RAM | Opslag | Prijsklasse | Gebruiksscenario |
|-----|------|------|-----|--------|-------------|------------------|
| F1 | Gratis | Gedeeld | 1GB | 1GB | Gratis | Ontwikkeling |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Kleine apps |
| S1 | Standaard | 1 | 1.75GB | 50GB | $$ | Productie |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Hoge prestaties |
| I1V2 | Geïsoleerd V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### SQL Database SKU Snelle Referentie

| SKU | Tier | DTU/vCore | Opslag | Prijsklasse | Gebruiksscenario |
|-----|------|-----------|--------|-------------|------------------|
| Basic | Basic | 5 DTU | 2GB | $ | Ontwikkeling |
| S2 | Standaard | 50 DTU | 250GB | $$ | Kleine productie |
| P2 | Premium | 250 DTU | 1TB | $$$ | Hoge prestaties |
| GP_Gen5_4 | Algemeen Doel | 4 vCore | 4TB | $$$ | Gebalanceerd |
| BC_Gen5_8 | Bedrijfskritisch | 8 vCore | 4TB | $$$$ | Missie-kritisch |

### Container Apps SKU Snelle Referentie

| Model | Prijs | CPU/Geheugen | Gebruiksscenario |
|-------|-------|--------------|------------------|
| Verbruik | Prijs per gebruik | 0.25-2 vCPU | Ontwikkeling, variabele belasting |
| Toegewijd D4 | Gereserveerd | 4 vCPU, 16GB | Productie |
| Toegewijd D8 | Gereserveerd | 8 vCPU, 32GB | Hoge prestaties |

---

## Validatietools

### SKU Beschikbaarheid Checker

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

### Kostenraming Script

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

### Prestatievalidatie

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

## Samenvatting Beste Praktijken

### Do's

1. **Begin klein en schaal op** op basis van daadwerkelijk gebruik
2. **Gebruik verschillende SKUs voor verschillende omgevingen**
3. **Monitor prestaties en kosten continu**
4. **Maak gebruik van gereserveerde capaciteit voor productie workloads**
5. **Implementeer automatisch schalen waar nodig**
6. **Test prestaties met realistische workloads**
7. **Plan voor groei maar vermijd over-provisioning**
8. **Gebruik gratis tiers voor ontwikkeling waar mogelijk**

### Don'ts

1. **Gebruik geen productie SKUs voor ontwikkeling**
2. **Negeer regionale SKU-beschikbaarheid niet**
3. **Vergeet de kosten van gegevensoverdracht niet**
4. **Over-provisioneer niet zonder rechtvaardiging**
5. **Negeer de impact van afhankelijkheden niet**
6. **Stel limieten voor automatisch schalen niet te hoog in**
7. **Vergeet nalevingsvereisten niet**
8. **Maak geen beslissingen alleen op basis van prijs**

---

**Pro Tip**: Gebruik Azure Cost Management en Advisor om gepersonaliseerde aanbevelingen te krijgen voor het optimaliseren van je SKU-selecties op basis van daadwerkelijke gebruikspatronen.

---

**Navigatie**
- **Vorige Les**: [Capaciteitsplanning](capacity-planning.md)
- **Volgende Les**: [Preflight Checks](preflight-checks.md)

---

**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in zijn oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
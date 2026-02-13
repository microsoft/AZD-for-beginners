# SKU-selectiegids - Het kiezen van de juiste Azure-serviceniveaus

**Hoofdstuknavigatie:**
- **📚 Cursus Startpagina**: [AZD For Beginners](../../README.md)
- **📖 Huidig hoofdstuk**: Chapter 6 - Pre-Deployment Validation & Planning
- **⬅️ Vorige**: [Capacity Planning](capacity-planning.md)
- **➡️ Volgende**: [Pre-flight Checks](preflight-checks.md)
- **🚀 Volgend hoofdstuk**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

## Inleiding

Deze uitgebreide gids helpt je bij het selecteren van optimale Azure-service-SKUs (Stock Keeping Units) voor verschillende omgevingen, workloads en vereisten. Leer prestatiebehoeften, kostenoverwegingen en schaalbaarheidsvereisten te analyseren om de meest geschikte serviceniveaus voor je Azure Developer CLI-implementaties te kiezen.

## Leerdoelen

Na het voltooien van deze gids zul je:
- Begrijpen wat Azure SKU-concepten, prijsmodellen en functieverscheidingen zijn
- Omgevingsspecifieke SKU-selectiestrategieën beheersen voor ontwikkeling, staging en productie
- Workloadvereisten analyseren en matchen met geschikte serviceniveaus
- Kostenoptimalisatiestrategieën implementeren door slimme SKU-selectie
- Prestatie-test- en validatietechnieken toepassen voor SKU-keuzes
- Geautomatiseerde SKU-aanbevelingen en monitoring configureren

## Leerresultaten

Na voltooiing kun je:
- Geschikte Azure-service-SKUs selecteren op basis van workloadvereisten en beperkingen
- Kosten-effectieve multi-omgevingarchitecturen ontwerpen met juiste tier-selectie
- Prestatiebenchmarking en validatie voor SKU-keuzes implementeren
- Geautomatiseerde tools maken voor SKU-aanbeveling en kostenoptimalisatie
- Plannen voor SKU-migraties en schaalstrategieën voor veranderende vereisten
- Principes van het Azure Well-Architected Framework toepassen bij het kiezen van serviceniveaus

## Inhoudsopgave

- [SKUs begrijpen](../../../../docs/chapter-06-pre-deployment)
- [Selectie op basis van omgeving](../../../../docs/chapter-06-pre-deployment)
- [Servicespecifieke richtlijnen](../../../../docs/chapter-06-pre-deployment)
- [Strategieën voor kostenoptimalisatie](../../../../docs/chapter-06-pre-deployment)
- [Prestatieoverwegingen](../../../../docs/chapter-06-pre-deployment)
- [Snelle referentietabellen](../../../../docs/chapter-06-pre-deployment)
- [Validatietools](../../../../docs/chapter-06-pre-deployment)

---

## SKUs begrijpen

### Wat zijn SKUs?

SKUs (Stock Keeping Units) vertegenwoordigen verschillende serviceniveaus en prestatieniveaus voor Azure-resources. Elke SKU biedt andere:

- **Prestatiekenmerken** (CPU, geheugen, doorvoer)
- **Beschikbaarheid van functies** (schaalopties, SLA-niveaus)
- **Prijsmodellen** (consumptie-gebaseerd, gereserveerde capaciteit)
- **Regionale beschikbaarheid** (niet alle SKUs zijn in alle regio's beschikbaar)

### Belangrijke factoren bij het kiezen van SKUs

1. **Workloadvereisten**
   - Verwachte verkeer-/loadpatronen
   - Prestatievereisten (CPU, geheugen, I/O)
   - Opslagbehoeften en toegangspatronen

2. **Type omgeving**
   - Ontwikkeling/testen versus productie
   - Beschikbaarheidsvereisten
   - Beveiligings- en compliancebehoeften

3. **Budgetbeperkingen**
   - Initiële kosten versus operationele kosten
   - Kortingen voor gereserveerde capaciteit
   - Kostengevolgen van autoscaling

4. **Groeiprojecties**
   - Schaalbaarheidsvereisten
   - Toekomstige functiebehoeften
   - Complexiteit van migratie

---

## Selectie op basis van omgeving

### Ontwikkelomgeving

**Prioriteiten**: Kostenoptimalisatie, basisfunctionaliteit, eenvoudige provisioning/deprovisioning

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
- **App Service**: F1 (Gratis) of B1 (Basis) voor eenvoudig testen
- **Databases**: Basistier met minimale resources
- **Opslag**: Standaard met alleen lokale redundantie
- **Compute**: Gedeelde resources zijn acceptabel
- **Netwerken**: Basisconfiguraties

### Staging/testomgeving

**Prioriteiten**: Productie-achtige configuratie, kostenbalans, mogelijkheid voor prestatietests

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
- **Functies**: De meeste productiefeatures ingeschakeld
- **Redundantie**: Enige geografische redundantie
- **Schaal**: Beperkte autoscaling voor tests
- **Monitoring**: Volledige monitoringstack

### Productieomgeving

**Prioriteiten**: Prestatie, beschikbaarheid, beveiliging, compliance, schaalbaarheid

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
- **Schaal**: Volledige autoscaling-mogelijkheden
- **Monitoring**: Omvattende observability

---

## Servicespecifieke richtlijnen

### Azure App Service

#### SKU-beslissingsmatrix

| Gebruikssituatie | Aanbevolen SKU | Toelichting |
|----------|----------------|-----------|
| Ontwikkeling/Test | F1 (Gratis) of B1 (Basis) | Kostenbesparend, voldoende voor testen |
| Kleine productie-apps | S1 (Standaard) | Aangepaste domeinen, SSL, autoscaling |
| Middelgrote productie-apps | P1V3 (Premium V3) | Betere prestaties, meer functies |
| Apps met veel verkeer | P2V3 of P3V3 | Toegewijde resources, hoge prestaties |
| Kritieke bedrijfsapps | I1V2 (Isolated V2) | Netwerkisolatie, toegewijde hardware |

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

#### Framework voor SKU-selectie

1. **DTU-gebaseerd (Database Transaction Units)**
   - **Basic**: 5 DTU - Ontwikkeling/testen
   - **Standard**: S0-S12 (10-3000 DTU) - Algemeen gebruik
   - **Premium**: P1-P15 (125-4000 DTU) - Prestatiekritisch

2. **vCore-gebaseerd** (Aanbevolen voor productie)
   - **General Purpose**: Gebalanceerde compute en opslag
   - **Business Critical**: Lage latentie, hoge IOPS
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

#### Omgevingstypes

1. **Op verbruik gebaseerde**
   - Pay-per-use prijsstelling
   - Geschikt voor ontwikkeling en variabele workloads
   - Gedeelde infrastructuur

2. **Toegewijd (Workload-profielen)**
   - Toegewijde compute-resources
   - Voorspelbare prestaties
   - Beter voor productieworkloads

#### Configuratievoorbeelden

**Ontwikkeling (op verbruik)**
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

1. **Handmatig geprovisioneerde throughput**
   - Voorspelbare prestaties
   - Kortingen voor gereserveerde capaciteit
   - Beste keuze voor stabiele workloads

2. **Autoscale geprovisioneerde throughput**
   - Automatische schaal op basis van gebruik
   - Betaal voor wat je gebruikt (met minimum)
   - Goed voor variabele workloads

3. **Serverless**
   - Pay-per-request
   - Geen geprovisioneerde throughput
   - Ideaal voor ontwikkeling en intermitterende workloads

#### SKU-voorbeelden

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

1. **Standard_LRS** - Ontwikkeling, niet-kritische data
2. **Standard_GRS** - Productie, geo-redundantie nodig
3. **Premium_LRS** - High-performance applicaties
4. **Premium_ZRS** - Hoge beschikbaarheid met zoneredundantie

#### Prestatieklassen

- **Standard**: Algemeen gebruik, kosteneffectief
- **Premium**: High-performance, low-latency scenario's

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

## Strategieën voor kostenoptimalisatie

### 1. Gereserveerde capaciteit

Reserveer resources voor 1-3 jaar voor aanzienlijke kortingen:

```bash
# Controleer reserveringsopties
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Juiste dimensionering

Begin met kleinere SKUs en schakel omhoog op basis van daadwerkelijk gebruik:

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

### 3. Auto-scalingconfiguratie

Implementeer intelligente schaalvergroting om kosten te optimaliseren:

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

### 4. Geplande schaling

Schaal omlaag tijdens daluren:

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

### Basis prestatievereisten

Definieer duidelijke prestatievereisten voordat u een SKU kiest:

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

### Loadtesten

Test verschillende SKUs om prestaties te valideren:

```bash
# Azure Load Testing-service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Monitoring en optimalisatie

Zet uitgebreide monitoring op:

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

### App Service SKU snelle referentie

| SKU | Laag | vCPU | RAM | Opslag | Prijsklasse | Gebruik |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Gratis | Shared | 1GB | 1GB | Gratis | Ontwikkeling |
| B1 | Basis | 1 | 1.75GB | 10GB | $ | Kleine apps |
| S1 | Standaard | 1 | 1.75GB | 50GB | $$ | Productie |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Hoge prestaties |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### SQL Database SKU snelle referentie

| SKU | Laag | DTU/vCore | Opslag | Prijsklasse | Gebruik |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Ontwikkeling |
| S2 | Standaard | 50 DTU | 250GB | $$ | Kleine productie |
| P2 | Premium | 250 DTU | 1TB | $$$ | Hoge prestaties |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Gebalanceerd |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Kritieke toepassingen |

### Container Apps SKU snelle referentie

| Model | Prijzen | CPU/Geheugen | Gebruik |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Ontwikkeling, variabele load |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Productie |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | Hoge prestaties |

---

## Validatietools

### SKU-beschikbaarheidschecker

```bash
#!/bin/bash
# Controleer de beschikbaarheid van de SKU in de doelregio

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

# Gebruik
check_sku_availability "eastus" "app-service" "P1V3"
```

### Kosteninschattingsscript

```powershell
# PowerShell-script voor kostenraming
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
        
        # Gebruik de Azure Pricing API of de calculator
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Gebruik
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

## Samenvatting van beste praktijken

### Aanbevelingen

1. **Begin klein en schakel omhoog** op basis van daadwerkelijk gebruik
2. **Gebruik verschillende SKUs voor verschillende omgevingen**
3. **Monitor prestaties en kosten continu**
4. **Maak gebruik van gereserveerde capaciteit voor productieworkloads**
5. **Implementeer autoscaling waar passend**
6. **Test prestaties met realistische workloads**
7. **Plan voor groei maar voorkom over-provisioning**
8. **Gebruik gratis tiers voor ontwikkeling wanneer mogelijk**

### Te vermijden

1. **Gebruik geen productie-SKUs voor ontwikkeling**
2. **Negeer de regionale beschikbaarheid van SKUs niet**
3. **Vergeet niet de kosten voor datatransfer**
4. **Over-provision niet zonder rechtvaardiging**
5. **Negeer de impact van afhankelijkheden niet**
6. **Stel autoscalinglimieten niet te hoog in**
7. **Vergeet compliancevereisten niet**
8. **Neem geen beslissingen alleen op prijsbasis**

---

**Pro Tip**: Gebruik Azure Cost Management en Advisor om gepersonaliseerde aanbevelingen te krijgen voor het optimaliseren van uw SKU-selecties op basis van daadwerkelijke gebruikspatronen.

---

**Navigatie**
- **Vorige les**: [Capacity Planning](capacity-planning.md)
- **Volgende les**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vrijwaring**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, houd er rekening mee dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de brontaal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
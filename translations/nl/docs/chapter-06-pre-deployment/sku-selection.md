# SKU Selectiegids - Het juiste Azure-service-tier kiezen

**Hoofdstuknavigatie:**
- **📚 Cursus Home**: [AZD voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 6 - Validatie en Planning Voorafgaand aan Implementatie
- **⬅️ Vorige**: [Capaciteitsplanning](capacity-planning.md)
- **➡️ Volgende**: [Pre-flight Checks](preflight-checks.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 7: Probleemoplossing](../chapter-07-troubleshooting/common-issues.md)

## Introductie

Deze uitgebreide gids helpt u bij het selecteren van optimale Azure-service-SKU's (Stock Keeping Units) voor verschillende omgevingen, workloads en vereisten. Leer prestatiesbehoeften, kostenoverwegingen en schaalbaarheidsvereisten te analyseren om de meest geschikte servicetiers te kiezen voor uw Azure Developer CLI-implementaties.

## Leerdoelen

Na het voltooien van deze gids zult u:
- Azure SKU-concepten, prijsmodellen en functieverscheidenheid begrijpen
- Omgevingsspecifieke strategieën voor SKU-selectie beheersen voor ontwikkeling, staging en productie
- Werkbelastingvereisten analyseren en deze afstemmen op passende servicetiers
- Kostoptimalisatiestrategieën implementeren door intelligente SKU-selectie
- Prestatie-test- en validatietechnieken voor SKU-keuzes toepassen
- Geautomatiseerde SKU-aanbevelingen en monitoring configureren

## Leerresultaten

Na voltooiing zult u in staat zijn om:
- Geschikte Azure-service-SKU's te selecteren op basis van werkbelastingvereisten en beperkingen
- Kosteneffectieve multi-omgeving architecturen ontwerpen met juiste tier-selectie
- Prestatiebenchmarking en validatie voor SKU-keuzes implementeren
- Geautomatiseerde tools maken voor SKU-aanbevelingen en kostoptimalisatie
- SKU-migraties en schaalaanpakken plannen voor veranderende vereisten
- Principes van het Azure Well-Architected Framework toepassen op servicetier-selectie

## Inhoudsopgave

- [Begrip van SKUs](#understanding-skus)
- [Omgevingsgebaseerde Selectie](#environment-based-selection)
- [Dienstspecifieke Richtlijnen](#service-specific-guidelines)
- [Kostenoptimalisatiestrategieën](#cost-optimization-strategies)
- [Prestatieoverwegingen](#performance-considerations)
- [Snelle Referentietabellen](#quick-reference-tables)
- [Validatietools](#validation-tools)

---

## Begrip van SKUs

> **Voorbeeldbereik:** YAML-SKU-kaarten en prestatieconfiguraties hieronder zijn ontwerpopmerkingen, geen `azure.yaml` schema of een load-toolconfiguratie. Bicep-blokken zijn alternatieven/fragmenten: declareer hun parameters en bovenliggende resources, gebruik unieke symbolische namen bij combinatie, en verbind modules tot een werkend project. Prijzen, limieten en regio/SKU-beschikbaarheid moeten voor uw abonnement vóór implementatie worden gecontroleerd.

### Wat zijn SKUs?

SKU's (Stock Keeping Units) vertegenwoordigen verschillende servicetiers en prestatieniveaus voor Azure-resources. Elke SKU biedt verschillende:

- **Prestatiekenmerken** (CPU, geheugen, doorvoer)
- **Functie beschikbaarheid** (schaalopties, SLA-niveaus)
- **Prijsmodellen** (verbruik-gebaseerd, gereserveerde capaciteit)
- **Regionale beschikbaarheid** (niet alle SKU's beschikbaar in alle regio's)

### Belangrijke Factoren bij SKU Selectie

1. **Werkbelastingvereisten**
   - Verwachte verkeers-/belastingpatronen
   - Prestatievereisten (CPU, geheugen, I/O)
   - Opslagbehoeften en toegangsituaties

2. **Omgevingstype**
   - Ontwikkeling/testen versus productie
   - Beschikbaarheidsvereisten
   - Beveiliging en nalevingsbehoeften

3. **Budgetbeperkingen**
   - Initiële kosten versus operationele kosten
   - Kortingen voor gereserveerde capaciteit
   - Kosten van auto-scaling implicaties

4. **Groei-vooruitzichten**
   - Schaalbaarheidsvereisten
   - Toekomstige functiebehoeften
   - Complexiteit van migratie

---

## Omgevingsgebaseerde Selectie

### Ontwikkelomgeving

**Prioriteiten**: Kostenoptimalisatie, basisfunctionaliteit, eenvoudige provisioning/deprovisioning

#### Aanbevolen SKU's
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

#### Kenmerken
- **App Service**: F1 (Gratis) of B1 (Basic) voor eenvoudige testdoeleinden
- **Databases**: Basistier met minimale resources
- **Opslag**: Standaard met alleen lokale redundantie
- **Compute**: Gedeelde resources zijn acceptabel
- **Netwerken**: Basisconfiguraties

### Staging/Testomgeving

**Prioriteiten**: Productielike configuratie, kostenbalans, mogelijkheid tot prestatietesten

#### Aanbevolen SKU's
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
- **Functies**: Meeste productiefeatures ingeschakeld
- **Redundantie**: Enige geografische redundantie
- **Schaalvergroting**: Beperkte auto-scaling voor testen
- **Monitoring**: Volledige monitorstack

### Productieomgeving

**Prioriteiten**: Prestaties, beschikbaarheid, beveiliging, compliance, schaalbaarheid

#### Aanbevolen SKU's
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

#### Kenmerken
- **Hoge beschikbaarheid**: 99,9%+ SLA-vereisten
- **Prestaties**: Toegewijde resources, hoge doorvoer
- **Beveiliging**: Premium beveiligingsvoorzieningen
- **Schaalvergroting**: Volledige auto-scaling mogelijkheden
- **Monitoring**: Uitgebreide observatie

---

## Dienstspecifieke Richtlijnen

### Azure App Service

#### SKU Beslissingsmatrix

| Gebruikssituatie | Aanbevolen SKU | Reden |
|----------|----------------|-----------|
| Ontwikkeling/Testen | F1 (Gratis) of B1 (Basic) | Kosteneffectief, voldoende voor testen |
| Kleine productieapps | S1 (Standard) | Aangepaste domeinen, SSL, auto-scaling |
| Middelgrote productieapps | P1V3 (Premium V3) | Beter prestaties, meer functies |
| Apps met hoog verkeer | P2V3 of P3V3 | Toegewijde resources, hoge prestaties |
| Kritieke apps | I1V2 (Isolated V2) | Netwerkisolatie, toegewijde hardware |

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
   - **Standard**: S0-S12 (10-3000 DTU) - Algemeen doel
   - **Premium**: P1-P15 (125-4000 DTU) - Prestatiekritisch

2. **vCore-gebaseerd** (Aanbevolen voor productie)
   - **General Purpose**: Gebalanceerde compute en opslag
   - **Business Critical**: Lage latentie, hoge IOPS
   - **Hyperscale**: Hoog schaalbare opslag; controleer huidige groottelimieten en regionale ondersteuning

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
   - Pay-per-use prijsstelling
   - Geschikt voor ontwikkeling en variabele workloads
   - Gedeelde infrastructuur

2. **Toegewijd (Workload-profielen)**
   - Toegewijde compute-resources
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

**Productie (Toegewijd)**
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

Zone-redundantie vereist ook ondersteunde regio-infrastructuur en geschikte VNet/subnetconfiguratie, hier weggelaten. Dit voorbeeld reserveert drie toegewijde nodes; configureer ten minste twee app-replicas voor cross-zone distributie en dimensioneer zowel replicas als nodes voor een zone-uitval. Zie [Container Apps betrouwbaarheidsgids](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Om een app op dit profiel te plaatsen, stel je de `workloadProfileName: 'production-profile'` in; alleen het aanmaken van het profiel verplaatst apps niet automatisch.

### Azure Cosmos DB

#### Doorvoermodellen

1. **Handmatig geprovisioneerde doorvoer**
   - Voorspelbare prestaties
   - Kortingen voor gereserveerde capaciteit
   - Geschikt voor consistente workloads

2. **Autoscale geprovisioneerde doorvoer**
   - Automatische schaalvergroting op basis van gebruik
   - Betalen voor wat u gebruikt (met minimum)
   - Goed voor variabele workloads

3. **Serverless**
   - Betalen per verzoek
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

#### Types Storage Account

1. **Standard_LRS** - Ontwikkeling, niet-kritische data
2. **Standard_GRS** - Productie, geo-redundantie vereist
3. **Premium_LRS** - High-performance toepassingen
4. **Premium_ZRS** - Hoge beschikbaarheid met zone-redundantie

#### Prestatieklassen

- **Standard**: Algemeen doel, kosteneffectief
- **Premium**: High-performance, lage-latentie scenario's

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
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Reserveringsaanbiedingen en in aanmerking komende resourcetypes variëren; inspecteer de catalogus en aankoopvoorwaarden in plaats van aan te nemen dat elke service/SKU een reservering ondersteunt.

### 2. Juiste Grootte

Begin met kleinere SKU's en schakel omhoog op basis van daadwerkelijk gebruik:

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

### 3. Auto-Scaling Configuratie

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

### 4. Geplande Schaling

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

### Basis Prestatievereisten

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

### Load Testing

Test verschillende SKU's om prestaties te valideren:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### Monitoring en Optimalisatie

Zet uitgebreide monitoring op:

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

## Snelle Referentietabellen

### App Service SKU Snelle Referentie

| SKU | Niveau | vCPU | RAM | Opslag | Prijs Range | Gebruikssituatie |
|-----|--------|------|-----|--------|-------------|------------------|
| F1 | Gratis | Gedeeld | 1GB | 1GB | Gratis | Ontwikkeling |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Kleine apps |
| S1 | Standaard | 1 | 1.75GB | 50GB | $$ | Productie |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Hoge prestaties |
| I1V2 | Geïsoleerd V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### SQL Database SKU Snelle Referentie

| SKU | Niveau | DTU/vCore | Opslag | Prijs Range | Gebruikssituatie |
|-----|--------|----------|--------|-------------|------------------|
| Basic | Basic | 5 DTU | 2GB | $ | Ontwikkeling |
| S2 | Standaard | 50 DTU | 250GB | $$ | Kleine productie |
| P2 | Premium | 250 DTU | 1TB | $$$ | Hoge prestaties |
| GP_Gen5_4 | Algemeen Doel | 4 vCore | 4TB | $$$ | Gebalanceerd |
| BC_Gen5_8 | Zakelijk Kritisch | 8 vCore | 4TB | $$$$ | Missie-kritisch |

### Container Apps SKU Snelle Referentie

| Model | Prijsstelling | CPU/Geheugen | Gebruikssituatie |
|-------|--------------|--------------|------------------|
| Verbruik | Pay-per-use | Ondersteunde CPU/geheugenkombinaties zijn afhankelijk van omgeving/profiel | Ontwikkeling of productie, variabele belasting |
| Toegewijd D4 | Facturering per toegewijde node | 4 vCPU, 16GiB per node | Aanhoudende belasting/isolatiebehoeften |
| Toegewijd D8 | Facturering per toegewijde node | 8 vCPU, 32GiB per node | Hogere aanhoudende belasting |

---

## Validatietools

### SKU Beschikbaarheidschecker

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

### Kostenschatting Script

**Alleen pseudocode:** `Get-ResourceCost` hieronder is een projectspecifieke functie die u moet implementeren met actuele regionale/contractprijsstellingen en gebruiksaanname. Het is geen PowerShell- of Azure-cmdlet.

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

De volgende YAML is een vereisten-schets, **geen** Azure Load Testing, JMeter, Locust of k6 invoerschema. Vertaal dit naar de werkelijke configuratie van uw gekozen tool voordat u het load-test commando hierboven gebruikt.

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

## Samenvatting Best Practices

### Do's

1. **Begin klein en schaal op** op basis van daadwerkelijk gebruik
2. **Gebruik verschillende SKU's voor verschillende omgevingen**
3. **Monitor voortdurend prestaties en kosten**
4. **Maak gebruik van gereserveerde capaciteit voor productie workloads**
5. **Implementeer auto-scaling waar geschikt**
6. **Test prestaties met realistische workloads**
7. **Plan voor groei maar voorkom over-provisioning**
8. **Gebruik gratis tiers voor ontwikkeling indien mogelijk**

### Don'ts

1. **Gebruik geen productiesku's voor ontwikkeling**
2. **Negeer regionale SKU-beschikbaarheid niet**
3. **Vergeet datakosten niet**
4. **Over-provisioneer niet zonder rechtvaardiging**
5. **Negeer de impact van afhankelijkheden niet**
6. **Stel auto-scaling limieten niet te hoog in**
7. **Vergeet compliancevereisten niet**
8. **Neem geen beslissingen alleen op basis van prijs**

---

**Pro Tip**: Gebruik Azure Cost Management en Advisor om gepersonaliseerde aanbevelingen te krijgen om uw SKU-selecties te optimaliseren op basis van werkelijk gebruikspatronen.

---

**Navigatie**
- **Vorige Les**: [Capaciteitsplanning](capacity-planning.md)
- **Volgende Les**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# SKU Selection Guide - Choosing the Right Azure Service Tiers

**Kapitel-Navigation:**
- **📚 Kursübersicht**: [AZD For Beginners](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 6 - Validierung und Planung vor der Bereitstellung
- **⬅️ Vorherige**: [Capacity Planning](capacity-planning.md)
- **➡️ Nächste**: [Preflight Checks](preflight-checks.md)
- **🚀 Nächstes Kapitel**: [Kapitel 7: Fehlerbehebung](../chapter-07-troubleshooting/common-issues.md)

## Einführung

Dieser umfassende Leitfaden hilft Ihnen bei der Auswahl optimaler Azure-Service-SKUs (Stock Keeping Units) für verschiedene Umgebungen, Workloads und Anforderungen. Lernen Sie, Leistungsanforderungen, Kostenüberlegungen und Skalierbarkeitsanforderungen zu analysieren, um die geeignetsten Service-Stufen für Ihre Azure Developer CLI-Bereitstellungen auszuwählen.

## Lernziele

Nach Abschluss dieses Leitfadens werden Sie:
- SKU-Konzepte von Azure, Preismodelle und Funktionsunterschiede verstehen
- Strategien zur SKU-Auswahl für spezifische Umgebungen (Entwicklung, Staging, Produktion) beherrschen
- Workload-Anforderungen analysieren und sie passenden Service-Stufen zuordnen
- Kosteneinsparungsstrategien durch intelligente SKU-Auswahl umsetzen
- Techniken für Leistungstests und Validierung von SKU-Entscheidungen anwenden
- Automatisierte SKU-Empfehlungen und Überwachung konfigurieren

## Lernergebnisse

Nach Abschluss sind Sie in der Lage:
- Geeignete Azure-Service-SKUs basierend auf Workload-Anforderungen und Einschränkungen auszuwählen
- Kostenoptimierte Multi-Umgebungs-Architekturen mit geeigneter Stufenauswahl zu entwerfen
- Leistungs-Benchmarking und Validierung für SKU-Entscheidungen umzusetzen
- Automatisierte Tools für SKU-Empfehlungen und Kostenoptimierung zu erstellen
- SKU-Migrationen und Skalierungsstrategien für sich ändernde Anforderungen zu planen
- Prinzipien des Azure Well-Architected Framework auf die Auswahl von Service-Stufen anzuwenden

## Inhaltsverzeichnis

- [Understanding SKUs](../../../../docs/chapter-06-pre-deployment)
- [Environment-Based Selection](../../../../docs/chapter-06-pre-deployment)
- [Service-Specific Guidelines](../../../../docs/chapter-06-pre-deployment)
- [Cost Optimization Strategies](../../../../docs/chapter-06-pre-deployment)
- [Performance Considerations](../../../../docs/chapter-06-pre-deployment)
- [Quick Reference Tables](../../../../docs/chapter-06-pre-deployment)
- [Validation Tools](../../../../docs/chapter-06-pre-deployment)

---

## Understanding SKUs

### What are SKUs?

SKUs (Stock Keeping Units) repräsentieren verschiedene Service-Stufen und Leistungsniveaus für Azure-Ressourcen. Jede SKU bietet unterschiedliche:

- **Leistungsmerkmale** (CPU, Speicher, Durchsatz)
- **Funktionsverfügbarkeit** (Skalierungsoptionen, SLA-Stufen)
- **Preismodelle** (nutzungsabhängig, reservierte Kapazität)
- **Regionale Verfügbarkeit** (nicht alle SKUs in allen Regionen verfügbar)

### Wichtige Faktoren bei der SKU-Auswahl

1. **Workload-Anforderungen**
   - Erwarteter Traffic-/Lastverlauf
   - Leistungsanforderungen (CPU, Speicher, I/O)
   - Speicherbedarf und Zugriffsweisen

2. **Umgebungstyp**
   - Entwicklung/Test vs. Produktion
   - Verfügbarkeitsanforderungen
   - Sicherheits- und Compliance-Bedürfnisse

3. **Budgetbeschränkungen**
   - Anfangskosten vs. Betriebskosten
   - Rabatte für reservierte Kapazität
   - Kostenimplikationen durch Auto-Skalierung

4. **Wachstumsprognosen**
   - Skalierbarkeitsanforderungen
   - Zukünftige Funktionsbedarfe
   - Migrationskomplexität

---

## Environment-Based Selection

### Development Environment

**Prioritäten**: Kostenoptimierung, Grundfunktionalität, einfache Bereitstellung/Stilllegung

#### Empfohlene SKUs
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

#### Eigenschaften
- **App Service**: F1 (Free) oder B1 (Basic) für einfache Tests
- **Datenbanken**: Basic-Stufe mit minimalen Ressourcen
- **Speicher**: Standard mit nur lokaler Redundanz
- **Compute**: Geteilte Ressourcen akzeptabel
- **Netzwerk**: Basis-Konfigurationen

### Staging/Testing Environment

**Prioritäten**: Produktionsähnliche Konfiguration, Kostenbalance, Leistungs-Testfähigkeit

#### Empfohlene SKUs
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

#### Eigenschaften
- **Leistung**: 70–80 % der Produktionskapazität
- **Funktionen**: Die meisten Produktionsfunktionen aktiviert
- **Redundanz**: Einige geografische Redundanzen
- **Skalierung**: Begrenztes Auto-Scaling für Tests
- **Überwachung**: Vollständiger Monitoring-Stack

### Production Environment

**Prioritäten**: Leistung, Verfügbarkeit, Sicherheit, Compliance, Skalierbarkeit

#### Empfohlene SKUs
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

#### Eigenschaften
- **Hohe Verfügbarkeit**: SLA-Anforderungen von 99,9%+
- **Leistung**: Dedizierte Ressourcen, hoher Durchsatz
- **Sicherheit**: Premium-Sicherheitsfunktionen
- **Skalierung**: Volle Auto-Scaling-Fähigkeiten
- **Überwachung**: Umfassende Observability

---

## Service-Specific Guidelines

### Azure App Service

#### SKU-Entscheidungsmatrix

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | Kosteneffektiv, ausreichend für Tests |
| Small production apps | S1 (Standard) | Custom Domains, SSL, Auto-Scaling |
| Medium production apps | P1V3 (Premium V3) | Bessere Leistung, mehr Funktionen |
| High-traffic apps | P2V3 or P3V3 | Dedizierte Ressourcen, hohe Leistung |
| Mission-critical apps | I1V2 (Isolated V2) | Netzwerk-Isolierung, dedizierte Hardware |

#### Konfigurationsbeispiele

**Development**
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

**Production**
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

#### SKU-Auswahlrahmen

1. **DTU-basiert (Database Transaction Units)**
   - **Basic**: 5 DTU - Entwicklung/Test
   - **Standard**: S0-S12 (10-3000 DTU) - Allgemeiner Einsatz
   - **Premium**: P1-P15 (125-4000 DTU) - Leistungsintensiv

2. **vCore-basiert** (Empfohlen für Produktion)
   - **General Purpose**: Ausgewogene Compute- und Speicherressourcen
   - **Business Critical**: Geringe Latenz, hohe IOPS
   - **Hyperscale**: Hoch skalierbarer Speicher (bis zu 100TB)

#### Beispielkonfigurationen

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

#### Umgebungstypen

1. **Consumption-basiert**
   - Bezahlung pro Nutzung
   - Geeignet für Entwicklung und variable Workloads
   - Geteilte Infrastruktur

2. **Dedicated (Workload Profiles)**
   - Dedizierte Compute-Ressourcen
   - Vorhersehbare Leistung
   - Besser für Produktions-Workloads

#### Konfigurationsbeispiele

**Development (Consumption)**
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

**Production (Dedicated)**
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

#### Durchsatzmodelle

1. **Manuell bereitgestellter Durchsatz**
   - Vorhersehbare Leistung
   - Rabatte für reservierte Kapazität
   - Am besten für konstante Workloads

2. **Autoscale bereitgestellter Durchsatz**
   - Automatische Skalierung basierend auf Nutzung
   - Bezahlen, was Sie nutzen (mit Minimum)
   - Gut für variable Workloads

3. **Serverless**
   - Bezahlung pro Anfrage
   - Kein bereitgestellter Durchsatz
   - Ideal für Entwicklung und sporadische Workloads

#### SKU-Beispiele

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

#### Storage-Account-Typen

1. **Standard_LRS** - Entwicklung, nicht-kritische Daten
2. **Standard_GRS** - Produktion, Geo-Redundanz erforderlich
3. **Premium_LRS** - Hochleistungsanwendungen
4. **Premium_ZRS** - Hohe Verfügbarkeit mit Zonen-Redundanz

#### Leistungsebenen

- **Standard**: Allgemeiner Gebrauch, kosteneffektiv
- **Premium**: Hochleistung, geringe Latenzsszenarien

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

## Kostenoptimierungsstrategien

### 1. Reservierte Kapazität

Reservieren Sie Ressourcen für 1–3 Jahre für signifikante Rabatte:

```bash
# Reservierungsoptionen prüfen
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Richtige Dimensionierung

Beginnen Sie mit kleineren SKUs und skalieren Sie basierend auf tatsächlicher Nutzung:

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

### 3. Auto-Scaling-Konfiguration

Implementieren Sie intelligentes Skalieren zur Kostenoptimierung:

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

### 4. Geplante Skalierung

Runterskalieren während ruhiger Zeiten:

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

## Leistungsüberlegungen

### Grundlegende Leistungsanforderungen

Definieren Sie klare Leistungsanforderungen vor der SKU-Auswahl:

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

### Lasttests

Testen Sie verschiedene SKUs, um die Leistung zu validieren:

```bash
# Azure Load Testing-Dienst
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Überwachung und Optimierung

Richten Sie eine umfassende Überwachung ein:

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

## Schnellreferenztabellen

### App Service SKU Schnellreferenz

| SKU | Stufe | vCPU | RAM | Speicher | Preisspanne | Anwendungsfall |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | Entwicklung |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Kleine Apps |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Produktion |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Hohe Leistung |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Unternehmen |

### SQL Database SKU Schnellreferenz

| SKU | Stufe | DTU/vCore | Speicher | Preisspanne | Anwendungsfall |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Entwicklung |
| S2 | Standard | 50 DTU | 250GB | $$ | Kleine Produktion |
| P2 | Premium | 250 DTU | 1TB | $$$ | Hohe Leistung |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Ausgewogen |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Missionskritisch |

### Container Apps SKU Schnellreferenz

| Modell | Abrechnung | CPU/RAM | Anwendungsfall |
|-------|---------|------------|----------|
| Consumption | Bezahlung pro Nutzung | 0.25-2 vCPU | Entwicklung, variable Last |
| Dedicated D4 | Reserviert | 4 vCPU, 16GB | Produktion |
| Dedicated D8 | Reserviert | 8 vCPU, 32GB | Hohe Leistung |

---

## Validierungstools

### SKU-Verfügbarkeitsprüfer

```bash
#!/bin/bash
# Verfügbarkeit der SKU in der Zielregion prüfen

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

# Verwendung
check_sku_availability "eastus" "app-service" "P1V3"
```

### Kostenabschätzungs-Skript

```powershell
# PowerShell-Skript zur Kostenschätzung
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
        
        # Verwenden Sie die Azure Pricing API oder den Preisrechner
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Verwendung
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### Leistungsvalidierung

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

## Zusammenfassung der Best Practices

### Empfehlungen

1. **Klein anfangen und nach oben skalieren** basierend auf tatsächlicher Nutzung
2. **Unterschiedliche SKUs für verschiedene Umgebungen verwenden**
3. **Leistung und Kosten kontinuierlich überwachen**
4. **Reservierte Kapazität für Produktions-Workloads nutzen**
5. **Auto-Scaling dort implementieren, wo es sinnvoll ist**
6. **Leistung mit realistischen Workloads testen**
7. **Für Wachstum planen, aber Überprovisionierung vermeiden**
8. **Free-Tiers für Entwicklung verwenden, wenn möglich**

### Was man vermeiden sollte

1. **Keine Produktions-SKUs für Entwicklung verwenden**
2. **Regionale SKU-Verfügbarkeit nicht ignorieren**
3. **Datenübertragungskosten nicht vergessen**
4. **Nicht ohne Begründung überprovisionieren**
5. **Auswirkungen von Abhängigkeiten nicht ignorieren**
6. **Auto-Scaling-Grenzen nicht zu hoch setzen**
7. **Compliance-Anforderungen nicht vergessen**
8. **Entscheidungen nicht ausschließlich aufgrund des Preises treffen**

---

**Pro-Tipp**: Verwenden Sie Azure Cost Management und Advisor, um personalisierte Empfehlungen zur Optimierung Ihrer SKU-Auswahl basierend auf tatsächlichen Nutzungsmustern zu erhalten.

---

**Navigation**
- **Vorherige Lektion**: [Capacity Planning](capacity-planning.md)
- **Nächste Lektion**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, können automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten. Das Originaldokument in seiner Ausgangssprache ist als maßgebliche Quelle zu betrachten. Bei wichtigen Informationen wird eine professionelle, menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
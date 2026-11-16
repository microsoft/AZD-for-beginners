# SKU-Auswahlleitfaden - Die richtigen Azure-Service-Stufen wählen

**Kapitel-Navigation:**
- **📚 Kurs-Startseite**: [AZD Für Einsteiger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 6 - Vorbereitende Validierung & Planung
- **⬅️ Vorheriges**: [Kapazitätsplanung](capacity-planning.md)
- **➡️ Nächstes**: [Vorflug-Checks](preflight-checks.md)
- **🚀 Nächstes Kapitel**: [Kapitel 7: Fehlerbehebung](../chapter-07-troubleshooting/common-issues.md)

## Einführung

Dieser umfassende Leitfaden hilft Ihnen, optimale Azure-Service-SKUs (Stock Keeping Units) für verschiedene Umgebungen, Workloads und Anforderungen auszuwählen. Lernen Sie, Leistungsanforderungen, Kostenüberlegungen und Skalierbarkeitsanforderungen zu analysieren, um die am besten geeigneten Service-Stufen für Ihre Azure Developer CLI-Bereitstellungen zu wählen.

## Lernziele

Nach Abschluss dieses Leitfadens werden Sie:
- Azure SKU-Konzepte, Preisgestaltungsmodelle und Funktionsunterschiede verstehen
- Umgebungspezifische SKU-Auswahlstrategien für Entwicklung, Staging und Produktion meistern
- Workload-Anforderungen analysieren und passende Service-Stufen zuordnen
- Kostenoptimierungsstrategien durch intelligente SKU-Auswahl umsetzen
- Leistungstest- und Validierungstechniken für SKU-Entscheidungen anwenden
- Automatisierte SKU-Empfehlungen und Monitoring konfigurieren

## Lernergebnisse

Nach Abschluss sind Sie in der Lage:
- Geeignete Azure-Service-SKUs basierend auf Workload-Anforderungen und Einschränkungen auszuwählen
- Kosteneffiziente Multi-Umgebungs-Architekturen mit passender Stufenauswahl zu entwerfen
- Leistungsbenchmarking und Validierung für SKU-Entscheidungen durchzuführen
- Automatisierte Tools für SKU-Empfehlung und Kostenoptimierung zu erstellen
- SKU-Migrationen und Skalierungsstrategien für sich ändernde Anforderungen zu planen
- Azure Well-Architected Framework Prinzipien auf die Service-Stufenauswahl anzuwenden

## Inhaltsverzeichnis

- [Verstehen von SKUs](#understanding-skus)
- [Umgebungsbasierte Auswahl](#environment-based-selection)
- [Servicespezifische Richtlinien](#service-specific-guidelines)
- [Kostenoptimierungsstrategien](#cost-optimization-strategies)
- [Performance-Überlegungen](#performance-considerations)
- [Schnellreferenztabellen](#quick-reference-tables)
- [Validierungstools](#validation-tools)

---

## Verstehen von SKUs

> **Beispielumfang:** YAML SKU-Karten und Leistungskonfigurationen unten sind Entwurfsnotizen, kein `azure.yaml` Schema oder Load-Tool-Konfiguration. Bicep-Blöcke sind Alternativen/Fragmente: deklarieren Sie deren Parameter und übergeordnete Ressourcen, verwenden Sie eindeutige symbolische Namen beim Kombinieren und integrieren Sie Module in ein funktionierendes Projekt. Preise, Limits und Regionen/SKU-Verfügbarkeit müssen für Ihr Abonnement vor Bereitstellung geprüft werden.

### Was sind SKUs?

SKUs (Stock Keeping Units) repräsentieren verschiedene Service-Stufen und Leistungsniveaus für Azure-Ressourcen. Jede SKU bietet unterschiedliche:

- **Leistungsmerkmale** (CPU, Speicher, Durchsatz)
- **Funktionsumfang** (Skalierungsoptionen, SLA-Stufen)
- **Preisgestaltungsmodelle** (verbrauchsbasiert, reservierte Kapazität)
- **Regionale Verfügbarkeit** (nicht alle SKUs in allen Regionen verfügbar)

### Schlüsselfaktoren bei der SKU-Auswahl

1. **Workload-Anforderungen**
   - Erwartete Verkehrs-/Lastmuster
   - Leistungsanforderungen (CPU, Speicher, I/O)
   - Speicherbedarfe und Zugriffsmuster

2. **Umgebungstyp**
   - Entwicklung/Test vs. Produktion
   - Verfügbarkeitsanforderungen
   - Sicherheits- und Compliance-Bedürfnisse

3. **Budgetbeschränkungen**
   - Anfangskosten vs. Betriebskosten
   - Rabatte für reservierte Kapazität
   - Kostenimplikationen von Auto-Skalierung

4. **Wachstumsprognosen**
   - Skalierbarkeitsanforderungen
   - Zukünftige Funktionsbedarfe
   - Migrationskomplexität

---

## Umgebungsspezifische Auswahl

### Entwicklungsumgebung

**Prioritäten**: Kostenoptimierung, Grundfunktionalität, einfache Bereitstellung/Zurücknahme

#### Empfohlene SKUs
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

#### Eigenschaften
- **App Service**: F1 (Kostenlos) oder B1 (Basic) für einfache Tests
- **Datenbanken**: Basistufe mit minimalen Ressourcen
- **Speicher**: Standard mit lokaler Redundanz nur
- **Compute**: Geteilte Ressourcen akzeptabel
- **Netzwerk**: Grundlegende Konfigurationen

### Staging-/Testumgebung

**Prioritäten**: Produktionsähnliche Konfiguration, Kosten-Balance, Leistungsprüfungsfähigkeit

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
- **Leistung**: 70-80% der Produktionskapazität
- **Funktionen**: Die meisten Produktionsfunktionen aktiviert
- **Redundanz**: Geografische Redundanz teilweise
- **Skalierung**: Begrenzte Auto-Skalierung für Tests
- **Monitoring**: Vollständiger Monitoring-Stack

### Produktionsumgebung

**Prioritäten**: Leistung, Verfügbarkeit, Sicherheit, Compliance, Skalierbarkeit

#### Empfohlene SKUs
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

#### Eigenschaften
- **Hohe Verfügbarkeit**: SLA-Anforderungen von 99,9%+
- **Leistung**: Dedizierte Ressourcen, hoher Durchsatz
- **Sicherheit**: Premium-Sicherheitsfunktionen
- **Skalierung**: Volle Auto-Skalierungsfähigkeiten
- **Monitoring**: Umfassende Beobachtbarkeit

---

## Servicespezifische Richtlinien

### Azure App Service

#### SKU-Entscheidungsmatrix

| Anwendungsfall | Empfohlene SKU | Begründung |
|----------|----------------|-----------|
| Entwicklung/Test | F1 (Kostenlos) oder B1 (Basic) | Kostenwirksam, ausreichend für Tests |
| Kleine Produktions-Apps | S1 (Standard) | Eigene Domains, SSL, Auto-Skalierung |
| Mittlere Produktions-Apps | P1V3 (Premium V3) | Bessere Leistung, mehr Funktionen |
| Hochlast-Apps | P2V3 oder P3V3 | Dedizierte Ressourcen, hohe Leistung |
| Geschäfts-kritische Apps | I1V2 (Isolated V2) | Netzwerkisolation, dedizierte Hardware |

#### Konfigurationsbeispiele

**Entwicklung**
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

### Azure SQL-Datenbank

#### SKU-Auswahlrahmen

1. **DTU-basiert (Database Transaction Units)**
   - **Basic**: 5 DTU - Entwicklung/Test
   - **Standard**: S0-S12 (10-3000 DTU) - Allgemeiner Gebrauch
   - **Premium**: P1-P15 (125-4000 DTU) - Performance-kritisch

2. **vCore-basiert** (Empfohlen für Produktion)
   - **General Purpose**: Ausgewogenes Compute und Speicher
   - **Business Critical**: Niedrige Latenz, hohe IOPS
   - **Hyperscale**: Hoch skalierbarer Speicher; aktuelle Größenlimits und Regionssupport prüfen

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

1. **Verbrauchsbasiert**
   - Bezahlung nach Nutzung
   - Geeignet für Entwicklung und variable Workloads
   - Geteilte Infrastruktur

2. **Dediziert (Workload-Profile)**
   - Dedizierte Compute-Ressourcen
   - Vorhersehbare Leistung
   - Besser für Produktions-Workloads

#### Konfigurationsbeispiele

**Entwicklung (Verbrauchsbasiert)**
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

**Produktion (Dediziert)**
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

Zonenausfallsicherheit erfordert auch Infrastruktur in unterstützten Regionen und passende VNet/Subnetz-Konfiguration, hier nicht angegeben. Dieses Beispiel sieht drei dedizierte Nodes vor; konfigurieren Sie mindestens zwei App-Replikate für zonenübergreifende Verteilung und dimensionieren Sie sowohl Replikate als auch Nodes für Zonenausfall. Siehe [Container Apps Zuverlässigkeitsleitfaden](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Um eine App auf dieses Profil zu setzen, legen Sie deren `workloadProfileName: 'production-profile'` fest; das Erstellen des Profils alleine verschiebt Apps nicht dorthin.

### Azure Cosmos DB

#### Durchsatzmodelle

1. **Manuell bereitgestellter Durchsatz**
   - Vorhersehbare Leistung
   - Rabatte für reservierte Kapazität
   - Am besten für konstante Workloads

2. **Autoscale bereitgestellter Durchsatz**
   - Automatisches Skalieren basierend auf Nutzung
   - Bezahlen Sie nur für die Nutzung (mit Minimum)
   - Gut für variable Workloads

3. **Serverless**
   - Bezahlung pro Anforderung
   - Kein bereitgestellter Durchsatz
   - Ideal für Entwicklung und intermittierende Workloads

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
2. **Standard_GRS** - Produktion, Geo-Redundanz benötigt
3. **Premium_LRS** - Hochleistungsanwendungen
4. **Premium_ZRS** - Hohe Verfügbarkeit mit Zonenausfallsicherheit

#### Leistungsklassen

- **Standard**: Allgemein, kosteneffektiv
- **Premium**: Hochleistung, niedrige Latenz-Szenarien

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

Reservieren Sie Ressourcen für 1-3 Jahre für signifikante Rabatte:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Reservierungsangebote und berechtigte Ressourcentypen variieren; prüfen Sie den Katalog und die Kaufbedingungen, anstatt anzunehmen, jeder Service/SKU unterstützt eine Reservation.

### 2. Richtige Dimensionierung (Right-Sizing)

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

### 3. Auto-Skalierungs-Konfiguration

Implementieren Sie intelligente Skalierung zur Kostenoptimierung:

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

### 4. Geplante Skalierung

Während der Nicht-Betriebszeiten herunter skalieren:

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

## Performance-Überlegungen

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
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### Überwachung und Optimierung

Richten Sie umfassendes Monitoring ein:

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

## Schnellreferenztabellen

### App Service SKU Schnellreferenz

| SKU | Ebene | vCPU | RAM | Speicher | Preisspanne | Anwendungsfall |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Kostenlos | Geteilt | 1GB | 1GB | Kostenlos | Entwicklung |
| B1 | Basic | 1 | 1,75GB | 10GB | $ | Kleine Apps |
| S1 | Standard | 1 | 1,75GB | 50GB | $$ | Produktion |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Hohe Leistung |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Unternehmen |

### SQL-Datenbank SKU Schnellreferenz

| SKU | Ebene | DTU/vCore | Speicher | Preisspanne | Anwendungsfall |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Entwicklung |
| S2 | Standard | 50 DTU | 250GB | $$ | Kleine Produktion |
| P2 | Premium | 250 DTU | 1TB | $$$ | Hohe Leistung |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Ausgewogen |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Geschäfts-kritisch |

### Container Apps SKU Schnellreferenz

| Modell | Preisgestaltung | CPU/Speicher | Anwendungsfall |
|-------|---------|------------|----------|
| Verbrauch | Pay-per-Use | Unterstützte CPU/Speicherkombinationen hängen von Umgebung/Profil ab | Entwicklung oder Produktion, variable Last |
| Dediziert D4 | Abrechnung pro dediziertem Node | 4 vCPU, 16GiB pro Node | Dauerhafte Last/Isolationsbedarf |
| Dediziert D8 | Abrechnung pro dediziertem Node | 8 vCPU, 32GiB pro Node | Höhere Dauerlast |

---

## Validierungstools

### SKU-Verfügbarkeitsprüfer

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

### Kostenschätzungsskript

**Nur Pseudocode:** `Get-ResourceCost` unten ist eine projektspezifische Funktion, die Sie mit aktuellen Regionen-/Vertragspreisen und Nutzungsannahmen implementieren müssen. Es ist kein PowerShell- oder Azure-Cmdlet.

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

### Leistungsvalidierung

Das folgende YAML ist ein Anforderungsskizze, **kein** Azure Load Testing-, JMeter-, Locust- oder k6-Eingabeschema. Übersetzen Sie es in die Konfiguration Ihres Tools, bevor Sie den oben genannten Lasttestbefehl verwenden.

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

### Dos

1. **Klein anfangen und basierend auf tatsächlicher Nutzung skalieren**
2. **Unterschiedliche SKUs für verschiedene Umgebungen nutzen**
3. **Leistung und Kosten kontinuierlich überwachen**
4. **Reservierte Kapazität für Produktions-Workloads nutzen**
5. **Auto-Skalierung dort implementieren, wo es sinnvoll ist**
6. **Leistung mit realistischen Workloads testen**
7. **Für Wachstum planen, aber Überprovisionierung vermeiden**
8. **Kostenlose Stufen möglichst für Entwicklung nutzen**

### Don'ts

1. **Keine Produktions-SKUs für Entwicklung verwenden**
2. **Die regionale SKU-Verfügbarkeit nicht ignorieren**
3. **Datenübertragungskosten nicht vergessen**
4. **Keine unrechtfertigte Überprovisionierung**
5. **Die Auswirkungen von Abhängigkeiten nicht ignorieren**
6. **Auto-Skalierungslimits nicht zu hoch setzen**
7. **Compliance-Anforderungen nicht vergessen**
8. **Entscheidungen nicht ausschließlich nach Preis treffen**

---

**Profi-Tipp**: Nutzen Sie Azure Cost Management und Advisor, um personalisierte Empfehlungen zur Optimierung Ihrer SKU-Auswahl basierend auf tatsächlichen Nutzungsmustern zu erhalten.

---

**Navigation**
- **Vorherige Lektion**: [Kapazitätsplanung](capacity-planning.md)
- **Nächste Lektion**: [Vorflug-Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
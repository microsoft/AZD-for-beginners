<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "952ed5af7f5db069c53a6840717e1801",
  "translation_date": "2025-09-17T16:11:47+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "de"
}
-->
# SKU-Auswahlleitfaden - Die richtigen Azure-Serviceebenen wählen

**Kapitelübersicht:**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 6 - Validierung & Planung vor der Bereitstellung
- **⬅️ Vorheriges**: [Kapazitätsplanung](capacity-planning.md)
- **➡️ Nächstes**: [Preflight-Checks](preflight-checks.md)
- **🚀 Nächstes Kapitel**: [Kapitel 7: Fehlerbehebung](../troubleshooting/common-issues.md)

## Einführung

Dieser umfassende Leitfaden hilft Ihnen, optimale Azure-Service-SKUs (Stock Keeping Units) für verschiedene Umgebungen, Workloads und Anforderungen auszuwählen. Lernen Sie, Leistungsanforderungen, Kostenüberlegungen und Skalierbarkeitsanforderungen zu analysieren, um die am besten geeigneten Serviceebenen für Ihre Azure Developer CLI-Bereitstellungen auszuwählen.

## Lernziele

Nach Abschluss dieses Leitfadens werden Sie:
- Die Konzepte von Azure-SKUs, Preismodelle und Funktionsunterschiede verstehen
- Strategien zur SKU-Auswahl für Entwicklungs-, Test- und Produktionsumgebungen beherrschen
- Workload-Anforderungen analysieren und passende Serviceebenen auswählen
- Kostenoptimierungsstrategien durch intelligente SKU-Auswahl umsetzen
- Leistungstests und Validierungstechniken für SKU-Entscheidungen anwenden
- Automatisierte SKU-Empfehlungen und Überwachung konfigurieren

## Lernergebnisse

Nach Abschluss können Sie:
- Geeignete Azure-Service-SKUs basierend auf Workload-Anforderungen und Einschränkungen auswählen
- Kostenoptimierte Architekturen für mehrere Umgebungen mit geeigneter Ebenenauswahl entwerfen
- Leistungstests und Validierung für SKU-Entscheidungen implementieren
- Automatisierte Tools für SKU-Empfehlungen und Kostenoptimierung erstellen
- SKU-Migrations- und Skalierungsstrategien für sich ändernde Anforderungen planen
- Prinzipien des Azure Well-Architected Frameworks auf die Auswahl von Serviceebenen anwenden

## Inhaltsverzeichnis

- [SKUs verstehen](../../../../docs/pre-deployment)
- [Umgebungsbasierte Auswahl](../../../../docs/pre-deployment)
- [Dienstspezifische Richtlinien](../../../../docs/pre-deployment)
- [Kostenoptimierungsstrategien](../../../../docs/pre-deployment)
- [Leistungsüberlegungen](../../../../docs/pre-deployment)
- [Schnellreferenztabellen](../../../../docs/pre-deployment)
- [Validierungstools](../../../../docs/pre-deployment)

---

## SKUs verstehen

### Was sind SKUs?

SKUs (Stock Keeping Units) repräsentieren verschiedene Serviceebenen und Leistungsstufen für Azure-Ressourcen. Jede SKU bietet unterschiedliche:

- **Leistungsmerkmale** (CPU, Speicher, Durchsatz)
- **Funktionsverfügbarkeit** (Skalierungsoptionen, SLA-Niveaus)
- **Preismodelle** (verbrauchsbasiert, reservierte Kapazität)
- **Regionale Verfügbarkeit** (nicht alle SKUs sind in allen Regionen verfügbar)

### Wichtige Faktoren bei der SKU-Auswahl

1. **Workload-Anforderungen**
   - Erwartete Traffic-/Lastmuster
   - Leistungsanforderungen (CPU, Speicher, I/O)
   - Speicherbedarf und Zugriffsmuster

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
   - Zukünftige Funktionsbedürfnisse
   - Migrationskomplexität

---

## Umgebungsbasierte Auswahl

### Entwicklungsumgebung

**Prioritäten**: Kostenoptimierung, grundlegende Funktionalität, einfache Bereitstellung/Entfernung

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

#### Merkmale
- **App Service**: F1 (Free) oder B1 (Basic) für einfache Tests
- **Datenbanken**: Basisebene mit minimalen Ressourcen
- **Speicher**: Standard mit lokaler Redundanz
- **Compute**: Gemeinsame Ressourcen akzeptabel
- **Netzwerk**: Basis-Konfigurationen

### Staging-/Testumgebung

**Prioritäten**: Produktionsähnliche Konfiguration, Kostenbalance, Leistungstestfähigkeit

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

#### Merkmale
- **Leistung**: 70-80 % der Produktionskapazität
- **Funktionen**: Die meisten Produktionsfunktionen aktiviert
- **Redundanz**: Einige geografische Redundanz
- **Skalierung**: Begrenzte Auto-Skalierung für Tests
- **Überwachung**: Vollständiger Überwachungsstack

### Produktionsumgebung

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

#### Merkmale
- **Hohe Verfügbarkeit**: 99,9 %+ SLA-Anforderungen
- **Leistung**: Dedizierte Ressourcen, hoher Durchsatz
- **Sicherheit**: Premium-Sicherheitsfunktionen
- **Skalierung**: Volle Auto-Skalierungsfähigkeiten
- **Überwachung**: Umfassende Beobachtbarkeit

---

## Dienstspezifische Richtlinien

### Azure App Service

#### SKU-Entscheidungsmatrix

| Anwendungsfall | Empfohlene SKU | Begründung |
|----------------|----------------|------------|
| Entwicklung/Test | F1 (Free) oder B1 (Basic) | Kosteneffizient, ausreichend für Tests |
| Kleine Produktionsanwendungen | S1 (Standard) | Eigene Domains, SSL, Auto-Skalierung |
| Mittlere Produktionsanwendungen | P1V3 (Premium V3) | Bessere Leistung, mehr Funktionen |
| Hochfrequente Anwendungen | P2V3 oder P3V3 | Dedizierte Ressourcen, hohe Leistung |
| Kritische Anwendungen | I1V2 (Isolated V2) | Netzwerkisolierung, dedizierte Hardware |

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
   - **Premium**: P1-P15 (125-4000 DTU) - Leistungsintensiv

2. **vCore-basiert** (Empfohlen für Produktion)
   - **General Purpose**: Ausgewogene Compute- und Speicherressourcen
   - **Business Critical**: Niedrige Latenz, hohe IOPS
   - **Hyperscale**: Hoch skalierbarer Speicher (bis zu 100 TB)

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
   - Pay-per-Use-Preismodell
   - Geeignet für Entwicklung und variable Workloads
   - Gemeinsame Infrastruktur

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

**Produktion (Dediziert)**
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

2. **Autoskalierter bereitgestellter Durchsatz**
   - Automatische Skalierung basierend auf Nutzung
   - Bezahlung nach Verbrauch (mit Mindestwert)
   - Gut für variable Workloads

3. **Serverless**
   - Bezahlung pro Anfrage
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

#### Speicherkontotypen

1. **Standard_LRS** - Entwicklung, nicht kritische Daten
2. **Standard_GRS** - Produktion, benötigte Geo-Redundanz
3. **Premium_LRS** - Hochleistungsanwendungen
4. **Premium_ZRS** - Hohe Verfügbarkeit mit Zonenredundanz

#### Leistungsebenen

- **Standard**: Allgemeiner Gebrauch, kosteneffizient
- **Premium**: Hochleistung, Szenarien mit niedriger Latenz

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

Ressourcen für 1-3 Jahre reservieren für erhebliche Rabatte:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Right-Sizing

Mit kleineren SKUs beginnen und basierend auf tatsächlicher Nutzung skalieren:

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

### 3. Auto-Skalierungskonfiguration

Intelligente Skalierung implementieren, um Kosten zu optimieren:

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

Während der Nebenzeiten herunterskalieren:

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

### Basisleistungsanforderungen

Klare Leistungsanforderungen vor der SKU-Auswahl definieren:

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

Verschiedene SKUs testen, um die Leistung zu validieren:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Überwachung und Optimierung

Umfassende Überwachung einrichten:

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

| SKU | Ebene | vCPU | RAM | Speicher | Preisspanne | Anwendungsfall |
|-----|-------|------|-----|----------|-------------|----------------|
| F1 | Free | Shared | 1GB | 1GB | Kostenlos | Entwicklung |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Kleine Anwendungen |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Produktion |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Hohe Leistung |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Unternehmen |

### SQL-Datenbank SKU Schnellreferenz

| SKU | Ebene | DTU/vCore | Speicher | Preisspanne | Anwendungsfall |
|-----|-------|-----------|----------|-------------|----------------|
| Basic | Basic | 5 DTU | 2GB | $ | Entwicklung |
| S2 | Standard | 50 DTU | 250GB | $$ | Kleine Produktion |
| P2 | Premium | 250 DTU | 1TB | $$$ | Hohe Leistung |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Ausgewogen |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Kritisch |

### Container Apps SKU Schnellreferenz

| Modell | Preisgestaltung | CPU/Speicher | Anwendungsfall |
|--------|-----------------|--------------|----------------|
| Verbrauchsbasiert | Pay-per-Use | 0.25-2 vCPU | Entwicklung, variable Last |
| Dediziert D4 | Reserviert | 4 vCPU, 16GB | Produktion |
| Dediziert D8 | Reserviert | 8 vCPU, 32GB | Hohe Leistung |

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

### Kostenabschätzungsskript

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

### Do's

1. **Klein anfangen und basierend auf tatsächlicher Nutzung skalieren**
2. **Verschiedene SKUs für verschiedene Umgebungen verwenden**
3. **Leistung und Kosten kontinuierlich überwachen**
4. **Reservierte Kapazität für Produktions-Workloads nutzen**
5. **Auto-Skalierung dort implementieren, wo es sinnvoll ist**
6. **Leistung mit realistischen Workloads testen**
7. **Wachstum planen, aber Überprovisionierung vermeiden**
8. **Kostenlose Ebenen für Entwicklung nutzen, wenn möglich**

### Don'ts

1. **Keine Produktions-SKUs für Entwicklung verwenden**
2. **Regionale SKU-Verfügbarkeit nicht ignorieren**
3. **Datenübertragungskosten nicht vergessen**
4. **Ohne Rechtfertigung überprovisionieren**
5. **Die Auswirkungen von Abhängigkeiten nicht ignorieren**
6. **Auto-Skalierungsgrenzen nicht zu hoch setzen**
7. **Compliance-Anforderungen nicht vergessen**
8. **Entscheidungen nicht nur auf Basis des Preises treffen**

---

**Profi-Tipp**: Verwenden Sie Azure Cost Management und Advisor, um personalisierte Empfehlungen zur Optimierung Ihrer SKU-Auswahl basierend auf tatsächlichen Nutzungsmustern zu erhalten.

---

**Navigation**
- **Vorherige Lektion**: [Kapazitätsplanung](capacity-planning.md)
- **Nächste Lektion**: [Preflight-Checks](preflight-checks.md)

---

**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.
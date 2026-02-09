# Guida alla selezione delle SKU - Scegliere i giusti livelli di servizio Azure

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Capitolo 6 - Validazione e Pianificazione Pre-distribuzione
- **⬅️ Previous**: [Capacity Planning](capacity-planning.md)
- **➡️ Next**: [Pre-flight Checks](preflight-checks.md)
- **🚀 Next Chapter**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

## Introduzione

Questa guida completa ti aiuta a selezionare le SKU (Stock Keeping Units) ottimali dei servizi Azure per diversi ambienti, carichi di lavoro e requisiti. Impara ad analizzare le esigenze di prestazioni, le considerazioni sui costi e i requisiti di scalabilità per scegliere i livelli di servizio più appropriati per le tue distribuzioni con Azure Developer CLI.

## Obiettivi di apprendimento

Completando questa guida, sarai in grado di:
- Comprendere i concetti di SKU di Azure, i modelli di prezzo e le differenze di funzionalità
- Padroneggiare strategie di selezione delle SKU specifiche per l'ambiente per sviluppo, staging e produzione
- Analizzare i requisiti del carico di lavoro e abbinarli ai livelli di servizio appropriati
- Implementare strategie di ottimizzazione dei costi tramite una selezione intelligente delle SKU
- Applicare tecniche di test delle prestazioni e di validazione per le scelte delle SKU
- Configurare raccomandazioni automatiche di SKU e monitoraggio

## Risultati di apprendimento

Al termine, sarai in grado di:
- Selezionare SKU dei servizi Azure appropriate in base ai requisiti e ai vincoli del carico di lavoro
- Progettare architetture multi-ambiente economicamente vantaggiose con la selezione corretta dei livelli
- Implementare benchmark e validazione delle prestazioni per le scelte delle SKU
- Creare strumenti automatici per la raccomandazione delle SKU e l'ottimizzazione dei costi
- Pianificare migrazioni e strategie di scaling delle SKU per requisiti in evoluzione
- Applicare i principi dell'Azure Well-Architected Framework alla selezione dei livelli di servizio

## Indice dei contenuti

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

SKU (Stock Keeping Units) rappresentano diversi livelli di servizio e livelli di prestazioni per le risorse Azure. Ogni SKU offre diversi:

- **Caratteristiche di prestazioni** (CPU, memoria, throughput)
- **Disponibilità delle funzionalità** (opzioni di scaling, livelli di SLA)
- **Modelli di prezzo** (a consumo, capacità riservata)
- **Disponibilità regionale** (non tutte le SKU sono disponibili in tutte le regioni)

### Fattori chiave nella selezione delle SKU

1. **Requisiti del carico di lavoro**
   - Traffico/carichi previsti
   - Requisiti di prestazioni (CPU, memoria, I/O)
   - Bisogni di archiviazione e pattern di accesso

2. **Tipo di ambiente**
   - Sviluppo/testing vs produzione
   - Requisiti di disponibilità
   - Esigenze di sicurezza e conformità

3. **Vincoli di budget**
   - Costi iniziali vs costi operativi
   - Sconti per capacità riservata
   - Implicazioni di costo dell'auto-scaling

4. **Proiezioni di crescita**
   - Requisiti di scalabilità
   - Necessità funzionali future
   - Complessità della migrazione

---

## Environment-Based Selection

### Development Environment

**Priorities**: Ottimizzazione dei costi, funzionalità di base, facile provisioning/de-provisioning

#### Recommended SKUs
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

#### Characteristics
- **App Service**: F1 (Gratuito) o B1 (Basic) per test semplici
- **Databases**: Livello Basic con risorse minime
- **Storage**: Standard con ridondanza locale solo
- **Compute**: Risorse condivise accettabili
- **Networking**: Configurazioni di base

### Staging/Testing Environment

**Priorities**: Configurazione simile alla produzione, bilanciamento dei costi, capacità di test delle prestazioni

#### Recommended SKUs
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

#### Characteristics
- **Prestazioni**: 70-80% della capacità di produzione
- **Funzionalità**: La maggior parte delle funzionalità di produzione abilitate
- **Ridondanza**: Alcuna ridondanza geografica
- **Scaling**: Auto-scaling limitato per i test
- **Monitoraggio**: Stack di monitoraggio completo

### Production Environment

**Priorities**: Prestazioni, disponibilità, sicurezza, conformità, scalabilità

#### Recommended SKUs
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

#### Characteristics
- **Alta disponibilità**: Requisiti SLA 99.9%+
- **Prestazioni**: Risorse dedicate, alto throughput
- **Sicurezza**: Funzionalità di sicurezza premium
- **Scaling**: Piene capacità di auto-scaling
- **Monitoraggio**: Osservabilità completa

---

## Service-Specific Guidelines

### Azure App Service

#### SKU Decision Matrix

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | Economico, sufficiente per il testing |
| Small production apps | S1 (Standard) | Domini personalizzati, SSL, auto-scaling |
| Medium production apps | P1V3 (Premium V3) | Migliori prestazioni, più funzionalità |
| High-traffic apps | P2V3 or P3V3 | Risorse dedicate, alte prestazioni |
| Mission-critical apps | I1V2 (Isolated V2) | Isolamento di rete, hardware dedicato |

#### Configuration Examples

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

#### SKU Selection Framework

1. **Basato su DTU (Database Transaction Units)**
   - **Basic**: 5 DTU - Sviluppo/testing
   - **Standard**: S0-S12 (10-3000 DTU) - Uso generale
   - **Premium**: P1-P15 (125-4000 DTU) - Critico per le prestazioni

2. **Basato su vCore** (Consigliato per la produzione)
   - **General Purpose**: Compute e storage bilanciati
   - **Business Critical**: Bassa latenza, alte IOPS
   - **Hyperscale**: Storage altamente scalabile (fino a 100TB)

#### Example Configurations

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

#### Environment Types

1. **Consumption-based**
   - Prezzo pay-per-use
   - Adatto per sviluppo e carichi variabili
   - Infrastruttura condivisa

2. **Dedicated (Workload Profiles)**
   - Risorse di calcolo dedicate
   - Prestazioni prevedibili
   - Migliore per carichi di produzione

#### Configuration Examples

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

#### Throughput Models

1. **Throughput provisioned manualmente**
   - Prestazioni prevedibili
   - Sconti per capacità riservata
   - Ideale per carichi costanti

2. **Throughput provisioned con autoscale**
   - Scaling automatico basato sull'uso
   - Paghi per quello che usi (con un minimo)
   - Buono per carichi variabili

3. **Serverless**
   - Paghi per richiesta
   - Nessun throughput provisioned
   - Ideale per sviluppo e carichi intermittenti

#### SKU Examples

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

#### Tipi di account di archiviazione

1. **Standard_LRS** - Sviluppo, dati non critici
2. **Standard_GRS** - Produzione, necessità di geo-ridondanza
3. **Premium_LRS** - Applicazioni ad alte prestazioni
4. **Premium_ZRS** - Alta disponibilità con ridondanza per zone

#### Livelli di prestazione

- **Standard**: Uso generale, conveniente
- **Premium**: Alte prestazioni, scenari a bassa latenza

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

## Strategie di ottimizzazione dei costi

### 1. Capacità riservata

Riserva risorse per 1-3 anni per sconti significativi:

```bash
# Verifica le opzioni di prenotazione
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Right-Sizing

Inizia con SKU più piccoli e scala in base all'uso reale:

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

### 3. Configurazione dell'auto-scaling

Implementa scaling intelligente per ottimizzare i costi:

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

### 4. Scaling programmato

Riduci la scala durante le ore non operative:

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

## Considerazioni sulle prestazioni

### Requisiti prestazionali di base

Definisci requisiti chiari di prestazioni prima della selezione delle SKU:

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

### Test di carico

Testa diverse SKU per convalidare le prestazioni:

```bash
# Servizio di test del carico di Azure
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Monitoraggio e ottimizzazione

Configura un monitoraggio completo:

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

## Tabelle di riferimento rapido

### App Service SKU Quick Reference

| SKU | Tier | vCPU | RAM | Storage | Price Range | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | Development |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Small apps |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Production |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | High performance |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### SQL Database SKU Quick Reference

| SKU | Tier | DTU/vCore | Storage | Price Range | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Development |
| S2 | Standard | 50 DTU | 250GB | $$ | Small production |
| P2 | Premium | 250 DTU | 1TB | $$$ | High performance |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Balanced |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Mission critical |

### Container Apps SKU Quick Reference

| Model | Pricing | CPU/Memory | Use Case |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Development, carico variabile |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Production |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | Alte prestazioni |

---

## Strumenti di validazione

### SKU Availability Checker

```bash
#!/bin/bash
# Verifica la disponibilità dello SKU nella regione di destinazione

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

# Utilizzo
check_sku_availability "eastus" "app-service" "P1V3"
```

### Cost Estimation Script

```powershell
# Script PowerShell per la stima dei costi
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
        
        # Usa l'API dei prezzi di Azure o il calcolatore
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Uso
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### Performance Validation

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

## Sommario delle migliori pratiche

### Cosa fare

1. **Inizia in piccolo e scala** in base all'uso reale
2. **Usa SKU diverse per ambienti diversi**
3. **Monitora continuamente prestazioni e costi**
4. **Sfrutta la capacità riservata per i workload di produzione**
5. **Implementa l'auto-scaling dove appropriato**
6. **Testa le prestazioni con carichi realistici**
7. **Pianifica la crescita ma evita l'over-provisioning**
8. **Usa i livelli gratuiti per lo sviluppo quando possibile**

### Cosa non fare

1. **Non usare SKU di produzione per lo sviluppo**
2. **Non ignorare la disponibilità regionale delle SKU**
3. **Non dimenticare i costi di trasferimento dei dati**
4. **Non sovra-provisionare senza giustificazione**
5. **Non ignorare l'impatto delle dipendenze**
6. **Non impostare limiti di auto-scaling troppo alti**
7. **Non dimenticare i requisiti di conformità**
8. **Non prendere decisioni basate solo sul prezzo**

---

**Pro Tip**: Usa Azure Cost Management e Advisor per ottenere raccomandazioni personalizzate per ottimizzare le tue selezioni di SKU in base ai pattern di utilizzo reali.

---

**Navigation**
- **Previous Lesson**: [Capacity Planning](capacity-planning.md)
- **Next Lesson**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Esclusione di responsabilità:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica basato su intelligenza artificiale [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per garantire l’accuratezza, si segnala che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella lingua di origine deve essere considerato la fonte autorevole. Per informazioni critiche si raccomanda la traduzione professionale eseguita da un traduttore umano. Non ci assumiamo alcuna responsabilità per eventuali incomprensioni o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "952ed5af7f5db069c53a6840717e1801",
  "translation_date": "2025-09-17T21:42:27+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "it"
}
-->
# Guida alla Selezione degli SKU - Scegliere i Giusti Livelli di Servizio Azure

**Navigazione Capitoli:**
- **📚 Home del Corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 6 - Validazione e Pianificazione Pre-Distribuzione
- **⬅️ Precedente**: [Pianificazione della Capacità](capacity-planning.md)
- **➡️ Successivo**: [Controlli Pre-Distribuzione](preflight-checks.md)
- **🚀 Capitolo Successivo**: [Capitolo 7: Risoluzione dei Problemi](../troubleshooting/common-issues.md)

## Introduzione

Questa guida completa ti aiuta a selezionare gli SKU (Stock Keeping Units) ottimali dei servizi Azure per diversi ambienti, carichi di lavoro e requisiti. Impara ad analizzare le esigenze di prestazioni, considerazioni sui costi e requisiti di scalabilità per scegliere i livelli di servizio più appropriati per le distribuzioni con Azure Developer CLI.

## Obiettivi di Apprendimento

Completando questa guida, sarai in grado di:
- Comprendere i concetti di SKU Azure, i modelli di prezzo e le differenze di funzionalità
- Padroneggiare strategie di selezione degli SKU specifiche per ambiente (sviluppo, staging e produzione)
- Analizzare i requisiti dei carichi di lavoro e abbinarli ai livelli di servizio appropriati
- Implementare strategie di ottimizzazione dei costi attraverso una selezione intelligente degli SKU
- Applicare tecniche di test delle prestazioni e validazione per le scelte degli SKU
- Configurare raccomandazioni e monitoraggio automatici degli SKU

## Risultati di Apprendimento

Al termine, sarai in grado di:
- Selezionare gli SKU dei servizi Azure appropriati in base ai requisiti e ai vincoli dei carichi di lavoro
- Progettare architetture multi-ambiente economiche con una corretta selezione dei livelli
- Implementare benchmarking delle prestazioni e validazione per le scelte degli SKU
- Creare strumenti automatizzati per raccomandazioni SKU e ottimizzazione dei costi
- Pianificare migrazioni e strategie di scalabilità degli SKU per requisiti in evoluzione
- Applicare i principi del Framework Azure Well-Architected alla selezione dei livelli di servizio

## Indice

- [Comprendere gli SKU](../../../../docs/pre-deployment)
- [Selezione Basata sull'Ambiente](../../../../docs/pre-deployment)
- [Linee Guida Specifiche per Servizio](../../../../docs/pre-deployment)
- [Strategie di Ottimizzazione dei Costi](../../../../docs/pre-deployment)
- [Considerazioni sulle Prestazioni](../../../../docs/pre-deployment)
- [Tabelle di Riferimento Rapido](../../../../docs/pre-deployment)
- [Strumenti di Validazione](../../../../docs/pre-deployment)

---

## Comprendere gli SKU

### Cosa sono gli SKU?

Gli SKU (Stock Keeping Units) rappresentano diversi livelli di servizio e prestazioni per le risorse Azure. Ogni SKU offre diverse:

- **Caratteristiche di prestazione** (CPU, memoria, throughput)
- **Disponibilità delle funzionalità** (opzioni di scalabilità, livelli SLA)
- **Modelli di prezzo** (basati sul consumo, capacità riservata)
- **Disponibilità regionale** (non tutti gli SKU sono disponibili in tutte le regioni)

### Fattori Chiave nella Selezione degli SKU

1. **Requisiti del Carico di Lavoro**
   - Modelli di traffico/carico previsti
   - Requisiti di prestazione (CPU, memoria, I/O)
   - Necessità di archiviazione e modelli di accesso

2. **Tipo di Ambiente**
   - Sviluppo/test vs. produzione
   - Requisiti di disponibilità
   - Necessità di sicurezza e conformità

3. **Vincoli di Budget**
   - Costi iniziali vs. costi operativi
   - Sconti per capacità riservata
   - Implicazioni dei costi di auto-scalabilità

4. **Proiezioni di Crescita**
   - Requisiti di scalabilità
   - Necessità future di funzionalità
   - Complessità di migrazione

---

## Selezione Basata sull'Ambiente

### Ambiente di Sviluppo

**Priorità**: Ottimizzazione dei costi, funzionalità di base, facile provisioning/de-provisioning

#### SKU Raccomandati
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

#### Caratteristiche
- **App Service**: F1 (Gratuito) o B1 (Base) per test semplici
- **Database**: Livello base con risorse minime
- **Archiviazione**: Standard con sola ridondanza locale
- **Calcolo**: Risorse condivise accettabili
- **Rete**: Configurazioni di base

### Ambiente di Staging/Test

**Priorità**: Configurazione simile alla produzione, bilanciamento dei costi, capacità di test delle prestazioni

#### SKU Raccomandati
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

#### Caratteristiche
- **Prestazioni**: 70-80% della capacità di produzione
- **Funzionalità**: La maggior parte delle funzionalità di produzione abilitate
- **Ridondanza**: Alcuna ridondanza geografica
- **Scalabilità**: Auto-scalabilità limitata per test
- **Monitoraggio**: Stack di monitoraggio completo

### Ambiente di Produzione

**Priorità**: Prestazioni, disponibilità, sicurezza, conformità, scalabilità

#### SKU Raccomandati
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

#### Caratteristiche
- **Alta disponibilità**: Requisiti SLA 99.9%+
- **Prestazioni**: Risorse dedicate, alto throughput
- **Sicurezza**: Funzionalità di sicurezza premium
- **Scalabilità**: Piena capacità di auto-scalabilità
- **Monitoraggio**: Osservabilità completa

---

## Linee Guida Specifiche per Servizio

### Azure App Service

#### Matrice di Decisione SKU

| Caso d'Uso | SKU Raccomandato | Motivazione |
|------------|------------------|-------------|
| Sviluppo/Test | F1 (Gratuito) o B1 (Base) | Economico, sufficiente per test |
| Piccole app di produzione | S1 (Standard) | Domini personalizzati, SSL, auto-scalabilità |
| App di produzione medie | P1V3 (Premium V3) | Migliori prestazioni, più funzionalità |
| App ad alto traffico | P2V3 o P3V3 | Risorse dedicate, alte prestazioni |
| App critiche | I1V2 (Isolato V2) | Isolamento di rete, hardware dedicato |

#### Esempi di Configurazione

**Sviluppo**
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

**Produzione**
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

#### Framework di Selezione SKU

1. **Basato su DTU (Database Transaction Units)**
   - **Base**: 5 DTU - Sviluppo/test
   - **Standard**: S0-S12 (10-3000 DTU) - Uso generico
   - **Premium**: P1-P15 (125-4000 DTU) - Critico per le prestazioni

2. **Basato su vCore** (Raccomandato per la produzione)
   - **Uso Generale**: Calcolo e archiviazione bilanciati
   - **Critico per il Business**: Bassa latenza, alto IOPS
   - **Hyperscale**: Archiviazione altamente scalabile (fino a 100TB)

#### Esempi di Configurazione

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

#### Tipi di Ambiente

1. **Basato sul Consumo**
   - Prezzi pay-per-use
   - Adatto per sviluppo e carichi variabili
   - Infrastruttura condivisa

2. **Dedicato (Profili di Carico)**
   - Risorse di calcolo dedicate
   - Prestazioni prevedibili
   - Migliore per carichi di produzione

#### Esempi di Configurazione

**Sviluppo (Consumo)**
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

**Produzione (Dedicato)**
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

#### Modelli di Throughput

1. **Throughput Manuale Provisionato**
   - Prestazioni prevedibili
   - Sconti per capacità riservata
   - Ideale per carichi stabili

2. **Throughput Provisionato Autoscalabile**
   - Scalabilità automatica basata sull'uso
   - Paghi solo per ciò che usi (con minimo)
   - Buono per carichi variabili

3. **Serverless**
   - Pagamento per richiesta
   - Nessun throughput provisionato
   - Ideale per sviluppo e carichi intermittenti

#### Esempi di SKU

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

#### Tipi di Account di Archiviazione

1. **Standard_LRS** - Sviluppo, dati non critici
2. **Standard_GRS** - Produzione, necessità di geo-ridondanza
3. **Premium_LRS** - Applicazioni ad alte prestazioni
4. **Premium_ZRS** - Alta disponibilità con ridondanza zonale

#### Livelli di Prestazione

- **Standard**: Uso generico, economico
- **Premium**: Scenari ad alte prestazioni, bassa latenza

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

## Strategie di Ottimizzazione dei Costi

### 1. Capacità Riservata

Riserva risorse per 1-3 anni per ottenere sconti significativi:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Dimensionamento Corretto

Inizia con SKU più piccoli e scala in base all'uso effettivo:

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

### 3. Configurazione di Auto-Scaling

Implementa scalabilità intelligente per ottimizzare i costi:

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

### 4. Scalabilità Programmata

Riduci la scala durante le ore di inattività:

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

## Considerazioni sulle Prestazioni

### Requisiti di Prestazione di Base

Definisci requisiti di prestazione chiari prima della selezione degli SKU:

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

### Test di Carico

Testa diversi SKU per validare le prestazioni:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Monitoraggio e Ottimizzazione

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

## Tabelle di Riferimento Rapido

### Riferimento Rapido SKU App Service

| SKU | Livello | vCPU | RAM | Archiviazione | Fascia di Prezzo | Caso d'Uso |
|-----|--------|------|-----|---------------|------------------|------------|
| F1 | Gratuito | Condiviso | 1GB | 1GB | Gratuito | Sviluppo |
| B1 | Base | 1 | 1.75GB | 10GB | $ | Piccole app |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Produzione |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Alte prestazioni |
| I1V2 | Isolato V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### Riferimento Rapido SKU SQL Database

| SKU | Livello | DTU/vCore | Archiviazione | Fascia di Prezzo | Caso d'Uso |
|-----|--------|-----------|---------------|------------------|------------|
| Base | Base | 5 DTU | 2GB | $ | Sviluppo |
| S2 | Standard | 50 DTU | 250GB | $$ | Piccola produzione |
| P2 | Premium | 250 DTU | 1TB | $$$ | Alte prestazioni |
| GP_Gen5_4 | Uso Generale | 4 vCore | 4TB | $$$ | Bilanciato |
| BC_Gen5_8 | Critico per il Business | 8 vCore | 4TB | $$$$ | Missione critica |

### Riferimento Rapido SKU Container Apps

| Modello | Prezzi | CPU/Memoria | Caso d'Uso |
|---------|-------|-------------|------------|
| Consumo | Pay-per-use | 0.25-2 vCPU | Sviluppo, carico variabile |
| Dedicato D4 | Riservato | 4 vCPU, 16GB | Produzione |
| Dedicato D8 | Riservato | 8 vCPU, 32GB | Alte prestazioni |

---

## Strumenti di Validazione

### Controllo Disponibilità SKU

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

### Script di Stima dei Costi

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

### Validazione delle Prestazioni

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

## Riepilogo delle Migliori Pratiche

### Cosa Fare

1. **Inizia in piccolo e scala** in base all'uso effettivo
2. **Usa SKU diversi per ambienti diversi**
3. **Monitora continuamente prestazioni e costi**
4. **Sfrutta la capacità riservata per carichi di produzione**
5. **Implementa auto-scalabilità dove appropriato**
6. **Testa le prestazioni con carichi realistici**
7. **Pianifica la crescita ma evita il sovra-provisioning**
8. **Usa livelli gratuiti per lo sviluppo quando possibile**

### Cosa Non Fare

1. **Non usare SKU di produzione per lo sviluppo**
2. **Non ignorare la disponibilità regionale degli SKU**
3. **Non dimenticare i costi di trasferimento dati**
4. **Non sovra-provisionare senza giustificazione**
5. **Non ignorare l'impatto delle dipendenze**
6. **Non impostare limiti di auto-scalabilità troppo alti**
7. **Non dimenticare i requisiti di conformità**
8. **Non prendere decisioni basate solo sul prezzo**

---

**Suggerimento Pro**: Usa Azure Cost Management e Advisor per ottenere raccomandazioni personalizzate sull'ottimizzazione delle selezioni SKU basate sui modelli di utilizzo effettivi.

---

**Navigazione**
- **Lezione Precedente**: [Pianificazione della Capacità](capacity-planning.md)
- **Lezione Successiva**: [Controlli Pre-Distribuzione](preflight-checks.md)

---

**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
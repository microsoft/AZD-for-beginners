# Guida alla Selezione SKU - Scegliere i Giusti Livelli di Servizio Azure

**Navigazione Capitolo:**
- **📚 Home del Corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo Corrente**: Capitolo 6 - Validazione e Pianificazione Pre-Deployment
- **⬅️ Precedente**: [Pianificazione della Capacità](capacity-planning.md)
- **➡️ Successivo**: [Controlli Preliminari](preflight-checks.md)
- **🚀 Prossimo Capitolo**: [Capitolo 7: Risoluzione Problemi](../chapter-07-troubleshooting/common-issues.md)

## Introduzione

Questa guida completa ti aiuta a selezionare le SKU di servizio Azure ottimali (Unità di Gestione Scorte) per diversi ambienti, carichi di lavoro e requisiti. Impara ad analizzare le esigenze di prestazioni, le considerazioni sui costi e le esigenze di scalabilità per scegliere i livelli di servizio più appropriati per le tue distribuzioni Azure Developer CLI.

## Obiettivi di Apprendimento

Completando questa guida, sarai in grado di:
- Comprendere i concetti di SKU Azure, i modelli di prezzo e le differenze di funzionalità
- Padroneggiare le strategie di selezione SKU specifiche per ambiente per sviluppo, staging e produzione
- Analizzare i requisiti dei carichi di lavoro e abbinarli ai livelli di servizio appropriati
- Implementare strategie di ottimizzazione dei costi tramite una selezione intelligente delle SKU
- Applicare tecniche di testing delle prestazioni e di validazione per le scelte SKU
- Configurare raccomandazioni SKU automatizzate e monitoraggio

## Risultati di Apprendimento

Al termine, sarai in grado di:
- Selezionare le SKU di servizio Azure appropriate in base ai requisiti e vincoli di carico di lavoro
- Progettare architetture multi-ambiente economiche con la corretta selezione del livello
- Implementare benchmarking e validazione delle prestazioni per le scelte SKU
- Creare strumenti automatizzati per la raccomandazione di SKU e ottimizzazione dei costi
- Pianificare migrazioni e strategie di scalabilità delle SKU per esigenze in evoluzione
- Applicare i principi del Framework Azure Well-Architected nella selezione dei livelli di servizio

## Indice

- [Comprendere le SKU](#understanding-skus)
- [Selezione Basata sull'Ambiente](#environment-based-selection)
- [Linee Guida Specifiche per Servizio](#service-specific-guidelines)
- [Strategie di Ottimizzazione dei Costi](#cost-optimization-strategies)
- [Considerazioni sulle Prestazioni](#performance-considerations)
- [Tabelle di Riferimento Rapido](#quick-reference-tables)
- [Strumenti di Validazione](#validation-tools)

---

## Comprendere le SKU

> **Esempio di ambito:** Le mappe YAML delle SKU e le configurazioni delle prestazioni sottostanti sono note di progettazione, non uno schema `azure.yaml` o una configurazione di uno strumento di carico. I blocchi Bicep sono alternative/frammenti: dichiarane i parametri e le risorse genitore, usa nomi simbolici unici quando li combini e collega i moduli in un progetto funzionante. Prezzi, limiti e disponibilità regione/SKU devono essere controllati per il tuo abbonamento prima della distribuzione.

### Cosa sono le SKU?

Le SKU (Unità di Gestione Scorte) rappresentano diversi livelli di servizio e livelli di prestazione per le risorse Azure. Ogni SKU offre differenti:

- **Caratteristiche di prestazione** (CPU, memoria, throughput)
- **Disponibilità delle funzionalità** (opzioni di scalabilità, livelli SLA)
- **Modelli di prezzo** (a consumo, capacità riservata)
- **Disponibilità regionale** (non tutte le SKU sono disponibili in tutte le regioni)

### Fattori Chiave nella Selezione SKU

1. **Requisiti del Carico di Lavoro**
   - Traffico/pattern di carico previsti
   - Requisiti di prestazione (CPU, memoria, I/O)
   - Necessità di archiviazione e pattern di accesso

2. **Tipo di Ambiente**
   - Sviluppo/testing vs. produzione
   - Requisiti di disponibilità
   - Necessità di sicurezza e conformità

3. **Vincoli di Budget**
   - Costi iniziali vs. costi operativi
   - Sconti per capacità riservata
   - Implicazioni dei costi di auto-scalabilità

4. **Proiezioni di Crescita**
   - Requisiti di scalabilità
   - Necessità di funzionalità future
   - Complessità di migrazione

---

## Selezione Basata sull'Ambiente

### Ambiente di Sviluppo

**Priorità**: Ottimizzazione dei costi, funzionalità di base, provisioning/deprovisioning semplice

#### SKU Consigliate
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

#### Caratteristiche
- **App Service**: F1 (Gratuito) o B1 (Base) per test semplici
- **Database**: Livello base con risorse minime
- **Storage**: Standard con ridondanza locale solo
- **Elaborazione**: Risorse condivise accettabili
- **Networking**: Configurazioni di base

### Ambiente di Staging/Testing

**Priorità**: Configurazione simile alla produzione, equilibrio costi, capacità di test delle prestazioni

#### SKU Consigliate
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

#### SKU Consigliate
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

#### Caratteristiche
- **Alta disponibilità**: Requisiti SLA 99.9%+
- **Prestazioni**: Risorse dedicate, alto throughput
- **Sicurezza**: Funzionalità di sicurezza premium
- **Scalabilità**: Capacità di auto-scalabilità completa
- **Monitoraggio**: Osservabilità completa

---

## Linee Guida Specifiche per Servizio

### Azure App Service

#### Matrice di Decisione SKU

| Caso d'Uso | SKU Consigliata | Razionale |
|----------|----------------|-----------|
| Sviluppo/Testing | F1 (Gratuito) o B1 (Base) | Economico, sufficiente per test |
| Piccole app di produzione | S1 (Standard) | Domini personalizzati, SSL, auto-scalabilità |
| Medie app di produzione | P1V3 (Premium V3) | Prestazioni migliori, più funzionalità |
| App ad alto traffico | P2V3 o P3V3 | Risorse dedicate, alte prestazioni |
| App mission-critical | I1V2 (Isolato V2) | Isolamento rete, hardware dedicato |

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
   - **Basic**: 5 DTU - Sviluppo/testing
   - **Standard**: S0-S12 (10-3000 DTU) - Uso generale
   - **Premium**: P1-P15 (125-4000 DTU) - Criticità prestazionale

2. **Basato su vCore** (Consigliato per produzione)
   - **General Purpose**: Equilibrio tra calcolo e archiviazione
   - **Business Critical**: Bassa latenza, alte IOPS
   - **Hyperscale**: Archiviazione altamente scalabile; verifica limiti attuali di dimensione e supporto regionale

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

1. **Basato su consumo**
   - Prezzo a consumo
   - Adatto per sviluppo e carichi di lavoro variabili
   - Infrastruttura condivisa

2. **Dedicato (Profili di Carico)**
   - Risorse di calcolo dedicate
   - Prestazioni prevedibili
   - Migliore per carichi di lavoro di produzione

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

**Produzione (Dedicato)**
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

La ridondanza di zona richiede inoltre infrastruttura in regioni supportate e configurazioni VNet/subnet idonee, omesse qui. Questo esempio prevede tre nodi dedicati; configura almeno due repliche dell'app per distribuzione cross-zone e dimensiona sia le repliche sia i nodi per failure di zona. Vedi [Guida di affidabilità Container Apps](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Per posizionare un'app su questo profilo, imposta il suo `workloadProfileName: 'production-profile'`; creare solo il profilo non sposta automaticamente le app.

### Azure Cosmos DB

#### Modelli di Throughput

1. **Throughput Provisionato Manuale**
   - Prestazioni prevedibili
   - Sconti per capacità riservata
   - Migliore per carichi di lavoro stabili

2. **Throughput Provisionato Autoscale**
   - Scalabilità automatica basata sull'uso
   - Paga ciò che usi (con un minimo)
   - Buono per carichi di lavoro variabili

3. **Serverless**
   - Paga per richiesta
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

#### Tipi di Storage Account

1. **Standard_LRS** - Sviluppo, dati non critici
2. **Standard_GRS** - Produzione, necessità di geo-ridondanza
3. **Premium_LRS** - Applicazioni ad alte prestazioni
4. **Premium_ZRS** - Alta disponibilità con ridondanza di zona

#### Livelli di Prestazioni

- **Standard**: Uso generale, economico
- **Premium**: Alta prestazione, scenari a bassa latenza

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

Prenota risorse per 1-3 anni per sconti significativi:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Le offerte di prenotazione e i tipi di risorse ammissibili variano; ispeziona il catalogo e i termini di acquisto invece di presumere che ogni servizio/SKU supporti una prenotazione.

### 2. Dimensionamento Corretto

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

### 3. Configurazione Auto-Scaling

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

### 4. Scalabilità Programmata

Riduci la scala durante le ore non di punta:

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

Definisci requisiti di prestazione chiari prima della selezione SKU:

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

Testa diverse SKU per convalidare le prestazioni:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### Monitoraggio e Ottimizzazione

Imposta un monitoraggio completo:

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

## Tabelle di Riferimento Rapido

### Riferimento Rapido SKU App Service

| SKU | Livello | vCPU | RAM | Storage | Fascia di Prezzo | Caso d'Uso |
|-----|--------|------|-----|---------|-----------------|------------|
| F1 | Gratuito | Condiviso | 1GB | 1GB | Gratuito | Sviluppo |
| B1 | Base | 1 | 1.75GB | 10GB | $ | Piccole app |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Produzione |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Alte prestazioni |
| I1V2 | Isolato V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### Riferimento Rapido SKU SQL Database

| SKU | Livello | DTU/vCore | Storage | Fascia di Prezzo | Caso d'Uso |
|-----|--------|-----------|---------|-----------------|------------|
| Basic | Base | 5 DTU | 2GB | $ | Sviluppo |
| S2 | Standard | 50 DTU | 250GB | $$ | Piccola produzione |
| P2 | Premium | 250 DTU | 1TB | $$$ | Alte prestazioni |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Bilanciato |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Mission critical |

### Riferimento Rapido SKU Container Apps

| Modello | Prezzi | CPU/Memoria | Caso d'Uso |
|--------|---------|------------|----------|
| Consumption | Pagamento a consumo | Combinazioni CPU/memoria supportate dipendono da ambiente/profilo | Sviluppo o produzione, carico variabile |
| Dedicated D4 | Fatturazione nodo dedicato | 4 vCPU, 16GiB per nodo | Carico sostenuto/necessità di isolamento |
| Dedicated D8 | Fatturazione nodo dedicato | 8 vCPU, 32GiB per nodo | Carico sostenuto più elevato |

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

### Script di Stima dei Costi

**Solo pseudocodice:** `Get-ResourceCost` di seguito è una funzione specifica per progetto che devi implementare usando prezzi regionali/contrattuali attuali e ipotesi di utilizzo. Non è un cmdlet PowerShell o Azure.

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

Lo YAML seguente è uno schema di requisiti, **non** uno schema di input per Azure Load Testing, JMeter, Locust o k6. Traducilo in una configurazione reale dello strumento scelto prima di usare il comando load-test sopra.

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

## Sommario delle Migliori Pratiche

### Cosa Fare

1. **Inizia in piccolo e scala in base all'uso reale**
2. **Usa SKU diverse per ambienti diversi**
3. **Monitora continuamente prestazioni e costi**
4. **Sfrutta la capacità riservata per carichi di produzione**
5. **Implementa auto-scalabilità dove appropriato**
6. **Testa le prestazioni con carichi realistici**
7. **Pianifica la crescita ma evita l'over-provisioning**
8. **Usa i livelli gratuiti per lo sviluppo quando possibile**

### Cosa Non Fare

1. **Non usare SKU di produzione per sviluppo**
2. **Non ignorare la disponibilità regionale delle SKU**
3. **Non dimenticare i costi di trasferimento dati**
4. **Non fare over-provisioning senza una giustificazione**
5. **Non ignorare l'impatto delle dipendenze**
6. **Non impostare limiti di auto-scalabilità troppo alti**
7. **Non dimenticare i requisiti di conformità**
8. **Non prendere decisioni basate solo sul prezzo**

---

**Suggerimento Professionale**: Usa Azure Cost Management e Advisor per ottenere raccomandazioni personalizzate per ottimizzare la selezione delle SKU basate sui modelli di utilizzo reali.

---

**Navigazione**
- **Lezione Precedente**: [Pianificazione della Capacità](capacity-planning.md)
- **Lezione Successiva**: [Controlli Preliminari](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
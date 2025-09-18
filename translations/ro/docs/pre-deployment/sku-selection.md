<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "952ed5af7f5db069c53a6840717e1801",
  "translation_date": "2025-09-18T11:04:12+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "ro"
}
-->
# Ghid de selecție SKU - Alegerea nivelurilor potrivite de servicii Azure

**Navigare capitole:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitol curent**: Capitolul 6 - Validare și planificare înainte de implementare
- **⬅️ Precedent**: [Planificarea capacității](capacity-planning.md)
- **➡️ Următor**: [Verificări preliminare](preflight-checks.md)
- **🚀 Capitol următor**: [Capitolul 7: Depanare](../troubleshooting/common-issues.md)

## Introducere

Acest ghid cuprinzător te ajută să selectezi SKU-uri (Stock Keeping Units) optime pentru serviciile Azure, adaptate diferitelor medii, sarcini de lucru și cerințe. Învață să analizezi nevoile de performanță, considerentele de cost și cerințele de scalabilitate pentru a alege cele mai potrivite niveluri de servicii pentru implementările tale Azure Developer CLI.

## Obiective de învățare

După parcurgerea acestui ghid, vei:
- Înțelege conceptele SKU Azure, modelele de preț și diferențele de funcționalitate
- Stăpâni strategiile de selecție SKU specifice mediului pentru dezvoltare, testare și producție
- Analiza cerințele sarcinilor de lucru și le vei potrivi cu nivelurile de servicii adecvate
- Implementa strategii de optimizare a costurilor prin selecția inteligentă a SKU-urilor
- Aplica tehnici de testare și validare a performanței pentru alegerile SKU
- Configura recomandări automate de SKU și monitorizare

## Rezultate de învățare

La final, vei fi capabil să:
- Selectezi SKU-uri Azure adecvate pe baza cerințelor și constrângerilor sarcinilor de lucru
- Proiectezi arhitecturi multi-mediu eficiente din punct de vedere al costurilor, cu selecția corectă a nivelurilor
- Implementa teste de performanță și validare pentru alegerile SKU
- Creezi instrumente automate pentru recomandări SKU și optimizarea costurilor
- Planifica migrarea SKU-urilor și strategiile de scalare pentru cerințe în schimbare
- Aplica principiile Framework-ului Azure Well-Architected la selecția nivelurilor de servicii

## Cuprins

- [Înțelegerea SKU-urilor](../../../../docs/pre-deployment)
- [Selecție bazată pe mediu](../../../../docs/pre-deployment)
- [Ghiduri specifice serviciilor](../../../../docs/pre-deployment)
- [Strategii de optimizare a costurilor](../../../../docs/pre-deployment)
- [Considerații de performanță](../../../../docs/pre-deployment)
- [Tabele de referință rapidă](../../../../docs/pre-deployment)
- [Instrumente de validare](../../../../docs/pre-deployment)

---

## Înțelegerea SKU-urilor

### Ce sunt SKU-urile?

SKU-urile (Stock Keeping Units) reprezintă diferite niveluri de servicii și performanță pentru resursele Azure. Fiecare SKU oferă diferite:

- **Caracteristici de performanță** (CPU, memorie, throughput)
- **Disponibilitate de funcționalități** (opțiuni de scalare, niveluri SLA)
- **Modele de preț** (bazate pe consum, capacitate rezervată)
- **Disponibilitate regională** (nu toate SKU-urile sunt disponibile în toate regiunile)

### Factori cheie în selecția SKU-urilor

1. **Cerințe ale sarcinilor de lucru**
   - Modele de trafic/sarcină așteptate
   - Cerințe de performanță (CPU, memorie, I/O)
   - Nevoi de stocare și modele de acces

2. **Tipul mediului**
   - Dezvoltare/testare vs. producție
   - Cerințe de disponibilitate
   - Nevoi de securitate și conformitate

3. **Constrângeri bugetare**
   - Costuri inițiale vs. costuri operaționale
   - Reduceri pentru capacitate rezervată
   - Implicații ale costurilor de auto-scalare

4. **Proiecții de creștere**
   - Cerințe de scalabilitate
   - Nevoi viitoare de funcționalități
   - Complexitatea migrației

---

## Selecție bazată pe mediu

### Mediu de dezvoltare

**Priorități**: Optimizarea costurilor, funcționalitate de bază, provisionare/deprovisionare ușoară

#### SKU-uri recomandate
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

#### Caracteristici
- **App Service**: F1 (Gratuit) sau B1 (Basic) pentru testare simplă
- **Baze de date**: Nivel de bază cu resurse minime
- **Stocare**: Standard cu redundanță locală doar
- **Compute**: Resurse partajate acceptabile
- **Rețea**: Configurații de bază

### Mediu de testare/staging

**Priorități**: Configurație similară producției, echilibru cost-performanță, capacitate de testare a performanței

#### SKU-uri recomandate
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

#### Caracteristici
- **Performanță**: 70-80% din capacitatea producției
- **Funcționalități**: Majoritatea funcționalităților producției activate
- **Redundanță**: Unele redundanțe geografice
- **Scalare**: Auto-scalare limitată pentru testare
- **Monitorizare**: Stack complet de monitorizare

### Mediu de producție

**Priorități**: Performanță, disponibilitate, securitate, conformitate, scalabilitate

#### SKU-uri recomandate
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

#### Caracteristici
- **Disponibilitate ridicată**: Cerințe SLA de 99.9%+
- **Performanță**: Resurse dedicate, throughput ridicat
- **Securitate**: Funcționalități premium de securitate
- **Scalare**: Capacități complete de auto-scalare
- **Monitorizare**: Observabilitate cuprinzătoare

---

## Ghiduri specifice serviciilor

### Azure App Service

#### Matrice de decizie SKU

| Caz de utilizare | SKU recomandat | Motivare |
|------------------|----------------|----------|
| Dezvoltare/Testare | F1 (Gratuit) sau B1 (Basic) | Cost-eficient, suficient pentru testare |
| Aplicații mici de producție | S1 (Standard) | Domenii personalizate, SSL, auto-scalare |
| Aplicații medii de producție | P1V3 (Premium V3) | Performanță mai bună, mai multe funcționalități |
| Aplicații cu trafic ridicat | P2V3 sau P3V3 | Resurse dedicate, performanță ridicată |
| Aplicații critice | I1V2 (Isolated V2) | Izolare rețea, hardware dedicat |

#### Exemple de configurații

**Dezvoltare**
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

**Producție**
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

#### Cadru de selecție SKU

1. **Bazat pe DTU (Database Transaction Units)**
   - **Basic**: 5 DTU - Dezvoltare/testare
   - **Standard**: S0-S12 (10-3000 DTU) - Scop general
   - **Premium**: P1-P15 (125-4000 DTU) - Performanță critică

2. **Bazat pe vCore** (Recomandat pentru producție)
   - **General Purpose**: Compute și stocare echilibrate
   - **Business Critical**: Latență scăzută, IOPS ridicat
   - **Hyperscale**: Stocare extrem de scalabilă (până la 100TB)

#### Exemple de configurații

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

#### Tipuri de medii

1. **Bazat pe consum**
   - Preț pe utilizare
   - Potrivit pentru dezvoltare și sarcini variabile
   - Infrastructură partajată

2. **Dedicat (Profiluri de sarcină)**
   - Resurse compute dedicate
   - Performanță previzibilă
   - Mai potrivit pentru sarcini de producție

#### Exemple de configurații

**Dezvoltare (Consum)**
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

**Producție (Dedicat)**
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

#### Modele de throughput

1. **Throughput manual provisionat**
   - Performanță previzibilă
   - Reduceri pentru capacitate rezervată
   - Cel mai bun pentru sarcini constante

2. **Throughput autoscalabil provisionat**
   - Scalare automată în funcție de utilizare
   - Plătești pentru ceea ce folosești (cu un minim)
   - Bun pentru sarcini variabile

3. **Serverless**
   - Plată per cerere
   - Fără throughput provisionat
   - Ideal pentru dezvoltare și sarcini intermitente

#### Exemple SKU

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

#### Tipuri de conturi de stocare

1. **Standard_LRS** - Dezvoltare, date non-critice
2. **Standard_GRS** - Producție, necesitate de geo-redundanță
3. **Premium_LRS** - Aplicații cu performanță ridicată
4. **Premium_ZRS** - Disponibilitate ridicată cu redundanță zonală

#### Niveluri de performanță

- **Standard**: Scop general, cost-eficient
- **Premium**: Performanță ridicată, latență scăzută

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

## Strategii de optimizare a costurilor

### 1. Capacitate rezervată

Rezervă resurse pentru 1-3 ani pentru reduceri semnificative:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Dimensionare corectă

Începe cu SKU-uri mai mici și scalează în funcție de utilizarea reală:

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

### 3. Configurare auto-scalare

Implementați scalare inteligentă pentru optimizarea costurilor:

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

### 4. Scalare programată

Redu scalarea în afara orelor de vârf:

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

## Considerații de performanță

### Cerințe de performanță de bază

Definește cerințe clare de performanță înainte de selecția SKU-urilor:

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

### Testare de sarcină

Testează diferite SKU-uri pentru validarea performanței:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Monitorizare și optimizare

Configurează monitorizare cuprinzătoare:

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

## Tabele de referință rapidă

### Referință rapidă SKU App Service

| SKU | Nivel | vCPU | RAM | Stocare | Interval de preț | Caz de utilizare |
|-----|-------|------|-----|---------|------------------|-----------------|
| F1 | Gratuit | Partajat | 1GB | 1GB | Gratuit | Dezvoltare |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Aplicații mici |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Producție |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Performanță ridicată |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### Referință rapidă SKU SQL Database

| SKU | Nivel | DTU/vCore | Stocare | Interval de preț | Caz de utilizare |
|-----|-------|-----------|---------|------------------|-----------------|
| Basic | Basic | 5 DTU | 2GB | $ | Dezvoltare |
| S2 | Standard | 50 DTU | 250GB | $$ | Producție mică |
| P2 | Premium | 250 DTU | 1TB | $$$ | Performanță ridicată |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Echilibrat |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Critic |

### Referință rapidă SKU Container Apps

| Model | Preț | CPU/Memorie | Caz de utilizare |
|-------|------|-------------|-----------------|
| Consum | Plată pe utilizare | 0.25-2 vCPU | Dezvoltare, sarcină variabilă |
| Dedicat D4 | Rezervat | 4 vCPU, 16GB | Producție |
| Dedicat D8 | Rezervat | 8 vCPU, 32GB | Performanță ridicată |

---

## Instrumente de validare

### Verificator disponibilitate SKU

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

### Script estimare costuri

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

### Validare performanță

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

## Rezumat bune practici

### Ce să faci

1. **Începe mic și scalează** în funcție de utilizarea reală
2. **Folosește SKU-uri diferite pentru medii diferite**
3. **Monitorizează performanța și costurile continuu**
4. **Profită de capacitatea rezervată pentru sarcinile de producție**
5. **Implementați auto-scalare acolo unde este potrivit**
6. **Testează performanța cu sarcini de lucru realiste**
7. **Planifică creșterea, dar evită supra-provisionarea**
8. **Folosește niveluri gratuite pentru dezvoltare, dacă este posibil**

### Ce să nu faci

1. **Nu folosi SKU-uri de producție pentru dezvoltare**
2. **Nu ignora disponibilitatea regională a SKU-urilor**
3. **Nu uita de costurile de transfer de date**
4. **Nu supra-provisiona fără justificare**
5. **Nu ignora impactul dependențelor**
6. **Nu seta limite de auto-scalare prea mari**
7. **Nu uita de cerințele de conformitate**
8. **Nu lua decizii bazate doar pe preț**

---

**Sfat util**: Folosește Azure Cost Management și Advisor pentru a obține recomandări personalizate pentru optimizarea selecției SKU-urilor pe baza modelelor reale de utilizare.

---

**Navigare**
- **Lecția precedentă**: [Planificarea capacității](capacity-planning.md)
- **Lecția următoare**: [Verificări preliminare](preflight-checks.md)

---

**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa maternă ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.
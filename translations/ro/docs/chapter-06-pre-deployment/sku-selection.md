# Ghid de selecție SKU - Alegerea nivelurilor corecte ale serviciilor Azure

**Navigare capitole:**
- **📚 Acasă curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 6 - Validarea și planificarea pre-deployment
- **⬅️ Anterior**: [Planificarea capacității](capacity-planning.md)
- **➡️ Următor**: [Verificări pre-zbor](preflight-checks.md)
- **🚀 Capitolul următor**: [Capitolul 7: Depanare](../chapter-07-troubleshooting/common-issues.md)

## Introducere

Acest ghid cuprinzător te ajută să selectezi SKU-urile optime pentru serviciile Azure (Unități de stocare a stocului) pentru diferite medii, încărcături de lucru și cerințe. Învață să analizezi nevoile de performanță, considerațiile de cost și cerințele de scalabilitate pentru a alege cele mai potrivite niveluri de servicii pentru implementările tale cu Azure Developer CLI.

## Obiective de învățare

Finalizând acest ghid, vei:
- Înțelege conceptele SKU Azure, modelele de tarifare și diferențele de funcționalitate
- Stăpâni strategiile de selecție SKU specifice mediului pentru dezvoltare, staging și producție
- Analiza cerințele încărcărilor de lucru și le vei asocia nivelurilor de servicii potrivite
- Implementa strategii de optimizare a costurilor prin selecția inteligentă a SKU-urilor
- Aplica tehnici de testare a performanței și validare pentru selecția SKU-urilor
- Configura recomandări și monitorizare automată a SKU-urilor

## Rezultate de învățare

La final vei putea:
- Selecta SKU-urile potrivite pentru serviciile Azure bazate pe cerințele și constrângerile încărcărilor de lucru
- Proiecta arhitecturi multi-mediu eficiente din punct de vedere al costurilor cu selecția corectă a nivelurilor
- Implementa benchmark-uri de performanță și validare pentru selecția SKU-urilor
- Crea unelte automate pentru recomandarea SKU-urilor și optimizarea costurilor
- Planifica migrații și strategii de scalare a SKU-urilor pentru cerințe în schimbare
- Aplica principiile Azure Well-Architected Framework la selecția nivelurilor de servicii

## Cuprins

- [Înțelegerea SKU-urilor](#understanding-skus)
- [Selecția bazată pe mediu](#environment-based-selection)
- [Ghiduri specifice serviciilor](#service-specific-guidelines)
- [Strategii de optimizare a costurilor](#cost-optimization-strategies)
- [Considerații privind performanța](#performance-considerations)
- [Tabele de referință rapidă](#quick-reference-tables)
- [Unelte de validare](#validation-tools)

---

## Înțelegerea SKU-urilor

> **Exemplu de sferă:** Mapările YAML pentru SKU-uri și configurațiile de performanță de mai jos sunt note de design, nu un `azure.yaml` schemă sau o configurație a unui instrument de încărcare. Blocurile Bicep sunt alternative/fragmente: declari parametrii și resursele părinte, folosește nume simbolice unice când le combini și conectează modulele într-un proiect funcțional. Prețurile, limitele și disponibilitatea pentru regiune/SKU trebuie verificate pentru abonamentul tău înainte de implementare.

### Ce sunt SKU-urile?

SKU-urile (Unități de stocare a stocului) reprezintă diferite niveluri de servicii și niveluri de performanță pentru resursele Azure. Fiecare SKU oferă diferite:

- **Caracteristici de performanță** (CPU, memorie, debit)
- **Disponibilitate a caracteristicilor** (opțiuni de scalare, niveluri SLA)
- **Modele de tarifare** (pe consum, capacitate rezervată)
- **Disponibilitate regională** (nu toate SKU-urile sunt disponibile în toate regiunile)

### Factori cheie în selecția SKU-urilor

1. **Cerințele încărcărilor de lucru**
   - Modele de trafic/încărcare așteptate
   - Cerințe de performanță (CPU, memorie, I/O)
   - Nevoi de stocare și modele de acces

2. **Tipul mediului**
   - Dezvoltare/testare vs. producție
   - Cerințe de disponibilitate
   - Nevoi de securitate și conformitate

3. **Constrângeri bugetare**
   - Costuri inițiale vs costuri operaționale
   - Discount-uri pentru capacitate rezervată
   - Implicațiile costurilor auto-scalării

4. **Prognoze de creștere**
   - Cerințe de scalabilitate
   - Nevoi de funcționalități viitoare
   - Complexitatea migrației

---

## Selecția bazată pe mediu

### Mediu de dezvoltare

**Priorități**: Optimizarea costurilor, funcționalitate de bază, aprovizionare/dezaprovisionare ușoară

#### SKU-uri recomandate
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

#### Caracteristici
- **App Service**: F1 (Free) sau B1 (Basic) pentru testare simplă
- **Baze de date**: nivel de bază cu resurse minime
- **Stocare**: Standard cu redundanță locală doar
- **Calcul**: Resurse partajate acceptabile
- **Rețea**: Configurații de bază

### Mediu de staging/testare

**Priorități**: Configurație similară producției, echilibru cost/performance, capacitate testare performanță

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
- **Caracteristici**: Cele mai multe caracteristici de producție activate
- **Redundanță**: Redundanță geografică parțială
- **Scalare**: Auto-scalare limitată pentru teste
- **Monitorizare**: Stivă completă de monitorizare

### Mediu de producție

**Priorități**: Performanță, disponibilitate, securitate, conformitate, scalabilitate

#### SKU-uri recomandate
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

#### Caracteristici
- **Înaltă disponibilitate**: Cerințe SLA de peste 99,9%
- **Performanță**: Resurse dedicate, debit ridicat
- **Securitate**: Funcții premium de securitate
- **Scalare**: Capacități complete de auto-scalare
- **Monitorizare**: Observabilitate cuprinzătoare

---

## Ghiduri specifice serviciilor

### Azure App Service

#### Matrice decizională SKU

| Caz de utilizare | SKU recomandat | Raționament |
|----------|----------------|-----------|
| Dezvoltare/Testare | F1 (Free) sau B1 (Basic) | Cost-eficient, suficient pentru testare |
| Aplicații mici de producție | S1 (Standard) | Domenii personalizate, SSL, auto-scalare |
| Aplicații medii de producție | P1V3 (Premium V3) | Performanță mai bună, mai multe funcții |
| Aplicații cu trafic mare | P2V3 sau P3V3 | Resurse dedicate, performanță ridicată |
| Aplicații critice de misiune | I1V2 (Isolat V2) | Izolare rețea, hardware dedicat |

#### Exemple de configurare

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

1. **Pe bază de DTU (Unități de tranzacții pe bază de date)**
   - **Basic**: 5 DTU - Dezvoltare/testare
   - **Standard**: S0-S12 (10-3000 DTU) - Scop general
   - **Premium**: P1-P15 (125-4000 DTU) - Critic pentru performanță

2. **Pe bază de vCore** (Recomandat pentru producție)
   - **General Purpose**: Calcul și stocare echilibrate
   - **Business Critical**: Latență scăzută, IOPS ridicate
   - **Hyperscale**: Stocare foarte scalabilă; verifică limitele curente de dimensiune și suportul regional

#### Exemple de configurare

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

1. **Pe bază de consum**
   - Tarifare pay-per-use
   - Potrivit pentru dezvoltare și încărcături de lucru variabile
   - Infrastructură partajată

2. **Dedicat (profiluri de încărcătură)**
   - Resurse de calcul dedicate
   - Performanță predictibilă
   - Mai bun pentru încărcături de producție

#### Exemple de configurare

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

**Producție (Dedicat)**
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

Redundanța zonală necesită, de asemenea, infrastructură în regiuni suportate și o configurare VNet/subnet corespunzătoare, omise aici. Acest exemplu alocă trei noduri dedicate; configurează cel puțin două replici de aplicație pentru distribuție cross-zone și dimensionează atât replicile, cât și nodurile pentru toleranța la defectarea unei zone. Vezi [ghidul de fiabilitate Container Apps](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Pentru a plasa o aplicație pe acest profil, setează-i `workloadProfileName: 'production-profile'`; crearea profilului singur nu mută aplicațiile pe acesta.

### Azure Cosmos DB

#### Modele de throughput

1. **Throughput provisionat manual**
   - Performanță previzibilă
   - Discounturi pentru capacitate rezervată
   - Cel mai bun pentru încărcături constante

2. **Throughput provisionat cu autoscalare**
   - Scalare automată bazată pe utilizare
   - Plătești pentru ce folosești (cu minim)
   - Bun pentru încărcături variabile

3. **Serverless**
   - Plată pe cerere
   - Fără throughput provisionat
   - Ideal pentru dezvoltare și încărcături intermitente

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

#### Tipuri cont stocare

1. **Standard_LRS** - Dezvoltare, date necritice
2. **Standard_GRS** - Producție, nevoie de geo-redundanță
3. **Premium_LRS** - Aplicații cu performanță înaltă
4. **Premium_ZRS** - Disponibilitate înaltă cu redundanță zonală

#### Niveluri de performanță

- **Standard**: Scop general, cost-eficient
- **Premium**: Scenarii de performanță ridicată, latență scăzută

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
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Ofertele de rezervare și tipurile de resurse eligibile variază; inspectează catalogul și condițiile de achiziție în loc să presupui că fiecare serviciu/SKU suportă rezervarea.

### 2. Dimensionare corectă

Începe cu SKU-uri mai mici și crește în funcție de utilizarea efectivă:

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

### 3. Configurare Auto-scaling

Implementează scalare inteligentă pentru optimizarea costurilor:

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

### 4. Scalare programată

Redu scalarea în timpul orelor neocupate:

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

## Considerații privind performanța

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

### Testare de încărcare

Testează diferite SKU-uri pentru a valida performanța:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### Monitorizare și optimizare

Configurează o monitorizare cuprinzătoare:

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

## Tabele de referință rapidă

### Referință rapidă SKU App Service

| SKU | Nivel | vCPU | RAM | Stocare | Interval preț | Caz de utilizare |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Partajat | 1GB | 1GB | Gratuit | Dezvoltare |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Aplicații mici |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Producție |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Performanță ridicată |
| I1V2 | Isolat V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### Referință rapidă SKU SQL Database

| SKU | Nivel | DTU/vCore | Stocare | Interval preț | Caz de utilizare |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Dezvoltare |
| S2 | Standard | 50 DTU | 250GB | $$ | Producție mică |
| P2 | Premium | 250 DTU | 1TB | $$$ | Performanță ridicată |
| GP_Gen5_4 | Scop general | 4 vCore | 4TB | $$$ | Echilibrat |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Misiune critică |

### Referință rapidă SKU Container Apps

| Model | Tarifare | CPU/Memorie | Caz de utilizare |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | Combinatii CPU/memorie suportate depind de mediu/profil | Dezvoltare sau producție, încărcătură variabilă |
| Dedicated D4 | Facturare nod dedicat | 4 vCPU, 16GiB per nod | Încărcătură susținută/nevoi izolare |
| Dedicated D8 | Facturare nod dedicat | 8 vCPU, 32GiB per nod | Încărcătură susținută mai mare |

---

## Unelte de validare

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

### Script estimare costuri

**Doar pseudocod:** `Get-ResourceCost` de mai jos este o funcție specifică proiectului pe care trebuie să o implementezi folosind prețurile regionale/contractuale și presupunerile de utilizare actuale. Nu este un cmdlet PowerShell sau Azure.

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

### Validarea performanței

YAML-ul următor este o schiță a cerințelor, **nu** o schemă de input pentru Azure Load Testing, JMeter, Locust sau k6. Traduce-o în configurația reală a uneletei alese înainte de a folosi comanda load-test de mai sus.

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

1. **Începe mic și scalează în sus** conform utilizării reale
2. **Folosește SKU-uri diferite pentru medii diferite**
3. **Monitorizează continuu performanța și costurile**
4. **Profită de capacitatea rezervată pentru încărcături de producție**
5. **Implementează auto-scalare unde este potrivit**
6. **Testează performanța cu încărcături realiste**
7. **Planifică pentru creștere, dar evită supra-provizionarea**
8. **Folosește nivelurile gratuite pentru dezvoltare când este posibil**

### Ce să nu faci

1. **Nu folosi SKU-urile de producție pentru dezvoltare**
2. **Nu ignora disponibilitatea SKU-urilor regionale**
3. **Nu uita de costurile transferului de date**
4. **Nu supra-provizionează fără justificare**
5. **Nu ignora impactul dependențelor**
6. **Nu seta limitele auto-scalării prea sus**
7. **Nu uita de cerințele de conformitate**
8. **Nu lua decizii bazate doar pe preț**

---

**Sfat profesionist**: Folosește Azure Cost Management și Advisor pentru a obține recomandări personalizate pentru optimizarea selecțiilor SKU bazate pe modelele reale de utilizare.

---

**Navigare**
- **Lecția anterioară**: [Planificarea capacității](capacity-planning.md)
- **Lecția următoare**: [Verificări pre-zbor](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Ghid de selecție a SKU-urilor - Alegerea nivelurilor potrivite de servicii Azure

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Capitolul 6 - Validare și planificare înainte de implementare
- **⬅️ Previous**: [Capacity Planning](capacity-planning.md)
- **➡️ Next**: [Pre-flight Checks](preflight-checks.md)
- **🚀 Next Chapter**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

## Introducere

Acest ghid cuprinzător te ajută să selectezi SKU-urile (Stock Keeping Units) optime pentru serviciile Azure în funcție de diferite medii, sarcini de lucru și cerințe. Învață să analizezi necesitățile de performanță, considerațiile de cost și cerințele de scalabilitate pentru a alege nivelurile de serviciu cele mai potrivite pentru implementările tale cu Azure Developer CLI.

## Obiective de învățare

După parcurgerea acestui ghid, vei:
- Înțelege conceptele SKU-urilor Azure, modelele de tarifare și diferențele de funcționalitate
- Stăpâni strategii de selecție a SKU-urilor specifice mediului pentru dezvoltare, staging și producție
- Analiza cerințele sarcinilor de lucru și le vei potrivi la nivelurile de serviciu adecvate
- Implementa strategii de optimizare a costurilor prin selecția inteligentă a SKU-urilor
- Aplica tehnici de testare a performanței și validare pentru alegerile SKU
- Configura recomandări automate de SKU și monitorizare

## Rezultate ale învățării

La finalizare, vei fi capabil să:
- Selectezi SKU-urile Azure potrivite pe baza cerințelor și constrângerilor de sarcină de lucru
- Proiectezi arhitecturi multi-mediu rentabile cu selecția corectă a nivelurilor
- Implementezi benchmark-uri de performanță și validare pentru alegerile de SKU
- Creezi unelte automate pentru recomandarea SKU-urilor și optimizarea costurilor
- Planifici migrarea SKU-urilor și strategiile de scalare pentru cerințe în schimbare
- Aplici principiile Azure Well-Architected Framework la selecția nivelurilor de serviciu

## Cuprins

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

SKU-urile (Stock Keeping Units) reprezintă diferite niveluri de servicii și niveluri de performanță pentru resursele Azure. Fiecare SKU oferă diferențe în:

- **Caracteristici de performanță** (CPU, memorie, debit)
- **Disponibilitatea funcționalităților** (opțiuni de scalare, niveluri SLA)
- **Modele de tarifare** (pe consum, capacitate rezervată)
- **Disponibilitate regională** (nu toate SKU-urile sunt disponibile în toate regiunile)

### Factori cheie în selecția SKU-urilor

1. **Cerințe ale sarcinii de lucru**
   - Modelele de trafic/sarcină așteptate
   - Cerințele de performanță (CPU, memorie, I/O)
   - Nevoi de stocare și modele de acces

2. **Tipul mediului**
   - Dezvoltare/testare vs. producție
   - Cerințe de disponibilitate
   - Nevoi de securitate și conformitate

3. **Constrângeri bugetare**
   - Costuri inițiale vs. costuri operaționale
   - Reduceri pentru capacitate rezervată
   - Implicații ale costurilor pentru autoscalare

4. **Proiecții de creștere**
   - Cerințe de scalabilitate
   - Nevoi viitoare de funcționalități
   - Complexitatea migrației

---

## Environment-Based Selection

### Development Environment

**Priorități**: Optimizarea costurilor, funcționalitate de bază, provisionare și dezalocare ușoară

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

#### Caracteristici
- **App Service**: F1 (Free) or B1 (Basic) pentru testare simplă
- **Databases**: nivel Basic cu resurse minime
- **Storage**: Standard cu redundanță locală doar
- **Compute**: Resurse partajate sunt acceptabile
- **Networking**: Configurații de bază

### Staging/Testing Environment

**Priorități**: Configurație similară producției, echilibru între cost și performanță, capabilități de testare a performanței

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

#### Caracteristici
- **Performanță**: 70-80% din capacitatea de producție
- **Funcționalități**: Majoritatea funcționalităților de producție activate
- **Redundanță**: Unele redundanțe geografice
- **Scalare**: Autoscalare limitată pentru testare
- **Monitorizare**: Stack complet de monitorizare

### Production Environment

**Priorități**: Performanță, disponibilitate, securitate, conformitate, scalabilitate

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

#### Caracteristici
- **Disponibilitate ridicată**: Cerințe SLA de 99,9%+
- **Performanță**: Resurse dedicate, debit mare
- **Securitate**: Funcționalități premium de securitate
- **Scalare**: Capabilități complete de autoscalare
- **Monitorizare**: Observabilitate cuprinzătoare

---

## Service-Specific Guidelines

### Azure App Service

#### SKU Decision Matrix

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | Cost-effective, suficient pentru testare |
| Small production apps | S1 (Standard) | Domenii personalizate, SSL, autoscalare |
| Medium production apps | P1V3 (Premium V3) | Performanță mai bună, mai multe funcționalități |
| High-traffic apps | P2V3 or P3V3 | Resurse dedicate, performanță ridicată |
| Mission-critical apps | I1V2 (Isolated V2) | Izolare de rețea, hardware dedicat |

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

1. **DTU-based (Database Transaction Units)**
   - **Basic**: 5 DTU - Dezvoltare/testare
   - **Standard**: S0-S12 (10-3000 DTU) - Scop general
   - **Premium**: P1-P15 (125-4000 DTU) - Critic pentru performanță

2. **vCore-based** (Recomandat pentru producție)
   - **General Purpose**: Compute și stocare echilibrate
   - **Business Critical**: Latență redusă, IOPS ridicate
   - **Hyperscale**: Stocare foarte scalabilă (până la 100TB)

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

#### Environment Types

1. **Consumption-based**
   - Tarifare la consum
   - Potrivit pentru dezvoltare și sarcini de lucru variabile
   - Infrastructură partajată

2. **Dedicated (Workload Profiles)**
   - Resurse de calcul dedicate
   - Performanță predictibilă
   - Mai potrivit pentru sarcini de producție

#### Exemple de configurare

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

1. **Manual Provisioned Throughput**
   - Performanță predictibilă
   - Reduceri pentru capacitate rezervată
   - Cel mai bun pentru sarcini constante

2. **Autoscale Provisioned Throughput**
   - Scalare automată în funcție de utilizare
   - Plătești pentru ceea ce folosești (cu un minim)
   - Bun pentru sarcini variabile

3. **Serverless**
   - Plată per cerere
   - Fără throughput provisionat
   - Ideal pentru dezvoltare și sarcini intermitente

#### Exemple de SKU

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

#### Storage Account Types

1. **Standard_LRS** - Dezvoltare, date non-critice
2. **Standard_GRS** - Producție, necesită redundanță geo
3. **Premium_LRS** - Aplicații high-performance
4. **Premium_ZRS** - Disponibilitate ridicată cu redundanță pe zone

#### Performance Tiers

- **Standard**: Scop general, rentabil
- **Premium**: Performanță ridicată, scenarii cu latență redusă

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

## Cost Optimization Strategies

### 1. Reserved Capacity

Rezervă resurse pe 1-3 ani pentru reduceri semnificative:

```bash
# Verificați opțiunile de rezervare
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Right-Sizing

Începe cu SKU-uri mai mici și scalează în sus pe baza utilizării reale:

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

### 3. Auto-Scaling Configuration

Implementă scalare inteligentă pentru a optimiza costurile:

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

### 4. Scheduled Scaling

Scalează în jos în timpul orelor de inactivitate:

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

## Performance Considerations

### Baseline Performance Requirements

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

### Load Testing

Testează diferite SKU-uri pentru a valida performanța:

```bash
# Serviciul Azure Load Testing
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Monitoring and Optimization

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

## Quick Reference Tables

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
| Consumption | Pay-per-use | 0.25-2 vCPU | Development, variable load |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Production |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | High performance |

---

## Validation Tools

### SKU Availability Checker

```bash
#!/bin/bash
# Verifică disponibilitatea SKU-urilor în regiunea țintă

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

# Utilizare
check_sku_availability "eastus" "app-service" "P1V3"
```

### Cost Estimation Script

```powershell
# Script PowerShell pentru estimarea costurilor
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
        
        # Folosiți API-ul de prețuri Azure sau calculatorul
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Utilizare
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

## Rezumat al celor mai bune practici

### De făcut

1. **Start small and scale up** pe baza utilizării reale
2. **Use different SKUs for different environments**
3. **Monitor performance and costs continuously**
4. **Leverage reserved capacity for production workloads**
5. **Implement auto-scaling where appropriate**
6. **Test performance with realistic workloads**
7. **Plan for growth but avoid over-provisioning**
8. **Use free tiers for development when possible**

### De evitat

1. **Don't use production SKUs for development**
2. **Don't ignore regional SKU availability**
3. **Don't forget about data transfer costs**
4. **Don't over-provision without justification**
5. **Don't ignore the impact of dependencies**
6. **Don't set auto-scaling limits too high**
7. **Don't forget about compliance requirements**
8. **Don't make decisions based on price alone**

---

**Sfat profesional**: Folosește Azure Cost Management și Advisor pentru a obține recomandări personalizate pentru optimizarea selecțiilor de SKU în funcție de tiparele reale de utilizare.

---

**Navigation**
- **Previous Lesson**: [Capacity Planning](capacity-planning.md)
- **Next Lesson**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original, în limba sa originală, trebuie considerat sursa autoritară. Pentru informații critice, se recomandă o traducere profesională realizată de un traducător uman. Nu ne asumăm răspunderea pentru orice neînțelegeri sau interpretări greșite care rezultă din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
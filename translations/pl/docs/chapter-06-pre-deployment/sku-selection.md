# SKU Selection Guide - Wybór odpowiednich poziomów usług Azure

**Nawigacja po rozdziale:**
- **📚 Strona kursu**: [AZD Dla Początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 6 - Walidacja i planowanie przed wdrożeniem
- **⬅️ Poprzedni**: [Planowanie pojemności](capacity-planning.md)
- **➡️ Następny**: [Kontrole przed wdrożeniem](preflight-checks.md)
- **🚀 Następny rozdział**: [Rozdział 7: Rozwiązywanie problemów](../chapter-07-troubleshooting/common-issues.md)

## Wprowadzenie

Ten kompleksowy przewodnik pomaga dobrać optymalne SKU usług Azure (Stock Keeping Units) dla różnych środowisk, obciążeń i wymagań. Nauczysz się analizować potrzeby wydajnościowe, aspekty kosztów i wymagania skalowalności, aby wybrać najbardziej odpowiednie poziomy usług dla wdrożeń Azure Developer CLI.

## Cele szkoleniowe

Po ukończeniu tego przewodnika:
- Zrozumiesz koncepcje SKU Azure, modele cenowe i różnice w funkcjach
- Opanujesz strategie wyboru SKU specyficzne dla środowisk: deweloperskiego, stagingowego i produkcyjnego
- Przeanalizujesz wymagania obciążeń i dopasujesz je do odpowiednich poziomów usług
- Wdrążysz strategie optymalizacji kosztów poprzez inteligentny wybór SKU
- Zastosujesz techniki testowania wydajności i walidacji wyborów SKU
- Skonfigurujesz automatyczne rekomendacje SKU i monitoring

## Efekty uczenia się

Po ukończeniu będziesz potrafił:
- Dobierać odpowiednie SKU usług Azure na podstawie wymagań i ograniczeń obciążenia
- Projektować efektywne kosztowo architektury wielośrodowiskowe z właściwym doborem poziomów
- Wdrażać benchmarking wydajności i walidację wyborów SKU
- Tworzyć narzędzia automatycznego rekomendowania SKU i optymalizacji kosztów
- Planować migracje SKU i strategie skalowania dla zmieniających się wymagań
- Stosować zasady Azure Well-Architected Framework przy wyborze poziomów usług

## Spis treści

- [Zrozumienie SKU](../../../../docs/chapter-06-pre-deployment)
- [Wybór zależny od środowiska](../../../../docs/chapter-06-pre-deployment)
- [Wytyczne dla poszczególnych usług](../../../../docs/chapter-06-pre-deployment)
- [Strategie optymalizacji kosztów](../../../../docs/chapter-06-pre-deployment)
- [Kwestie związane z wydajnością](../../../../docs/chapter-06-pre-deployment)
- [Szybkie tabele referencyjne](../../../../docs/chapter-06-pre-deployment)
- [Narzędzia do walidacji](../../../../docs/chapter-06-pre-deployment)

---

## Zrozumienie SKU

### Czym są SKU?

SKU (Stock Keeping Units) reprezentują różne poziomy usług i poziomy wydajności dla zasobów Azure. Każde SKU oferuje różne:

- **Charakterystyki wydajności** (CPU, pamięć, przepustowość)
- **Dostępność funkcji** (opcje skalowania, poziomy SLA)
- **Modele cenowe** (płatność za zużycie, zarezerwowana pojemność)
- **Dostępność regionalna** (nie wszystkie SKU są dostępne we wszystkich regionach)

### Kluczowe czynniki przy wyborze SKU

1. **Wymagania obciążenia**
   - Oczekiwany ruch/wzorce obciążenia
   - Wymagania wydajności (CPU, pamięć, I/O)
   - Potrzeby dotyczące przechowywania i wzorce dostępu

2. **Typ środowiska**
   - Deweloperskie/testowe vs. produkcyjne
   - Wymagania dotyczące dostępności
   - Potrzeby związane z bezpieczeństwem i zgodnością

3. **Ograniczenia budżetowe**
   - Koszty początkowe vs. koszty operacyjne
   - Rabaty za zarezerwowaną pojemność
   - Skutki kosztowe auto-scalingu

4. **Prognozy wzrostu**
   - Wymagania skalowalności
   - Przyszłe potrzeby funkcjonalne
   - Złożoność migracji

---

## Wybór zależny od środowiska

### Środowisko deweloperskie

**Priorytety**: Optymalizacja kosztów, podstawowa funkcjonalność, łatwe tworzenie/usuwanie zasobów

#### Zalecane SKU
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

#### Charakterystyka
- **App Service**: F1 (Free) lub B1 (Basic) do prostego testowania
- **Bazy danych**: Poziom Basic z minimalnymi zasobami
- **Pamięć**: Standard z lokalną redundancją tylko
- **Obliczenia**: Akceptowalne współdzielone zasoby
- **Sieć**: Podstawowe konfiguracje

### Środowisko staging/testowe

**Priorytety**: Konfiguracja podobna do produkcji, bilans kosztów, możliwość testowania wydajności

#### Zalecane SKU
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

#### Charakterystyka
- **Wydajność**: 70-80% pojemności produkcyjnej
- **Funkcje**: Większość funkcji produkcyjnych włączona
- **Redundancja**: Częściowa redundancja geograficzna
- **Skalowanie**: Ograniczony auto-scaling do testów
- **Monitorowanie**: Pełny stos monitoringu

### Środowisko produkcyjne

**Priorytety**: Wydajność, dostępność, bezpieczeństwo, zgodność, skalowalność

#### Zalecane SKU
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

#### Charakterystyka
- **Wysoka dostępność**: Wymagania SLA 99.9%+
- **Wydajność**: Dedykowane zasoby, duża przepustowość
- **Bezpieczeństwo**: Funkcje bezpieczeństwa premium
- **Skalowanie**: Pełne możliwości auto-scalingu
- **Monitorowanie**: Kompleksowa obserwowalność

---

## Wytyczne dla poszczególnych usług

### Azure App Service

#### Macierz decyzji dotycząca SKU

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | Cost-effective, sufficient for testing |
| Small production apps | S1 (Standard) | Custom domains, SSL, auto-scaling |
| Medium production apps | P1V3 (Premium V3) | Better performance, more features |
| High-traffic apps | P2V3 or P3V3 | Dedicated resources, high performance |
| Mission-critical apps | I1V2 (Isolated V2) | Network isolation, dedicated hardware |

#### Przykłady konfiguracji

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

#### Ramy wyboru SKU

1. **Oparte na DTU (Database Transaction Units)**
   - **Basic**: 5 DTU - Deweloperka/testy
   - **Standard**: S0-S12 (10-3000 DTU) - Ogólne zastosowania
   - **Premium**: P1-P15 (125-4000 DTU) - Krytyczne pod względem wydajności

2. **Oparte na vCore** (zalecane dla produkcji)
   - **General Purpose**: Zrównoważone obliczenia i pamięć masowa
   - **Business Critical**: Niskie opóźnienia, wysoki IOPS
   - **Hyperscale**: Wysoce skalowalna pamięć masowa (do 100TB)

#### Przykładowe konfiguracje

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

#### Typy środowisk

1. **Oparte na zużyciu (Consumption)**
   - Płatność za użycie
   - Odpowiednie dla deweloperki i zmiennych obciążeń
   - Wspólna infrastruktura

2. **Dedykowane (Profile obciążenia)**
   - Dedykowane zasoby obliczeniowe
   - Przewidywalna wydajność
   - Lepsze dla obciążeń produkcyjnych

#### Przykłady konfiguracji

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

#### Modele przepustowości

1. **Ręcznie przydzielona przepustowość**
   - Przewidywalna wydajność
   - Rabaty za zarezerwowaną pojemność
   - Najlepsze dla stabilnych obciążeń

2. **Autoscale Provisioned Throughput**
   - Automatyczne skalowanie na podstawie użycia
   - Płacisz za to, czego używasz (z minimalnym progiem)
   - Dobre dla zmiennych obciążeń

3. **Serverless**
   - Płatność za żądanie
   - Brak przydzielonej przepustowości
   - Idealne dla deweloperki i przerywanych obciążeń

#### Przykłady SKU

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

#### Typy kont magazynowych

1. **Standard_LRS** - Deweloperka, dane niekrytyczne
2. **Standard_GRS** - Produkcja, wymagania geo-redundancji
3. **Premium_LRS** - Aplikacje o wysokiej wydajności
4. **Premium_ZRS** - Wysoka dostępność z redundancją strefową

#### Poziomy wydajności

- **Standard**: Ogólnego przeznaczenia, opłacalny
- **Premium**: Wysoka wydajność, scenariusze niskich opóźnień

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

## Strategie optymalizacji kosztów

### 1. Zarezerwowana pojemność

Zarezerwuj zasoby na 1-3 lata, aby uzyskać znaczące rabaty:

```bash
# Sprawdź opcje rezerwacji
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Dobre dopasowanie rozmiaru (Right-Sizing)

Zacznij od mniejszych SKU i skaluj w górę na podstawie rzeczywistego użycia:

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

### 3. Konfiguracja auto-scalingu

Wdróż inteligentne skalowanie, aby zoptymalizować koszty:

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

### 4. Skalowanie zaplanowane

Zmniejsz zasoby poza godzinami szczytu:

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

## Kwestie związane z wydajnością

### Wymagania bazowe dotyczące wydajności

Zdefiniuj jasne wymagania wydajności przed wyborem SKU:

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

### Testy obciążeniowe

Testuj różne SKU, aby zweryfikować wydajność:

```bash
# Usługa Azure Load Testing
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Monitorowanie i optymalizacja

Skonfiguruj kompleksowe monitorowanie:

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

## Szybkie tabele referencyjne

### Szybka referencja SKU App Service

| SKU | Tier | vCPU | RAM | Storage | Price Range | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | Development |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Small apps |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Production |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | High performance |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### Szybka referencja SKU SQL Database

| SKU | Tier | DTU/vCore | Storage | Price Range | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Development |
| S2 | Standard | 50 DTU | 250GB | $$ | Small production |
| P2 | Premium | 250 DTU | 1TB | $$$ | High performance |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Balanced |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Mission critical |

### Szybka referencja SKU Container Apps

| Model | Pricing | CPU/Memory | Use Case |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Development, variable load |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Production |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | High performance |

---

## Narzędzia do walidacji

### SKU Availability Checker

```bash
#!/bin/bash
# Sprawdź dostępność SKU w docelowym regionie

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

# Użycie
check_sku_availability "eastus" "app-service" "P1V3"
```

### Skrypt do szacowania kosztów

```powershell
# Skrypt PowerShell do szacowania kosztów
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
        
        # Użyj Azure Pricing API lub kalkulatora
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Użycie
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### Walidacja wydajności

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

## Podsumowanie najlepszych praktyk

### Co robić

1. **Zacznij od małego i skaluj w górę** na podstawie rzeczywistego użycia
2. **Używaj różnych SKU dla różnych środowisk**
3. **Monitoruj wydajność i koszty nieustannie**
4. **Wykorzystuj zarezerwowaną pojemność dla obciążeń produkcyjnych**
5. **Wdróż auto-scaling tam, gdzie to właściwe**
6. **Testuj wydajność z realistycznymi obciążeniami**
7. **Planuj wzrost, ale unikaj nadmiernego przydzielania zasobów**
8. **Używaj darmowych poziomów dla deweloperki, gdy to możliwe**

### Czego nie robić

1. **Nie używaj SKU produkcyjnych w środowisku deweloperskim**
2. **Nie ignoruj dostępności SKU w regionach**
3. **Nie zapominaj o kosztach transferu danych**
4. **Nie nadmiernie przydzielaj zasoby bez uzasadnienia**
5. **Nie ignoruj wpływu zależności**
6. **Nie ustawiaj limitów auto-scalingu zbyt wysoko**
7. **Nie zapominaj o wymaganiach zgodności**
8. **Nie podejmuj decyzji wyłącznie na podstawie ceny**

---

**Wskazówka**: Użyj Azure Cost Management i Advisor, aby uzyskać spersonalizowane rekomendacje optymalizacji wyboru SKU na podstawie rzeczywistych wzorców użycia.

---

**Nawigacja**
- **Poprzednia lekcja**: [Planowanie pojemności](capacity-planning.md)
- **Następna lekcja**: [Kontrole przed wdrożeniem](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Wyłączenie odpowiedzialności:
Niniejszy dokument został przetłumaczony przy użyciu usługi tłumaczeń opartych na sztucznej inteligencji Co-op Translator (https://github.com/Azure/co-op-translator). Chociaż dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w języku źródłowym powinien być uznawany za wersję wiążącą. W przypadku informacji o krytycznym znaczeniu zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
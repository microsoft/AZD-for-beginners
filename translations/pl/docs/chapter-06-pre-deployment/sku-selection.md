# Przewodnik po wyborze SKU - Wybór odpowiednich poziomów usług Azure

**Nawigacja po rozdziale:**
- **📚 Strona kursu**: [AZD Dla Początkujących](../../README.md)
- **📖 Aktualny rozdział**: Rozdział 6 - Walidacja i planowanie przed wdrożeniem
- **⬅️ Poprzedni**: [Planowanie pojemności](capacity-planning.md)
- **➡️ Następny**: [Kontrole przed uruchomieniem](preflight-checks.md)
- **🚀 Następny rozdział**: [Rozdział 7: Rozwiązywanie problemów](../chapter-07-troubleshooting/common-issues.md)

## Wprowadzenie

Ten kompleksowy przewodnik pomaga wybrać optymalne SKU usług Azure (jednostki magazynowe) dla różnych środowisk, obciążeń i wymagań. Naucz się analizować potrzeby dotyczące wydajności, koszty i wymagania dotyczące skalowalności, aby wybrać najbardziej odpowiednie poziomy usług dla wdrożeń Azure Developer CLI.

## Cele nauki

Po ukończeniu tego przewodnika będziesz:
- Rozumieć koncepcje SKU Azure, modele wyceny i różnice funkcji
- Opanować strategie wyboru SKU specyficzne dla środowiska, dla rozwoju, testów i produkcji
- Analizować wymagania obciążeń i dopasowywać je do odpowiednich poziomów usług
- Wdrażać strategie optymalizacji kosztów dzięki inteligentnemu wyborowi SKU
- Stosować techniki testowania wydajności i walidacji wyboru SKU
- Konfigurować automatyczne rekomendacje SKU i monitorowanie

## Rezultaty nauki

Po ukończeniu będziesz potrafił:
- Wybierać odpowiednie SKU usług Azure w oparciu o wymagania i ograniczenia obciążeń
- Projektować ekonomiczne architektury wielośrodowiskowe z właściwym doborem poziomów
- Wdrażać benchmarki wydajności i walidację wyboru SKU
- Tworzyć zautomatyzowane narzędzia do rekomendacji SKU i optymalizacji kosztów
- Planować migracje SKU i strategie skalowania przy zmieniających się wymaganiach
- Stosować zasady Azure Well-Architected Framework do wyboru poziomów usług

## Spis treści

- [Zrozumienie SKU](#understanding-skus)
- [Wybór oparty na środowisku](#environment-based-selection)
- [Wskazówki specyficzne dla usług](#service-specific-guidelines)
- [Strategie optymalizacji kosztów](#cost-optimization-strategies)
- [Uwagi dotyczące wydajności](#performance-considerations)
- [Szybkie tabele odniesienia](#quick-reference-tables)
- [Narzędzia walidacyjne](#validation-tools)

---

## Zrozumienie SKU

> **Przykładowy zakres:** Mapa SKU w YAML i konfiguracje wydajności poniżej to notatki projektowe, nie schemat `azure.yaml` ani konfiguracja narzędzia do testu obciążenia. Bloki Bicep to alternatywy/fragmenty: deklaruj ich parametry i zasoby nadrzędne, używaj unikalnych nazw symbolicznych przy łączeniu, i łącz moduły w działający projekt. Ceny, limity i dostępność regionów/SKU należy sprawdzić w swoim subskrypcji przed wdrożeniem.

### Czym są SKU?

SKU (jednostki magazynowe) reprezentują różne poziomy usług i poziomy wydajności zasobów Azure. Każde SKU oferuje różne:

- **Charakterystyki wydajności** (CPU, pamięć, przepustowość)
- **Dostępność funkcji** (opcje skalowania, poziomy SLA)
- **Modele wyceny** (opłaty zależne od zużycia, zarezerwowana pojemność)
- **Dostępność regionalna** (nie wszystkie SKU dostępne we wszystkich regionach)

### Kluczowe czynniki przy wyborze SKU

1. **Wymagania obciążenia**
   - Oczekiwane wzorce ruchu/obciążenia
   - Wymagania wydajnościowe (CPU, pamięć, I/O)
   - Potrzeby dotyczące przechowywania i wzorce dostępu

2. **Typ środowiska**
   - Środowisko deweloperskie/testowe vs produkcyjne
   - Wymagania dotyczące dostępności
   - Potrzeby bezpieczeństwa i zgodności

3. **Ograniczenia budżetowe**
   - Koszty początkowe vs operacyjne
   - Rabaty za zarezerwowaną pojemność
   - Skutki kosztowe automatycznego skalowania

4. **Projekcje wzrostu**
   - Wymagania dotyczące skalowalności
   - Przyszłe potrzeby funkcji
   - Złożoność migracji

---

## Wybór oparty na środowisku

### Środowisko deweloperskie

**Priorytety**: Optymalizacja kosztów, podstawowa funkcjonalność, łatwe uruchamianie i wyłączanie

#### Zalecane SKU
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

#### Charakterystyka
- **App Service**: F1 (Darmowy) lub B1 (Podstawowy) do prostych testów
- **Bazy danych**: poziom podstawowy z minimalnymi zasobami
- **Storage**: Standard z lokalną redundancją tylko
- **Obliczenia**: dopuszczalne współdzielone zasoby
- **Sieć**: podstawowa konfiguracja

### Środowisko staging/testowe

**Priorytety**: Konfiguracja jak produkcyjna, balans kosztów, możliwość testów wydajności

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
- **Wydajność**: 70-80% wydajności produkcyjnej
- **Funkcje**: większość funkcji produkcyjnych włączona
- **Redundancja**: częściowa redundancja geograficzna
- **Skalowanie**: ograniczone automatyczne skalowanie do testów
- **Monitorowanie**: pełny stos monitoringu

### Środowisko produkcyjne

**Priorytety**: Wydajność, dostępność, bezpieczeństwo, zgodność, skalowalność

#### Zalecane SKU
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

#### Charakterystyka
- **Wysoka dostępność**: wymagania SLA 99.9%+
- **Wydajność**: dedykowane zasoby, duża przepustowość
- **Bezpieczeństwo**: funkcje premium bezpieczeństwa
- **Skalowanie**: pełne możliwości automatycznego skalowania
- **Monitorowanie**: kompleksowa obserwowalność

---

## Wskazówki specyficzne dla usług

### Azure App Service

#### Macierz decyzji SKU

| Zastosowanie | Zalecane SKU | Uzasadnienie |
|----------|----------------|-----------|
| Deweloperstwo/Testy | F1 (Darmowy) lub B1 (Podstawowy) | Ekonomiczne, wystarczające do testów |
| Małe aplikacje produkcyjne | S1 (Standardowy) | Własne domeny, SSL, automatyczne skalowanie |
| Średnie aplikacje produkcyjne | P1V3 (Premium V3) | Lepsza wydajność, więcej funkcji |
| Aplikacje o dużym ruchu | P2V3 lub P3V3 | Dedykowane zasoby, wysoka wydajność |
| Krytyczne aplikacje | I1V2 (Izolowany V2) | Izolacja sieci, dedykowany sprzęt |

#### Przykłady konfiguracji

**Deweloperskie**
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

**Produkcja**
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
   - **Basic**: 5 DTU - deweloperskie/testowe
   - **Standard**: S0-S12 (10-3000 DTU) - ogólnego przeznaczenia
   - **Premium**: P1-P15 (125-4000 DTU) - krytyczne dla wydajności

2. **Oparte na vCore** (zalecane dla produkcji)
   - **General Purpose**: zrównoważone obliczenia i magazyn
   - **Business Critical**: niskie opóźnienia, wysokie IOPS
   - **Hyperscale**: wysoce skalowalna pamięć; sprawdź aktualne limity i wsparcie regionalne

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

1. **Oparta na zużyciu**
   - Opłata za zużycie
   - Nadaje się do rozwoju i zmiennych obciążeń
   - Wspólna infrastruktura

2. **Dedykowana (profile obciążenia)**
   - Dedykowane zasoby obliczeniowe
   - Przewidywalna wydajność
   - Lepiej dla obciążeń produkcyjnych

#### Przykłady konfiguracji

**Deweloperskie (zużycia)**
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

**Produkcyjne (dedykowane)**
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

Redundancja strefowa wymaga też infrastruktury obsługującej region i odpowiedniej konfiguracji VNet/podsieci, pomijanej tutaj. Ten przykład zakłada trzy dedykowane węzły; skonfiguruj co najmniej dwie repliki aplikacji do dystrybucji między strefami i wymierz repliki i węzły na awarię strefy. Zobacz [wytyczne niezawodności Container Apps](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Aby umieścić aplikację na tym profilu, ustaw jej `workloadProfileName: 'production-profile'`; samo stworzenie profilu nie przenosi aplikacji do niego.

### Azure Cosmos DB

#### Modele przepustowości

1. **Ręcznie przydzielona przepustowość**
   - Przewidywalna wydajność
   - Rabaty za zarezerwowaną pojemność
   - Najlepsze dla stałych obciążeń

2. **Autoskalowana przepustowość**
   - Automatyczne skalowanie w oparciu o użycie
   - Płacisz za to, co wykorzystujesz (z minimalną wartością)
   - Dobre dla zmiennych obciążeń

3. **Serverless**
   - Płacisz za żądanie
   - Brak przydzielonej przepustowości
   - Idealne dla rozwoju i przerywanych obciążeń

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

### Konto Storage Azure

#### Typy kont storage

1. **Standard_LRS** - rozwój, dane niekrytyczne
2. **Standard_GRS** - produkcja, wymagana georedundancja
3. **Premium_LRS** - aplikacje wysokowydajne
4. **Premium_ZRS** - wysoka dostępność z redundancją strefową

#### Poziomy wydajności

- **Standardowy**: ogólne przeznaczenie, ekonomiczny
- **Premium**: wysokowydajne scenariusze niskich opóźnień

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

Rezerwuj zasoby na 1-3 lata, aby uzyskać znaczne rabaty:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Oferty rezerwacji i kwalifikujące się typy zasobów różnią się; sprawdź katalog i warunki zakupu zamiast zakładać, że każda usługa/SKU obsługuje rezerwację.

### 2. Optymalne dopasowanie rozmiaru

Zacznij od mniejszych SKU i skaluj w górę na podstawie faktycznego użytkowania:

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

### 3. Konfiguracja automatycznego skalowania

Wdrażaj inteligentne skalowanie w celu optymalizacji kosztów:

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

### 4. Skalowanie według harmonogramu

Skaluje w dół w godzinach poza szczytem:

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

## Uwagi dotyczące wydajności

### Wymagania dotyczące wydajności bazowej

Określ jasne wymagania wydajnościowe przed wyborem SKU:

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
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
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

## Tabele szybkiego odniesienia

### Szybkie odniesienie SKU App Service

| SKU | Poziom | vCPU | RAM | Pamięć | Zakres cen | Zastosowanie |
|-----|--------|-------|-----|---------|-------------|------------|
| F1 | Darmowy | Współdzielony | 1GB | 1GB | Darmowy | Rozwój |
| B1 | Podstawowy | 1 | 1.75GB | 10GB | $ | Małe aplikacje |
| S1 | Standardowy | 1 | 1.75GB | 50GB | $$ | Produkcja |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Wysoka wydajność |
| I1V2 | Izolowany V2 | 2 | 8GB | 1TB | $$$$ | Przedsiębiorstwo |

### Szybkie odniesienie SKU SQL Database

| SKU | Poziom | DTU/vCore | Pamięć | Zakres cen | Zastosowanie |
|-----|--------|-----------|---------|-------------|------------|
| Basic | Podstawowy | 5 DTU | 2GB | $ | Rozwój |
| S2 | Standardowy | 50 DTU | 250GB | $$ | Mała produkcja |
| P2 | Premium | 250 DTU | 1TB | $$$ | Wysoka wydajność |
| GP_Gen5_4 | Ogólnego przeznaczenia | 4 vCore | 4TB | $$$ | Zrównoważony |
| BC_Gen5_8 | Krytyczny biznesowo | 8 vCore | 4TB | $$$$ | Krytyczne zadania |

### Szybkie odniesienie SKU Container Apps

| Model | Wycenianie | CPU/Pamięć | Zastosowanie |
|-------|-----------|------------|----------|
| Konsumpcja | Opłata za użycie | Obsługiwane kombinacje CPU/pamięć zależne od środowiska/profilu | Rozwój lub produkcja, zmienne obciążenie |
| Dedykowany D4 | Rozliczenie dedykowanego węzła | 4 vCPU, 16GiB na węzeł | Utrzymane obciążenie/potrzeby izolacji |
| Dedykowany D8 | Rozliczenie dedykowanego węzła | 8 vCPU, 32GiB na węzeł | Wyższe utrzymane obciążenie |

---

## Narzędzia walidacyjne

### Sprawdzanie dostępności SKU

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

### Skrypt szacowania kosztów

**Pseudokod wyłącznie:** `Get-ResourceCost` poniżej to funkcja specyficzna dla projektu, którą musisz zaimplementować, korzystając z aktualnych cen regionalnych/umownych i założeń dotyczących użycia. Nie jest to PowerShell ani polecenie Azure.

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

### Walidacja wydajności

Poniższy YAML jest szkicem wymagań, **nie** schematem wejścia Azure Load Testing, JMeter, Locust ani k6. Przekonwertuj go na rzeczywistą konfigurację wybranego narzędzia przed użyciem polecenia testu obciążenia powyżej.

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

## Podsumowanie dobrych praktyk

### Co robić

1. **Zaczynaj od małych rozmiarów i skaluj w górę** na podstawie rzeczywistego użycia
2. **Używaj różnych SKU dla różnych środowisk**
3. **Monitoruj wydajność i koszty ciągle**
4. **Wykorzystuj zarezerwowaną pojemność dla obciążeń produkcyjnych**
5. **Wdrażaj automatyczne skalowanie tam, gdzie to stosowne**
6. **Testuj wydajność przy realistycznych obciążeniach**
7. **Planuj rozwój, ale unikaj nadmiernego przydzielania zasobów**
8. **Korzystaj z darmowych poziomów podczas rozwoju, jeśli to możliwe**

### Czego unikać

1. **Nie używaj produkcyjnych SKU do rozwoju**
2. **Nie ignoruj dostępności SKU w regionach**
3. **Nie zapomnij o kosztach transferu danych**
4. **Nie przydzielaj zasobów bez uzasadnienia**
5. **Nie ignoruj wpływu zależności**
6. **Nie ustawiaj limitów automatycznego skalowania zbyt wysoko**
7. **Nie ignoruj wymagań dotyczących zgodności**
8. **Nie podejmuj decyzji wyłącznie na podstawie ceny**

---

**Porada eksperta**: Skorzystaj z Azure Cost Management i Advisor, aby uzyskać spersonalizowane rekomendacje dotyczące optymalizacji wyboru SKU w oparciu o rzeczywiste wzorce użycia.

---

**Nawigacja**
- **Poprzednia lekcja**: [Planowanie pojemności](capacity-planning.md)
- **Następna lekcja**: [Kontrole przed uruchomieniem](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
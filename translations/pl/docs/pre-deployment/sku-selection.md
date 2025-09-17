<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "952ed5af7f5db069c53a6840717e1801",
  "translation_date": "2025-09-17T16:44:52+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "pl"
}
-->
# Przewodnik po wyborze SKU - Wybór odpowiednich poziomów usług Azure

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 6 - Walidacja i planowanie przed wdrożeniem
- **⬅️ Poprzedni**: [Planowanie pojemności](capacity-planning.md)
- **➡️ Następny**: [Kontrole przed wdrożeniem](preflight-checks.md)
- **🚀 Następny rozdział**: [Rozdział 7: Rozwiązywanie problemów](../troubleshooting/common-issues.md)

## Wprowadzenie

Ten kompleksowy przewodnik pomoże Ci wybrać optymalne SKU (Stock Keeping Units) usług Azure dla różnych środowisk, obciążeń i wymagań. Dowiedz się, jak analizować potrzeby wydajnościowe, koszty i wymagania dotyczące skalowalności, aby wybrać najbardziej odpowiednie poziomy usług dla wdrożeń Azure Developer CLI.

## Cele nauki

Po ukończeniu tego przewodnika będziesz:
- Rozumieć koncepcje SKU Azure, modele cenowe i różnice w funkcjach
- Opanować strategie wyboru SKU specyficzne dla środowiska: rozwoju, testowania i produkcji
- Analizować wymagania obciążeń i dopasowywać je do odpowiednich poziomów usług
- Wdrażać strategie optymalizacji kosztów poprzez inteligentny wybór SKU
- Stosować techniki testowania wydajności i walidacji dla wybranych SKU
- Konfigurować automatyczne rekomendacje SKU i monitorowanie

## Efekty nauki

Po ukończeniu będziesz w stanie:
- Wybrać odpowiednie SKU usług Azure na podstawie wymagań i ograniczeń obciążeń
- Projektować ekonomiczne architektury wielośrodowiskowe z właściwym wyborem poziomów usług
- Wdrażać testy wydajności i walidację dla wybranych SKU
- Tworzyć narzędzia automatyzujące rekomendacje SKU i optymalizację kosztów
- Planować migracje SKU i strategie skalowania dla zmieniających się wymagań
- Stosować zasady Azure Well-Architected Framework do wyboru poziomów usług

## Spis treści

- [Zrozumienie SKU](../../../../docs/pre-deployment)
- [Wybór oparty na środowisku](../../../../docs/pre-deployment)
- [Wytyczne specyficzne dla usług](../../../../docs/pre-deployment)
- [Strategie optymalizacji kosztów](../../../../docs/pre-deployment)
- [Uwagi dotyczące wydajności](../../../../docs/pre-deployment)
- [Tabele szybkiego odniesienia](../../../../docs/pre-deployment)
- [Narzędzia walidacji](../../../../docs/pre-deployment)

---

## Zrozumienie SKU

### Czym są SKU?

SKU (Stock Keeping Units) reprezentują różne poziomy usług i poziomy wydajności dla zasobów Azure. Każde SKU oferuje różne:

- **Charakterystyki wydajnościowe** (CPU, pamięć, przepustowość)
- **Dostępność funkcji** (opcje skalowania, poziomy SLA)
- **Modele cenowe** (na podstawie zużycia, zarezerwowanej pojemności)
- **Dostępność regionalna** (nie wszystkie SKU są dostępne we wszystkich regionach)

### Kluczowe czynniki przy wyborze SKU

1. **Wymagania obciążenia**
   - Oczekiwane wzorce ruchu/obciążenia
   - Wymagania wydajnościowe (CPU, pamięć, I/O)
   - Potrzeby magazynowe i wzorce dostępu

2. **Typ środowiska**
   - Rozwój/testowanie vs. produkcja
   - Wymagania dotyczące dostępności
   - Potrzeby w zakresie bezpieczeństwa i zgodności

3. **Ograniczenia budżetowe**
   - Koszty początkowe vs. koszty operacyjne
   - Zniżki na zarezerwowaną pojemność
   - Koszty związane z automatycznym skalowaniem

4. **Projekcje wzrostu**
   - Wymagania dotyczące skalowalności
   - Przyszłe potrzeby funkcjonalne
   - Złożoność migracji

---

## Wybór oparty na środowisku

### Środowisko rozwojowe

**Priorytety**: Optymalizacja kosztów, podstawowa funkcjonalność, łatwe wdrażanie/usuwanie

#### Rekomendowane SKU
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
- **App Service**: F1 (Free) lub B1 (Basic) dla prostego testowania
- **Bazy danych**: Podstawowy poziom z minimalnymi zasobami
- **Magazyn**: Standardowy z lokalną redundancją
- **Obliczenia**: Akceptowalne zasoby współdzielone
- **Sieć**: Podstawowe konfiguracje

### Środowisko testowe/stagingowe

**Priorytety**: Konfiguracja zbliżona do produkcji, równowaga kosztów, możliwość testowania wydajności

#### Rekomendowane SKU
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
- **Skalowanie**: Ograniczone automatyczne skalowanie do testów
- **Monitorowanie**: Pełny zestaw monitorowania

### Środowisko produkcyjne

**Priorytety**: Wydajność, dostępność, bezpieczeństwo, zgodność, skalowalność

#### Rekomendowane SKU
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
- **Wydajność**: Dedykowane zasoby, wysoka przepustowość
- **Bezpieczeństwo**: Funkcje bezpieczeństwa premium
- **Skalowanie**: Pełne możliwości automatycznego skalowania
- **Monitorowanie**: Kompleksowa obserwowalność

---

## Wytyczne specyficzne dla usług

### Azure App Service

#### Macierz decyzji SKU

| Zastosowanie | Rekomendowane SKU | Uzasadnienie |
|--------------|-------------------|--------------|
| Rozwój/testowanie | F1 (Free) lub B1 (Basic) | Ekonomiczne, wystarczające do testów |
| Małe aplikacje produkcyjne | S1 (Standard) | Własne domeny, SSL, automatyczne skalowanie |
| Średnie aplikacje produkcyjne | P1V3 (Premium V3) | Lepsza wydajność, więcej funkcji |
| Aplikacje o dużym ruchu | P2V3 lub P3V3 | Dedykowane zasoby, wysoka wydajność |
| Aplikacje krytyczne | I1V2 (Isolated V2) | Izolacja sieciowa, dedykowany sprzęt |

#### Przykłady konfiguracji

**Rozwój**
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
   - **Podstawowe**: 5 DTU - Rozwój/testowanie
   - **Standardowe**: S0-S12 (10-3000 DTU) - Ogólne zastosowanie
   - **Premium**: P1-P15 (125-4000 DTU) - Krytyczne dla wydajności

2. **Oparte na vCore** (zalecane dla produkcji)
   - **Ogólne przeznaczenie**: Zrównoważone zasoby obliczeniowe i magazynowe
   - **Biznes krytyczny**: Niska latencja, wysoki IOPS
   - **Hyperscale**: Wysoce skalowalny magazyn (do 100TB)

#### Przykłady konfiguracji

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

1. **Oparte na zużyciu**
   - Model płatności za użycie
   - Odpowiednie dla rozwoju i zmiennych obciążeń
   - Współdzielona infrastruktura

2. **Dedykowane (Profile obciążeń)**
   - Dedykowane zasoby obliczeniowe
   - Przewidywalna wydajność
   - Lepsze dla obciążeń produkcyjnych

#### Przykłady konfiguracji

**Rozwój (zużycie)**
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

**Produkcja (dedykowane)**
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
   - Zniżki na zarezerwowaną pojemność
   - Najlepsze dla stabilnych obciążeń

2. **Automatyczne skalowanie przepustowości**
   - Automatyczne skalowanie w zależności od użycia
   - Płatność za rzeczywiste użycie (z minimalnym poziomem)
   - Dobre dla zmiennych obciążeń

3. **Serverless**
   - Płatność za żądanie
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

### Azure Storage Account

#### Typy kont magazynowych

1. **Standard_LRS** - Rozwój, dane niekrytyczne
2. **Standard_GRS** - Produkcja, wymagana geo-redundancja
3. **Premium_LRS** - Aplikacje o wysokiej wydajności
4. **Premium_ZRS** - Wysoka dostępność z redundancją strefową

#### Poziomy wydajności

- **Standardowe**: Ogólne zastosowanie, ekonomiczne
- **Premium**: Wysoka wydajność, scenariusze o niskiej latencji

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

Rezerwuj zasoby na 1-3 lata, aby uzyskać znaczące zniżki:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Dopasowanie rozmiaru

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

### 3. Konfiguracja automatycznego skalowania

Wdrażaj inteligentne skalowanie, aby optymalizować koszty:

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

### 4. Skalowanie według harmonogramu

Zmniejsz skalę poza godzinami szczytu:

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

### Podstawowe wymagania wydajnościowe

Zdefiniuj jasne wymagania wydajnościowe przed wyborem SKU:

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
# Azure Load Testing service
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

## Tabele szybkiego odniesienia

### Szybkie odniesienie SKU dla App Service

| SKU | Poziom | vCPU | RAM | Magazyn | Zakres cenowy | Zastosowanie |
|-----|--------|------|-----|---------|---------------|--------------|
| F1 | Free | Współdzielone | 1GB | 1GB | Free | Rozwój |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Małe aplikacje |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Produkcja |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Wysoka wydajność |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Korporacyjne |

### Szybkie odniesienie SKU dla SQL Database

| SKU | Poziom | DTU/vCore | Magazyn | Zakres cenowy | Zastosowanie |
|-----|--------|-----------|---------|---------------|--------------|
| Basic | Podstawowy | 5 DTU | 2GB | $ | Rozwój |
| S2 | Standard | 50 DTU | 250GB | $$ | Mała produkcja |
| P2 | Premium | 250 DTU | 1TB | $$$ | Wysoka wydajność |
| GP_Gen5_4 | Ogólne przeznaczenie | 4 vCore | 4TB | $$$ | Zrównoważone |
| BC_Gen5_8 | Biznes krytyczny | 8 vCore | 4TB | $$$$ | Krytyczne dla biznesu |

### Szybkie odniesienie SKU dla Container Apps

| Model | Cennik | CPU/Pamięć | Zastosowanie |
|-------|--------|------------|--------------|
| Zużycie | Płatność za użycie | 0.25-2 vCPU | Rozwój, zmienne obciążenie |
| Dedykowane D4 | Zarezerwowane | 4 vCPU, 16GB | Produkcja |
| Dedykowane D8 | Zarezerwowane | 8 vCPU, 32GB | Wysoka wydajność |

---

## Narzędzia walidacji

### Narzędzie do sprawdzania dostępności SKU

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

### Skrypt szacowania kosztów

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

1. **Zaczynaj od małych SKU i skaluj w górę** na podstawie rzeczywistego użycia
2. **Używaj różnych SKU dla różnych środowisk**
3. **Monitoruj wydajność i koszty na bieżąco**
4. **Wykorzystuj zarezerwowaną pojemność dla obciążeń produkcyjnych**
5. **Wdrażaj automatyczne skalowanie tam, gdzie to możliwe**
6. **Testuj wydajność na realistycznych obciążeniach**
7. **Planuj wzrost, ale unikaj nadmiernego przydzielania zasobów**
8. **Używaj darmowych poziomów dla rozwoju, gdy to możliwe**

### Czego unikać

1. **Nie używaj SKU produkcyjnych dla rozwoju**
2. **Nie ignoruj dostępności SKU w regionach**
3. **Nie zapominaj o kosztach transferu danych**
4. **Nie przydzielaj nadmiernych zasobów bez uzasadnienia**
5. **Nie ignoruj wpływu zależności**
6. **Nie ustawiaj limitów automatycznego skalowania zbyt wysoko**
7. **Nie zapominaj o wymaganiach zgodności**
8. **Nie podejmuj decyzji wyłącznie na podstawie ceny**

---

**Porada**: Używaj Azure Cost Management i Advisor, aby uzyskać spersonalizowane rekomendacje dotyczące optymalizacji wyboru SKU na podstawie rzeczywistych wzorców użycia.

---

**Nawigacja**
- **Poprzednia lekcja**: [Planowanie pojemności](capacity-planning.md)
- **Następna lekcja**: [Kontrole przed wdrożeniem](preflight-checks.md)

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby zapewnić poprawność tłumaczenia, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
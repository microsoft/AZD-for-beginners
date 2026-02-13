# Planowanie pojemności - dostępność i limity zasobów Azure

**Chapter Navigation:**
- **📚 Course Home**: [AZD dla początkujących](../../README.md)
- **📖 Current Chapter**: Rozdział 6 - Walidacja i planowanie przed wdrożeniem
- **⬅️ Previous Chapter**: [Rozdział 5: Rozwiązania AI z wieloma agentami](../../examples/retail-scenario.md)
- **➡️ Next**: [Wybór SKU](sku-selection.md)
- **🚀 Next Chapter**: [Rozdział 7: Rozwiązywanie problemów](../chapter-07-troubleshooting/common-issues.md)

## Wprowadzenie

Ten kompleksowy przewodnik pomaga zaplanować i zwalidować pojemność zasobów Azure przed wdrożeniem przy użyciu Azure Developer CLI. Naucz się oceniać limity (quotas), dostępność i ograniczenia regionalne, aby zapewnić udane wdrożenia przy optymalizacji kosztów i wydajności. Opanuj techniki planowania pojemności dla różnych architektur aplikacji i scenariuszy skalowania.

## Cele nauki

Po ukończeniu tego przewodnika będziesz:
- Rozumieć limity, kwoty (quotas) i ograniczenia dostępności regionalnej w Azure
- Opanować techniki sprawdzania dostępności zasobów i pojemności przed wdrożeniem
- Wdrażać zautomatyzowane strategie walidacji pojemności i monitorowania
- Projektować aplikacje z właściwym doborem rozmiaru zasobów i rozważaniami dotyczącymi skalowania
- Stosować strategie optymalizacji kosztów poprzez inteligentne planowanie pojemności
- Konfigurować alerty i monitorowanie zużycia kwot oraz dostępności zasobów

## Efekty nauczania

Po ukończeniu będziesz potrafić:
- Ocenić i zweryfikować wymagania dotyczące pojemności zasobów Azure przed wdrożeniem
- Tworzyć zautomatyzowane skrypty do sprawdzania pojemności i monitorowania kwot
- Projektować skalowalne architektury uwzględniające ograniczenia regionalne i subskrypcyjne
- Wdrażać ekonomiczne strategie doboru rozmiaru zasobów dla różnych typów obciążeń
- Konfigurować proaktywne monitorowanie i alertowanie dla problemów związanych z pojemnością
- Planować wdrożenia wieloregionowe z właściwym rozdziałem pojemności

## Dlaczego planowanie pojemności jest istotne

Przed wdrożeniem aplikacji musisz upewnić się, że:
- **Wystarczające kwoty** dla wymaganych zasobów
- **Dostępność zasobów** w docelowym regionie
- **Dostępność poziomu usługi** dla typu Twojej subskrypcji
- **Pojemność sieci** dla spodziewanego ruchu
- **Optymalizacja kosztów** przez właściwy dobór rozmiaru

## 📊 Zrozumienie limitów i kwot w Azure

### Rodzaje limitów
1. **Limitów na poziomie subskrypcji** - maksymalna liczba zasobów na subskrypcję
2. **Limitów regionalnych** - maksymalna liczba zasobów na region
3. **Limitów specyficznych dla zasobu** - ograniczenia dla poszczególnych typów zasobów
4. **Limitów związanych z poziomem usługi** - ograniczenia zależne od planu usługi

### Typowe limity zasobów
```bash
# Sprawdź bieżące użycie limitów
az vm list-usage --location eastus2 --output table

# Sprawdź konkretne limity zasobów
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## Kontrole pojemności przed wdrożeniem

### Zautomatyzowany skrypt walidacji pojemności
```bash
#!/bin/bash
# capacity-check.sh - Weryfikacja pojemności Azure przed wdrożeniem

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# Funkcja do sprawdzania wykorzystania limitów
check_quota() {
    local resource_type=$1
    local required=$2
    
    echo "Checking $resource_type quota..."
    
    case $resource_type in
        "compute")
            usage=$(az vm list-usage --location "$LOCATION" --query "[?localName=='Total Regional vCPUs'].{current:currentValue,limit:limit}" -o json)
            current=$(echo "$usage" | jq -r '.[0].current')
            limit=$(echo "$usage" | jq -r '.[0].limit')
            ;;
        "storage")
            usage=$(az storage account show-usage --query "{current:value,limit:limit}" -o json)
            current=$(echo "$usage" | jq -r '.current')
            limit=$(echo "$usage" | jq -r '.limit')
            ;;
        "network")
            usage=$(az network list-usages --location "$LOCATION" --query "[?localName=='Virtual Networks'].{current:currentValue,limit:limit}" -o json)
            current=$(echo "$usage" | jq -r '.[0].current')
            limit=$(echo "$usage" | jq -r '.[0].limit')
            ;;
    esac
    
    available=$((limit - current))
    
    if [ "$available" -ge "$required" ]; then
        echo "✅ $resource_type: $available/$limit available (need $required)"
    else
        echo "❌ $resource_type: Only $available/$limit available (need $required)"
        return 1
    fi
}

# Sprawdź różne limity zasobów
check_quota "compute" 4      # Wymagane 4 vCPU
check_quota "storage" 2      # Wymagane 2 konta magazynu
check_quota "network" 1      # Wymagana 1 wirtualna sieć

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### Kontrole pojemności specyficzne dla usług

#### Pojemność App Service
```bash
# Sprawdź dostępność planu App Service
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # Sprawdź dostępne SKU w regionie
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # Zaproponuj alternatywne regiony
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # Sprawdź bieżące użycie
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# Użycie
check_app_service_capacity "eastus2" "P1v3"
```

#### Pojemność bazy danych
```bash
# Sprawdź pojemność PostgreSQL
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # Sprawdź, czy SKU jest dostępny
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # Pokaż dostępne SKU
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# Sprawdź pojemność Cosmos DB
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # Sprawdź dostępność regionu
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # Sprawdź, czy serverless jest obsługiwany (jeśli to konieczne)
        if [ "$tier" = "serverless" ]; then
            serverless_regions=$(az cosmosdb locations list \
                --query "[?supportsAvailabilityZone==true && name=='$location']" -o tsv)
            
            if [ -n "$serverless_regions" ]; then
                echo "✅ Cosmos DB Serverless is supported in $location"
            else
                echo "⚠️  Cosmos DB Serverless may not be supported in $location"
            fi
        fi
    else
        echo "❌ Cosmos DB is not available in $location"
        return 1
    fi
}
```

#### Pojemność Container Apps
```bash
# Sprawdź pojemność Container Apps
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # Sprawdź, czy Container Apps jest dostępny w regionie
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # Sprawdź aktualną liczbę środowisk
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # Container Apps ma limit 15 środowisk na region
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # Pokaż dostępne regiony
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 Walidacja dostępności regionalnej

### Dostępność usług według regionu
```bash
# Sprawdź dostępność usługi w różnych regionach
check_service_availability() {
    local service=$1
    
    echo "Checking $service availability across regions..."
    
    case $service in
        "appservice")
            az appservice list-locations --query "[].{region:name,displayName:displayName}" -o table
            ;;
        "containerapp")
            az provider show --namespace Microsoft.App \
                --query "resourceTypes[?resourceType=='containerApps'].locations" -o table
            ;;
        "postgres")
            az postgres flexible-server list-skus --location eastus2 >/dev/null 2>&1 && \
            echo "PostgreSQL Flexible Server regions:" && \
            az account list-locations --query "[?metadata.regionType=='Physical'].{name:name,displayName:displayName}" -o table
            ;;
        "cosmosdb")
            az cosmosdb locations list --query "[].{name:name,documentationUrl:documentationUrl}" -o table
            ;;
    esac
}

# Sprawdź wszystkie usługi
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### Zalecenia dotyczące wyboru regionu
```bash
# Zalecaj optymalne regiony na podstawie wymagań
recommend_region() {
    local requirements=$1  # "niski koszt" | "wydajność" | "zgodność"
    
    echo "Region recommendations for: $requirements"
    
    case $requirements in
        "lowcost")
            echo "💰 Cost-optimized regions:"
            echo "  - East US (Virginia)"
            echo "  - South Central US (Texas)"
            echo "  - West US 2 (Washington)"
            ;;
        "performance")
            echo "⚡ Performance-optimized regions:"
            echo "  - East US 2 (Virginia) - Latest hardware"
            echo "  - West US 2 (Washington) - Latest hardware"
            echo "  - North Europe (Ireland) - For EU users"
            ;;
        "compliance")
            echo "🔒 Compliance-focused regions:"
            echo "  - US Gov regions - For government workloads"
            echo "  - Germany regions - For GDPR compliance"
            echo "  - Australia regions - For data sovereignty"
            ;;
    esac
}
```

## 💰 Planowanie i szacowanie kosztów

### Szacowanie kosztów zasobów
```bash
# Oszacuj koszty wdrożenia
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # Utwórz tymczasową grupę zasobów do oszacowania
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # Wdróż infrastrukturę w trybie walidacji
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # Usuń tymczasową grupę zasobów
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### Zalecenia dotyczące optymalizacji SKU
```bash
# Zalecaj optymalne SKU na podstawie wymagań
recommend_sku() {
    local service=$1
    local workload_type=$2  # "deweloperskie" | "testowe" | "produkcyjne"
    
    echo "SKU recommendations for $service ($workload_type workload):"
    
    case $service in
        "appservice")
            case $workload_type in
                "dev")
                    echo "  Recommended: B1 (Basic)"
                    echo "  Alternative: F1 (Free) for temporary testing"
                    ;;
                "staging")
                    echo "  Recommended: S1 (Standard)"
                    echo "  Alternative: B2 (Basic) for cost savings"
                    ;;
                "production")
                    echo "  Recommended: P1v3 (Premium)"
                    echo "  High-traffic: P2v3 or P3v3"
                    echo "  Consider: App Service Environment for isolation"
                    ;;
            esac
            ;;
        "postgres")
            case $workload_type in
                "dev")
                    echo "  Recommended: Standard_B1ms (Burstable)"
                    echo "  Storage: 32 GB"
                    ;;
                "staging")
                    echo "  Recommended: Standard_B2s (Burstable)"
                    echo "  Storage: 64 GB"
                    ;;
                "production")
                    echo "  Recommended: Standard_D2s_v3 (General Purpose)"
                    echo "  High-performance: Standard_D4s_v3 or higher"
                    echo "  Storage: 128 GB or more with backup"
                    ;;
            esac
            ;;
        "cosmosdb")
            case $workload_type in
                "dev")
                    echo "  Recommended: Serverless"
                    echo "  Alternative: Provisioned 400 RU/s"
                    ;;
                "staging")
                    echo "  Recommended: Provisioned 400-1000 RU/s"
                    echo "  Enable autoscale for variable workloads"
                    ;;
                "production")
                    echo "  Recommended: Provisioned with autoscale"
                    echo "  High-availability: Multi-region writes"
                    echo "  Consider: Dedicated throughput for containers"
                    ;;
            esac
            ;;
    esac
}
```

## 🚀 Zautomatyzowane kontrole przed wdrożeniem

### Kompleksowy skrypt przedwdrożeniowy
```bash
#!/bin/bash
# preflight-check.sh - Kompletna walidacja przed wdrożeniem

set -e

# Konfiguracja
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# Kolory wyjścia
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # Brak koloru

# Funkcje logowania
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# Wczytaj konfigurację
if [ -f "$CONFIG_FILE" ]; then
    REQUIRED_VCPUS=$(jq -r '.requirements.vcpus' "$CONFIG_FILE")
    REQUIRED_STORAGE=$(jq -r '.requirements.storage' "$CONFIG_FILE")
    REQUIRED_SERVICES=($(jq -r '.requirements.services[]' "$CONFIG_FILE"))
else
    log_warn "No configuration file found, using defaults"
    REQUIRED_VCPUS=4
    REQUIRED_STORAGE=2
    REQUIRED_SERVICES=("appservice" "postgres" "storage")
fi

echo "🚀 Starting pre-flight checks..."
echo "Location: $LOCATION"
echo "Environment: $ENVIRONMENT"
echo "Required vCPUs: $REQUIRED_VCPUS"
echo "Required Storage Accounts: $REQUIRED_STORAGE"
echo "Required Services: ${REQUIRED_SERVICES[*]}"
echo "=================================="

# Sprawdzenie 1: Uwierzytelnianie
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# Sprawdzenie 2: Dostępność regionalna
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# Sprawdzenie 3: Walidacja limitów
log_info "Checking quota availability..."

# Limit vCPU
vcpu_usage=$(az vm list-usage --location "$LOCATION" \
    --query "[?localName=='Total Regional vCPUs'].{current:currentValue,limit:limit}" -o json)
vcpu_current=$(echo "$vcpu_usage" | jq -r '.[0].current')
vcpu_limit=$(echo "$vcpu_usage" | jq -r '.[0].limit')
vcpu_available=$((vcpu_limit - vcpu_current))

if [ "$vcpu_available" -ge "$REQUIRED_VCPUS" ]; then
    log_info "vCPU quota: $vcpu_available/$vcpu_limit available (need $REQUIRED_VCPUS)"
else
    log_error "Insufficient vCPU quota: $vcpu_available/$vcpu_limit available (need $REQUIRED_VCPUS)"
    exit 1
fi

# Limit konta magazynu
storage_usage=$(az storage account show-usage --query "{current:value,limit:limit}" -o json)
storage_current=$(echo "$storage_usage" | jq -r '.current')
storage_limit=$(echo "$storage_usage" | jq -r '.limit')
storage_available=$((storage_limit - storage_current))

if [ "$storage_available" -ge "$REQUIRED_STORAGE" ]; then
    log_info "Storage quota: $storage_available/$storage_limit available (need $REQUIRED_STORAGE)"
else
    log_error "Insufficient storage quota: $storage_available/$storage_limit available (need $REQUIRED_STORAGE)"
    exit 1
fi

# Sprawdzenie 4: Dostępność usługi
log_info "Checking service availability..."

for service in "${REQUIRED_SERVICES[@]}"; do
    case $service in
        "appservice")
            if az appservice list-locations --sku B1 --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
                log_info "App Service is available in $LOCATION"
            else
                log_error "App Service is not available in $LOCATION"
                exit 1
            fi
            ;;
        "postgres")
            if az postgres flexible-server list-skus --location "$LOCATION" >/dev/null 2>&1; then
                log_info "PostgreSQL is available in $LOCATION"
            else
                log_error "PostgreSQL is not available in $LOCATION"
                exit 1
            fi
            ;;
        "containerapp")
            if az provider show --namespace Microsoft.App \
                --query "resourceTypes[?resourceType=='containerApps'].locations" \
                --output tsv | grep -q "$LOCATION"; then
                log_info "Container Apps is available in $LOCATION"
            else
                log_error "Container Apps is not available in $LOCATION"
                exit 1
            fi
            ;;
        "cosmosdb")
            if az cosmosdb locations list --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
                log_info "Cosmos DB is available in $LOCATION"
            else
                log_error "Cosmos DB is not available in $LOCATION"
                exit 1
            fi
            ;;
    esac
done

# Sprawdzenie 5: Pojemność sieci
log_info "Checking network capacity..."
vnet_usage=$(az network list-usages --location "$LOCATION" \
    --query "[?localName=='Virtual Networks'].{current:currentValue,limit:limit}" -o json)
vnet_current=$(echo "$vnet_usage" | jq -r '.[0].current')
vnet_limit=$(echo "$vnet_usage" | jq -r '.[0].limit')
vnet_available=$((vnet_limit - vnet_current))

if [ "$vnet_available" -gt 0 ]; then
    log_info "Virtual Network quota: $vnet_available/$vnet_limit available"
else
    log_warn "Virtual Network quota: $vnet_available/$vnet_limit available (may need cleanup)"
fi

# Sprawdzenie 6: Walidacja nazewnictwa zasobów
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# Sprawdzenie 7: Szacowanie kosztów
log_info "Performing cost estimation..."
ESTIMATED_MONTHLY_COST=$(calculate_estimated_cost "$ENVIRONMENT" "$LOCATION")
log_info "Estimated monthly cost: \$${ESTIMATED_MONTHLY_COST}"

if [ "$ENVIRONMENT" = "production" ] && [ "$ESTIMATED_MONTHLY_COST" -gt 1000 ]; then
    log_warn "High estimated cost for production environment: \$${ESTIMATED_MONTHLY_COST}/month"
    read -p "Continue with deployment? (y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        log_info "Deployment cancelled by user"
        exit 1
    fi
fi

# Sprawdzenie 8: Walidacja szablonu
log_info "Validating Bicep templates..."
if [ -f "infra/main.bicep" ]; then
    if az bicep build --file infra/main.bicep --stdout >/dev/null 2>&1; then
        log_info "Bicep template syntax is valid"
    else
        log_error "Bicep template has syntax errors"
        az bicep build --file infra/main.bicep
        exit 1
    fi
else
    log_warn "No Bicep template found at infra/main.bicep"
fi

# Podsumowanie końcowe
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### Szablon pliku konfiguracyjnego
```json
{
  "requirements": {
    "vcpus": 4,
    "storage": 2,
    "services": [
      "appservice",
      "postgres",
      "storage"
    ]
  },
  "preferences": {
    "region": "eastus2",
    "costOptimized": true,
    "highAvailability": false
  },
  "skus": {
    "dev": {
      "appServiceSku": "B1",
      "databaseSku": "Standard_B1ms"
    },
    "staging": {
      "appServiceSku": "S1",
      "databaseSku": "Standard_B2s"
    },
    "production": {
      "appServiceSku": "P1v3",
      "databaseSku": "Standard_D2s_v3"
    }
  }
}
```

## 📈 Monitorowanie pojemności podczas wdrożenia

### Monitorowanie pojemności w czasie rzeczywistym
```bash
# Monitoruj pojemność podczas wdrażania
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # Sprawdź status wdrożenia
        deployment_status=$(az deployment group list \
            --resource-group "$resource_group" \
            --query "[0].properties.provisioningState" -o tsv)
        
        if [ "$deployment_status" = "Succeeded" ]; then
            log_info "Deployment completed successfully"
            break
        elif [ "$deployment_status" = "Failed" ]; then
            log_error "Deployment failed"
            break
        fi
        
        # Sprawdź bieżące wykorzystanie zasobów
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 Integracja z AZD

### Dodaj haki przedwdrożeniowe do azure.yaml
```yaml
# azure.yaml
hooks:
  preprovision:
    shell: sh
    run: |
      echo "Running pre-flight capacity checks..."
      ./scripts/preflight-check.sh ${AZURE_LOCATION} ${AZURE_ENV_NAME}
      
      if [ $? -ne 0 ]; then
        echo "Pre-flight checks failed"
        exit 1
      fi
      
      echo "Pre-flight checks passed, proceeding with deployment"
```

## Najlepsze praktyki

1. **Zawsze uruchamiaj kontrole pojemności** przed wdrożeniem do nowych regionów
2. **Regularnie monitoruj zużycie kwot**, aby uniknąć niespodzianek
3. **Planuj wzrost** poprzez sprawdzanie przyszłych potrzeb pojemności
4. **Korzystaj z narzędzi do szacowania kosztów**, aby uniknąć zaskoczeń na rachunku
5. **Dokumentuj wymagania pojemnościowe** dla swojego zespołu
6. **Automatyzuj walidację pojemności** w pipeline'ach CI/CD
7. **Uwzględnij wymagania pojemnościowe dla regionalnego przełączenia awaryjnego**

## Kolejne kroki

- [Przewodnik wyboru SKU](sku-selection.md) - Wybierz optymalne poziomy usług
- [Kontrole przedwdrożeniowe](preflight-checks.md) - Zautomatyzowane skrypty walidacyjne
- [Skrócona ściągawka](../../resources/cheat-sheet.md) - Szybkie polecenia referencyjne
- [Słownik](../../resources/glossary.md) - Terminy i definicje

## Dodatkowe zasoby

- [Limity subskrypcji Azure](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Kalkulator cen Azure](https://azure.microsoft.com/pricing/calculator/)
- [Zarządzanie kosztami Azure](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Dostępność regionalna Azure](https://azure.microsoft.com/global-infrastructure/services/)

---

**Nawigacja**
- **Poprzednia lekcja**: [Przewodnik debugowania](../chapter-07-troubleshooting/debugging.md)

- **Następna lekcja**: [Wybór SKU](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Zastrzeżenie:
Niniejszy dokument został przetłumaczony przy użyciu usługi tłumaczeń AI Co-op Translator (https://github.com/Azure/co-op-translator). Choć dokładamy wszelkich starań, aby zapewnić poprawność, prosimy pamiętać, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym należy uznać za wersję autorytatywną. W przypadku informacji o znaczeniu krytycznym zalecane jest skorzystanie z usług profesjonalnego tłumacza. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
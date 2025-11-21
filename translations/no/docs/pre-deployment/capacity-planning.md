<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "133c6f0d02c698cbe1cdb5d405ad4994",
  "translation_date": "2025-11-21T14:48:19+00:00",
  "source_file": "docs/pre-deployment/capacity-planning.md",
  "language_code": "no"
}
-->
# Kapasitetsplanlegging - Azure ressurs tilgjengelighet og grenser

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 6 - Validering og planlegging før utrulling
- **⬅️ Forrige kapittel**: [Kapittel 5: Multi-Agent AI-løsninger](../../examples/retail-scenario.md)
- **➡️ Neste**: [SKU-valg](sku-selection.md)
- **🚀 Neste kapittel**: [Kapittel 7: Feilsøking](../troubleshooting/common-issues.md)

## Introduksjon

Denne omfattende veiledningen hjelper deg med å planlegge og validere Azure ressurskapasitet før utrulling med Azure Developer CLI. Lær å vurdere kvoter, tilgjengelighet og regionale begrensninger for å sikre vellykkede utrullinger samtidig som du optimaliserer kostnader og ytelse. Mestre kapasitetsplanleggingsteknikker for ulike applikasjonsarkitekturer og skaleringsscenarier.

## Læringsmål

Ved å fullføre denne veiledningen vil du:
- Forstå Azure kvoter, grenser og regionale tilgjengelighetsbegrensninger
- Mestre teknikker for å sjekke ressurs tilgjengelighet og kapasitet før utrulling
- Implementere automatiserte strategier for kapasitetsvalidering og overvåking
- Designe applikasjoner med riktig ressursstørrelse og skaleringshensyn
- Anvende kostnadsoptimaliseringsstrategier gjennom intelligent kapasitetsplanlegging
- Konfigurere varsler og overvåking for kvotebruk og ressurs tilgjengelighet

## Læringsutbytte

Etter fullføring vil du kunne:
- Vurdere og validere Azure ressurskapasitetskrav før utrulling
- Lage automatiserte skript for kapasitetskontroll og kvoteovervåking
- Designe skalerbare arkitekturer som tar hensyn til regionale og abonnementsgrenser
- Implementere kostnadseffektive ressursstørrelsesstrategier for ulike arbeidsbelastningstyper
- Konfigurere proaktiv overvåking og varsling for kapasitetsrelaterte problemer
- Planlegge utrullinger i flere regioner med riktig kapasitetsfordeling

## Hvorfor kapasitetsplanlegging er viktig

Før du ruller ut applikasjoner, må du sikre:
- **Tilstrekkelige kvoter** for nødvendige ressurser
- **Ressurstilgjengelighet** i din målregion
- **Tilgjengelighet av tjenestenivå** for din abonnementstype
- **Nettverkskapasitet** for forventet trafikk
- **Kostnadsoptimalisering** gjennom riktig dimensjonering

## 📊 Forstå Azure kvoter og grenser

### Typer grenser
1. **Abonnementsnivå kvoter** - Maksimale ressurser per abonnement
2. **Regionale kvoter** - Maksimale ressurser per region
3. **Ressursspesifikke grenser** - Grenser for individuelle ressurstyper
4. **Tjenestenivå grenser** - Grenser basert på din tjenesteplan

### Vanlige ressurskvoter
```bash
# Sjekk nåværende kvotebruk
az vm list-usage --location eastus2 --output table

# Sjekk spesifikke ressurskvoter
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## Kapasitetskontroller før utrulling

### Automatisert kapasitetsvalideringsskript
```bash
#!/bin/bash
# capacity-check.sh - Valider Azure-kapasitet før distribusjon

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# Funksjon for å sjekke kvotebruk
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

# Sjekk ulike ressurskvoter
check_quota "compute" 4      # Trenger 4 vCPUer
check_quota "storage" 2      # Trenger 2 lagringskontoer
check_quota "network" 1      # Trenger 1 virtuelt nettverk

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### Tjenestespesifikke kapasitetskontroller

#### App Service kapasitet
```bash
# Sjekk tilgjengelighet for App Service Plan
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # Sjekk tilgjengelige SKUs i regionen
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # Foreslå alternative regioner
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # Sjekk nåværende bruk
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# Bruk
check_app_service_capacity "eastus2" "P1v3"
```

#### Database kapasitet
```bash
# Sjekk PostgreSQL-kapasitet
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # Sjekk om SKU er tilgjengelig
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # Vis tilgjengelige SKUer
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# Sjekk Cosmos DB-kapasitet
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # Sjekk regiontilgjengelighet
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # Sjekk om serverløs støttes (hvis nødvendig)
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

#### Container Apps kapasitet
```bash
# Sjekk Container Apps kapasitet
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # Sjekk om Container Apps er tilgjengelig i regionen
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # Sjekk nåværende miljøantall
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # Container Apps har en grense på 15 miljøer per region
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # Vis tilgjengelige regioner
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 Validering av regional tilgjengelighet

### Tjenestetilgjengelighet per region
```bash
# Sjekk tjenestetilgjengelighet på tvers av regioner
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

# Sjekk alle tjenester
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### Anbefalinger for regionvalg
```bash
# Anbefal optimale regioner basert på krav
recommend_region() {
    local requirements=$1  # "lavkostnad" | "ytelse" | "samsvar"
    
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

## 💰 Kostnadsplanlegging og estimering

### Ressurskostnadsestimering
```bash
# Estimer distribusjonskostnader
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # Opprett en midlertidig ressursgruppe for estimering
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # Distribuer infrastruktur i valideringsmodus
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # Rydd opp i midlertidig ressursgruppe
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### Anbefalinger for SKU-optimalisering
```bash
# Anbefal optimale SKU-er basert på krav
recommend_sku() {
    local service=$1
    local workload_type=$2  # "dev" | "staging" | "produksjon"
    
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

## 🚀 Automatiserte pre-flight kontroller

### Omfattende pre-flight skript
```bash
#!/bin/bash
# preflight-check.sh - Fullstendig validering før distribusjon

set -e

# Konfigurasjon
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# Farger for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # Ingen farge

# Loggingsfunksjoner
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# Last inn konfigurasjon
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

# Sjekk 1: Autentisering
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# Sjekk 2: Regional tilgjengelighet
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# Sjekk 3: Kvotavalidering
log_info "Checking quota availability..."

# vCPU-kvote
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

# Lagringskonto-kvote
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

# Sjekk 4: Tjenestetilgjengelighet
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

# Sjekk 5: Nettverkskapasitet
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

# Sjekk 6: Ressursnavnvalidering
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# Sjekk 7: Kostnadsestimering
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

# Sjekk 8: Malvalidering
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

# Endelig oppsummering
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### Konfigurasjonsfilmal
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

## 📈 Overvåking av kapasitet under utrulling

### Sanntidskapasitetsovervåking
```bash
# Overvåk kapasitet under distribusjon
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # Sjekk distribusjonsstatus
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
        
        # Sjekk nåværende ressursbruk
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 Integrasjon med AZD

### Legg til pre-flight hooks i azure.yaml
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

## Beste praksis

1. **Kjør alltid kapasitetskontroller** før utrulling til nye regioner
2. **Overvåk kvotebruk regelmessig** for å unngå overraskelser
3. **Planlegg for vekst** ved å sjekke fremtidige kapasitetsbehov
4. **Bruk kostnadsestimeringsverktøy** for å unngå uventede regninger
5. **Dokumenter kapasitetskrav** for teamet ditt
6. **Automatiser kapasitetsvalidering** i CI/CD-pipelines
7. **Vurder regionale failover** kapasitetskrav

## Neste steg

- [SKU-valgveiledning](sku-selection.md) - Velg optimale tjenestenivåer
- [Pre-flight kontroller](preflight-checks.md) - Automatiserte valideringsskript
- [Hurtigreferanse](../../resources/cheat-sheet.md) - Kommandoer for rask tilgang
- [Ordliste](../../resources/glossary.md) - Begreper og definisjoner

## Tilleggsressurser

- [Azure abonnementsgrenser](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Azure prisberegner](https://azure.microsoft.com/pricing/calculator/)
- [Azure kostnadsstyring](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Azure regional tilgjengelighet](https://azure.microsoft.com/global-infrastructure/services/)

---

**Navigasjon**
- **Forrige leksjon**: [Feilsøkingsveiledning](../troubleshooting/debugging.md)

- **Neste leksjon**: [SKU-valg](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
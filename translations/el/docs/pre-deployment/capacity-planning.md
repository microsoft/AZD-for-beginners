# Σχεδιασμός Χωρητικότητας - Διαθεσιμότητα και Όρια Πόρων Azure

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 6 - Επικύρωση & Σχεδιασμός Πριν την Ανάπτυξη
- **⬅️ Προηγούμενο Κεφάλαιο**: [Κεφάλαιο 5: Λύσεις AI με Πολλαπλούς Πράκτορες](../../examples/retail-scenario.md)
- **➡️ Επόμενο**: [Επιλογή SKU](sku-selection.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 7: Αντιμετώπιση Προβλημάτων](../troubleshooting/common-issues.md)

## Εισαγωγή

Αυτός ο αναλυτικός οδηγός σας βοηθά να σχεδιάσετε και να επικυρώσετε τη χωρητικότητα πόρων Azure πριν την ανάπτυξη με το Azure Developer CLI. Μάθετε να αξιολογείτε ποσοστώσεις, διαθεσιμότητα και περιφερειακούς περιορισμούς για να εξασφαλίσετε επιτυχημένες αναπτύξεις ενώ βελτιστοποιείτε το κόστος και την απόδοση. Κατακτήστε τεχνικές σχεδιασμού χωρητικότητας για διαφορετικές αρχιτεκτονικές εφαρμογών και σενάρια κλιμάκωσης.

## Στόχοι Μάθησης

Με την ολοκλήρωση αυτού του οδηγού, θα:
- Κατανοήσετε τις ποσοστώσεις, τα όρια και τους περιφερειακούς περιορισμούς του Azure
- Κατακτήσετε τεχνικές για τον έλεγχο της διαθεσιμότητας και της χωρητικότητας πόρων πριν την ανάπτυξη
- Εφαρμόσετε αυτοματοποιημένες στρατηγικές επικύρωσης και παρακολούθησης χωρητικότητας
- Σχεδιάσετε εφαρμογές με σωστή διάσταση πόρων και κλιμάκωση
- Εφαρμόσετε στρατηγικές βελτιστοποίησης κόστους μέσω έξυπνου σχεδιασμού χωρητικότητας
- Ρυθμίσετε ειδοποιήσεις και παρακολούθηση για χρήση ποσοστώσεων και διαθεσιμότητα πόρων

## Αποτελέσματα Μάθησης

Με την ολοκλήρωση, θα μπορείτε να:
- Αξιολογείτε και να επικυρώνετε τις απαιτήσεις χωρητικότητας πόρων Azure πριν την ανάπτυξη
- Δημιουργείτε αυτοματοποιημένα scripts για έλεγχο χωρητικότητας και παρακολούθηση ποσοστώσεων
- Σχεδιάζετε αρχιτεκτονικές που κλιμακώνονται λαμβάνοντας υπόψη περιφερειακά και συνδρομητικά όρια
- Εφαρμόζετε στρατηγικές διάστασης πόρων που είναι οικονομικά αποδοτικές για διαφορετικούς τύπους φορτίων εργασίας
- Ρυθμίζετε προληπτική παρακολούθηση και ειδοποιήσεις για θέματα χωρητικότητας
- Σχεδιάζετε αναπτύξεις σε πολλές περιοχές με σωστή κατανομή χωρητικότητας

## Γιατί Είναι Σημαντικός ο Σχεδιασμός Χωρητικότητας

Πριν την ανάπτυξη εφαρμογών, πρέπει να εξασφαλίσετε:
- **Επαρκείς ποσοστώσεις** για τους απαιτούμενους πόρους
- **Διαθεσιμότητα πόρων** στην επιλεγμένη περιοχή
- **Διαθεσιμότητα επιπέδου υπηρεσίας** για τον τύπο συνδρομής σας
- **Χωρητικότητα δικτύου** για την αναμενόμενη κίνηση
- **Βελτιστοποίηση κόστους** μέσω σωστής διάστασης

## 📊 Κατανόηση Ποσοστώσεων και Ορίων Azure

### Τύποι Ορίων
1. **Ποσοστώσεις σε επίπεδο συνδρομής** - Μέγιστοι πόροι ανά συνδρομή
2. **Περιφερειακές ποσοστώσεις** - Μέγιστοι πόροι ανά περιοχή
3. **Όρια συγκεκριμένων πόρων** - Όρια για μεμονωμένους τύπους πόρων
4. **Όρια επιπέδου υπηρεσίας** - Όρια βάσει του πλάνου υπηρεσίας σας

### Συνηθισμένες Ποσοστώσεις Πόρων
```bash
# Ελέγξτε την τρέχουσα χρήση ποσοστώσεων
az vm list-usage --location eastus2 --output table

# Ελέγξτε συγκεκριμένες ποσοστώσεις πόρων
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## Έλεγχοι Χωρητικότητας Πριν την Ανάπτυξη

### Αυτοματοποιημένο Script Επικύρωσης Χωρητικότητας
```bash
#!/bin/bash
# capacity-check.sh - Επικύρωση χωρητικότητας Azure πριν από την ανάπτυξη

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# Λειτουργία για έλεγχο χρήσης ποσοστώσεων
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

# Έλεγχος διαφόρων ποσοστώσεων πόρων
check_quota "compute" 4      # Απαιτούνται 4 vCPUs
check_quota "storage" 2      # Απαιτούνται 2 λογαριασμοί αποθήκευσης
check_quota "network" 1      # Απαιτείται 1 εικονικό δίκτυο

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### Έλεγχοι Χωρητικότητας Ανά Υπηρεσία

#### Χωρητικότητα App Service
```bash
# Ελέγξτε τη διαθεσιμότητα του Σχεδίου Υπηρεσιών Εφαρμογής
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # Ελέγξτε τις διαθέσιμες SKU στην περιοχή
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # Προτείνετε εναλλακτικές περιοχές
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # Ελέγξτε την τρέχουσα χρήση
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# Χρήση
check_app_service_capacity "eastus2" "P1v3"
```

#### Χωρητικότητα Βάσης Δεδομένων
```bash
# Ελέγξτε τη χωρητικότητα του PostgreSQL
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # Ελέγξτε αν το SKU είναι διαθέσιμο
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # Εμφάνιση διαθέσιμων SKUs
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# Ελέγξτε τη χωρητικότητα του Cosmos DB
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # Ελέγξτε τη διαθεσιμότητα της περιοχής
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # Ελέγξτε αν υποστηρίζεται το serverless (αν χρειάζεται)
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

#### Χωρητικότητα Container Apps
```bash
# Ελέγξτε τη χωρητικότητα των Container Apps
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # Ελέγξτε αν τα Container Apps είναι διαθέσιμα στην περιοχή
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # Ελέγξτε τον τρέχοντα αριθμό περιβαλλόντων
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # Τα Container Apps έχουν όριο 15 περιβάλλοντα ανά περιοχή
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # Εμφάνιση διαθέσιμων περιοχών
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 Επικύρωση Περιφερειακής Διαθεσιμότητας

### Διαθεσιμότητα Υπηρεσιών Ανά Περιοχή
```bash
# Ελέγξτε τη διαθεσιμότητα υπηρεσιών σε όλες τις περιοχές
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

# Ελέγξτε όλες τις υπηρεσίες
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### Συστάσεις Επιλογής Περιοχής
```bash
# Προτείνετε βέλτιστες περιοχές βάσει απαιτήσεων
recommend_region() {
    local requirements=$1  # "χαμηλό κόστος" | "απόδοση" | "συμμόρφωση"
    
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

## 💰 Σχεδιασμός Κόστους και Εκτίμηση

### Εκτίμηση Κόστους Πόρων
```bash
# Εκτίμηση κόστους ανάπτυξης
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # Δημιουργία προσωρινής ομάδας πόρων για εκτίμηση
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # Ανάπτυξη υποδομής σε λειτουργία επικύρωσης
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # Καθαρισμός προσωρινής ομάδας πόρων
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### Συστάσεις Βελτιστοποίησης SKU
```bash
# Προτείνετε βέλτιστα SKUs βάσει απαιτήσεων
recommend_sku() {
    local service=$1
    local workload_type=$2  # "dev" | "staging" | "production"
    
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

## 🚀 Αυτοματοποιημένοι Έλεγχοι Πριν την Ανάπτυξη

### Αναλυτικό Script Πριν την Ανάπτυξη
```bash
#!/bin/bash
# preflight-check.sh - Ολοκληρωμένη επικύρωση πριν την ανάπτυξη

set -e

# Διαμόρφωση
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# Χρώματα για την έξοδο
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # Χωρίς χρώμα

# Λειτουργίες καταγραφής
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# Φόρτωση διαμόρφωσης
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

# Έλεγχος 1: Πιστοποίηση
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# Έλεγχος 2: Περιφερειακή διαθεσιμότητα
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# Έλεγχος 3: Επικύρωση ποσοστώσεων
log_info "Checking quota availability..."

# Ποσόστωση vCPU
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

# Ποσόστωση λογαριασμού αποθήκευσης
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

# Έλεγχος 4: Διαθεσιμότητα υπηρεσιών
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

# Έλεγχος 5: Χωρητικότητα δικτύου
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

# Έλεγχος 6: Επικύρωση ονομάτων πόρων
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# Έλεγχος 7: Εκτίμηση κόστους
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

# Έλεγχος 8: Επικύρωση προτύπου
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

# Τελική σύνοψη
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### Πρότυπο Αρχείου Ρύθμισης
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

## 📈 Παρακολούθηση Χωρητικότητας Κατά την Ανάπτυξη

### Παρακολούθηση Χωρητικότητας σε Πραγματικό Χρόνο
```bash
# Παρακολουθήστε τη χωρητικότητα κατά την ανάπτυξη
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # Ελέγξτε την κατάσταση της ανάπτυξης
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
        
        # Ελέγξτε την τρέχουσα χρήση πόρων
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 Ενσωμάτωση με AZD

### Προσθήκη Hooks Πριν την Ανάπτυξη στο azure.yaml
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

## Βέλτιστες Πρακτικές

1. **Πάντα να εκτελείτε ελέγχους χωρητικότητας** πριν την ανάπτυξη σε νέες περιοχές
2. **Παρακολουθείτε τη χρήση ποσοστώσεων τακτικά** για να αποφύγετε εκπλήξεις
3. **Σχεδιάστε για ανάπτυξη** ελέγχοντας τις μελλοντικές ανάγκες χωρητικότητας
4. **Χρησιμοποιήστε εργαλεία εκτίμησης κόστους** για να αποφύγετε απρόσμενα έξοδα
5. **Τεκμηριώστε τις απαιτήσεις χωρητικότητας** για την ομάδα σας
6. **Αυτοματοποιήστε την επικύρωση χωρητικότητας** στις διαδικασίες CI/CD
7. **Λάβετε υπόψη τις απαιτήσεις χωρητικότητας για εναλλακτικές περιοχές**

## Επόμενα Βήματα

- [Οδηγός Επιλογής SKU](sku-selection.md) - Επιλέξτε βέλτιστα επίπεδα υπηρεσιών
- [Έλεγχοι Πριν την Ανάπτυξη](preflight-checks.md) - Αυτοματοποιημένα scripts επικύρωσης
- [Σύντομος Οδηγός](../../resources/cheat-sheet.md) - Γρήγορες εντολές αναφοράς
- [Γλωσσάρι](../../resources/glossary.md) - Όροι και ορισμοί

## Πρόσθετοι Πόροι

- [Όρια Συνδρομής Azure](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Υπολογιστής Τιμολόγησης Azure](https://azure.microsoft.com/pricing/calculator/)
- [Διαχείριση Κόστους Azure](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Περιφερειακή Διαθεσιμότητα Azure](https://azure.microsoft.com/global-infrastructure/services/)

---

**Πλοήγηση**
- **Προηγούμενο Μάθημα**: [Οδηγός Εντοπισμού Σφαλμάτων](../troubleshooting/debugging.md)

- **Επόμενο Μάθημα**: [Επιλογή SKU](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτόματες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
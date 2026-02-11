# Kapacitástervezés - Azure erőforrások elérhetősége és korlátai

**Fejezet navigáció:**
- **📚 Kurzus főoldal**: [AZD For Beginners](../../README.md)
- **📖 Jelenlegi fejezet**: 6. fejezet - Előtelepítés előtti ellenőrzés és tervezés
- **⬅️ Előző fejezet**: [5. fejezet: Többügynökös MI megoldások](../../examples/retail-scenario.md)
- **➡️ Következő**: [SKU kiválasztás](sku-selection.md)
- **🚀 Következő fejezet**: [7. fejezet: Hibaelhárítás](../chapter-07-troubleshooting/common-issues.md)

## Bevezetés

Ez az átfogó útmutató segít a Azure erőforrások kapacitásának megtervezésében és érvényesítésében az Azure Developer CLI-vel történő telepítés előtt. Tanulja meg felmérni a kvótákat, elérhetőséget és regionális korlátozásokat, hogy biztosítsa a sikeres telepítéseket, miközben optimalizálja a költségeket és a teljesítményt. Sajátítsa el a kapacitástervezési technikákat különböző alkalmazás-architektúrák és skálázási forgatókönyvek esetére.

## Tanulási célok

A útmutató elvégzésével Ön:
- Megérti az Azure kvótáit, korlátait és regionális elérhetőségi korlátait
- Elsajátítja az erőforrás-elérhetőség és kapacitás ellenőrzésének technikáit telepítés előtt
- Megvalósít automatizált kapacitás-érvényesítési és monitorozási stratégiákat
- Olyan alkalmazásokat tervez, amelyek megfelelő méretezéssel és skálázási megfontolásokkal rendelkeznek
- Alkalmaz költségoptimalizálási stratégiákat intelligens kapacitástervezéssel
- Konfigurál riasztásokat és monitorozást a kvótahasználathoz és az erőforrások elérhetőségéhez

## Tanulási eredmények

A befejezést követően képes lesz:
- Felmérni és érvényesíteni az Azure erőforrás kapacitásigényeit telepítés előtt
- Automatizált szkripteket létrehozni kapacitás-ellenőrzésre és kvóta-monitorozásra
- Olyan skálázható architektúrákat tervezni, amelyek figyelembe veszik a regionális és előfizetési korlátokat
- Költséghatékony erőforrás-méretezési stratégiákat alkalmazni különböző munkaterhelésekhez
- Proaktív monitorozást és riasztást konfigurálni kapacitással kapcsolatos problémákra
- Többrégiós telepítéseket tervezni megfelelő kapacitás-elosztással

## Miért fontos a kapacitástervezés

Alkalmazások telepítése előtt biztosítania kell:
- **Megfelelő kvótákat** a szükséges erőforrásokhoz
- **Erőforrás elérhetőséget** a cél régióban
- **Szolgáltatási szint elérhetőséget** az előfizetés típusához
- **Hálózati kapacitást** a várt forgalomhoz
- **Költségoptimalizálást** megfelelő méretezéssel

## 📊 Az Azure kvóták és korlátok megértése

### A korlátok típusai
1. **Előfizetés-szintű kvóták** - Maximális erőforrások előfizetésenként
2. **Regionális kvóták** - Maximális erőforrások régiónként
3. **Erőforrás-specifikus korlátok** - Egyes erőforrástípusokra vonatkozó korlátok
4. **Szolgáltatási szint korlátok** - A szolgáltatási terv alapú korlátok

### Gyakori erőforrás-kvóták
```bash
# Ellenőrizze az aktuális kvótahasználatot
az vm list-usage --location eastus2 --output table

# Ellenőrizze a konkrét erőforrások kvótáit
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## Előtelepítés előtti kapacitás-ellenőrzések

### Automatizált kapacitás-érvényesítő szkript
```bash
#!/bin/bash
# capacity-check.sh - Azure kapacitás ellenőrzése a telepítés előtt

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# Függvény a kvótahasználat ellenőrzésére
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

# Különböző erőforráskvóták ellenőrzése
check_quota "compute" 4      # Szükséges 4 vCPU
check_quota "storage" 2      # Szükséges 2 tárolófiók
check_quota "network" 1      # Szükséges 1 virtuális hálózat

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### Szolgáltatás-specifikus kapacitás-ellenőrzések

#### App Service kapacitása
```bash
# Ellenőrizze az App Service Plan elérhetőségét
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # Ellenőrizze a régióban elérhető SKU-kat
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # Javasoljon alternatív régiókat
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # Ellenőrizze az aktuális használatot
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# Használat
check_app_service_capacity "eastus2" "P1v3"
```

#### Adatbázis-kapacitás
```bash
# Ellenőrizze a PostgreSQL kapacitását
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # Ellenőrizze, hogy az SKU elérhető-e
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # Mutassa az elérhető SKU-kat
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# Ellenőrizze a Cosmos DB kapacitását
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # Ellenőrizze a régió elérhetőségét
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # Ellenőrizze, hogy a serverless támogatott-e (ha szükséges)
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

#### Container Apps kapacitása
```bash
# Ellenőrizze a Container Apps kapacitását
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # Ellenőrizze, hogy a Container Apps elérhető-e a régióban
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # Ellenőrizze az aktuális környezetek számát
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # A Container Apps esetében régiónként legfeljebb 15 környezet engedélyezett
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # Mutassa az elérhető régiókat
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 Regionális elérhetőség ellenőrzése

### Szolgáltatás elérhetősége régiónként
```bash
# Ellenőrizze a szolgáltatások elérhetőségét régiónként
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

# Ellenőrizze az összes szolgáltatást
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### Régió kiválasztási ajánlások
```bash
# Ajánljon optimális régiókat a követelmények alapján
recommend_region() {
    local requirements=$1  # "alacsony költség" | "teljesítmény" | "megfelelés"
    
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

## 💰 Költségtervezés és becslés

### Erőforrás-költség becslés
```bash
# Becsülje meg a telepítési költségeket
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # Hozzon létre egy ideiglenes erőforráscsoportot a becsléshez
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # Telepítse az infrastruktúrát érvényesítési módban
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # Törölje az ideiglenes erőforráscsoportot
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### SKU optimalizálási ajánlások
```bash
# Ajánljon optimális SKU-kat a követelmények alapján
recommend_sku() {
    local service=$1
    local workload_type=$2  # "fejlesztés" | "teszt" | "éles"
    
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

## 🚀 Automatizált előellenőrzések

### Átfogó előellenőrző szkript
```bash
#!/bin/bash
# preflight-check.sh - Teljes telepítés előtti ellenőrzés

set -e

# Konfiguráció
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# Kimenet színei
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # Nincs szín

# Naplózó függvények
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# Konfiguráció betöltése
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

# Ellenőrzés 1: Hitelesítés
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# Ellenőrzés 2: Regionális elérhetőség
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# Ellenőrzés 3: Kvóta ellenőrzése
log_info "Checking quota availability..."

# vCPU kvóta
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

# Tárolási fiók kvóta
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

# Ellenőrzés 4: Szolgáltatás elérhetősége
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

# Ellenőrzés 5: Hálózati kapacitás
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

# Ellenőrzés 6: Erőforrásnevek érvényesítése
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# Ellenőrzés 7: Költségbecslés
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

# Ellenőrzés 8: Sablon érvényesítése
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

# Végső összegzés
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### Konfigurációs fájl sablon
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

## 📈 Kapacitás monitorozása telepítés közben

### Valós idejű kapacitásfigyelés
```bash
# Figyeld a kapacitást telepítés közben
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # Ellenőrizd a telepítés állapotát
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
        
        # Ellenőrizd az aktuális erőforráshasználatot
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 Integráció az AZD-vel

### Előellenőrzési hookok hozzáadása az azure.yaml-hoz
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

## Legjobb gyakorlatok

1. **Mindig futtass kapacitás-ellenőrzéseket** új régiókba történő telepítés előtt
2. **Rendszeresen figyeld a kvótahasználatot**, hogy elkerüld a meglepetéseket
3. **Tervezd a növekedést** a jövőbeni kapacitásigények ellenőrzésével
4. **Használj költségbecslő eszközöket**, hogy elkerüld a számlameglepetéseket
5. **Dokumentáld a kapacitáskövetelményeket** a csapatod számára
6. **Automatizáld a kapacitás-ellenőrzést** CI/CD pipeline-okban
7. **Fontold meg a regionális failover** kapacitáskövetelményeket

## Következő lépések

- [SKU kiválasztási útmutató](sku-selection.md) - Válassz optimális szolgáltatási szinteket
- [Előellenőrzések](preflight-checks.md) - Automatizált ellenőrző szkriptek
- [Gyorsparancsok](../../resources/cheat-sheet.md) - Gyors referencia parancsok
- [Fogalomtár](../../resources/glossary.md) - Fogalmak és definíciók

## További források

- [Azure előfizetési korlátok](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Azure árkalkulátor](https://azure.microsoft.com/pricing/calculator/)
- [Azure költségkezelés](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Azure régiós elérhetőség](https://azure.microsoft.com/global-infrastructure/services/)

---

**Navigáció**
- **Előző lecke**: [Hibakeresési útmutató](../chapter-07-troubleshooting/debugging.md)

- **Következő lecke**: [SKU kiválasztás](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősségkizárás**:
Ez a dokumentum az AI fordító szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) használatával készült. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő irányadónak. Kritikus jelentőségű információk esetén szakmai, emberi fordítást javaslunk. Nem vállalunk felelősséget a fordítás használatából eredő bármilyen félreértésért vagy téves értelmezésért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
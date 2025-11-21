<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "133c6f0d02c698cbe1cdb5d405ad4994",
  "translation_date": "2025-11-20T22:09:56+00:00",
  "source_file": "docs/pre-deployment/capacity-planning.md",
  "language_code": "it"
}
-->
# Pianificazione della Capacità - Disponibilità e Limiti delle Risorse Azure

**Navigazione del Capitolo:**
- **📚 Corso Principale**: [AZD per Principianti](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 6 - Validazione e Pianificazione Pre-Distribuzione
- **⬅️ Capitolo Precedente**: [Capitolo 5: Soluzioni AI Multi-Agenti](../../examples/retail-scenario.md)
- **➡️ Prossimo**: [Selezione SKU](sku-selection.md)
- **🚀 Capitolo Successivo**: [Capitolo 7: Risoluzione dei Problemi](../troubleshooting/common-issues.md)

## Introduzione

Questa guida completa ti aiuta a pianificare e validare la capacità delle risorse Azure prima della distribuzione con Azure Developer CLI. Imparerai a valutare quote, disponibilità e limitazioni regionali per garantire distribuzioni di successo ottimizzando costi e prestazioni. Padroneggia le tecniche di pianificazione della capacità per diverse architetture applicative e scenari di scalabilità.

## Obiettivi di Apprendimento

Completando questa guida, sarai in grado di:
- Comprendere le quote, i limiti e i vincoli di disponibilità regionale di Azure
- Padroneggiare le tecniche per verificare la disponibilità e la capacità delle risorse prima della distribuzione
- Implementare strategie automatizzate di validazione e monitoraggio della capacità
- Progettare applicazioni con dimensionamento e considerazioni di scalabilità adeguate
- Applicare strategie di ottimizzazione dei costi attraverso una pianificazione intelligente della capacità
- Configurare avvisi e monitoraggio per l'uso delle quote e la disponibilità delle risorse

## Risultati di Apprendimento

Al termine, sarai in grado di:
- Valutare e validare i requisiti di capacità delle risorse Azure prima della distribuzione
- Creare script automatizzati per il controllo della capacità e il monitoraggio delle quote
- Progettare architetture scalabili che tengano conto dei limiti regionali e di sottoscrizione
- Implementare strategie di dimensionamento delle risorse convenienti per diversi tipi di carico di lavoro
- Configurare un monitoraggio proattivo e avvisi per problemi legati alla capacità
- Pianificare distribuzioni multi-regione con una corretta distribuzione della capacità

## Perché la Pianificazione della Capacità è Importante

Prima di distribuire applicazioni, è necessario assicurarsi:
- **Quote sufficienti** per le risorse richieste
- **Disponibilità delle risorse** nella regione di destinazione
- **Disponibilità del livello di servizio** per il tipo di sottoscrizione
- **Capacità di rete** per il traffico previsto
- **Ottimizzazione dei costi** attraverso un dimensionamento adeguato

## 📊 Comprendere le Quote e i Limiti di Azure

### Tipi di Limiti
1. **Quote a livello di sottoscrizione** - Risorse massime per sottoscrizione
2. **Quote regionali** - Risorse massime per regione
3. **Limiti specifici delle risorse** - Limiti per tipi di risorse individuali
4. **Limiti del livello di servizio** - Limiti basati sul piano di servizio

### Quote Comuni delle Risorse
```bash
# Controlla l'utilizzo attuale della quota
az vm list-usage --location eastus2 --output table

# Controlla le quote delle risorse specifiche
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## Controlli di Capacità Pre-Distribuzione

### Script di Validazione Automatica della Capacità
```bash
#!/bin/bash
# capacity-check.sh - Convalida la capacità di Azure prima della distribuzione

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# Funzione per controllare l'utilizzo della quota
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

# Controlla varie quote di risorse
check_quota "compute" 4      # Necessari 4 vCPU
check_quota "storage" 2      # Necessari 2 account di archiviazione
check_quota "network" 1      # Necessaria 1 rete virtuale

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### Controlli di Capacità Specifici per Servizio

#### Capacità del Servizio App
```bash
# Controlla la disponibilità del piano di servizio dell'app
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # Controlla gli SKU disponibili nella regione
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # Suggerisci regioni alternative
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # Controlla l'utilizzo corrente
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# Utilizzo
check_app_service_capacity "eastus2" "P1v3"
```

#### Capacità del Database
```bash
# Controlla la capacità di PostgreSQL
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # Controlla se SKU è disponibile
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # Mostra gli SKU disponibili
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# Controlla la capacità di Cosmos DB
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # Controlla la disponibilità della regione
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # Controlla se il serverless è supportato (se necessario)
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

#### Capacità delle App Container
```bash
# Controlla la capacità delle Container Apps
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # Verifica se Container Apps è disponibile nella regione
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # Controlla il numero attuale di ambienti
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # Container Apps ha un limite di 15 ambienti per regione
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # Mostra le regioni disponibili
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 Validazione della Disponibilità Regionale

### Disponibilità dei Servizi per Regione
```bash
# Controlla la disponibilità del servizio nelle regioni
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

# Controlla tutti i servizi
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### Raccomandazioni per la Selezione della Regione
```bash
# Consiglia regioni ottimali in base ai requisiti
recommend_region() {
    local requirements=$1  # "basso costo" | "prestazioni" | "conformità"
    
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

## 💰 Pianificazione e Stima dei Costi

### Stima dei Costi delle Risorse
```bash
# Stimare i costi di distribuzione
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # Creare un gruppo di risorse temporaneo per la stima
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # Distribuire l'infrastruttura in modalità di convalida
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # Pulire il gruppo di risorse temporaneo
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### Raccomandazioni per l'Ottimizzazione degli SKU
```bash
# Consiglia SKU ottimali in base ai requisiti
recommend_sku() {
    local service=$1
    local workload_type=$2  # "dev" | "staging" | "produzione"
    
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

## 🚀 Controlli Pre-Distribuzione Automatizzati

### Script Completo di Controllo Pre-Distribuzione
```bash
#!/bin/bash
# preflight-check.sh - Validazione completa pre-distribuzione

set -e

# Configurazione
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# Colori per l'output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # Nessun colore

# Funzioni di registrazione
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# Carica configurazione
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

# Controllo 1: Autenticazione
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# Controllo 2: Disponibilità regionale
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# Controllo 3: Validazione delle quote
log_info "Checking quota availability..."

# Quota vCPU
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

# Quota account di archiviazione
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

# Controllo 4: Disponibilità del servizio
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

# Controllo 5: Capacità di rete
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

# Controllo 6: Validazione dei nomi delle risorse
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# Controllo 7: Stima dei costi
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

# Controllo 8: Validazione del modello
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

# Riepilogo finale
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### Modello di File di Configurazione
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

## 📈 Monitoraggio della Capacità Durante la Distribuzione

### Monitoraggio in Tempo Reale della Capacità
```bash
# Monitora la capacità durante il deployment
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # Controlla lo stato del deployment
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
        
        # Controlla l'utilizzo attuale delle risorse
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 Integrazione con AZD

### Aggiungere Hook Pre-Distribuzione a azure.yaml
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

## Migliori Pratiche

1. **Esegui sempre controlli di capacità** prima di distribuire in nuove regioni
2. **Monitora regolarmente l'uso delle quote** per evitare sorprese
3. **Pianifica la crescita** verificando le necessità di capacità future
4. **Usa strumenti di stima dei costi** per evitare sorprese in bolletta
5. **Documenta i requisiti di capacità** per il tuo team
6. **Automatizza la validazione della capacità** nelle pipeline CI/CD
7. **Considera i requisiti di capacità per il failover regionale**

## Prossimi Passi

- [Guida alla Selezione degli SKU](sku-selection.md) - Scegli i livelli di servizio ottimali
- [Controlli Pre-Distribuzione](preflight-checks.md) - Script di validazione automatizzati
- [Cheat Sheet](../../resources/cheat-sheet.md) - Comandi di riferimento rapido
- [Glossario](../../resources/glossary.md) - Termini e definizioni

## Risorse Aggiuntive

- [Limiti delle Sottoscrizioni Azure](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Calcolatore dei Prezzi Azure](https://azure.microsoft.com/pricing/calculator/)
- [Gestione dei Costi Azure](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Disponibilità Regionale di Azure](https://azure.microsoft.com/global-infrastructure/services/)

---

**Navigazione**
- **Lezione Precedente**: [Guida al Debugging](../troubleshooting/debugging.md)

- **Prossima Lezione**: [Selezione SKU](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si consiglia una traduzione professionale umana. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
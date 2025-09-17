#!/bin/bash

# retail Multi-Agent Solution - ARM Template Deployment Script
# This script deploys the complete retail multi-agent customer support solution

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
RESOURCE_GROUP=""
LOCATION="eastus2"
TEMPLATE_FILE="azuredeploy.json"
PARAMETERS_FILE="azuredeploy.parameters.json"
DEPLOYMENT_NAME="retail-deployment-$(date +%Y%m%d-%H%M%S)"
PROJECT_NAME="retail"
ENVIRONMENT="dev"
DEPLOYMENT_MODE="standard"
ENABLE_MULTI_REGION=true
ENABLE_MONITORING=true
ENABLE_SECURITY=true

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to show usage
show_usage() {
    cat << EOF
Usage: $0 [OPTIONS]

Deploy the retail Multi-Agent Customer Support Solution using ARM Template

OPTIONS:
    -g, --resource-group    Resource group name (required)
    -l, --location          Azure region (default: eastus2)
    -p, --project-name      Project name prefix (default: retail)
    -e, --environment       Environment (dev/staging/prod) (default: dev)
    -m, --deployment-mode   Deployment mode (minimal/standard/premium) (default: standard)
    --no-multi-region      Disable multi-region deployment
    --no-monitoring        Disable monitoring features
    --no-security          Disable security features
    -h, --help             Show this help message

EXAMPLES:
    # Basic deployment
    $0 -g myResourceGroup

    # Production deployment with premium features
    $0 -g myProductionRG -e prod -m premium -l eastus2

    # Minimal development deployment
    $0 -g myDevRG -e dev -m minimal --no-multi-region

EOF
}

# Function to validate prerequisites
validate_prerequisites() {
    print_status "Validating prerequisites..."
    
    # Check if Azure CLI is installed
    if ! command -v az &> /dev/null; then
        print_error "Azure CLI is not installed. Please install it first."
        exit 1
    fi
    
    # Check if logged in to Azure
    if ! az account show &> /dev/null; then
        print_error "Not logged in to Azure. Please run 'az login' first."
        exit 1
    fi
    
    # Check if template file exists
    if [[ ! -f "$TEMPLATE_FILE" ]]; then
        print_error "Template file '$TEMPLATE_FILE' not found."
        exit 1
    fi
    
    # Check if parameters file exists
    if [[ ! -f "$PARAMETERS_FILE" ]]; then
        print_error "Parameters file '$PARAMETERS_FILE' not found."
        exit 1
    fi
    
    print_success "Prerequisites validated successfully"
}

# Function to check resource group
check_resource_group() {
    print_status "Checking resource group '$RESOURCE_GROUP'..."
    
    if az group show --name "$RESOURCE_GROUP" &> /dev/null; then
        print_warning "Resource group '$RESOURCE_GROUP' already exists"
    else
        print_status "Creating resource group '$RESOURCE_GROUP' in '$LOCATION'..."
        az group create --name "$RESOURCE_GROUP" --location "$LOCATION"
        print_success "Resource group created successfully"
    fi
}

# Function to validate deployment
validate_deployment() {
    print_status "Validating ARM template deployment..."
    
    az deployment group validate \
        --resource-group "$RESOURCE_GROUP" \
        --template-file "$TEMPLATE_FILE" \
        --parameters "$PARAMETERS_FILE" \
        --parameters projectName="$PROJECT_NAME" \
                    location="$LOCATION" \
                    environmentName="$ENVIRONMENT" \
                    deploymentMode="$DEPLOYMENT_MODE" \
                    enableMultiRegion="$ENABLE_MULTI_REGION" \
                    enableMonitoring="$ENABLE_MONITORING" \
                    enableSecurity="$ENABLE_SECURITY"
    
    if [[ $? -eq 0 ]]; then
        print_success "Template validation passed"
    else
        print_error "Template validation failed"
        exit 1
    fi
}

# Function to deploy resources
deploy_resources() {
    print_status "Starting ARM template deployment..."
    print_status "Deployment name: $DEPLOYMENT_NAME"
    print_status "This may take 15-30 minutes..."
    
    az deployment group create \
        --resource-group "$RESOURCE_GROUP" \
        --name "$DEPLOYMENT_NAME" \
        --template-file "$TEMPLATE_FILE" \
        --parameters "$PARAMETERS_FILE" \
        --parameters projectName="$PROJECT_NAME" \
                    location="$LOCATION" \
                    environmentName="$ENVIRONMENT" \
                    deploymentMode="$DEPLOYMENT_MODE" \
                    enableMultiRegion="$ENABLE_MULTI_REGION" \
                    enableMonitoring="$ENABLE_MONITORING" \
                    enableSecurity="$ENABLE_SECURITY" \
        --verbose
    
    if [[ $? -eq 0 ]]; then
        print_success "Deployment completed successfully"
    else
        print_error "Deployment failed"
        exit 1
    fi
}

# Function to show deployment outputs
show_outputs() {
    print_status "Retrieving deployment outputs..."
    
    OUTPUTS=$(az deployment group show \
        --resource-group "$RESOURCE_GROUP" \
        --name "$DEPLOYMENT_NAME" \
        --query properties.outputs \
        --output json)
    
    if [[ $? -eq 0 ]]; then
        echo ""
        print_success "=== DEPLOYMENT OUTPUTS ==="
        echo "$OUTPUTS" | jq -r '
            "Frontend URL: " + .frontendUrl.value,
            "Router URL: " + .routerUrl.value,
            "Primary OpenAI Endpoint: " + .openAiEndpointPrimary.value,
            "Search Service: " + .searchServiceEndpoint.value,
            "Storage Account: " + .storageAccountName.value,
            (if .keyVaultName.value then "Key Vault: " + .keyVaultName.value else empty end),
            (if .applicationInsightsName.value then "Application Insights: " + .applicationInsightsName.value else empty end),
            "Cosmos DB: " + .cosmosDbAccountName.value
        '
        echo ""
        print_success "=== DEPLOYMENT SUMMARY ==="
        echo "$OUTPUTS" | jq -r '.deploymentSummary.value | to_entries[] | "\(.key): \(.value)"'
    else
        print_warning "Could not retrieve deployment outputs"
    fi
}

# Function to run post-deployment configuration
post_deployment_setup() {
    print_status "Running post-deployment configuration..."
    
    # Get the search service name and key
    SEARCH_SERVICE=$(az deployment group show \
        --resource-group "$RESOURCE_GROUP" \
        --name "$DEPLOYMENT_NAME" \
        --query properties.outputs.searchServiceName.value \
        --output tsv)
    
    SEARCH_KEY=$(az search admin-key show \
        --service-name "$SEARCH_SERVICE" \
        --resource-group "$RESOURCE_GROUP" \
        --query primaryKey \
        --output tsv)
    
    print_status "Search service: $SEARCH_SERVICE"
    
    # Create search index (this would typically be done by a separate script)
    print_status "Search index creation would be configured here..."
    print_warning "Remember to run the data setup scripts to populate the search index"
    
    # Show next steps
    echo ""
    print_success "=== NEXT STEPS ==="
    echo "1. Configure your search index with product data"
    echo "2. Upload initial documents to the storage account"
    echo "3. Test the agent endpoints"
    echo "4. Configure CI/CD pipelines for application deployment"
    echo "5. Set up monitoring dashboards in Application Insights"
    echo ""
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -g|--resource-group)
            RESOURCE_GROUP="$2"
            shift 2
            ;;
        -l|--location)
            LOCATION="$2"
            shift 2
            ;;
        -p|--project-name)
            PROJECT_NAME="$2"
            shift 2
            ;;
        -e|--environment)
            ENVIRONMENT="$2"
            shift 2
            ;;
        -m|--deployment-mode)
            DEPLOYMENT_MODE="$2"
            shift 2
            ;;
        --no-multi-region)
            ENABLE_MULTI_REGION=false
            shift
            ;;
        --no-monitoring)
            ENABLE_MONITORING=false
            shift
            ;;
        --no-security)
            ENABLE_SECURITY=false
            shift
            ;;
        -h|--help)
            show_usage
            exit 0
            ;;
        *)
            print_error "Unknown option: $1"
            show_usage
            exit 1
            ;;
    esac
done

# Validate required parameters
if [[ -z "$RESOURCE_GROUP" ]]; then
    print_error "Resource group is required. Use -g or --resource-group"
    show_usage
    exit 1
fi

# Main execution
main() {
    echo ""
    print_status "=== retail MULTI-AGENT SOLUTION DEPLOYMENT ==="
    print_status "Project: $PROJECT_NAME"
    print_status "Environment: $ENVIRONMENT"
    print_status "Mode: $DEPLOYMENT_MODE"
    print_status "Resource Group: $RESOURCE_GROUP"
    print_status "Location: $LOCATION"
    print_status "Multi-Region: $ENABLE_MULTI_REGION"
    print_status "Monitoring: $ENABLE_MONITORING"
    print_status "Security: $ENABLE_SECURITY"
    echo ""
    
    validate_prerequisites
    check_resource_group
    validate_deployment
    deploy_resources
    show_outputs
    post_deployment_setup
    
    echo ""
    print_success "🎉 retail Multi-Agent Solution deployed successfully!"
    print_status "Check the outputs above for important URLs and resource names"
}

# Run main function
main
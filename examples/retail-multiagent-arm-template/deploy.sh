#!/usr/bin/env bash
# Provision an educational infrastructure scaffold, NOT a working agent application.
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
RESOURCE_GROUP=""
LOCATION="eastus2"
PROJECT_NAME="retail"
ENVIRONMENT="dev"
DEPLOYMENT_MODE="standard"
ENABLE_MULTI_REGION=true
ENABLE_MONITORING=true
ENABLE_SECURITY=true
DEPLOYMENT_NAME="retail-deployment-$(date +%Y%m%d-%H%M%S)"

show_usage() {
    printf '%s\n' \
        "Usage: $0 -g RESOURCE_GROUP [options]" \
        "Deploy infrastructure and hello-world placeholders; no agent code is included." \
        "  -g, --resource-group NAME  Required resource group" \
        "  -l, --location REGION      Primary region (default: eastus2)" \
        "  -p, --project-name NAME    Lowercase alphanumeric prefix, 3-10 characters" \
        "  -e, --environment NAME     dev, staging, or prod (default: dev)" \
        "  -m, --deployment-mode MODE minimal, standard, or premium (default: standard)" \
        "  --no-multi-region          Skip secondary and embeddings accounts" \
        "  --no-monitoring            Skip Application Insights and Log Analytics" \
        "  --no-security              Skip the empty Key Vault (NOT a security toggle)" \
        "  -h, --help                 Show help" \
        "Review model availability, quotas and costs in README.md before deploying."
}

fail() { printf 'Error: %s\n' "$*" >&2; exit 1; }
require_value() {
    [[ $# -ge 2 && -n "$2" && "$2" != -* ]] || fail "Missing value for $1"
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        -g|--resource-group) require_value "$@"; RESOURCE_GROUP="$2"; shift 2 ;;
        -l|--location) require_value "$@"; LOCATION="$2"; shift 2 ;;
        -p|--project-name) require_value "$@"; PROJECT_NAME="$2"; shift 2 ;;
        -e|--environment) require_value "$@"; ENVIRONMENT="$2"; shift 2 ;;
        -m|--deployment-mode) require_value "$@"; DEPLOYMENT_MODE="$2"; shift 2 ;;
        --no-multi-region) ENABLE_MULTI_REGION=false; shift ;;
        --no-monitoring) ENABLE_MONITORING=false; shift ;;
        --no-security) ENABLE_SECURITY=false; shift ;;
        -h|--help) show_usage; exit 0 ;;
        *) fail "Unknown option: $1" ;;
    esac
done

[[ -n "$RESOURCE_GROUP" ]] || fail "Resource group is required (-g)"
[[ "$PROJECT_NAME" =~ ^[a-z0-9]{3,10}$ ]] || fail "Project name must be 3-10 lowercase letters/digits"
[[ "$ENVIRONMENT" =~ ^(dev|staging|prod)$ ]] || fail "Environment must be dev, staging, or prod"
[[ "$DEPLOYMENT_MODE" =~ ^(minimal|standard|premium)$ ]] || fail "Mode must be minimal, standard, or premium"
command -v az >/dev/null 2>&1 || fail "Install Azure CLI first"
az account show --output none || fail "Sign in with az login and select the intended subscription"
[[ -f "$SCRIPT_DIR/azuredeploy.json" && -f "$SCRIPT_DIR/azuredeploy.parameters.json" ]] || fail "Template files are missing"

# An argument array preserves resource group names and paths containing spaces.
PARAMETERS=(
    --parameters "$SCRIPT_DIR/azuredeploy.parameters.json"
    --parameters "projectName=$PROJECT_NAME" "location=$LOCATION"
    "environmentName=$ENVIRONMENT" "deploymentMode=$DEPLOYMENT_MODE"
    "enableMultiRegion=$ENABLE_MULTI_REGION" "enableMonitoring=$ENABLE_MONITORING"
    "enableSecurity=$ENABLE_SECURITY"
)

if [[ "$(az group exists --name "$RESOURCE_GROUP" --output tsv)" != true ]]; then
    az group create --name "$RESOURCE_GROUP" --location "$LOCATION" --output none
fi

az deployment group validate \
    --resource-group "$RESOURCE_GROUP" --template-file "$SCRIPT_DIR/azuredeploy.json" \
    "${PARAMETERS[@]}" --output none

az deployment group create \
    --resource-group "$RESOURCE_GROUP" --name "$DEPLOYMENT_NAME" \
    --template-file "$SCRIPT_DIR/azuredeploy.json" "${PARAMETERS[@]}" --output none

az deployment group show --resource-group "$RESOURCE_GROUP" --name "$DEPLOYMENT_NAME" \
    --query properties.outputs --output json

printf '%s\n' \
    "Infrastructure provisioning finished. Router/frontend URLs serve hello-world placeholders." \
    "No agents, search indexes, data pipelines, RBAC assignments, or failover logic were installed." \
    "Build and test your application separately; see README.md." \
    "Delete the dedicated resource group when done to avoid ongoing charges."

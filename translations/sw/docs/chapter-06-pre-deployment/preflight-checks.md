# Ukaguzi wa Kabla ya Uwasilishaji kwa Usambazaji za AZD

**Uvinjari wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzaji](../../README.md)
- **📖 Sura ya Sasa**: Sura 6 - Uhakiki na Upangaji Kabla ya Uwasilishaji
- **⬅️ Iliyopita**: [Uchaguzi wa SKU](sku-selection.md)
- **➡️ Sura Ifuatayo**: [Sura 7: Utatuzi wa Matatizo](../chapter-07-troubleshooting/common-issues.md)
- **🔧 Inayohusiana**: [Sura 4: Mwongozo wa Uwasilishaji](../chapter-04-infrastructure/deployment-guide.md)

## Utangulizi

Mwongozo huu kamili unatoa skiripti za uthibitisho kabla ya uwasilishaji na taratibu za kuhakikisha mafanikio ya uwasilishaji wa Azure Developer CLI kabla hazijaanza. Jifunze kutekeleza ukaguzi wa moja kwa moja kwa ajili ya uthibitisho wa uthibitisho, upatikanaji wa rasilimali, vikwazo, uzingatiaji wa usalama, na mahitaji ya utendaji ili kuzuia kushindwa kwa uwasilishaji na kuboresha viwango vya mafanikio ya uwasilishaji.

## Malengo ya Kujifunza

Kwa kumaliza mwongozo huu, utakuwa umeweza:
- Kumaliza mbinu na skiripti za uthibitisho za kabla ya uwasilishaji zilizojiendesha
- Kuelewa mikakati kamili ya ukaguzi kwa uthibitisho, ruhusa, na vikwazo
- Kutekeleza taratibu za uthibitisho wa upatikanaji na uwezo wa rasilimali
- Kusanidi ukaguzi wa usalama na uzingatiaji wa sera za shirika
- Kubuni taratibu za makadirio ya gharama na uthibitisho wa bajeti
- Kuunda automatisering ya ukaguzi wa kabla ya uwasilishaji kwa pipelines za CI/CD

## Matokeo ya Kujifunza

Baada ya kumaliza, utakuwa unaweza:
- Kuunda na kutekeleza skiripti kamili za uthibitisho kabla ya kuanza
- Kubuni mtiririko wa ukaguzi unaojiendesha kwa mazingira tofauti ya uwasilishaji
- Kutekeleza taratibu na sera za uthibitisho maalum kwa mazingira
- Kusanidi ufuatiliaji wa hatua na arifa kwa uandaliwa wa uwasilishaji
- Kutatua masuala kabla ya uwasilishaji na kutekeleza hatua za kurekebisha
- Kuunganisha ukaguzi wa kabla ya uwasilishaji katika pipelines za DevOps na automatisering

## Jedwali la Yaliyomo

- [Muhtasari](../../../../docs/chapter-06-pre-deployment)
- [Skripti Iliyotautomatika ya Kabla ya Uwasilishaji](../../../../docs/chapter-06-pre-deployment)
- [Orodha ya Ukaguzi wa Mkono](../../../../docs/chapter-06-pre-deployment)
- [Uthibitisho wa Mazingira](../../../../docs/chapter-06-pre-deployment)
- [Uthibitisho wa Rasilimali](../../../../docs/chapter-06-pre-deployment)
- [Ukaguzi wa Usalama na Uzingatiaji](../../../../docs/chapter-06-pre-deployment)
- [Utendaji na Upangaji wa Uwezo](../../../../docs/chapter-06-pre-deployment)
- [Kutatuza Matatizo ya Kawaida](../../../../docs/chapter-06-pre-deployment)

---

## Muhtasari

Ukaguzi wa kabla ya uwasilishaji ni uthibitisho muhimu unaofanyika kabla ya kuwasilisha ili kuhakikisha:

- **Upatikanaji wa rasilimali** na vikwazo katika maeneo lengwa
- **Uthibitishaji na ruhusa** zimesanidiwa kwa usahihi
- **Uhalali wa templeti** na usahihi wa vigezo
- **Muunganisho wa mtandao** na utegemezi
- **Uzingatiaji wa usalama** na sera za shirika
- **Makadirio ya gharama** ndani ya vizingiti vya bajeti

### Wakati wa Kuendesha Ukaguzi wa Kabla ya Uwasilishaji

- **Kabla ya uwasilishaji wa kwanza** kwa mazingira mapya
- **Baada ya mabadiliko makubwa ya templeti**
- **Kabla ya uwasilishaji wa uzalishaji**
- **Wakati wa kubadilisha maeneo ya Azure**
- **Kama sehemu ya pipelines za CI/CD**

---

## Skripti Iliyotautomatika ya Kabla ya Uwasilishaji

### Kicheki cha Pre-flight cha PowerShell

```powershell
#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Comprehensive pre-flight checks for AZD deployments
.DESCRIPTION
    Validates authentication, permissions, quotas, and resource availability before deployment
.PARAMETER EnvironmentName
    AZD environment name to validate
.PARAMETER ResourceGroup
    Target resource group (optional, will be derived if not provided)
.PARAMETER Location
    Target Azure region
.EXAMPLE
    .\preflight-check.ps1 -EnvironmentName "production" -Location "eastus"
#>

param(
    [Parameter(Mandatory = $true)]
    [string]$EnvironmentName,
    
    [Parameter(Mandatory = $false)]
    [string]$ResourceGroup,
    
    [Parameter(Mandatory = $true)]
    [string]$Location,
    
    [Parameter(Mandatory = $false)]
    [switch]$Detailed
)

# Uwekaji wa rangi kwa matokeo
$Red = "`e[31m"
$Green = "`e[32m"
$Yellow = "`e[33m"
$Blue = "`e[34m"
$Reset = "`e[0m"

function Write-Status {
    param($Message, $Status, $Details = "")
    
    $statusIcon = switch ($Status) {
        "Success" { "${Green}✓${Reset}" }
        "Warning" { "${Yellow}⚠${Reset}" }
        "Error" { "${Red}✗${Reset}" }
        "Info" { "${Blue}ℹ${Reset}" }
    }
    
    Write-Host "$statusIcon $Message" -NoNewline
    if ($Details) {
        Write-Host " - $Details" -ForegroundColor Gray
    } else {
        Write-Host ""
    }
}

function Test-Prerequisites {
    Write-Host "${Blue}=== Prerequisites Check ===${Reset}"
    
    # Kagua usakinishaji wa AZD
    try {
        $azdVersion = azd version --output json | ConvertFrom-Json
        Write-Status "AZD CLI installed" "Success" "Version: $($azdVersion.azd.version)"
    }
    catch {
        Write-Status "AZD CLI not found" "Error" "Install from https://aka.ms/azd-install"
        return $false
    }
    
    # Kagua usakinishaji wa Azure CLI
    try {
        $azVersion = az version --output json | ConvertFrom-Json
        Write-Status "Azure CLI installed" "Success" "Version: $($azVersion.'azure-cli')"
    }
    catch {
        Write-Status "Azure CLI not found" "Error" "Install from https://aka.ms/azcli"
        return $false
    }
    
    # Kagua toleo la PowerShell
    if ($PSVersionTable.PSVersion.Major -ge 7) {
        Write-Status "PowerShell version" "Success" "Version: $($PSVersionTable.PSVersion)"
    }
    else {
        Write-Status "PowerShell version" "Warning" "Consider upgrading to PowerShell 7+"
    }
    
    return $true
}

function Test-Authentication {
    Write-Host "`n${Blue}=== Authentication Check ===${Reset}"
    
    try {
        # Kagua uthibitishaji wa AZD
        $azdAuth = azd auth login --check-status --output json 2>$null | ConvertFrom-Json
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
        }
        else {
            Write-Status "AZD authentication" "Error" "Run 'azd auth login'"
            return $false
        }
        
        # Kagua uthibitishaji wa Azure CLI
        $azAccount = az account show --output json | ConvertFrom-Json
        Write-Status "Azure CLI authentication" "Success" "Subscription: $($azAccount.name)"
        
        # Thibitisha upatikanaji wa usajili
        $subscriptionId = $azAccount.id
        $subscription = az account subscription show --subscription-id $subscriptionId --output json | ConvertFrom-Json
        Write-Status "Subscription access" "Success" "State: $($subscription.state)"
        
        return $true
    }
    catch {
        Write-Status "Authentication failed" "Error" $_.Exception.Message
        return $false
    }
}

function Test-Permissions {
    Write-Host "`n${Blue}=== Permissions Check ===${Reset}"
    
    try {
        # Pata uteuzi wa majukumu wa mtumiaji wa sasa
        $roleAssignments = az role assignment list --assignee (az account show --query user.name --output tsv) --output json | ConvertFrom-Json
        
        $hasContributor = $roleAssignments | Where-Object { 
            $_.roleDefinitionName -eq "Contributor" -or 
            $_.roleDefinitionName -eq "Owner" -or
            $_.roleDefinitionName -eq "User Access Administrator"
        }
        
        if ($hasContributor) {
            Write-Status "Required permissions" "Success" "Contributor or higher role found"
        }
        else {
            Write-Status "Required permissions" "Warning" "May need Contributor role for deployment"
        }
        
        # Jaribu uundaji wa kikundi cha rasilimali (ikiwa imetajwa)
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # Jaribu uwezo wa kuunda kikundi cha rasilimali
                try {
                    az group create --name "preflight-test-rg" --location $Location --output none
                    az group delete --name "preflight-test-rg" --yes --output none
                    Write-Status "Resource group creation" "Success" "Can create resource groups"
                }
                catch {
                    Write-Status "Resource group creation" "Error" "Cannot create resource groups"
                    return $false
                }
            }
        }
        
        return $true
    }
    catch {
        Write-Status "Permissions check failed" "Error" $_.Exception.Message
        return $false
    }
}

function Test-QuotasAndLimits {
    Write-Host "`n${Blue}=== Quotas and Limits Check ===${Reset}"
    
    try {
        # Kagua mipaka ya rasilimali za hesabu
        $computeUsage = az vm list-usage --location $Location --output json | ConvertFrom-Json
        
        # Kagua vikwazo maalum
        $coreQuota = $computeUsage | Where-Object { $_.name.value -eq "cores" }
        if ($coreQuota) {
            $usagePercent = [math]::Round(($coreQuota.currentValue / $coreQuota.limit) * 100, 2)
            if ($usagePercent -lt 80) {
                Write-Status "Compute cores quota" "Success" "$($coreQuota.currentValue)/$($coreQuota.limit) ($usagePercent%)"
            }
            else {
                Write-Status "Compute cores quota" "Warning" "$($coreQuota.currentValue)/$($coreQuota.limit) ($usagePercent%)"
            }
        }
        
        # Kagua mipaka ya App Service
        try {
            $appServiceUsage = az appservice list-locations --sku S1 --output json | ConvertFrom-Json
            if ($appServiceUsage | Where-Object { $_.name -eq $Location }) {
                Write-Status "App Service availability" "Success" "Available in $Location"
            }
            else {
                Write-Status "App Service availability" "Warning" "May not be available in $Location"
            }
        }
        catch {
            Write-Status "App Service quota check" "Warning" "Could not verify App Service limits"
        }
        
        # Kagua mipaka ya akaunti ya uhifadhi
        $storageAccounts = az storage account list --output json | ConvertFrom-Json
        $accountCount = ($storageAccounts | Measure-Object).Count
        if ($accountCount -lt 200) {
            Write-Status "Storage account limit" "Success" "$accountCount/250 storage accounts"
        }
        else {
            Write-Status "Storage account limit" "Warning" "$accountCount/250 storage accounts"
        }
        
        return $true
    }
    catch {
        Write-Status "Quota check failed" "Warning" $_.Exception.Message
        return $true # Isiyozuia
    }
}

function Test-NetworkConnectivity {
    Write-Host "`n${Blue}=== Network Connectivity Check ===${Reset}"
    
    # Jaribu vituo vya mwisho vya Azure
    $endpoints = @(
        "https://management.azure.com/",
        "https://login.microsoftonline.com/",
        "https://graph.microsoft.com/",
        "https://vault.azure.net/"
    )
    
    foreach ($endpoint in $endpoints) {
        try {
            $response = Invoke-WebRequest -Uri $endpoint -Method Head -TimeoutSec 10 -UseBasicParsing
            Write-Status "Connectivity to $endpoint" "Success" "Status: $($response.StatusCode)"
        }
        catch {
            Write-Status "Connectivity to $endpoint" "Error" $_.Exception.Message
        }
    }
    
    # Jaribu utatuzi wa DNS
    try {
        $dnsResult = Resolve-DnsName "management.azure.com" -ErrorAction Stop
        Write-Status "DNS resolution" "Success" "Resolved successfully"
    }
    catch {
        Write-Status "DNS resolution" "Error" "Cannot resolve Azure endpoints"
        return $false
    }
    
    return $true
}

function Test-TemplateValidation {
    Write-Host "`n${Blue}=== Template Validation ===${Reset}"
    
    # Kagua ikiwa azure.yaml ipo
    if (Test-Path "azure.yaml") {
        Write-Status "azure.yaml found" "Success"
        
        # Changanua azure.yaml
        try {
            $azureYaml = Get-Content "azure.yaml" -Raw | ConvertFrom-Yaml
            Write-Status "azure.yaml parsing" "Success"
            
            # Thibitisha huduma
            if ($azureYaml.services) {
                $serviceCount = ($azureYaml.services | Get-Member -MemberType NoteProperty).Count
                Write-Status "Services defined" "Success" "$serviceCount services found"
            }
            else {
                Write-Status "Services defined" "Warning" "No services defined in azure.yaml"
            }
        }
        catch {
            Write-Status "azure.yaml parsing" "Error" "Invalid YAML format"
            return $false
        }
    }
    else {
        Write-Status "azure.yaml not found" "Error" "Run 'azd init' to create configuration"
        return $false
    }
    
    # Kagua kwa faili za miundombinu
    if (Test-Path "infra") {
        $bicepFiles = Get-ChildItem -Path "infra" -Filter "*.bicep" -Recurse
        if ($bicepFiles.Count -gt 0) {
            Write-Status "Infrastructure templates" "Success" "$($bicepFiles.Count) Bicep files found"
            
            # Thibitisha main.bicep ikiwa ipo
            if (Test-Path "infra/main.bicep") {
                try {
                    az bicep build --file "infra/main.bicep" --stdout | Out-Null
                    Write-Status "Bicep template validation" "Success" "main.bicep is valid"
                }
                catch {
                    Write-Status "Bicep template validation" "Error" "main.bicep has errors"
                    return $false
                }
            }
        }
        else {
            Write-Status "Infrastructure templates" "Warning" "No Bicep files found in infra/"
        }
    }
    else {
        Write-Status "Infrastructure directory" "Error" "infra/ directory not found"
        return $false
    }
    
    # 🧪 MPYA: Jaribu muhtasari wa miundombinu (jaribio kavu salama)
    try {
        Write-Status "Infrastructure preview test" "Info" "Running safe dry-run validation..."
        $previewResult = azd provision --preview --output json 2>$null
        if ($LASTEXITCODE -eq 0) {
            Write-Status "Infrastructure preview" "Success" "Preview completed - no deployment errors detected"
        }
        else {
            Write-Status "Infrastructure preview" "Warning" "Preview detected potential issues - review before deployment"
        }
    }
    catch {
        Write-Status "Infrastructure preview" "Warning" "Could not run preview - ensure azd is latest version"
    }
    
    return $true
}

function Test-RegionalAvailability {
    Write-Host "`n${Blue}=== Regional Availability Check ===${Reset}"
    
    try {
        # Kagua ikiwa eneo ni halali
        $locations = az account list-locations --output json | ConvertFrom-Json
        $validLocation = $locations | Where-Object { $_.name -eq $Location -or $_.displayName -eq $Location }
        
        if ($validLocation) {
            Write-Status "Azure region" "Success" "Location '$Location' is valid"
        }
        else {
            Write-Status "Azure region" "Error" "Location '$Location' is not valid"
            return $false
        }
        
        # Kagua upatikanaji wa huduma katika mkoa
        $services = @("Microsoft.Web", "Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault")
        
        foreach ($service in $services) {
            try {
                $providers = az provider show --namespace $service --output json | ConvertFrom-Json
                $resourceTypes = $providers.resourceTypes | Where-Object { $_.locations -contains $Location }
                
                if ($resourceTypes) {
                    Write-Status "$service availability" "Success" "Available in $Location"
                }
                else {
                    Write-Status "$service availability" "Warning" "May not be available in $Location"
                }
            }
            catch {
                Write-Status "$service availability" "Warning" "Could not verify availability"
            }
        }
        
        return $true
    }
    catch {
        Write-Status "Regional availability check failed" "Error" $_.Exception.Message
        return $false
    }
}

function Test-CostEstimation {
    Write-Host "`n${Blue}=== Cost Estimation Check ===${Reset}"
    
    # Makadirio ya gharama ya msingi (inginahitaji Azure Pricing API kwa makadirio sahihi)
    Write-Status "Cost estimation" "Info" "Use Azure Pricing Calculator for detailed estimates"
    Write-Status "Monitoring setup" "Info" "Set up Azure Cost Management alerts"
    
    # Kagua ikiwa bajeti ipo
    try {
        $budgets = az consumption budget list --output json 2>$null | ConvertFrom-Json
        if ($budgets -and $budgets.Count -gt 0) {
            Write-Status "Budget monitoring" "Success" "$($budgets.Count) budgets configured"
        }
        else {
            Write-Status "Budget monitoring" "Warning" "No budgets configured - consider setting up cost alerts"
        }
    }
    catch {
        Write-Status "Budget check" "Warning" "Could not check budget configuration"
    }
    
    return $true
}

function Test-SecurityCompliance {
    Write-Host "`n${Blue}=== Security & Compliance Check ===${Reset}"
    
    # Kagua mbinu za kawaida za usalama
    try {
        # Kagua ikiwa Key Vault imewekwa
        if (Select-String -Path "infra/*.bicep" -Pattern "Microsoft.KeyVault" -Quiet) {
            Write-Status "Key Vault usage" "Success" "Key Vault detected in templates"
        }
        else {
            Write-Status "Key Vault usage" "Warning" "Consider using Key Vault for secrets"
        }
        
        # Kagua matumizi ya utambulisho uliosimamiwa
        if (Select-String -Path "infra/*.bicep" -Pattern "managedIdentity|SystemAssigned" -Quiet) {
            Write-Status "Managed Identity" "Success" "Managed Identity detected"
        }
        else {
            Write-Status "Managed Identity" "Warning" "Consider using Managed Identity"
        }
        
        # Kagua utekelezaji wa HTTPS
        if (Select-String -Path "infra/*.bicep" -Pattern "httpsOnly.*true|requireHttps.*true" -Quiet) {
            Write-Status "HTTPS enforcement" "Success" "HTTPS enforcement detected"
        }
        else {
            Write-Status "HTTPS enforcement" "Warning" "Ensure HTTPS is enforced"
        }
        
        return $true
    }
    catch {
        Write-Status "Security compliance check" "Warning" "Could not perform security validation"
        return $true
    }
}

# Utendaji mkuu
function Invoke-PreflightCheck {
    Write-Host "${Green}AZD Pre-flight Check${Reset}" -ForegroundColor Green
    Write-Host "Environment: $EnvironmentName"
    Write-Host "Location: $Location"
    if ($ResourceGroup) { Write-Host "Resource Group: $ResourceGroup" }
    Write-Host "Time: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    Write-Host ""
    
    $allPassed = $true
    $results = @{}
    
    # Endesha ukaguzi wote
    $results["Prerequisites"] = Test-Prerequisites
    $results["Authentication"] = Test-Authentication
    $results["Permissions"] = Test-Permissions
    $results["QuotasAndLimits"] = Test-QuotasAndLimits
    $results["NetworkConnectivity"] = Test-NetworkConnectivity
    $results["TemplateValidation"] = Test-TemplateValidation
    $results["RegionalAvailability"] = Test-RegionalAvailability
    $results["CostEstimation"] = Test-CostEstimation
    $results["SecurityCompliance"] = Test-SecurityCompliance
    
    # Muhtasari
    Write-Host "`n${Blue}=== Pre-flight Check Summary ===${Reset}"
    
    $passedCount = 0
    $totalCount = $results.Count
    
    foreach ($result in $results.GetEnumerator()) {
        if ($result.Value) {
            Write-Status $result.Key "Success"
            $passedCount++
        }
        else {
            Write-Status $result.Key "Error"
            $allPassed = $false
        }
    }
    
    Write-Host ""
    if ($allPassed) {
        Write-Host "${Green}✓ All pre-flight checks passed ($passedCount/$totalCount)${Reset}"
        Write-Host "${Green}✓ Ready for deployment!${Reset}"
        exit 0
    }
    else {
        Write-Host "${Red}✗ Some pre-flight checks failed ($passedCount/$totalCount)${Reset}"
        Write-Host "${Red}✗ Please resolve issues before deployment${Reset}"
        exit 1
    }
}

# Endesha ukaguzi wa awali
Invoke-PreflightCheck
```

### Kicheki cha Pre-flight cha Bash

```bash
#!/bin/bash
# Toleo la Bash la ukaguzi wa awali kwa mifumo ya Unix/Linux

set -euo pipefail

# Msimbo wa rangi
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # Hakuna rangi

# Vigezo vya kimataifa
ENVIRONMENT_NAME=""
LOCATION=""
RESOURCE_GROUP=""
DETAILED=false

print_status() {
    local message=$1
    local status=$2
    local details=${3:-""}
    
    case $status in
        "success")
            echo -e "${GREEN}✓${NC} $message${details:+ - $details}"
            ;;
        "warning")
            echo -e "${YELLOW}⚠${NC} $message${details:+ - $details}"
            ;;
        "error")
            echo -e "${RED}✗${NC} $message${details:+ - $details}"
            ;;
        "info")
            echo -e "${BLUE}ℹ${NC} $message${details:+ - $details}"
            ;;
    esac
}

check_prerequisites() {
    echo -e "${BLUE}=== Prerequisites Check ===${NC}"
    
    # Angalia usakinishaji wa AZD
    if command -v azd >/dev/null 2>&1; then
        local azd_version=$(azd version --output json | jq -r '.azd.version')
        print_status "AZD CLI installed" "success" "Version: $azd_version"
    else
        print_status "AZD CLI not found" "error" "Install from https://aka.ms/azd-install"
        return 1
    fi
    
    # Angalia usakinishaji wa Azure CLI
    if command -v az >/dev/null 2>&1; then
        local az_version=$(az version --output json | jq -r '."azure-cli"')
        print_status "Azure CLI installed" "success" "Version: $az_version"
    else
        print_status "Azure CLI not found" "error" "Install from https://aka.ms/azcli"
        return 1
    fi
    
    # Angalia usakinishaji wa jq
    if command -v jq >/dev/null 2>&1; then
        print_status "jq installed" "success"
    else
        print_status "jq not found" "warning" "Install jq for better JSON parsing"
    fi
    
    return 0
}

check_authentication() {
    echo -e "\n${BLUE}=== Authentication Check ===${NC}"
    
    # Angalia uthibitishaji wa AZD
    if azd auth login --check-status >/dev/null 2>&1; then
        local principal_name=$(azd auth login --check-status --output json 2>/dev/null | jq -r '.principalName // "Unknown"')
        print_status "AZD authentication" "success" "User: $principal_name"
    else
        print_status "AZD authentication" "error" "Run 'azd auth login'"
        return 1
    fi
    
    # Angalia uthibitishaji wa Azure CLI
    if az account show >/dev/null 2>&1; then
        local subscription_name=$(az account show --query 'name' --output tsv)
        print_status "Azure CLI authentication" "success" "Subscription: $subscription_name"
    else
        print_status "Azure CLI authentication" "error" "Run 'az login'"
        return 1
    fi
    
    return 0
}

check_template_validation() {
    echo -e "\n${BLUE}=== Template Validation ===${NC}"
    
    # Angalia azure.yaml
    if [[ -f "azure.yaml" ]]; then
        print_status "azure.yaml found" "success"
        
        # Uthibitishaji wa msingi wa YAML
        if python3 -c "import yaml; yaml.safe_load(open('azure.yaml'))" 2>/dev/null; then
            print_status "azure.yaml parsing" "success"
        else
            print_status "azure.yaml parsing" "error" "Invalid YAML format"
            return 1
        fi
    else
        print_status "azure.yaml not found" "error" "Run 'azd init' to create configuration"
        return 1
    fi
    
    # Angalia faili za miundombinu
    if [[ -d "infra" ]]; then
        local bicep_count=$(find infra -name "*.bicep" | wc -l)
        if [[ $bicep_count -gt 0 ]]; then
            print_status "Infrastructure templates" "success" "$bicep_count Bicep files found"
            
            # Thibitisha main.bicep ikiwa ipo
            if [[ -f "infra/main.bicep" ]]; then
                if az bicep build --file "infra/main.bicep" --stdout >/dev/null 2>&1; then
                    print_status "Bicep template validation" "success" "main.bicep is valid"
                else
                    print_status "Bicep template validation" "error" "main.bicep has errors"
                    return 1
                fi
            fi
        else
            print_status "Infrastructure templates" "warning" "No Bicep files found"
        fi
    else
        print_status "Infrastructure directory" "error" "infra/ directory not found"
        return 1
    fi
    
    return 0
}

check_regional_availability() {
    echo -e "\n${BLUE}=== Regional Availability Check ===${NC}"
    
    # Angalia ikiwa eneo ni halali
    if az account list-locations --query "[?name=='$LOCATION' || displayName=='$LOCATION']" --output tsv | grep -q .; then
        print_status "Azure region" "success" "Location '$LOCATION' is valid"
    else
        print_status "Azure region" "error" "Location '$LOCATION' is not valid"
        return 1
    fi
    
    # Angalia upatikanaji wa huduma
    local services=("Microsoft.Web" "Microsoft.Sql" "Microsoft.Storage" "Microsoft.KeyVault")
    
    for service in "${services[@]}"; do
        if az provider show --namespace "$service" --query "resourceTypes[?locations[?contains(@, '$LOCATION')]]" --output tsv | grep -q .; then
            print_status "$service availability" "success" "Available in $LOCATION"
        else
            print_status "$service availability" "warning" "May not be available in $LOCATION"
        fi
    done
    
    return 0
}

main() {
    # Changanua hoja za mstari wa amri
    while [[ $# -gt 0 ]]; do
        case $1 in
            --environment-name)
                ENVIRONMENT_NAME="$2"
                shift 2
                ;;
            --location)
                LOCATION="$2"
                shift 2
                ;;
            --resource-group)
                RESOURCE_GROUP="$2"
                shift 2
                ;;
            --detailed)
                DETAILED=true
                shift
                ;;
            *)
                echo "Unknown option: $1"
                exit 1
                ;;
        esac
    done
    
    # Thibitisha vigezo vinavyohitajika
    if [[ -z "$ENVIRONMENT_NAME" || -z "$LOCATION" ]]; then
        echo "Usage: $0 --environment-name <name> --location <location> [--resource-group <rg>] [--detailed]"
        exit 1
    fi
    
    echo -e "${GREEN}AZD Pre-flight Check${NC}"
    echo "Environment: $ENVIRONMENT_NAME"
    echo "Location: $LOCATION"
    [[ -n "$RESOURCE_GROUP" ]] && echo "Resource Group: $RESOURCE_GROUP"
    echo "Time: $(date '+%Y-%m-%d %H:%M:%S')"
    echo ""
    
    # Endesha ukaguzi
    local all_passed=true
    
    check_prerequisites || all_passed=false
    check_authentication || all_passed=false
    check_template_validation || all_passed=false
    check_regional_availability || all_passed=false
    
    # Muhtasari
    echo -e "\n${BLUE}=== Pre-flight Check Summary ===${NC}"
    
    if $all_passed; then
        echo -e "${GREEN}✓ All pre-flight checks passed${NC}"
        echo -e "${GREEN}✓ Ready for deployment!${NC}"
        exit 0
    else
        echo -e "${RED}✗ Some pre-flight checks failed${NC}"
        echo -e "${RED}✗ Please resolve issues before deployment${NC}"
        exit 1
    fi
}

# Endesha kazi kuu
main "$@"
```

---

## Orodha ya Ukaguzi ya Mkono

### Orodha ya Ukaguzi Kabla ya Uwasilishaji

Chapisha orodha hii ya ukaguzi na thibitisha kila kipengee kabla ya uwasilishaji:

#### ✅ Usanidi wa Mazingira
- [ ] AZD CLI imewekwa na kusasishwa hadi toleo la hivi karibuni
- [ ] Azure CLI imewekwa na kuthibitishwa
- [ ] Usajili sahihi wa Azure umechaguliwa
- [ ] Jina la mazingira ni la kipekee na linafuata kanuni za uundaji majina
- [ ] Kikundi cha rasilimali lengwa kimebainishwa au kinaweza kuundwa

#### ✅ Uthibitishaji na Ruhusa
- [ ] Uthibitishaji umefanikiwa kwa kutumia `azd auth login`
- [ ] Mtumiaji ana jukumu la Contributor kwenye usajili/kikundi cha rasilimali lengwa
- [ ] Service principal imeundwa kwa ajili ya CI/CD (ikiwa inahitajika)
- [ ] Hakuna vyeti au nyaraka za uthibitisho zilizoisha muda

#### ✅ Uthibitisho wa Templeti
- [ ] `azure.yaml` inapatikana na ni YAML sahihi
- [ ] Huduma zote zilizofafanuliwa katika azure.yaml zina msimbo wa chanzo unaofanana
- [ ] Templeti za Bicep kwenye saraka ya `infra/` zipo
- [ ] `main.bicep` inakusanya bila makosa (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 Mwoneko wa miundombinu unaendeshwa kwa mafanikio (`azd provision --preview`)
- [ ] Vigezo vyote vinavyohitajika vina thamani za kimsingi au vitawekwa
- [ ] Hakuna siri zilizofungwa kwao (hardcoded) katika templeti

#### ✅ Upangaji wa Rasilimali
- [ ] Eneo la Azure lengwa limechaguliwa na kuthibitishwa
- [ ] Huduma za Azure zinazohitajika zinapatikana katika eneo lengwa
- [ ] Vikwazo vya kutosha vinapatikana kwa rasilimali zilizopangwa
- [ ] Migongano ya majina ya rasilimali imetathminiwa
- [ ] Tegemezi kati ya rasilimali zimeeleweka

#### ✅ Mtandao na Usalama
- [ ] Muunganisho wa mtandao kwa sehemu za mwisho za Azure umethibitishwa
- [ ] Mipangilio ya firewall/proxy imesanidiwa ikiwa inahitajika
- [ ] Key Vault imesanidiwa kwa usimamizi wa siri
- [ ] Identiti zilizodhibitiwa zimetumika pale inapowezekana
- [ ] Utekelezaji wa HTTPS umewezeshwa kwa programu za wavuti

#### ✅ Usimamizi wa Gharama
- [ ] Makisio ya gharama yamehesabiwa kwa kutumia Azure Pricing Calculator
- [ ] Arifa za bajeti zimesanidiwa ikiwa zinahitajika
- [ ] SKUs zinazofaa zimechaguliwa kwa aina ya mazingira
- [ ] Uwezo uliohifadhiwa umezingatiwa kwa mzigo wa kazi wa uzalishaji

#### ✅ Ufuatiliaji na Uonekano
- [ ] Application Insights imesanidiwa katika templeti
- [ ] Eneo la kazi la Log Analytics limepangwa
- [ ] Sheria za onyo zimefafanuliwa kwa vipimo muhimu
- [ ] Vituo vya ukaguzi wa afya vimetekelezwa katika programu

#### ✅ Chelezo & Urejesho
- [ ] Mkakati wa chelezo umefafanuliwa kwa rasilimali za data
- [ ] Malengo ya muda wa urejesho (RTO) yameandikwa
- [ ] Malengo ya nukta za urejesho (RPO) yameandikwa
- [ ] Mpango wa urejesho wa dharura uko tayari kwa uzalishaji

---

## Uthibitisho wa Mazingira

### Uthibitisho wa Mazingira ya Maendeleo

```bash
#!/bin/bash
# Uthibitisho maalum wa mazingira ya maendeleo

validate_dev_environment() {
    echo "=== Development Environment Validation ==="
    
    # Angalia usanidi unaofaa kwa mazingira ya maendeleo
    if grep -q "sku.*Free\|sku.*F1\|sku.*Basic" infra/*.bicep; then
        echo "✓ Development-appropriate SKUs detected"
    else
        echo "⚠ Consider using lower-cost SKUs for development"
    fi
    
    # Angalia usanidi wa kuzimwa kiotomatiki
    if grep -q "autoShutdown\|deallocate" infra/*.bicep; then
        echo "✓ Auto-shutdown configuration found"
    else
        echo "ℹ Consider adding auto-shutdown for cost savings"
    fi
    
    # Thibitisha usanidi wa hifadhidata za maendeleo
    if grep -q "Basic\|S0\|S1" infra/*.bicep; then
        echo "✓ Development database tiers configured"
    else
        echo "⚠ Consider using Basic/Standard tiers for development databases"
    fi
}
```

### Uthibitisho wa Mazingira ya Uzalishaji

```bash
#!/bin/bash
# Uhakiki maalum wa mazingira ya uzalishaji

validate_prod_environment() {
    echo "=== Production Environment Validation ==="
    
    # Angalia usanidi wa upatikanaji wa juu
    if grep -q "zoneRedundant.*true\|Premium\|Standard_GRS" infra/*.bicep; then
        echo "✓ High availability configurations detected"
    else
        echo "⚠ Consider enabling high availability for production"
    fi
    
    # Angalia usanidi wa chelezo
    if grep -q "backup\|retention\|pointInTimeRestore" infra/*.bicep; then
        echo "✓ Backup configurations found"
    else
        echo "⚠ Ensure backup strategies are implemented"
    fi
    
    # Thibitisha usanidi wa ufuatiliaji
    if grep -q "Microsoft.Insights\|Application_Type.*web" infra/*.bicep; then
        echo "✓ Monitoring and observability configured"
    else
        echo "⚠ Add comprehensive monitoring for production"
    fi
    
    # Angalia usanidi wa usalama
    if grep -q "Microsoft.KeyVault\|managedIdentity\|httpsOnly.*true" infra/*.bicep; then
        echo "✓ Security best practices implemented"
    else
        echo "⚠ Review security configurations for production"
    fi
}
```

---

## Uthibitisho wa Rasilimali

### Skripti ya Uthibitisho wa Vikwazo

```python
#!/usr/bin/env python3
"""
Azure quota and limit validation script
"""

import json
import subprocess
import sys
from typing import Dict, List, Tuple

def run_command(command: List[str]) -> Dict:
    """Run Azure CLI command and return JSON result"""
    try:
        result = subprocess.run(command, capture_output=True, text=True, check=True)
        return json.loads(result.stdout)
    except subprocess.CalledProcessError as e:
        print(f"Error running command {' '.join(command)}: {e}")
        return {}
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON: {e}")
        return {}

def check_compute_quotas(location: str) -> bool:
    """Check compute quotas in specified location"""
    print(f"\n=== Compute Quotas Check ({location}) ===")
    
    usage = run_command(['az', 'vm', 'list-usage', '--location', location])
    
    if not usage:
        print("❌ Could not retrieve compute usage information")
        return False
    
    critical_quotas = ['cores', 'virtualMachines', 'standardDSv3Family']
    
    for quota_item in usage:
        if quota_item['name']['value'] in critical_quotas:
            current = quota_item['currentValue']
            limit = quota_item['limit']
            usage_percent = (current / limit) * 100 if limit > 0 else 0
            
            status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
            print(f"{status} {quota_item['name']['localizedValue']}: {current}/{limit} ({usage_percent:.1f}%)")
            
            if usage_percent >= 95:
                return False
    
    return True

def check_storage_limits(location: str) -> bool:
    """Check storage account limits"""
    print(f"\n=== Storage Limits Check ({location}) ===")
    
    # Pata akaunti za hifadhi katika usajili
    accounts = run_command(['az', 'storage', 'account', 'list'])
    
    if accounts is None:
        print("❌ Could not retrieve storage account information")
        return False
    
    account_count = len(accounts)
    max_accounts = 250  # Kikomo cha chaguo-msingi cha Azure
    
    usage_percent = (account_count / max_accounts) * 100
    status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
    
    print(f"{status} Storage Accounts: {account_count}/{max_accounts} ({usage_percent:.1f}%)")
    
    return usage_percent < 95

def check_network_limits(location: str) -> bool:
    """Check network-related limits"""
    print(f"\n=== Network Limits Check ({location}) ===")
    
    # Kagua mitandao ya virtual
    vnets = run_command(['az', 'network', 'vnet', 'list'])
    if vnets is not None:
        vnet_count = len(vnets)
        print(f"✅ Virtual Networks: {vnet_count}/1000")
    
    # Kagua anwani za IP za umma
    public_ips = run_command(['az', 'network', 'public-ip', 'list'])
    if public_ips is not None:
        ip_count = len(public_ips)
        print(f"✅ Public IP Addresses: {ip_count}/1000")
    
    return True

def main():
    if len(sys.argv) != 2:
        print("Usage: python3 quota_check.py <location>")
        sys.exit(1)
    
    location = sys.argv[1]
    
    print("🔍 Azure Quota and Limits Validation")
    print(f"📍 Location: {location}")
    print(f"⏰ Time: {subprocess.run(['date'], capture_output=True, text=True).stdout.strip()}")
    
    all_passed = True
    
    # Endesha ukaguzi
    all_passed &= check_compute_quotas(location)
    all_passed &= check_storage_limits(location)
    all_passed &= check_network_limits(location)
    
    # Muhtasari
    print(f"\n=== Quota Check Summary ===")
    if all_passed:
        print("✅ All quota checks passed - sufficient capacity available")
        sys.exit(0)
    else:
        print("❌ Some quota limits are near capacity - consider requesting increases")
        sys.exit(1)

if __name__ == "__main__":
    main()
```

---

## Ukaguzi wa Usalama na Uzingatiaji

### Skripti ya Uthibitisho wa Usalama

```bash
#!/bin/bash
# Ukaguzi wa usalama na uzingatiaji kwa uenezi wa AZD

check_security_practices() {
    echo "=== Security Best Practices Check ==="
    
    local issues_found=0
    
    # Kagua matumizi ya Key Vault
    if grep -r "Microsoft.KeyVault" infra/ >/dev/null 2>&1; then
        echo "✅ Key Vault detected in infrastructure"
    else
        echo "⚠️  Key Vault not found - consider using for secrets management"
        ((issues_found++))
    fi
    
    # Kagua matumizi ya kitambulisho kilichosimamiwa
    if grep -r "managedIdentity\|SystemAssigned\|UserAssigned" infra/ >/dev/null 2>&1; then
        echo "✅ Managed Identity configuration detected"
    else
        echo "⚠️  Managed Identity not found - consider using for service authentication"
        ((issues_found++))
    fi
    
    # Kagua utekelezaji wa HTTPS
    if grep -r "httpsOnly.*true\|requireHttps.*true" infra/ >/dev/null 2>&1; then
        echo "✅ HTTPS enforcement detected"
    else
        echo "⚠️  HTTPS enforcement not found - ensure secure connections"
        ((issues_found++))
    fi
    
    # Kagua toleo la chini kabisa la TLS
    if grep -r "minimumTlsVersion.*'TLS1_2'" infra/ >/dev/null 2>&1; then
        echo "✅ Minimum TLS 1.2 configuration detected"
    else
        echo "⚠️  Minimum TLS version not specified - consider requiring TLS 1.2+"
        ((issues_found++))
    fi
    
    # Kagua vizuizi vya ufikiaji wa umma
    if grep -r "allowBlobPublicAccess.*false\|publicNetworkAccess.*Disabled" infra/ >/dev/null 2>&1; then
        echo "✅ Public access restrictions detected"
    else
        echo "⚠️  Public access restrictions not found - consider limiting public access"
        ((issues_found++))
    fi
    
    # Kagua vikundi vya usalama vya mtandao
    if grep -r "Microsoft.Network/networkSecurityGroups" infra/ >/dev/null 2>&1; then
        echo "✅ Network Security Groups detected"
    else
        echo "ℹ️  Network Security Groups not found - may be acceptable depending on architecture"
    fi
    
    return $issues_found
}

check_compliance_requirements() {
    echo -e "\n=== Compliance Requirements Check ==="
    
    # Kagua usimbaji fiche wa data
    if grep -r "encryption\|encryptionAtRest\|transparentDataEncryption" infra/ >/dev/null 2>&1; then
        echo "✅ Encryption configurations detected"
    else
        echo "⚠️  Encryption configurations not found - ensure data is encrypted"
    fi
    
    # Kagua uandishi wa kumbukumbu za ukaguzi
    if grep -r "Microsoft.Insights.*auditingSettings\|diagnosticSettings" infra/ >/dev/null 2>&1; then
        echo "✅ Audit logging configurations detected"
    else
        echo "⚠️  Audit logging not found - consider enabling for compliance"
    fi
    
    # Kagua sera za chelezo na uhifadhi
    if grep -r "backup.*Policy\|retentionPolicy\|retention.*Days" infra/ >/dev/null 2>&1; then
        echo "✅ Backup and retention policies detected"
    else
        echo "⚠️  Backup/retention policies not found - required for data governance"
    fi
}

# Utekelezaji mkuu
main() {
    echo "🔒 Security and Compliance Validation"
    echo "📁 Checking infra/ directory for security best practices"
    echo ""
    
    if [[ ! -d "infra" ]]; then
        echo "❌ infra/ directory not found"
        exit 1
    fi
    
    local security_issues
    security_issues=$(check_security_practices)
    check_compliance_requirements
    
    echo -e "\n=== Security Check Summary ==="
    if [[ $security_issues -eq 0 ]]; then
        echo "✅ All security checks passed"
        exit 0
    else
        echo "⚠️  $security_issues security recommendations found"
        echo "ℹ️  Review recommendations before deploying to production"
        exit 1
    fi
}

main "$@"
```

---

## Uingizaji na CI/CD

### Uingizaji wa GitHub Actions

```yaml
name: AZD Pre-flight Checks

on:
  workflow_dispatch:
    inputs:
      environment:
        description: 'Environment to validate'
        required: true
        default: 'development'
        type: choice
        options:
        - development
        - staging
        - production
      location:
        description: 'Azure region'
        required: true
        default: 'eastus'

jobs:
  preflight:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    
    - name: Install AZD
      uses: Azure/setup-azd@v0.1.0
    
    - name: Install Azure CLI
      uses: azure/setup-azure@v3
    
    - name: Azure Login
      uses: azure/login@v1
      with:
        creds: ${{ secrets.AZURE_CREDENTIALS }}
    
    - name: Run Pre-flight Checks
      run: |
        chmod +x ./scripts/preflight-check.sh
        ./scripts/preflight-check.sh \
          --environment-name ${{ github.event.inputs.environment }} \
          --location ${{ github.event.inputs.location }}
    
    - name: Security Validation
      run: |
        chmod +x ./scripts/security-check.sh
        ./scripts/security-check.sh
    
    - name: Upload Results
      uses: actions/upload-artifact@v3
      if: always()
      with:
        name: preflight-results
        path: preflight-results.json
```

### Uingizaji wa Azure DevOps

```yaml
trigger: none

parameters:
- name: environment
  displayName: Environment
  type: string
  default: development
  values:
  - development
  - staging
  - production

- name: location
  displayName: Azure Region
  type: string
  default: eastus

pool:
  vmImage: 'ubuntu-latest'

steps:
- task: AzureCLI@2
  displayName: 'Install AZD'
  inputs:
    azureSubscription: $(serviceConnection)
    scriptType: bash
    scriptLocation: inlineScript
    inlineScript: |
      curl -fsSL https://aka.ms/install-azd.sh | bash
      export PATH=$PATH:~/.azd/bin

- task: Bash@3
  displayName: 'Run Pre-flight Checks'
  inputs:
    targetType: filePath
    filePath: './scripts/preflight-check.sh'
    arguments: '--environment-name ${{ parameters.environment }} --location ${{ parameters.location }}'

- task: PublishTestResults@2
  displayName: 'Publish Pre-flight Results'
  condition: always()
  inputs:
    testResultsFormat: 'JUnit'
    testResultsFiles: 'preflight-results.xml'
    testRunTitle: 'Pre-flight Validation'
```

---

## Muhtasari wa Mbinu Bora

### ✅ Mbinu Bora za Ukaguzi wa Kabla ya Uwasilishaji

1. **Tumia Ukitautomatika Pale Inapowezekana**
   - Unganisha ukaguzi katika mifumo ya CI/CD
   - Tumia skiripti kwa uthibitisho unaoweza kurudiwa
   - Hifadhi matokeo kwa ajili ya rekodi za ukaguzi

2. **Uthibitisho Uliobinafsishwa kwa Mazingira**
   - Ukaguzi tofauti kwa maendeleo/ujaribio/uzalishaji
   - Mahitaji sahihi ya usalama kwa kila mazingira
   - Uboreshaji wa gharama kwa mazingira yasiyo ya uzalishaji

3. **Ufunikaji Kamili**
   - Uthibitishaji na ruhusa
   - Vikwazo na upatikanaji wa rasilimali
   - Uthibitisho wa templeti na sintaksia
   - Mahitaji ya usalama na uzingatiaji

4. **Ripoti Zinazoeleweka**
   - Viashiria vya hali vilivyopangwa kwa rangi
   - Ujumbe wa makosa ya kina na hatua za kurekebisha
   - Ripoti za muhtasari kwa tathmini ya haraka

5. **Shindwa Haraka**
   - Acha uwasilishaji ikiwa ukaguzi muhimu unashindwa
   - Toa mwongozo wazi wa utatuzi
   - Ruhusu kuendesha tena ukaguzi kwa urahisi

### Makosa ya Kawaida ya Kabla ya Uwasilishaji

1. **Kuruka uthibitisho** kwa uwasilishaji wa "haraka"
2. **Ukaguzi wa ruhusa usio wa kutosha** kabla ya uwasilishaji
3. **Kupuuza mipaka ya vikwazo** hadi uwasilishaji ushindwe
4. **Kutokuthibitisha templeti** katika mifumo ya CI/CD
5. **Ukosefu wa uthibitisho wa usalama** kwa mazingira ya uzalishaji
6. **Makadirio duni ya gharama** yanayosababisha mshangao wa bajeti

---

**Ushauri wa Kitaalam**: Endesha ukaguzi wa kabla ya uwasilishaji kama kazi tofauti katika pipeline yako ya CI/CD kabla ya kazi ya uwasilishaji ya kweli. Hii inakuwezesha kugundua masuala mapema na kutoa mrejesho wa haraka kwa waendelezaji.

---

**Navigation**
- **Somo lililopita**: [Uchaguzi wa SKU](sku-selection.md)
- **Somo lijalo**: [Karatasi ya Mwongozo](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Tamko la kutokujali:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya utafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Nyaraka asilia kwa lugha yake inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inapendekezwa kutumia tafsiri ya kitaalamu iliyofanywa na mtafsiri wa binadamu. Hatuwajibiki kwa kutoelewana au tafsiri potofu zitokanazo na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
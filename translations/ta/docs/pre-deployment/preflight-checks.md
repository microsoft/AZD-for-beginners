<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "943c0b72e253ba63ff813a2a580ebf10",
  "translation_date": "2025-10-24T18:26:36+00:00",
  "source_file": "docs/pre-deployment/preflight-checks.md",
  "language_code": "ta"
}
-->
# AZD பிரயோகங்களுக்கு முன் சோதனைகள்

**அத்தியாய வழிகாட்டி:**
- **📚 பாடநெறி முகப்பு**: [AZD ஆரம்பக்காரர்களுக்காக](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 6 - பிரயோகத்திற்கு முன் சரிபார்ப்பு மற்றும் திட்டமிடல்
- **⬅️ முந்தையது**: [SKU தேர்வு](sku-selection.md)
- **➡️ அடுத்த அத்தியாயம்**: [அத்தியாயம் 7: பிழை தீர்வு](../troubleshooting/common-issues.md)
- **🔧 தொடர்புடையது**: [அத்தியாயம் 4: பிரயோக வழிகாட்டி](../deployment/deployment-guide.md)

## அறிமுகம்

இந்த விரிவான வழிகாட்டி, Azure Developer CLI பிரயோகங்களுக்கு முன் வெற்றிகரமான பிரயோகத்தை உறுதிப்படுத்துவதற்கான முன்-சோதனை ஸ்கிரிப்ட்கள் மற்றும் நடைமுறைகளை வழங்குகிறது. அங்கீகாரம், வளங்களின் கிடைப்பாடு, ஒதுக்கீடுகள், பாதுகாப்பு இணக்கம் மற்றும் செயல்திறன் தேவைகளுக்கான தானியங்க சோதனைகளை செயல்படுத்த கற்றுக்கொள்ளுங்கள், பிரயோக தோல்விகளைத் தவிர்க்கவும் மற்றும் வெற்றியின் விகிதத்தை மேம்படுத்தவும்.

## கற்றல் இலக்குகள்

இந்த வழிகாட்டியை முடிக்கும்போது, நீங்கள்:
- தானியங்க முன்-சோதனை நடைமுறைகள் மற்றும் ஸ்கிரிப்ட்களை கற்றுக்கொள்வீர்கள்
- அங்கீகாரம், அனுமதிகள் மற்றும் ஒதுக்கீடுகளுக்கான விரிவான சோதனை உத்திகளை புரிந்துகொள்வீர்கள்
- வளங்களின் கிடைப்பாடு மற்றும் திறன் சோதனை நடைமுறைகளை செயல்படுத்துவீர்கள்
- நிறுவன கொள்கைகளுக்கான பாதுகாப்பு மற்றும் இணக்கத்தன்மை சோதனைகளை அமைப்பீர்கள்
- செலவீன மதிப்பீடு மற்றும் பட்ஜெட் சோதனை வேலைகளை வடிவமைப்பீர்கள்
- CI/CD குழாய்களில் தனிப்பயன் முன்-சோதனை தானியங்கத்தை உருவாக்குவீர்கள்

## கற்றல் முடிவுகள்

முடித்தவுடன், நீங்கள்:
- விரிவான முன்-சோதனை ஸ்கிரிப்ட்களை உருவாக்கி செயல்படுத்த முடியும்
- பிரயோக சூழல்களுக்கு தானியங்க சோதனை வேலைகளை வடிவமைக்க முடியும்
- சூழல்-குறிப்பிட்ட சோதனை நடைமுறைகள் மற்றும் கொள்கைகளை செயல்படுத்த முடியும்
- பிரயோகத்திற்கு தயாராக இருக்க தற்காலிக கண்காணிப்பு மற்றும் எச்சரிக்கை அமைப்புகளை அமைக்க முடியும்
- பிரயோகத்திற்கு முன் பிரச்சினைகளை தீர்க்கவும் மற்றும் சரிசெய்யும் நடவடிக்கைகளை செயல்படுத்தவும் முடியும்
- DevOps குழாய்கள் மற்றும் தானியங்க வேலைகளில் முன்-சோதனைகளை ஒருங்கிணைக்க முடியும்

## உள்ளடக்க அட்டவணை

- [கண்ணோட்டம்](../../../../docs/pre-deployment)
- [தானியங்க முன்-சோதனை ஸ்கிரிப்ட்](../../../../docs/pre-deployment)
- [கையேடு சோதனை சோதனை பட்டியல்](../../../../docs/pre-deployment)
- [சூழல் சோதனை](../../../../docs/pre-deployment)
- [வள சோதனை](../../../../docs/pre-deployment)
- [பாதுகாப்பு & இணக்கத்தன்மை சோதனைகள்](../../../../docs/pre-deployment)
- [செயல்திறன் & திறன் திட்டமிடல்](../../../../docs/pre-deployment)
- [பொதுவான பிரச்சினைகளை தீர்க்க](../../../../docs/pre-deployment)

---

## கண்ணோட்டம்

முன்-சோதனைகள் பிரயோகத்திற்கு முன் செய்யப்படும் முக்கியமான சோதனைகள் ஆகும், இது உறுதிப்படுத்துகிறது:

- இலக்கு பகுதிகளில் **வளங்களின் கிடைப்பாடு** மற்றும் ஒதுக்கீடுகள்
- **அங்கீகாரம் மற்றும் அனுமதிகள்** சரியாக அமைக்கப்பட்டுள்ளன
- **டெம்ப்ளேட் செல்லுபடியாகும்** மற்றும் அளவுரு சரியானது
- **நெட்வொர்க் இணைப்பு** மற்றும் சார்புகள்
- **பாதுகாப்பு இணக்கம்** நிறுவன கொள்கைகளுடன்
- **செலவீன மதிப்பீடு** பட்ஜெட் வரம்பிற்குள்

### முன்-சோதனைகளை எப்போது இயக்க வேண்டும்

- **முதல் பிரயோகத்திற்கு முன்** புதிய சூழலில்
- **முக்கியமான டெம்ப்ளேட் மாற்றங்களுக்குப் பிறகு**
- **தயாரிப்பு பிரயோகங்களுக்கு முன்**
- **Azure பகுதிகளை மாற்றும்போது**
- **CI/CD குழாய்களின் ஒரு பகுதியாக**

---

## தானியங்க முன்-சோதனை ஸ்கிரிப்ட்

### PowerShell முன்-சோதனை சோதனையாளர்

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

# Color coding for output
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
    
    # Check AZD installation
    try {
        $azdVersion = azd version --output json | ConvertFrom-Json
        Write-Status "AZD CLI installed" "Success" "Version: $($azdVersion.azd.version)"
    }
    catch {
        Write-Status "AZD CLI not found" "Error" "Install from https://aka.ms/azd-install"
        return $false
    }
    
    # Check Azure CLI installation
    try {
        $azVersion = az version --output json | ConvertFrom-Json
        Write-Status "Azure CLI installed" "Success" "Version: $($azVersion.'azure-cli')"
    }
    catch {
        Write-Status "Azure CLI not found" "Error" "Install from https://aka.ms/azcli"
        return $false
    }
    
    # Check PowerShell version
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
        # Check AZD authentication
        $azdAuth = azd auth login --check-status --output json 2>$null | ConvertFrom-Json
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
        }
        else {
            Write-Status "AZD authentication" "Error" "Run 'azd auth login'"
            return $false
        }
        
        # Check Azure CLI authentication
        $azAccount = az account show --output json | ConvertFrom-Json
        Write-Status "Azure CLI authentication" "Success" "Subscription: $($azAccount.name)"
        
        # Validate subscription access
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
        # Get current user's role assignments
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
        
        # Test resource group creation (if specified)
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # Test ability to create resource group
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
        # Check compute quotas
        $computeUsage = az vm list-usage --location $Location --output json | ConvertFrom-Json
        
        # Check specific quotas
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
        
        # Check App Service limits
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
        
        # Check storage account limits
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
        return $true # Non-blocking
    }
}

function Test-NetworkConnectivity {
    Write-Host "`n${Blue}=== Network Connectivity Check ===${Reset}"
    
    # Test Azure endpoints
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
    
    # Test DNS resolution
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
    
    # Check if azure.yaml exists
    if (Test-Path "azure.yaml") {
        Write-Status "azure.yaml found" "Success"
        
        # Parse azure.yaml
        try {
            $azureYaml = Get-Content "azure.yaml" -Raw | ConvertFrom-Yaml
            Write-Status "azure.yaml parsing" "Success"
            
            # Validate services
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
    
    # Check for infrastructure files
    if (Test-Path "infra") {
        $bicepFiles = Get-ChildItem -Path "infra" -Filter "*.bicep" -Recurse
        if ($bicepFiles.Count -gt 0) {
            Write-Status "Infrastructure templates" "Success" "$($bicepFiles.Count) Bicep files found"
            
            # Validate main.bicep if it exists
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
    
    # 🧪 NEW: Test infrastructure preview (safe dry-run)
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
        # Check if location is valid
        $locations = az account list-locations --output json | ConvertFrom-Json
        $validLocation = $locations | Where-Object { $_.name -eq $Location -or $_.displayName -eq $Location }
        
        if ($validLocation) {
            Write-Status "Azure region" "Success" "Location '$Location' is valid"
        }
        else {
            Write-Status "Azure region" "Error" "Location '$Location' is not valid"
            return $false
        }
        
        # Check service availability in region
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
    
    # Basic cost estimation (would need Azure Pricing API for accurate estimates)
    Write-Status "Cost estimation" "Info" "Use Azure Pricing Calculator for detailed estimates"
    Write-Status "Monitoring setup" "Info" "Set up Azure Cost Management alerts"
    
    # Check if budget exists
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
    
    # Check for common security practices
    try {
        # Check if Key Vault is configured
        if (Select-String -Path "infra/*.bicep" -Pattern "Microsoft.KeyVault" -Quiet) {
            Write-Status "Key Vault usage" "Success" "Key Vault detected in templates"
        }
        else {
            Write-Status "Key Vault usage" "Warning" "Consider using Key Vault for secrets"
        }
        
        # Check for managed identity usage
        if (Select-String -Path "infra/*.bicep" -Pattern "managedIdentity|SystemAssigned" -Quiet) {
            Write-Status "Managed Identity" "Success" "Managed Identity detected"
        }
        else {
            Write-Status "Managed Identity" "Warning" "Consider using Managed Identity"
        }
        
        # Check for HTTPS enforcement
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

# Main execution
function Invoke-PreflightCheck {
    Write-Host "${Green}AZD Pre-flight Check${Reset}" -ForegroundColor Green
    Write-Host "Environment: $EnvironmentName"
    Write-Host "Location: $Location"
    if ($ResourceGroup) { Write-Host "Resource Group: $ResourceGroup" }
    Write-Host "Time: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    Write-Host ""
    
    $allPassed = $true
    $results = @{}
    
    # Run all checks
    $results["Prerequisites"] = Test-Prerequisites
    $results["Authentication"] = Test-Authentication
    $results["Permissions"] = Test-Permissions
    $results["QuotasAndLimits"] = Test-QuotasAndLimits
    $results["NetworkConnectivity"] = Test-NetworkConnectivity
    $results["TemplateValidation"] = Test-TemplateValidation
    $results["RegionalAvailability"] = Test-RegionalAvailability
    $results["CostEstimation"] = Test-CostEstimation
    $results["SecurityCompliance"] = Test-SecurityCompliance
    
    # Summary
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

# Run the pre-flight check
Invoke-PreflightCheck
```

### Bash முன்-சோதனை சோதனையாளர்

```bash
#!/bin/bash
# Bash version of pre-flight checks for Unix/Linux systems

set -euo pipefail

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Global variables
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
    
    # Check AZD installation
    if command -v azd >/dev/null 2>&1; then
        local azd_version=$(azd version --output json | jq -r '.azd.version')
        print_status "AZD CLI installed" "success" "Version: $azd_version"
    else
        print_status "AZD CLI not found" "error" "Install from https://aka.ms/azd-install"
        return 1
    fi
    
    # Check Azure CLI installation
    if command -v az >/dev/null 2>&1; then
        local az_version=$(az version --output json | jq -r '."azure-cli"')
        print_status "Azure CLI installed" "success" "Version: $az_version"
    else
        print_status "Azure CLI not found" "error" "Install from https://aka.ms/azcli"
        return 1
    fi
    
    # Check jq installation
    if command -v jq >/dev/null 2>&1; then
        print_status "jq installed" "success"
    else
        print_status "jq not found" "warning" "Install jq for better JSON parsing"
    fi
    
    return 0
}

check_authentication() {
    echo -e "\n${BLUE}=== Authentication Check ===${NC}"
    
    # Check AZD authentication
    if azd auth login --check-status >/dev/null 2>&1; then
        local principal_name=$(azd auth login --check-status --output json 2>/dev/null | jq -r '.principalName // "Unknown"')
        print_status "AZD authentication" "success" "User: $principal_name"
    else
        print_status "AZD authentication" "error" "Run 'azd auth login'"
        return 1
    fi
    
    # Check Azure CLI authentication
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
    
    # Check azure.yaml
    if [[ -f "azure.yaml" ]]; then
        print_status "azure.yaml found" "success"
        
        # Basic YAML validation
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
    
    # Check infrastructure files
    if [[ -d "infra" ]]; then
        local bicep_count=$(find infra -name "*.bicep" | wc -l)
        if [[ $bicep_count -gt 0 ]]; then
            print_status "Infrastructure templates" "success" "$bicep_count Bicep files found"
            
            # Validate main.bicep if exists
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
    
    # Check if location is valid
    if az account list-locations --query "[?name=='$LOCATION' || displayName=='$LOCATION']" --output tsv | grep -q .; then
        print_status "Azure region" "success" "Location '$LOCATION' is valid"
    else
        print_status "Azure region" "error" "Location '$LOCATION' is not valid"
        return 1
    fi
    
    # Check service availability
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
    # Parse command line arguments
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
    
    # Validate required parameters
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
    
    # Run checks
    local all_passed=true
    
    check_prerequisites || all_passed=false
    check_authentication || all_passed=false
    check_template_validation || all_passed=false
    check_regional_availability || all_passed=false
    
    # Summary
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

# Run main function
main "$@"
```

---

## கையேடு சோதனை பட்டியல்

### பிரயோகத்திற்கு முன் சோதனை பட்டியல்

இந்த பட்டியலை அச்சிட்டு, பிரயோகத்திற்கு முன் ஒவ்வொரு உருப்படியையும் சரிபார்க்கவும்:

#### ✅ சூழல் அமைப்பு
- [ ] AZD CLI நிறுவப்பட்டு, சமீபத்திய பதிப்புக்கு மேம்படுத்தப்பட்டது
- [ ] Azure CLI நிறுவப்பட்டு, அங்கீகரிக்கப்பட்டது
- [ ] சரியான Azure சந்தா தேர்ந்தெடுக்கப்பட்டது
- [ ] சூழல் பெயர் தனித்துவமாகவும் பெயரிடல் விதிமுறைகளை பின்பற்றவும்
- [ ] இலக்கு வளக் குழு அடையாளம் காணப்பட்டது அல்லது உருவாக்க முடியும்

#### ✅ அங்கீகாரம் & அனுமதிகள்
- [ ] `azd auth login` மூலம் வெற்றிகரமாக அங்கீகரிக்கப்பட்டது
- [ ] பயனருக்கு இலக்கு சந்தா/வளக் குழுவில் Contributor பங்கு உள்ளது
- [ ] CI/CD க்கான சேவை பிரதிநிதி அமைக்கப்பட்டது (தேவையானால்)
- [ ] காலாவதியான சான்றிதழ்கள் அல்லது அனுமதிகள் இல்லை

#### ✅ டெம்ப்ளேட் சோதனை
- [ ] `azure.yaml` உள்ளது மற்றும் செல்லுபடியாகும் YAML
- [ ] azure.yaml இல் வரையறுக்கப்பட்ட அனைத்து சேவைகளுக்கும் தொடர்புடைய மூலக் குறியீடு உள்ளது
- [ ] `infra/` கோப்பகத்தில் உள்ள Bicep டெம்ப்ளேட்கள் உள்ளன
- [ ] `main.bicep` பிழையின்றி தொகுக்கிறது (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 கட்டமைப்பு முன்னோட்டம் வெற்றிகரமாக இயங்குகிறது (`azd provision --preview`)
- [ ] தேவையான அனைத்து அளவுருக்களுக்கும் இயல்புநிலை மதிப்புகள் உள்ளன அல்லது வழங்கப்படும்
- [ ] டெம்ப்ளேட்களில் கடினமாக குறியிடப்பட்ட ரகசியங்கள் இல்லை

#### ✅ வள திட்டமிடல்
- [ ] இலக்கு Azure பகுதி தேர்ந்தெடுக்கப்பட்டு சரிபார்க்கப்பட்டது
- [ ] இலக்கு பகுதியில் தேவையான Azure சேவைகள் கிடைக்கின்றன
- [ ] திட்டமிடப்பட்ட வளங்களுக்கு போதுமான ஒதுக்கீடுகள் உள்ளன
- [ ] வள பெயரிடல் மோதல்கள் சரிபார்க்கப்பட்டன
- [ ] வளங்களுக்கிடையிலான சார்புகள் புரிந்துகொள்ளப்பட்டன

#### ✅ நெட்வொர்க் & பாதுகாப்பு
- [ ] Azure முடிவுகளுக்கு நெட்வொர்க் இணைப்பு சரிபார்க்கப்பட்டது
- [ ] Firewall/Proxy அமைப்புகள் தேவைப்பட்டால் அமைக்கப்பட்டன
- [ ] ரகசிய மேலாண்மைக்கான Key Vault அமைக்கப்பட்டது
- [ ] சுய மேலாண்மை அடையாளங்கள் பயன்படுத்தப்பட்டன
- [ ] வலை பயன்பாடுகளுக்கு HTTPS அமல்படுத்தல் செயல்படுத்தப்பட்டது

#### ✅ செலவீன மேலாண்மை
- [ ] Azure விலை கணக்கீடு கருவி மூலம் செலவீன மதிப்பீடுகள் கணக்கிடப்பட்டன
- [ ] தேவைப்பட்டால் பட்ஜெட் எச்சரிக்கைகள் அமைக்கப்பட்டன
- [ ] சூழல் வகைக்கு பொருத்தமான SKU கள் தேர்ந்தெடுக்கப்பட்டன
- [ ] தயாரிப்பு வேலைப்பாடுகளுக்கு ஒதுக்கப்பட்ட திறன் பரிசீலிக்கப்பட்டது

#### ✅ கண்காணிப்பு & கணினி திறன்
- [ ] டெம்ப்ளேட்களில் Application Insights அமைக்கப்பட்டது
- [ ] Log Analytics வேலைப்பாடுகள் திட்டமிடப்பட்டன
- [ ] முக்கியமான அளவுகோள்களுக்கு எச்சரிக்கை விதிகள் வரையறுக்கப்பட்டன
- [ ] பயன்பாடுகளில் ஆரோக்கிய சோதனை முடிவுகள் செயல்படுத்தப்பட்டன

#### ✅ காப்புப்பிரதி & மீட்பு
- [ ] தரவின் வளங்களுக்கான காப்புப்பிரதி உத்தி வரையறுக்கப்பட்டது
- [ ] மீட்பு நேர இலக்குகள் (RTO) ஆவணப்படுத்தப்பட்டன
- [ ] மீட்பு புள்ளி இலக்குகள் (RPO) ஆவணப்படுத்தப்பட்டன
- [ ] தயாரிப்பு சூழலுக்கான பேரழிவு மீட்பு திட்டம் உள்ளது

---

## சூழல் சோதனை

### மேம்பாட்டு சூழல் சோதனை

```bash
#!/bin/bash
# Development environment specific validations

validate_dev_environment() {
    echo "=== Development Environment Validation ==="
    
    # Check for development-friendly configurations
    if grep -q "sku.*Free\|sku.*F1\|sku.*Basic" infra/*.bicep; then
        echo "✓ Development-appropriate SKUs detected"
    else
        echo "⚠ Consider using lower-cost SKUs for development"
    fi
    
    # Check for auto-shutdown configurations
    if grep -q "autoShutdown\|deallocate" infra/*.bicep; then
        echo "✓ Auto-shutdown configuration found"
    else
        echo "ℹ Consider adding auto-shutdown for cost savings"
    fi
    
    # Validate development database configurations
    if grep -q "Basic\|S0\|S1" infra/*.bicep; then
        echo "✓ Development database tiers configured"
    else
        echo "⚠ Consider using Basic/Standard tiers for development databases"
    fi
}
```

### தயாரிப்பு சூழல் சோதனை

```bash
#!/bin/bash
# Production environment specific validations

validate_prod_environment() {
    echo "=== Production Environment Validation ==="
    
    # Check for high availability configurations
    if grep -q "zoneRedundant.*true\|Premium\|Standard_GRS" infra/*.bicep; then
        echo "✓ High availability configurations detected"
    else
        echo "⚠ Consider enabling high availability for production"
    fi
    
    # Check for backup configurations
    if grep -q "backup\|retention\|pointInTimeRestore" infra/*.bicep; then
        echo "✓ Backup configurations found"
    else
        echo "⚠ Ensure backup strategies are implemented"
    fi
    
    # Validate monitoring setup
    if grep -q "Microsoft.Insights\|Application_Type.*web" infra/*.bicep; then
        echo "✓ Monitoring and observability configured"
    else
        echo "⚠ Add comprehensive monitoring for production"
    fi
    
    # Check for security configurations
    if grep -q "Microsoft.KeyVault\|managedIdentity\|httpsOnly.*true" infra/*.bicep; then
        echo "✓ Security best practices implemented"
    else
        echo "⚠ Review security configurations for production"
    fi
}
```

---

## வள சோதனை

### ஒதுக்கீடு சோதனை ஸ்கிரிப்ட்

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
    
    # Get storage accounts in subscription
    accounts = run_command(['az', 'storage', 'account', 'list'])
    
    if accounts is None:
        print("❌ Could not retrieve storage account information")
        return False
    
    account_count = len(accounts)
    max_accounts = 250  # Default Azure limit
    
    usage_percent = (account_count / max_accounts) * 100
    status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
    
    print(f"{status} Storage Accounts: {account_count}/{max_accounts} ({usage_percent:.1f}%)")
    
    return usage_percent < 95

def check_network_limits(location: str) -> bool:
    """Check network-related limits"""
    print(f"\n=== Network Limits Check ({location}) ===")
    
    # Check virtual networks
    vnets = run_command(['az', 'network', 'vnet', 'list'])
    if vnets is not None:
        vnet_count = len(vnets)
        print(f"✅ Virtual Networks: {vnet_count}/1000")
    
    # Check public IP addresses
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
    
    # Run checks
    all_passed &= check_compute_quotas(location)
    all_passed &= check_storage_limits(location)
    all_passed &= check_network_limits(location)
    
    # Summary
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

## பாதுகாப்பு & இணக்கத்தன்மை சோதனைகள்

### பாதுகாப்பு சோதனை ஸ்கிரிப்ட்

```bash
#!/bin/bash
# Security and compliance validation for AZD deployments

check_security_practices() {
    echo "=== Security Best Practices Check ==="
    
    local issues_found=0
    
    # Check for Key Vault usage
    if grep -r "Microsoft.KeyVault" infra/ >/dev/null 2>&1; then
        echo "✅ Key Vault detected in infrastructure"
    else
        echo "⚠️  Key Vault not found - consider using for secrets management"
        ((issues_found++))
    fi
    
    # Check for managed identity usage
    if grep -r "managedIdentity\|SystemAssigned\|UserAssigned" infra/ >/dev/null 2>&1; then
        echo "✅ Managed Identity configuration detected"
    else
        echo "⚠️  Managed Identity not found - consider using for service authentication"
        ((issues_found++))
    fi
    
    # Check for HTTPS enforcement
    if grep -r "httpsOnly.*true\|requireHttps.*true" infra/ >/dev/null 2>&1; then
        echo "✅ HTTPS enforcement detected"
    else
        echo "⚠️  HTTPS enforcement not found - ensure secure connections"
        ((issues_found++))
    fi
    
    # Check for minimum TLS version
    if grep -r "minimumTlsVersion.*'TLS1_2'" infra/ >/dev/null 2>&1; then
        echo "✅ Minimum TLS 1.2 configuration detected"
    else
        echo "⚠️  Minimum TLS version not specified - consider requiring TLS 1.2+"
        ((issues_found++))
    fi
    
    # Check for public access restrictions
    if grep -r "allowBlobPublicAccess.*false\|publicNetworkAccess.*Disabled" infra/ >/dev/null 2>&1; then
        echo "✅ Public access restrictions detected"
    else
        echo "⚠️  Public access restrictions not found - consider limiting public access"
        ((issues_found++))
    fi
    
    # Check for network security groups
    if grep -r "Microsoft.Network/networkSecurityGroups" infra/ >/dev/null 2>&1; then
        echo "✅ Network Security Groups detected"
    else
        echo "ℹ️  Network Security Groups not found - may be acceptable depending on architecture"
    fi
    
    return $issues_found
}

check_compliance_requirements() {
    echo -e "\n=== Compliance Requirements Check ==="
    
    # Check for data encryption
    if grep -r "encryption\|encryptionAtRest\|transparentDataEncryption" infra/ >/dev/null 2>&1; then
        echo "✅ Encryption configurations detected"
    else
        echo "⚠️  Encryption configurations not found - ensure data is encrypted"
    fi
    
    # Check for audit logging
    if grep -r "Microsoft.Insights.*auditingSettings\|diagnosticSettings" infra/ >/dev/null 2>&1; then
        echo "✅ Audit logging configurations detected"
    else
        echo "⚠️  Audit logging not found - consider enabling for compliance"
    fi
    
    # Check for backup and retention policies
    if grep -r "backup.*Policy\|retentionPolicy\|retention.*Days" infra/ >/dev/null 2>&1; then
        echo "✅ Backup and retention policies detected"
    else
        echo "⚠️  Backup/retention policies not found - required for data governance"
    fi
}

# Main execution
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

## CI/CD உடன் ஒருங்கிணைப்பு

### GitHub Actions ஒருங்கிணைப்பு

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

### Azure DevOps ஒருங்கிணைப்பு

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

## சிறந்த நடைமுறைகள் சுருக்கம்

### ✅ முன்-சோதனை சிறந்த நடைமுறைகள்

1. **சாத்தியமான இடங்களில் தானியங்கம் செய்யவும்**
   - சோதனைகளை CI/CD குழாய்களில் ஒருங்கிணைக்கவும்
   - மீண்டும் செய்யக்கூடிய சோதனைகளுக்கு ஸ்கிரிப்ட்களை பயன்படுத்தவும்
   - முடிவுகளை ஆடிட்டுக்கான பதிவுகளுக்கு சேமிக்கவும்

2. **சூழல்-குறிப்பிட்ட சோதனை**
   - மேம்பாடு/சோதனை/தயாரிப்பு ஆகியவற்றுக்கு வேறுபட்ட சோதனைகள்
   - ஒவ்வொரு சூழலுக்கும் பொருத்தமான பாதுகாப்பு தேவைகள்
   - தயாரிப்பு அல்லாத சூழல்களுக்கு செலவீன ஆப்டிமைசேஷன்

3. **விரிவான கவரேஜ்**
   - அங்கீகாரம் மற்றும் அனுமதிகள்
   - வள ஒதுக்கீடுகள் மற்றும் கிடைப்பாடு
   - டெம்ப்ளேட் சோதனை மற்றும் வடிவமைப்பு
   - பாதுகாப்பு மற்றும் இணக்கத்தன்மை தேவைகள்

4. **தெளிவான அறிக்கைகள்**
   - நிறம்வாரியான நிலை குறியீடுகள்
   - தீர்வுக்கான விரிவான பிழை செய்திகள்
   - விரைவான மதிப்பீட்டுக்கான சுருக்க அறிக்கைகள்

5. **விரைவில் தோல்வி**
   - முக்கியமான சோதனைகள் தோல்வியடைந்தால் பிரயோகத்தை நிறுத்தவும்
   - தீர்வுக்கான தெளிவான வழிகாட்டுதலை வழங்கவும்
   - சோதனைகளை எளிதாக மீண்டும் இயக்கவும்

### பொதுவான முன்-சோதனை தவறுகள்

1. **"விரைவான" பிரயோகங்களுக்கு சோதனையை தவிர்க்குதல்**
2. **போதுமான அனுமதிகள்** சோதனை செய்யாமல் பிரயோகத்திற்கு முன்
3. **ஒதுக்கீடு வரம்புகளை** புறக்கணித்து பிரயோக தோல்வி வரை காத்திருத்தல்
4. **டெம்ப்ளேட்களை** CI/CD குழாய்களில் சோதிக்காமல் இருப்பது
5. **தயாரிப்பு சூழலுக்கு பாதுகாப்பு சோதனையை** தவிர்க்குதல்
6. **செலவீன மதிப்பீடு** போதாமை காரணமாக பட்ஜெட் அதிர்ச்சிகள்

---

**சிறந்த ஆலோசனை**: உங்கள் CI/CD குழாயில், உண்மையான பிரயோக வேலைக்கு முன் தனி வேலைகளாக முன்-சோதனைகளை இயக்கவும். இது பிரச்சினைகளை ஆரம்பத்திலேயே கண்டறிய உதவுகிறது மற்றும் டெவலப்பர்களுக்கு விரைவான பின்னூட்டத்தை வழங்குகிறது.

---

**வழிகாட்டி**
- **முந்தைய பாடம்**: [SKU தேர்வு](sku-selection.md)
- **அடுத்த பாடம்**: [Cheat Sheet](../../resources/cheat-sheet.md)

---

**குறிப்பு**:  
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சிக்கிறோம், ஆனால் தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கக்கூடும் என்பதை கவனத்தில் கொள்ளவும். அதன் தாய்மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கு நாங்கள் பொறுப்பல்ல.
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "faaf041a7f92fb1ced7f3322a4cf0b2a",
  "translation_date": "2025-09-18T13:24:51+00:00",
  "source_file": "docs/pre-deployment/preflight-checks.md",
  "language_code": "my"
}
-->
# AZD တင်သွင်းမှုများအတွက် Pre-Flight စစ်ဆေးမှုများ

**အခန်းအညွှန်း:**
- **📚 သင်ခန်းစာအိမ်**: [AZD အခြေခံများ](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၆ - တင်သွင်းမှုမတိုင်မီ စစ်ဆေးခြင်းနှင့် အစီအစဉ်ရေးဆွဲခြင်း
- **⬅️ ယခင်**: [SKU ရွေးချယ်မှု](sku-selection.md)
- **➡️ နောက်အခန်း**: [အခန်း ၇: ပြဿနာများကို ဖြေရှင်းခြင်း](../troubleshooting/common-issues.md)
- **🔧 ဆက်စပ်**: [အခန်း ၄: တင်သွင်းမှုလမ်းညွှန်](../deployment/deployment-guide.md)

## အကျဉ်းချုပ်

ဒီလမ်းညွှန်မှာ Azure Developer CLI တင်သွင်းမှုများအောင်မြင်စွာလုပ်ဆောင်နိုင်ရန်အတွက် တင်သွင်းမှုမတိုင်မီ စစ်ဆေးမှု script များနှင့် လုပ်ထုံးလုပ်နည်းများကို ပေးထားပါတယ်။ Authentication, အရင်းအမြစ်ရရှိနိုင်မှု, quota, လုံခြုံရေးလိုက်နာမှုများနှင့် စွမ်းဆောင်ရည်လိုအပ်ချက်များအတွက် အလိုအလျောက်စစ်ဆေးမှုများကို အကောင်အထည်ဖော်ပြီး တင်သွင်းမှုမအောင်မြင်မှုများကို ကာကွယ်နိုင်ရန်နှင့် တင်သွင်းမှုအောင်မြင်မှုနှုန်းကို မြှင့်တင်နိုင်ရန် လေ့လာပါ။

## သင်ယူရည်မှန်းချက်များ

ဒီလမ်းညွှန်ကို ပြီးမြောက်ပါက၊ သင်သည်:
- အလိုအလျောက် စစ်ဆေးမှုနည်းလမ်းများနှင့် script များကို ကျွမ်းကျင်စွာ အသုံးပြုနိုင်မည်
- Authentication, အခွင့်အာဏာများနှင့် quota များအတွက် စစ်ဆေးမှုနည်းလမ်းများကို နားလည်မည်
- အရင်းအမြစ်ရရှိနိုင်မှုနှင့် စွမ်းဆောင်ရည်စစ်ဆေးမှုလုပ်ထုံးလုပ်နည်းများကို အကောင်အထည်ဖော်နိုင်မည်
- အဖွဲ့အစည်းမူဝါဒများအတွက် လုံခြုံရေးနှင့်လိုက်နာမှု စစ်ဆေးမှုများကို ပြင်ဆင်နိုင်မည်
- ကုန်ကျစရိတ်ခန့်မှန်းခြင်းနှင့် ဘတ်ဂျက်စစ်ဆေးမှု workflow များကို ဒီဇိုင်းဆွဲနိုင်မည်
- CI/CD pipeline များအတွက် အလိုအလျောက် pre-flight စစ်ဆေးမှုများကို ဖန်တီးနိုင်မည်

## သင်ယူရလဒ်များ

ဒီလမ်းညွှန်ကို ပြီးမြောက်ပါက၊ သင်သည်:
- အကျယ်အကျယ် စစ်ဆေးမှု script များကို ဖန်တီးပြီး အကောင်အထည်ဖော်နိုင်မည်
- တင်သွင်းမှုအခြေအနေများအတွက် အလိုအလျောက် စစ်ဆေးမှု workflow များကို ဒီဇိုင်းဆွဲနိုင်မည်
- ပတ်ဝန်းကျင်အလိုက် စစ်ဆေးမှုလုပ်ထုံးလုပ်နည်းများနှင့် မူဝါဒများကို အကောင်အထည်ဖော်နိုင်မည်
- တင်သွင်းမှုအဆင်သင့်ဖြစ်မှုအတွက် ကြိုတင်စောင့်ကြည့်မှုနှင့် အချက်ပေးမှုများကို ပြင်ဆင်နိုင်မည်
- တင်သွင်းမှုမတိုင်မီ ပြဿနာများကို ဖြေရှင်းပြီး အကောင်းဆုံးနည်းလမ်းများကို အကောင်အထည်ဖော်နိုင်မည်
- DevOps pipeline များနှင့် အလိုအလျောက်လုပ်ငန်းစဉ်များထဲသို့ pre-flight စစ်ဆေးမှုများကို ပေါင်းစည်းနိုင်မည်

## အကြောင်းအရာများ

- [အကျဉ်းချုပ်](../../../../docs/pre-deployment)
- [အလိုအလျောက် Pre-flight Script](../../../../docs/pre-deployment)
- [လက်ဖြင့် စစ်ဆေးရန် စစ်ဆေးစာရင်း](../../../../docs/pre-deployment)
- [ပတ်ဝန်းကျင် စစ်ဆေးမှု](../../../../docs/pre-deployment)
- [အရင်းအမြစ် စစ်ဆေးမှု](../../../../docs/pre-deployment)
- [လုံခြုံရေးနှင့်လိုက်နာမှု စစ်ဆေးမှုများ](../../../../docs/pre-deployment)
- [စွမ်းဆောင်ရည်နှင့် စွမ်းအားအစီအစဉ်ရေးဆွဲခြင်း](../../../../docs/pre-deployment)
- [ပုံမှန်ပြဿနာများကို ဖြေရှင်းခြင်း](../../../../docs/pre-deployment)

---

## အကျဉ်းချုပ်

Pre-flight စစ်ဆေးမှုများသည် တင်သွင်းမှုမတိုင်မီ အောင်မြင်မှုအတွက် အရေးကြီးသော စစ်ဆေးမှုများဖြစ်ပြီး:

- **အရင်းအမြစ်ရရှိနိုင်မှု**နှင့် quota များကို ရည်မှန်းထားသောဒေသများတွင် စစ်ဆေးခြင်း
- **Authentication နှင့် အခွင့်အာဏာများ**ကို မှန်ကန်စွာ ပြင်ဆင်ထားခြင်း
- **Template မှန်ကန်မှု**နှင့် parameter မှန်ကန်မှု
- **Network ချိတ်ဆက်မှု**နှင့် အခြေခံလိုအပ်ချက်များ
- **အဖွဲ့အစည်းမူဝါဒများနှင့် လုံခြုံရေးလိုက်နာမှု**
- **ကုန်ကျစရိတ်ခန့်မှန်းခြင်း**ကို ဘတ်ဂျက်အတွင်းရှိစေခြင်း

### Pre-flight စစ်ဆေးမှုများကို မည်သည့်အချိန်တွင် လုပ်ဆောင်မည်

- **ပတ်ဝန်းကျင်အသစ်**တွင် ပထမဆုံးတင်သွင်းမှုမတိုင်မီ
- **Template အရေးကြီးပြောင်းလဲမှုများ**ပြီးနောက်
- **ထုတ်လုပ်မှုတင်သွင်းမှုများ**မတိုင်မီ
- **Azure ဒေသများကို ပြောင်းလဲသောအခါ**
- **CI/CD pipeline များ၏ အစိတ်အပိုင်းအဖြစ်**

---

## အလိုအလျောက် Pre-flight Script

### PowerShell Pre-flight Checker

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

### Bash Pre-flight Checker

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

## လက်ဖြင့် စစ်ဆေးရန် စစ်ဆေးစာရင်း

### တင်သွင်းမှုမတိုင်မီ စစ်ဆေးစာရင်း

ဒီစာရင်းကို print ထုတ်ပြီး တင်သွင်းမှုမတိုင်မီ အချက်တစ်ခုချင်းစီကို စစ်ဆေးပါ:

#### ✅ ပတ်ဝန်းကျင် ပြင်ဆင်မှု
- [ ] AZD CLI ကို ထည့်သွင်းပြီး နောက်ဆုံးဗားရှင်းအထိ update ပြုလုပ်ထားခြင်း
- [ ] Azure CLI ကို ထည့်သွင်းပြီး authenticated ဖြစ်ခြင်း
- [ ] မှန်ကန်သော Azure subscription ကို ရွေးချယ်ထားခြင်း
- [ ] ပတ်ဝန်းကျင်အမည်သည် ထူးခြားပြီး နာမည်ပုံစံလိုက်နာထားခြင်း
- [ ] ရည်မှန်းထားသော resource group ကို သတ်မှတ်ထားခြင်း (သို့) ဖန်တီးနိုင်ခြင်း

#### ✅ Authentication & အခွင့်အာဏာများ
- [ ] `azd auth login` ဖြင့် အောင်မြင်စွာ authenticated ဖြစ်ခြင်း
- [ ] User သည် ရည်မှန်းထားသော subscription/resource group တွင် Contributor role ရှိခြင်း
- [ ] CI/CD အတွက် service principal ကို ပြင်ဆင်ထားခြင်း (လိုအပ်ပါက)
- [ ] သက်တမ်းကုန်ဆုံးထားသော certificates သို့မဟုတ် credentials မရှိခြင်း

#### ✅ Template စစ်ဆေးမှု
- [ ] `azure.yaml` ရှိပြီး မှန်ကန်သော YAML ဖြစ်ခြင်း
- [ ] azure.yaml တွင် သတ်မှတ်ထားသော service များအားလုံးတွင် ဆက်စပ် source code ရှိခြင်း
- [ ] `infra/` directory တွင် Bicep template များ ရှိခြင်း
- [ ] `main.bicep` သည် error မရှိဘဲ compile ဖြစ်ခြင်း (`az bicep build --file infra/main.bicep`)
- [ ] လိုအပ်သော parameter များအားလုံးတွင် default value ရှိခြင်း သို့မဟုတ် ပေးထားမည်ဖြစ်ခြင်း
- [ ] Template များတွင် hardcoded secrets မရှိခြင်း

#### ✅ အရင်းအမြစ်အစီအစဉ်ရေးဆွဲခြင်း
- [ ] ရည်မှန်းထားသော Azure region ကို ရွေးချယ်ပြီး စစ်ဆေးထားခြင်း
- [ ] ရည်မှန်းထားသော region တွင် လိုအပ်သော Azure service များ ရရှိနိုင်ခြင်း
- [ ] ရည်မှန်းထားသော resource များအတွက် quota လုံလောက်မှု ရှိခြင်း
- [ ] Resource နာမည်ပဋိပက္ခများကို စစ်ဆေးထားခြင်း
- [ ] Resource များအကြား အချင်းချင်းလိုအပ်ချက်များကို နားလည်ထားခြင်း

#### ✅ Network & လုံခြုံရေး
- [ ] Azure endpoint များနှင့် network ချိတ်ဆက်မှုကို စစ်ဆေးထားခြင်း
- [ ] Firewall/proxy setting များကို လိုအပ်ပါက ပြင်ဆင်ထားခြင်း
- [ ] Key Vault ကို secret များစီမံခန့်ခွဲရန် ပြင်ဆင်ထားခြင်း
- [ ] Managed identity များကို အလွှမ်းအသုံးပြုထားခြင်း
- [ ] Web application များအတွက် HTTPS enforcement ကို enabled လုပ်ထားခြင်း

#### ✅ ကုန်ကျစရိတ်စီမံခန့်ခွဲမှု
- [ ] Azure Pricing Calculator ကို အသုံးပြု၍ ကုန်ကျစရိတ်ခန့်မှန်းထားခြင်း
- [ ] လိုအပ်ပါက ဘတ်ဂျက်အချက်ပေးမှုများကို ပြင်ဆင်ထားခြင်း
- [ ] ပတ်ဝန်းကျင်အမျိုးအစားအတွက် သင့်လျော်သော SKU များကို ရွေးချယ်ထားခြင်း
- [ ] ထုတ်လုပ်မှု workload များအတွက် reserved capacity ကို စဉ်းစားထားခြင်း

#### ✅ စောင့်ကြည့်မှုနှင့် အခြေအနေသိရှိမှု
- [ ] Template များတွင် Application Insights ကို ပြင်ဆင်ထားခြင်း
- [ ] Log Analytics workspace ကို စီစဉ်ထားခြင်း
- [ ] အရေးကြီးသော metrics များအတွက် alert rule များကို သတ်မှတ်ထားခြင်း
- [ ] Application များတွင် health check endpoint များကို အကောင်အထည်ဖော်ထားခြင်း

#### ✅ Backup & Recovery
- [ ] Data resource များအတွက် backup strategy ကို သတ်မှတ်ထားခြင်း
- [ ] Recovery time objective (RTO) များကို စာရွက်စာတမ်းပြုစုထားခြင်း
- [ ] Recovery point objective (RPO) များကို စာရွက်စာတမ်းပြုစုထားခြင်း
- [ ] ထုတ်လုပ်မှုအတွက် disaster recovery plan ကို ပြင်ဆင်ထားခြင်း

---

## ပတ်ဝန်းကျင် စစ်ဆေးမှု

### Development ပတ်ဝန်းကျင် စစ်ဆေးမှု

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

### Production ပတ်ဝန်းကျင် စစ်ဆေးမှု

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

## အရင်းအမြစ် စစ်ဆေးမှု

### Quota စစ်ဆေးမှု Script

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

## လုံခြုံရေးနှင့်လိုက်နာမှု စစ်ဆေးမှုများ

### လုံခြုံရေး စစ်ဆေးမှု Script

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

## CI/CD နှင့် ပေါင်းစည်းမှု

### GitHub Actions Integration

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

### Azure DevOps Integration

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

## အကောင်းဆုံးနည်းလမ်းများ အကျဉ်းချုပ်

### ✅ Pre-flight စစ်ဆေးမှု အကောင်းဆုံးနည်းလမ်းများ

1. **အလိုအလျောက်လုပ်ဆောင်ရန်**
   - CI/CD pipeline များထဲသို့ စစ်ဆေးမှုများကို ပေါင်းစည်းပါ
   - စစ်ဆေးမှုများအတွက် script များကို အသုံးပြုပါ
   - ရလဒ်များကို audit trail အတွက် သိမ်းဆည်းပါ

2. **ပတ်ဝန်းကျင်အလိုက် စစ်ဆေးမှု**
   - Development/စမ်းသပ်မှု/ထုတ်လုပ်မှုအတွက် ကွဲပြားသော စစ်ဆေးမှုများ
   - ပတ်ဝန်းကျင်အလိုက် လုံခြုံရေးလိုအပ်ချက်များ
   - ထုတ်လုပ်မှုမဟုတ်သော ပတ်ဝန်းကျင်များအတွက် ကုန်ကျစရိတ်အခွင့်အရေးများ

3. **အကျယ်အဝန်း စစ်ဆေးမှု**
   - Authentication နှင့် အခွင့်အာဏာများ
   - Resource quota နှင့် availability
   - Template စစ်ဆေးမှုနှင့် syntax
   - လုံခြုံရေးနှင့်လိုက်နာမှုလိုအပ်ချက်များ

4. **ရှင်းလင်းသော အစီရင်ခံမှု**
   - အရောင်သတ်မှတ်ထားသော status indicator များ
   - ပြဿနာများအတွက် အသေးစိတ် error message များနှင့် ဖြေရှင်းနည်းများ
   - အမြန်စစ်ဆေးနိုင်ရန် အကျဉ်းချုပ်အစီရင်ခံစာများ

5. **Fail Fast**
   - အရေးကြီးသော စစ်ဆေးမှုများမအောင်မြင်ပါက တင်သွင်းမှုကို ရပ်တန့်ပါ
   - ဖြေရှင်းနည်းများအတွက် ရှင်းလင်းသောလမ်းညွှန်များပေးပါ
   - စစ်ဆေးမှုများကို ပြန်လည်လုပ်ဆောင်ရန် လွယ်ကူစေပါ

### Pre-flight စစ်ဆေးမှုတွင် ဖြစ်နိုင်သော အမှားများ

1. **"အမြန်" တင်သွင်းမှုများအတွက် စစ်ဆေးမှုကို ကျော်သွားခြင်း**
2. **အခွင့်အာဏာများကို လုံလောက်စွာ စစ်ဆေးမှုမပြုလုပ်ခြင်း**
3. **Quota အကန့်အသတ်များကို မစစ်ဆေးဘဲ တင်သွင်းမှုမအောင်မြင်မှုဖြစ်ခြင်း**
4. **CI/CD pipeline များတွင် Template မစစ်ဆေးခြင်း**
5. **ထုတ်လုပ်မှုပတ်ဝန်းကျင်များအတွက် လုံခြုံရေးစစ်ဆေးမှုကို မလုပ်ဆောင်ခြင်း**
6. **ကုန်ကျစရိတ်ခန့်မှန်းမှုမလုံလောက်ခြင်းကြောင့် ဘတ်ဂျက်ပြဿနာများဖြစ်ခြင်း**

---

**Pro Tip**: Pre-flight စစ်ဆေးမှုများကို CI/CD pipeline တွင် တင်သွင်းမှုလုပ်ငန်းစဉ်မတိုင်မီ အခြား job အဖြစ် run လုပ်ပါ။ ဒါက ပြဿနာများကို စောစောမတိုင်မီ ဖမ်းဆီးနိုင်ပြီး developer များအတွက် အမြန် feedback ပေးနိုင်စေပါသည်။

---

**အညွှန်း**
- **ယခင်သင်ခန်းစာ**: [SKU ရွေးချယ်မှု](sku-selection.md)
- **နောက်သင်ခန်းစာ**: [Cheat Sheet](../../resources/cheat-sheet.md)

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းစာရွက်စာတမ်းကို ၎င်း၏ မူရင်းဘာသာစကားဖြင့် အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွတ်များ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
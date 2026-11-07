# AZD ডিপ্লয়মেন্টের জন্য প্রি-ফ্লাইট চেকসমূহ

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [শুরুর জন্য AZডি](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ৬ - প্রি-ডিপ্লয়মেন্ট যাচাইকরণ ও পরিকল্পনা
- **⬅️ পূর্ববর্তী**: [SKU নির্বাচন](sku-selection.md)
- **➡️ পরবর্তী অধ্যায়**: [অধ্যায় ৭: সমস্যা সমাধান](../chapter-07-troubleshooting/common-issues.md)
- **🔧 সংশ্লিষ্ট**: [অধ্যায় ৪: ডিপ্লয়মেন্ট গাইড](../chapter-04-infrastructure/deployment-guide.md)

## পরিচিতি

এই বিস্তৃত গাইডটি প্রি-ডিপ্লয়মেন্ট যাচাইকরণ স্ক্রিপ্ট এবং প্রক্রিয়াসমূহ প্রদান করে যাতে Azure Developer CLI ডিপ্লয়মেন্ট শুরু হওয়ার আগে সফল হতে পারে। প্রমাণীকরণ, রিসোর্স প্রয়োজনীয়তা, কোটা, নিরাপত্তা সম্মতি, এবং কর্মক্ষমতা প্রয়োজনীয়তার জন্য স্বয়ংক্রিয় চেকগুলি বাস্তবায়ন করতে শিখুন যাতে ডিপ্লয়মেন্ট ব্যর্থতা রোধ করা যায় এবং ডিপ্লয়মেন্ট সফলতার হার অনুকূল করা যায়।

## শেখার লক্ষ্যসমূহ

এই গাইড সম্পন্ন করলে, আপনি:
- স্বয়ংক্রিয় প্রি-ডিপ্লয়মেন্ট যাচাইকরণ কৌশল এবং স্ক্রিপ্ট অধ্যয়ন করবেন
- প্রমাণীকরণ, অনুমতি এবং কোটা জন্য বিস্তৃত যাচাইকরণ কৌশল বোঝবেন
- রিসোর্স প্রাপ্যতা এবং সক্ষমতা যাচাইকরণ প্রক্রিয়া বাস্তবায়ন করবেন
- প্রতিষ্ঠান নীতি জন্য নিরাপত্তা ও সম্মতি চেক কনফিগার করবেন
- খরচের হিসাব এবং বাজেট যাচাইকরণ কার্যপ্রবাহ ডিজাইন করবেন
- CI/CD পাইপলাইন জন্য কাস্টম প্রি-ফ্লাইট চেক অটোমেশন তৈরি করবেন

## শেখার ফলাফল

সম্পন্ন হলে, আপনি সক্ষম হবেন:
- বিস্তৃত প্রি-ফ্লাইট যাচাইকরণ স্ক্রিপ্ট তৈরি ও চালানোর
- বিভিন্ন ডিপ্লয়মেন্ট পরিস্থিতির জন্য স্বয়ংক্রিয় যাচাইকরণ কার্যপ্রবাহ ডিজাইন করার
- পরিবেশ-নির্দিষ্ট যাচাইকরণ প্রক্রিয়া ও নীতি বাস্তবায়ন করার
- ডিপ্লয়মেন্ট প্রস্তুতির জন্য সক্রিয় নিরীক্ষণ ও সতর্কতা কনফিগার করার
- প্রি-ডিপ্লয়মেন্ট সমস্যা সমাধান ও সংশোধনমূলক পদক্ষেপ বাস্তবায়ন করার
- প্রি-ফ্লাইট চেকসমূহ DevOps পাইপলাইন ও স্বয়ংক্রিয়তায় সংহত করার

## বিষয় সমূহের সূচি

- [সারাংশ](#overview)
- [স্বয়ংক্রিয় প্রি-ফ্লাইট স্ক্রিপ্ট](#automated-pre-flight-script)
- [ম্যানুয়াল যাচাইকরণ চেকলিস্ট](#manual-validation-checklist)
- [পরিবেশ যাচাইকরণ](#environment-validation)
- [রিসোর্স যাচাইকরণ](#resource-validation)
- [নিরাপত্তা ও সম্মতি যাচাইকরণ](#security--compliance-checks)
- [کارکردگی ও সক্ষমতা পরিকল্পনা](capacity-planning.md)
- [সাধারণ সমস্যার সমাধান](../chapter-07-troubleshooting/common-issues.md)

---

## সারাংশ

প্রি-ফ্লাইট চেক সম্পর্কিত গুরুত্বপূর্ণ যাচাইকরণ আছে যা ডিপ্লয়মেন্টের পূর্বে সম্পাদিত হয় নিশ্চিত করার জন্য:

- **টার্গেট অঞ্চলে** রিসোর্স প্রাপ্যতা এবং কোটা
- **প্রমাণীকরণ এবং অনুমতি** সঠিকভাবে কনফিগারকৃত
- **টেমপ্লেট বৈধতা** এবং প্যারামিটার সঠিকতা
- **নেটওয়ার্ক সংযোগ** ও নির্ভরশীলতা
- **সংস্থার নীতি অনুযায়ী নিরাপত্তা সম্মতি**
- **বাজেটের মধ্যকার** খরচ অনুমান

### কখন প্রি-ফ্লাইট চেক চালাবেন

- **নতুন পরিবেশে প্রথম ডিপ্লয়মেন্টের আগে**
- **গুরুত্বপূর্ণ টেমপ্লেট পরিবর্তনের পর**
- **প্রোডাকশন ডিপ্লয়মেন্টের পূর্বে**
- **Azure অঞ্চল পরিবর্তনের সময়**
- **CI/CD পাইপলাইনের অংশ হিসেবে**

---

## স্বয়ংক্রিয় প্রি-ফ্লাইট স্ক্রিপ্ট

> **ব্যাপ্তি এবং প্রয়োজনীয়তা:** এগুলো আপনার নিজস্ব প্রকল্পে সংরক্ষণের জন্য প্রাথমিক স্ক্রিপ্ট, এই অধ্যায় থেকে সরাসরি পাওয়া লোকাল ফাইল নয়। পावरশেল সংস্করণে PowerShell **7.3+** (নেটিভ কমান্ড ত্রুটি প্রচার) এবং `powershell-yaml` মডিউল প্রয়োজন `ConvertFrom-Yaml` এর জন্য। Bash সংস্করণে Bash, `jq`, Python 3.10+, এবং PyYAML প্রয়োজন। উভয় সংস্করণে Azure CLI, azd, এবং একটি কার্যকর Bicep প্রকল্প দরকার। এগুলো ডায়াগনস্টিক, ডিপ্লয়মেন্ট প্রস্তুতি, সক্ষমতা, বা সম্মতির প্রমাণ নয়। `azd provision --preview` এর আগে টেমপ্লেট হুক পরীক্ষা করুন; হুকগুলো প্রকল্পের যেকোন কমান্ড চালাতে পারে।

### পাওয়ারশেল প্রি-ফ্লাইট চেকার

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

# Fail native commands into catch blocks instead of reporting false successes.
$ErrorActionPreference = 'Stop'
if ($PSVersionTable.PSVersion -lt [version]'7.3') {
    throw 'PowerShell 7.3+ is required for this script.'
}
$PSNativeCommandUseErrorActionPreference = $true

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
        if ($azdAuth.status -eq "success") {
            Write-Status "AZD authentication" "Success" "Token available; expires $($azdAuth.expiresOn)"
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
        $subscription = az account show --subscription $subscriptionId --output json | ConvertFrom-Json
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
            $_.roleDefinitionName -eq "Owner"
        }
        
        if ($hasContributor) {
            Write-Status "Role assignment inventory" "Info" "Contributor/Owner found; verify effective scope, policy and any role-assignment permissions separately"
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
                Write-Status "Resource group creation" "Warning" "Group does not exist. Review subscription-scope permissions; this diagnostic does not create/delete test groups."
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
        if ($coreQuota -and $coreQuota.limit -gt 0) {
            $usagePercent = [math]::Round(($coreQuota.currentValue / $coreQuota.limit) * 100, 2)
            if ($usagePercent -lt 80) {
                Write-Status "Compute cores quota" "Success" "$($coreQuota.currentValue)/$($coreQuota.limit) ($usagePercent%)"
            } else {
                Write-Status "Compute cores quota" "Warning" "Missing or zero quota; verify service requirements"
            }
            else {
                Write-Status "Compute cores quota" "Warning" "$($coreQuota.currentValue)/$($coreQuota.limit) ($usagePercent%)"
            }
        }
        
        # Check App Service limits
        try {
            $appServiceUsage = az appservice list-locations --sku S1 --output json | ConvertFrom-Json
            $displayLocation = az account list-locations --query "[?name=='$Location'].displayName | [0]" -o tsv
            if ($appServiceUsage | Where-Object { $_.name -eq $Location -or $_.name -eq $displayLocation }) {
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
        $storageUsage = @(az storage account show-usage --location $Location --output json | ConvertFrom-Json)[0]
        if ($storageUsage -and $storageUsage.limit -gt 0 -and $storageUsage.currentValue -lt $storageUsage.limit) {
            Write-Status "Storage account quota" "Info" "$($storageUsage.currentValue)/$($storageUsage.limit) in $Location"
        }
        else {
            Write-Status "Storage account quota" "Warning" "No headroom or missing quota data"
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
            # A 401/403/404 response may still prove HTTP reachability.
            if ($_.Exception.Response) {
                Write-Status "Connectivity to $endpoint" "Info" "HTTP response received; this is not an authorization test"
            } else {
                Write-Status "Connectivity to $endpoint" "Error" $_.Exception.Message
                return $false
            }
        }
    }
    
    # Test DNS resolution
    try {
        $dnsResult = [System.Net.Dns]::GetHostAddresses("management.azure.com")
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
            if (-not (Get-Command ConvertFrom-Yaml -ErrorAction SilentlyContinue)) {
                throw 'ConvertFrom-Yaml requires the powershell-yaml module.'
            }
            $azureYaml = Get-Content "azure.yaml" -Raw | ConvertFrom-Yaml
            Write-Status "azure.yaml parsing" "Success"
            
            # Validate services
            if ($azureYaml.services) {
                $serviceCount = $azureYaml.services.Count
                Write-Status "Services defined" "Success" "$serviceCount services found"
            }
            else {
                Write-Status "Services defined" "Warning" "No services defined in azure.yaml"
            }
        }
        catch {
            Write-Status "azure.yaml parsing" "Error" $_.Exception.Message
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
    
    # Preview ARM changes only after reviewing the project's hooks.
    try {
        Write-Status "Infrastructure preview test" "Info" "Previewing proposed changes (not a capacity or deployment guarantee)..."
        $previewResult = azd provision --preview 2>$null
        if ($LASTEXITCODE -eq 0) {
            Write-Status "Infrastructure preview" "Success" "Preview completed; review changes and remaining diagnostics"
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
                $resourceTypes = $providers.resourceTypes | Where-Object { $_.locations -contains $validLocation.displayName }
                
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
    
    # Text-search heuristics only: presence of keywords is not compliance proof.
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
        Write-Host "${Green}✓ Implemented checks passed; review warnings and untested requirements.${Reset}"
        exit 0
    }
    else {
        Write-Host "${Red}✗ Some pre-flight checks failed ($passedCount/$totalCount)${Reset}"
        Write-Host "${Red}✗ Please resolve issues before deployment${Reset}"
        exit 1
    }
}

# Run the pre-flight check
azd env select $EnvironmentName
Invoke-PreflightCheck
```

### bash প্রি-ফ্লাইট চেকার

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
        print_status "jq not found" "error" "jq is required"
        return 1
    fi
    python3 -c "import yaml" >/dev/null 2>&1 || {
        print_status "Python/PyYAML not found" "error" "Python 3 and PyYAML are required"; return 1;
    }
    
    return 0
}

check_authentication() {
    echo -e "\n${BLUE}=== Authentication Check ===${NC}"
    
    # Check AZD authentication
    # --check-status returns exit code 0 even when unauthenticated; inspect JSON.
    if azd auth login --check-status --output json | jq -e '.status == "success"' >/dev/null; then
        print_status "AZD authentication" "success" "Token available"
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
    
    local display_location
    display_location=$(az account list-locations --query "[?name=='$LOCATION'].displayName | [0]" -o tsv)
    for service in "${services[@]}"; do
        if az provider show --namespace "$service" --query "resourceTypes[?contains(locations, '$display_location')]" --output tsv | grep -q .; then
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
    if ! $all_passed; then exit 1; fi
    azd env select "$ENVIRONMENT_NAME" || exit 1
    check_authentication || all_passed=false
    check_template_validation || all_passed=false
    check_regional_availability || all_passed=false
    
    # Summary
    echo -e "\n${BLUE}=== Pre-flight Check Summary ===${NC}"
    
    if $all_passed; then
        echo -e "${GREEN}✓ All pre-flight checks passed${NC}"
        echo -e "${GREEN}✓ Implemented checks passed; review warnings and untested requirements.${NC}"
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

## ম্যানুয়াল যাচাইকরণ চেকলিস্ট

### প্রি-ডিপ্লয়মেন্ট চেকলিস্ট

এই চেকলিস্ট প্রিন্ট করে ডিপ্লয়মেন্টের আগে প্রতিটি আইটেম যাচাই করুন:

#### ✅ পরিবেশ সেটআপ
- [ ] AZD CLI ইনস্টল ও সর্বশেষ সংস্করণে আপডেট করা হয়েছে
- [ ] Azure CLI ইনস্টল এবং প্রমাণীকরণ সম্পন্ন
- [ ] সঠিক Azure সাবস্ক্রিপশন নির্বাচন করা হয়েছে
- [ ] পরিবেশের নাম ইউনিক এবং নামকরণের নিয়ম অনুসরণ করে
- [ ] লক্ষ্য রিসোর্স গ্রুপ চিহ্নিত বা তৈরি করা সম্ভব

#### ✅ প্রমাণীকরণ ও অনুমতি
- [ ] সফলভাবে `azd auth login` দিয়ে প্রমাণীকরণ করা হয়েছে
- [ ] ব্যবহারকারীর টার্গেট সাবস্ক্রিপশন/রিসোর্স গ্রুপে Contributor ভূমিকা রয়েছে
- [ ] যদি টেমপ্লেটস রোল অ্যাসাইনমেন্ট তৈরি করে, তবে ডিপ্লয়মেন্ট পরিচয়ও স্কোপড রোল-অ্যাসাইনমেন্ট অনুমতি রাখে (শুধু Contributor যথেষ্ট নয়)
- [ ] CI/CD এর জন্য সার্ভিস প্রিন্সিপাল কনফিগার করা হয়েছে (যদি প্রয়োগযোগ্য)
- [ ] কোনো মেয়াদোত্তীর্ণ সনদপত্র বা ক্রেডেনশিয়াল নেই

#### ✅ টেমপ্লেট যাচাইকরণ
- [ ] `azure.yaml` বিদ্যমান এবং বৈধ YAML
- [ ] azure.yaml এ সংজ্ঞায়িত সব সার্ভিসের জন্য উৎস কোড উপস্থিত
- [ ] `infra/` ডিরেক্টরির Bicep টেমপ্লেট উপস্থিত
- [ ] `main.bicep` ত্রুটি ছাড়াই কম্পাইল হয় (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 ইনফ্রাস্ট্রাকচার প্রিভিউ সফলভাবে চলে (`azd provision --preview`)
- [ ] সব প্রয়োজনীয় প্যারামিটার ডিফল্ট মানে বা সরবরাহ করা হবে
- [ ] টেমপ্লেটে কোনো হার্ডকোডেড সিক্রেট নেই

#### ✅ রিসোর্স পরিকল্পনা
- [ ] লক্ষ্য Azure অঞ্চল নির্বাচন ও যাচাইকরণ করা হয়েছে
- [ ] টার্গেট অঞ্চলে প্রয়োজনীয় Azure সার্ভিস উপলব্ধ
- [ ] পরিকল্পিত রিসোর্স জন্য যথেষ্ট কোটা রয়েছে
- [ ] রিসোর্স নামকরণ সংঘাত পরীক্ষা করা হয়েছে
- [ ] রিসোর্সগুলোর মধ্যে নির্ভরশীলতা বুঝা হয়েছে

#### ✅ নেটওয়ার্ক ও নিরাপত্তা
- [ ] Azure এন্ডপয়েন্টের সাথে নেটওয়ার্ক সংযোগ নিশ্চিত
- [ ] প্রয়োজনে ফায়ারওয়াল/প্রক্সি সেটিং কনফিগার করা হয়েছে
- [ ] সিক্রেট ব্যবস্থাপনার জন্য Key Vault কনফিগার করা হয়েছে
- [ ] সম্ভব হলে Managed identities ব্যবহার করা হয়েছে
- [ ] ওয়েব অ্যাপ্লিকেশনগুলোর জন্য HTTPS বাধ্যতামূলক করা হয়েছে

#### ✅ খরচ ব্যবস্থাপনা
- [ ] Azure মূল্য নির্ধারণ ক্যালকুলেটর দিয়ে খরচ হিসাব করা হয়েছে
- [ ] প্রয়োজনে বাজেট সতর্কতা কনফিগার করা হয়েছে
- [ ] পরিবেশের ধরন অনুযায়ী সঠিক SKU নির্বাচন করা হয়েছে
- [ ] প্রোডাকশন ওয়ার্কলোডের জন্য রিজার্ভড সক্ষমতা বিবেচনা করা হয়েছে

#### ✅ নজরদারি ও পর্যবেক্ষণ
- [ ] টেমপ্লেটে Application Insights কনফিগার করা হয়েছে
- [ ] Log Analytics কর্মস্থান পরিকল্পনা করা হয়েছে
- [ ] গুরুত্বপূর্ণ মেট্রিক্সের জন্য এলার্ট রুল নির্ধারণ করা হয়েছে
- [ ] অ্যাপ্লিকেশনের স্বাস্থ্য চেক এন্ডপয়েন্ট বাস্তবায়ন করা হয়েছে

#### ✅ ব্যাকআপ ও পুনরুদ্ধার
- [ ] ডেটা রিসোর্সের জন্য ব্যাকআপ স্ট্র্যাটেজি নির্ধারিত
- [ ] পুনরুদ্ধার সময় সূচক (RTO) নথিভুক্ত
- [ ] পুনরুদ্ধার পয়েন্ট সূচক (RPO) নথিভুক্ত
- [ ] প্রোডাকশনের জন্য দুর্যোগ পুনরুদ্ধার পরিকল্পনা রয়েছে

---

## পরিবেশ যাচাইকরণ

নিম্নলিখিত `grep` চেকগুলি শুধু চিত্রনাট্যস্বরূপ অনুস্মারক মাত্র। কোনো শব্দের উপস্থিতি বৈশিষ্ট্যটি সঠিক রিসোর্সে কনফিগার আছে তা প্রমাণ করে না, এবং কোনো শব্দের অনুপস্থিতি তার অভাব প্রমাণ করে না (মডিউল/ডিফল্টস এটি সরবরাহ করতে পারে)। এগুলো প্রোডাকশন সম্মতি গেট হিসেবে ব্যবহার করবেন না।

### উন্নয়ন পরিবেশ যাচাইকরণ

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

### প্রোডাকশন পরিবেশ যাচাইকরণ

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

## রিসোর্স যাচাইকরণ

### কোটা যাচাইকরণ স্ক্রিপ্ট

```python
#!/usr/bin/env python3
"""
Azure quota and limit validation script
"""

import json
import subprocess
import sys
from typing import Dict, List, Tuple

def run_command(command: List[str]) -> dict | list | None:
    """Run Azure CLI command and return JSON result"""
    try:
        result = subprocess.run(command, capture_output=True, text=True, check=True)
        return json.loads(result.stdout)
    except subprocess.CalledProcessError as e:
        print(f"Error running command {' '.join(command)}: {e}")
        return None
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON: {e}")
        return None

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
            if limit <= 0:
                print(f"❌ No quota for {quota_item['name']['value']}")
                return False
            usage_percent = (current / limit) * 100
            
            status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
            print(f"{status} {quota_item['name']['localizedValue']}: {current}/{limit} ({usage_percent:.1f}%)")
            
            if usage_percent >= 95:
                return False
    
    return True

def check_storage_limits(location: str) -> bool:
    """Check storage account limits"""
    print(f"\n=== Storage Limits Check ({location}) ===")
    
    # Retrieve regional quota rather than assuming a subscription-wide constant.
    usages = run_command(['az', 'storage', 'account', 'show-usage', '--location', location])
    
    if not usages:
        print("❌ Could not retrieve storage account information")
        return False
    
    account_count = usages['currentValue']
    max_accounts = usages['limit']
    if max_accounts <= 0:
        return False
    
    usage_percent = (account_count / max_accounts) * 100
    status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
    
    print(f"{status} Storage Accounts: {account_count}/{max_accounts} ({usage_percent:.1f}%)")
    
    return usage_percent < 95

def check_network_limits(location: str) -> bool:
    """Check network-related limits"""
    print(f"\n=== Network Limits Check ({location}) ===")
    
    usages = run_command(['az', 'network', 'list-usages', '--location', location])
    if not usages:
        return False
    for item in usages:
        current, limit = item['currentValue'], item['limit']
        print(f"{item['name']['value']}: {current}/{limit}")
        if limit <= 0 or current >= limit:
            return False
    return True

def main():
    if len(sys.argv) != 2:
        print("Usage: python3 quota_check.py <location>")
        sys.exit(1)
    
    location = sys.argv[1]
    
    print("🔍 Azure Quota and Limits Validation")
    print(f"📍 Location: {location}")
    from datetime import datetime, timezone
    print(f"⏰ Time: {datetime.now(timezone.utc).isoformat()}")
    
    all_passed = True
    
    # Run checks
    all_passed &= check_compute_quotas(location)
    all_passed &= check_storage_limits(location)
    all_passed &= check_network_limits(location)
    
    # Summary
    print(f"\n=== Quota Check Summary ===")
    if all_passed:
        print("✅ Implemented quota thresholds passed; not a capacity reservation")
        sys.exit(0)
    else:
        print("❌ Some quota limits are near capacity - consider requesting increases")
        sys.exit(1)

if __name__ == "__main__":
    main()
```

---

## নিরাপত্তা ও সম্মতি যাচাইকরণ

### নিরাপত্তা যাচাইকরণ স্ক্রিপ্ট

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
    
    local security_issues=0
    check_security_practices || security_issues=$?
    check_compliance_requirements
    
    echo -e "\n=== Security Check Summary ==="
    if [[ $security_issues -eq 0 ]]; then
        echo "✅ Text-search reminders passed; this is not a security/compliance assessment"
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

## CI/CD এর সাথে সংহতকরণ

### গিটহাব অ্যাকশন্স সংযোগ

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
    permissions:
      id-token: write
      contents: read
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    
    - name: Install AZD
      uses: Azure/setup-azd@v0.1.0
      with:
        version: 1.37.2
    
    - name: Verify prerequisites
      run: |
        az version
        jq --version
        python3 -c "import yaml"
    
    - name: Azure Login
      uses: azure/login@v2
      with:
        client-id: ${{ vars.AZURE_CLIENT_ID }}
        tenant-id: ${{ vars.AZURE_TENANT_ID }}
        subscription-id: ${{ vars.AZURE_SUBSCRIPTION_ID }}

    - name: AZD Login
      run: |
        azd auth login --client-id "${{ vars.AZURE_CLIENT_ID }}" \
          --tenant-id "${{ vars.AZURE_TENANT_ID }}" \
          --federated-credential-provider github
    
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
    
```

এই ওয়ার্কফ্লোয়ের জন্য ফেডারেটেড ক্রেডেনশিয়াল কনফিগার করুন এবং সংরক্ষিত স্ক্রিপ্ট চালানোর আগে নির্বাচিত azd পরিবেশ তৈরি/পুনরুদ্ধার করুন। এই উদাহরণগুলো কনসোল আউটপুটই লিখে; কোনো `preflight-results.json` বা JUnit ফাইল তৈরি করে না।

### Azure DevOps সংযোগ

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

- task: AzureCLI@2
  displayName: 'Run Pre-flight Checks'
  inputs:
    azureSubscription: $(serviceConnection)
    scriptType: bash
    scriptLocation: inlineScript
    inlineScript: |
      set -e
      # Requires a workload-identity-federated service connection.
      # AzureCLI@2 supplies AZURESUBSCRIPTION_* for the azd provider.
      azd auth login --federated-credential-provider azure-pipelines
      bash ./scripts/preflight-check.sh \
        --environment-name "${{ parameters.environment }}" \
        --location "${{ parameters.location }}"
  env:
    SYSTEM_ACCESSTOKEN: $(System.AccessToken)
```

পাইপলাইনকে অবশ্যই তার azd পরিবেশ পুনরুদ্ধার/তৈরি করতে হবে এবং এই পাঠে প্রদর্শিত স্ক্রিপ্ট সংরক্ষণ করতে হবে এই টাস্কের আগে। ফেডারেটেড সার্ভিস সংযোগ কনফিগার করুন এবং পাইপলাইনকে প্রয়োজনীয় টোকেন অনুমতি দিন। পূর্বের `AzureCLI@2` টাস্কের Azure CLI লগইন পরে কোনও সাধারণ Bash টাস্কের প্রমাণীকরণ করবে এমন প্রত্যাশা করবেন না।

---

## সেরা অনুশীলন সংক্ষিপ্তসার

### ✅ প্রি-ফ্লাইট চেক সেরা অনুশীলনসমূহ

1. **যথাসম্ভব স্বয়ংক্রিয় করুন**
   - যাচাইকরণ CI/CD পাইপলাইনে সংহত করুন
   - পুনরাবৃত্ত যাচাইকরণের জন্য স্ক্রিপ্ট ব্যবহার করুন
   - নিরীক্ষা ট্রেইলের জন্য ফলাফল সংরক্ষণ করুন

2. **পরিবেশ-নির্দিষ্ট যাচাইকরণ**
   - dev/staging/prod জন্য পৃথক চেক
   - পরিবেশ অনুযায়ী উপযুক্ত নিরাপত্তা প্রয়োজনীয়তা
   - অ-প্রোডাকশন পরিবেশের জন্য খরচ অপ্টিমাইজেশন

3. **বিস্তৃত কাভারেজ**
   - প্রমাণীকরণ এবং অনুমতি
   - রিসোর্স কোটা এবং প্রাপ্যতা
   - টেমপ্লেট যাচাইকরণ এবং সিনট্যাক্স
   - নিরাপত্তা এবং সম্মতি প্রয়োজনীয়তা

4. **পরিষ্কার প্রতিবেদন**
   - রঙ-কোডেড স্ট্যাটাস নির্দেশক
   - বিস্তারিত ত্রুটি বার্তা এবং সমাধান পদক্ষেপ
   - দ্রুত মূল্যায়নের জন্য সারাংশ প্রতিবেদন

5. **দ্রুত ব্যর্থতা নিশ্চিত করুন**
   - গুরুত্বপূর্ণ চেক ব্যর্থ হলে ডিপ্লয়মেন্ট বন্ধ করুন
   - সমাধানের জন্য স্পষ্ট নির্দেশিকা প্রদান করুন
   - চেক পুনরায় চালানোর সুবিধা নিশ্চিত করুন

### সাধারণ প্রি-ফ্লাইট সমস্যা

1. **"দ্রুত" ডিপ্লয়মেন্টের জন্য যাচাইকরণ এড়ানো**
2. **অপর্যাপ্ত অনুমতি যাচাইকরণ ডিপ্লয়মেন্টের আগে**
3. **কোটা সীমা উপেক্ষা করা যতক্ষণ না ডিপ্লয়মেন্ট ব্যর্থ হয়**
4. **CI/CD পাইপলাইনে টেমপ্লেট যাচাইকরণ না করা**
5. **প্রোডাকশন পরিবেশের জন্য নিরাপত্তা যাচাইকরণ অনুপস্থিতি**
6. **অপর্যাপ্ত খরচ অনুমান বাজেট অপ্রত্যাশিত করে তোলে**

---

**পেশাদার টিপস**: প্রকৃত ডিপ্লয়মেন্ট জবের আগে আপনার CI/CD পাইপলাইনে একটি পৃথক জবে প্রি-ফ্লাইট চেক চালান। এতে সমস্যা দ্রুত ধরা পড়ে এবং ডেভেলপারদের দ্রুত প্রতিক্রিয়া প্রদান সম্ভব হয়।

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [SKU নির্বাচন](sku-selection.md)
- **পরবর্তী পাঠ**: [চিট শিট](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
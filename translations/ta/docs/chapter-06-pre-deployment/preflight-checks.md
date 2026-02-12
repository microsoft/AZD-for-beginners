# AZD வினியோகங்களுக்கு முன்-விமான சோதனைகள்

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 6 - முன்-வினியோகச் சோதனை மற்றும் திட்டமிடல்
- **⬅️ முந்தைய**: [SKU தேர்வு](sku-selection.md)
- **➡️ அடுத்த அத்தியாயம்**: [அத்தியாயம் 7: பிழைதிருத்தம்](../chapter-07-troubleshooting/common-issues.md)
- **🔧 தொடர்புடைய**: [அத்தியாயம் 4: வினியோக வழிகாட்டு](../chapter-04-infrastructure/deployment-guide.md)

## அறிமுகம்

இந்த விரிவான வழிகாட்டி, Azure Developer CLI வினியோகங்கள் தொடங்குவதற்கு முன் வெற்றிகரமாக நடைபெற உறுதி செய்ய முன்-வினியோகச் சோதனை ஸ்கிரிப்டுகள் மற்றும் செயல்முறைகளை வழங்குகிறது. அங்கீகாரம், வளக் கிடைக்கும் தன்மை, குறியீட்டு வரம்புகள், பாதுகாப்பு அமையுதல் மற்றும் செயல்திறன் தேவைகள் ஆகியவற்றுக்கு தானியங்கி சரிபார்ப்புகளை எவ்வாறு செயல்படுத்துவது என்று கற்று, வினியோக தோல்விகளை தவிர்த்து வெற்றிகரமான வினியோகங்களை அதிகரிக்கவும்.

## கற்றல் நோக்கங்கள்

இந்த வழிகாட்டியை முடித்தவுடன் நீங்கள்:
- தானியங்கி முன்-வினியோகச் சோதனை நுட்பங்கள் மற்றும் ஸ்கிரிப்டுகளைக் கையாளteren
- அங்கீகாரம், அனுமதிகள் மற்றும் குறியீட்டு வரம்புகளுக்கு விரிவான சரிபார்ப்பு தந்திரங்க்களை புரிந்துகொள்வீர்கள்
- வளக் கிடைக்கும் தன்மை மற்றும் கொள்ளளவு சரிபார்ப்பு செயல்முறைகளை செயல்படுத்துவீர்கள்
- நிறுவனக் கொள்கைகள் படி பாதுகாப்பு மற்றும் அமையுதல் சோதனைகளை கட்டமைப்பீர்கள்
- செலவியல் மதிப்பீடு மற்றும் பட்ஜெட் சரிபார்ப்பு வேலைப்பாடுகளை வடிவமைப்பீர்கள்
- CI/CD குழாய்களில் தனிப்பயன் முன்-விமானச் சோதனை தானியக்கங்களை உருவாக்குவீர்கள்

## கற்றல் விளைவுகள்

முடிவில், நீங்கள்:
- விரிவான முன்-விமானச் சோதனை ஸ்கிரிப்டுகளை உருவாக்கி இயக்க முடியும்
- வித்தியாசமான வினியோக السينாரெயோக்களுக்கு தானியங்கி சரிபார்ப்பு வேலைப்பாடுகளை வடிவமைக்க முடியும்
- சூழல்-சுட்டி சரிபார்ப்பு செயல்முறைகள் மற்றும் கொள்கைகளை செயல்படுத்த முடியும்
- வினியோக தயார்ச்சிக்கான முன்கணிப்பு மற்றும் எச்சரிக்கை அமைப்புகளை கட்டமைக்க முடியும்
- முன்-வினியோக பிரச்சினைகளை பிழைதிருத்தி சரிசெய்ய முடியும்
- முன்-விமானச் சோதனைகளை DevOps குழாய்கள் மற்றும் தானியக்க வேலைப்பாடுகளில் இணைக்க முடியும்

## உள்ளடக்க பட்டியல்

- [Overview](../../../../docs/chapter-06-pre-deployment)
- [Automated Pre-flight Script](../../../../docs/chapter-06-pre-deployment)
- [Manual Validation Checklist](../../../../docs/chapter-06-pre-deployment)
- [Environment Validation](../../../../docs/chapter-06-pre-deployment)
- [Resource Validation](../../../../docs/chapter-06-pre-deployment)
- [Security & Compliance Checks](../../../../docs/chapter-06-pre-deployment)
- [Performance & Capacity Planning](../../../../docs/chapter-06-pre-deployment)
- [Troubleshooting Common Issues](../../../../docs/chapter-06-pre-deployment)

---

## Overview

முன்-விமான சோதனைகள் என்பதன் நோக்கம் வினியோகத்திற்கு முன்னர் நடக்கும் அவசியமான சரிபார்ப்புகள்:

- **இலக்கு பிரதேசங்களில் உள்ள வளக் கிடைமையின்மையும் குறியீட்டு வரம்புகளும்**
- **அங்கீகாரம் மற்றும் அனுமதிகள்** சரியாக அமைக்கப்பட்டுள்ளன
- **அச்சு மாதிரியின் செல்லுபடைத்தன்மை** மற்றும் அளவுருக்களின் துல்லியம்
- **வரையறைத் தொடர்பு** மற்றும் சார்புகள்
- **நிறுவன கொள்கைகளுடன் ஏற்புடைய பாதுகாப்பு அமையுதல்**
- **பட்ஜெட்டுக்குள் செலவுக் கணக்கீடு**

### When to Run Pre-flight Checks

- **புது சூழலுக்கு** முதன் முறையாக வினியோகத்திற்கு முன்
- **முக்கியமான அச்சு மாதிரி மாற்றங்களுக்குப் பிறகு**
- **உற்பத்தி (production) வினியோகங்களுக்கு முன்**
- **Azure பிரதேசங்களை மாற்றும்போது**
- **CI/CD குழாய் பகுதியாக**

---

## Automated Pre-flight Script

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

# வெளியீட்டிற்கான வண்ண குறியீடு
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
    
    # AZD நிறுவலைச் சரிபார்
    try {
        $azdVersion = azd version --output json | ConvertFrom-Json
        Write-Status "AZD CLI installed" "Success" "Version: $($azdVersion.azd.version)"
    }
    catch {
        Write-Status "AZD CLI not found" "Error" "Install from https://aka.ms/azd-install"
        return $false
    }
    
    # Azure CLI நிறுவலைச் சரிபார்
    try {
        $azVersion = az version --output json | ConvertFrom-Json
        Write-Status "Azure CLI installed" "Success" "Version: $($azVersion.'azure-cli')"
    }
    catch {
        Write-Status "Azure CLI not found" "Error" "Install from https://aka.ms/azcli"
        return $false
    }
    
    # PowerShell பதிப்பைச் சரிபார்
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
        # AZD அங்கீகாரத்தைச் சரிபார்
        $azdAuth = azd auth login --check-status --output json 2>$null | ConvertFrom-Json
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
        }
        else {
            Write-Status "AZD authentication" "Error" "Run 'azd auth login'"
            return $false
        }
        
        # Azure CLI அங்கீகாரத்தைச் சரிபார்
        $azAccount = az account show --output json | ConvertFrom-Json
        Write-Status "Azure CLI authentication" "Success" "Subscription: $($azAccount.name)"
        
        # சப்ஸ்கிரிப்ஷன் அணுகலைச் சரிபார்
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
        # தற்போதைய பயனரின் பங்கு ஒதுக்கீடுகளைப் பெறுக
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
        
        # வள குழு உருவாக்கத்தை சோதிக்கவும் (குறிக்கப்பட்டிருந்தால்)
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # வள குழு உருவாக்கும் திறனை சோதிக்கவும்
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
        # கணினி (compute) வரம்புகளைச் சரிபார்
        $computeUsage = az vm list-usage --location $Location --output json | ConvertFrom-Json
        
        # குறிப்பிட்ட வரம்புகளைச் சரிபார்
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
        
        # App Service வரம்புகளைச் சரிபார்
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
        
        # சேமிப்பு கணக்கு வரம்புகளைச் சரிபார்
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
        return $true # தடையின்றி
    }
}

function Test-NetworkConnectivity {
    Write-Host "`n${Blue}=== Network Connectivity Check ===${Reset}"
    
    # Azure எண்ட்பாயின்ட்களைச் சோதிக்கவும்
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
    
    # DNS தீர்வை சோதிக்கவும்
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
    
    # azure.yaml உள்ளது என்பதைச் சரிபார்
    if (Test-Path "azure.yaml") {
        Write-Status "azure.yaml found" "Success"
        
        # azure.yaml ஐ பகுப்பாய்வு செய்க
        try {
            $azureYaml = Get-Content "azure.yaml" -Raw | ConvertFrom-Yaml
            Write-Status "azure.yaml parsing" "Success"
            
            # சேவைகள் செல்லுபடியாக உள்ளதா எனச் சரிபார்
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
    
    # இன்ஃப்ராஸ்ட்ரக்சர் கோப்புகள் உள்ளதா எனச் சரிபார்
    if (Test-Path "infra") {
        $bicepFiles = Get-ChildItem -Path "infra" -Filter "*.bicep" -Recurse
        if ($bicepFiles.Count -gt 0) {
            Write-Status "Infrastructure templates" "Success" "$($bicepFiles.Count) Bicep files found"
            
            # main.bicep உள்ளது என்றால் அதைச் சரிபார்க்கவும்
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
    
    # 🧪 புதியது: அடித்தள முன்னோட்டத்தைச் சோதிக்கவும் (பாதுகாப்பான ட்ரை-ரன்)
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
        # இடம் செல்லுபடியாக உள்ளதா எனச் சரிபார்
        $locations = az account list-locations --output json | ConvertFrom-Json
        $validLocation = $locations | Where-Object { $_.name -eq $Location -or $_.displayName -eq $Location }
        
        if ($validLocation) {
            Write-Status "Azure region" "Success" "Location '$Location' is valid"
        }
        else {
            Write-Status "Azure region" "Error" "Location '$Location' is not valid"
            return $false
        }
        
        # பிராந்தியத்தில் சேவை கிடைக்கிறதா எனச் சரிபார்
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
    
    # அடிப்படை செலவுக் கணக்கீடு (சரியான மதிப்புகளுக்கு Azure Pricing API தேவைப்படும்)
    Write-Status "Cost estimation" "Info" "Use Azure Pricing Calculator for detailed estimates"
    Write-Status "Monitoring setup" "Info" "Set up Azure Cost Management alerts"
    
    # பட்ஜெட் உள்ளதா என்பதைச் சரிபார்
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
    
    # பொதுவான பாதுகாப்பு நடைமுறைகள் உள்ளனவா எனச் சரிபார்
    try {
        # Key Vault அமைக்கப்பட்டுள்ளதா என்பதைச் சரிபார்
        if (Select-String -Path "infra/*.bicep" -Pattern "Microsoft.KeyVault" -Quiet) {
            Write-Status "Key Vault usage" "Success" "Key Vault detected in templates"
        }
        else {
            Write-Status "Key Vault usage" "Warning" "Consider using Key Vault for secrets"
        }
        
        # மேலாண்மை அடையாளம் பயன்படுத்தப்படுகிறதா என்பதைச் சரிபார்
        if (Select-String -Path "infra/*.bicep" -Pattern "managedIdentity|SystemAssigned" -Quiet) {
            Write-Status "Managed Identity" "Success" "Managed Identity detected"
        }
        else {
            Write-Status "Managed Identity" "Warning" "Consider using Managed Identity"
        }
        
        # HTTPS கட்டாயப்படுத்தப்பட்டுள்ளதா எனச் சரிபார்
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

# முக்கிய செயல்பாடு
function Invoke-PreflightCheck {
    Write-Host "${Green}AZD Pre-flight Check${Reset}" -ForegroundColor Green
    Write-Host "Environment: $EnvironmentName"
    Write-Host "Location: $Location"
    if ($ResourceGroup) { Write-Host "Resource Group: $ResourceGroup" }
    Write-Host "Time: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    Write-Host ""
    
    $allPassed = $true
    $results = @{}
    
    # எல்லா சோதனைகளையும் இயக்கவும்
    $results["Prerequisites"] = Test-Prerequisites
    $results["Authentication"] = Test-Authentication
    $results["Permissions"] = Test-Permissions
    $results["QuotasAndLimits"] = Test-QuotasAndLimits
    $results["NetworkConnectivity"] = Test-NetworkConnectivity
    $results["TemplateValidation"] = Test-TemplateValidation
    $results["RegionalAvailability"] = Test-RegionalAvailability
    $results["CostEstimation"] = Test-CostEstimation
    $results["SecurityCompliance"] = Test-SecurityCompliance
    
    # சுருக்கம்
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

# முன்-சோதனை (pre-flight) சரிபார்ப்பை இயக்கவும்
Invoke-PreflightCheck
```

### Bash Pre-flight Checker

```bash
#!/bin/bash
# யுனிக்ஸ்/லினக்ஸ் அமைப்புகளுக்கான முன்-சோதனை சரிபார்ப்புகளுக்கான Bash பதிப்பு

set -euo pipefail

# நிறக் குறியீடுகள்
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # நிறம் இல்லை

# உலகளாவிய மாறிலிகள்
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
    
    # AZD நிறுவல் சரிபார்க்கவும்
    if command -v azd >/dev/null 2>&1; then
        local azd_version=$(azd version --output json | jq -r '.azd.version')
        print_status "AZD CLI installed" "success" "Version: $azd_version"
    else
        print_status "AZD CLI not found" "error" "Install from https://aka.ms/azd-install"
        return 1
    fi
    
    # Azure CLI நிறுவல் சரிபார்க்கவும்
    if command -v az >/dev/null 2>&1; then
        local az_version=$(az version --output json | jq -r '."azure-cli"')
        print_status "Azure CLI installed" "success" "Version: $az_version"
    else
        print_status "Azure CLI not found" "error" "Install from https://aka.ms/azcli"
        return 1
    fi
    
    # jq நிறுவல் சரிபார்க்கவும்
    if command -v jq >/dev/null 2>&1; then
        print_status "jq installed" "success"
    else
        print_status "jq not found" "warning" "Install jq for better JSON parsing"
    fi
    
    return 0
}

check_authentication() {
    echo -e "\n${BLUE}=== Authentication Check ===${NC}"
    
    # AZD அங்கீகாரத்தைச் சரிபார்க்கவும்
    if azd auth login --check-status >/dev/null 2>&1; then
        local principal_name=$(azd auth login --check-status --output json 2>/dev/null | jq -r '.principalName // "Unknown"')
        print_status "AZD authentication" "success" "User: $principal_name"
    else
        print_status "AZD authentication" "error" "Run 'azd auth login'"
        return 1
    fi
    
    # Azure CLI அங்கீகாரத்தைச் சரிபார்க்கவும்
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
    
    # azure.yaml-ஐ சரிபார்க்கவும்
    if [[ -f "azure.yaml" ]]; then
        print_status "azure.yaml found" "success"
        
        # அடிப்படை YAML சரிபார்ப்பு
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
    
    # அடித்தளக் கோப்புகளைச் சரிபார்க்கவும்
    if [[ -d "infra" ]]; then
        local bicep_count=$(find infra -name "*.bicep" | wc -l)
        if [[ $bicep_count -gt 0 ]]; then
            print_status "Infrastructure templates" "success" "$bicep_count Bicep files found"
            
            # main.bicep இருந்தால் செல்லுபடுத்தவும்
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
    
    # இடம் செல்லுபடியாகிறதா என்று சரிபார்க்கவும்
    if az account list-locations --query "[?name=='$LOCATION' || displayName=='$LOCATION']" --output tsv | grep -q .; then
        print_status "Azure region" "success" "Location '$LOCATION' is valid"
    else
        print_status "Azure region" "error" "Location '$LOCATION' is not valid"
        return 1
    fi
    
    # சேவை கிடைப்பதைச் சரிபார்க்கவும்
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
    # கட்டளை வரி வாதங்களைப் பகுப்பாய்வு செய்யவும்
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
    
    # தேவையான அளவுருக்களைச் செல்லுபடுத்தவும்
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
    
    # சரிபார்ப்புகளை இயக்கவும்
    local all_passed=true
    
    check_prerequisites || all_passed=false
    check_authentication || all_passed=false
    check_template_validation || all_passed=false
    check_regional_availability || all_passed=false
    
    # சுருக்கம்
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

# முதன்மை செயல்பாட்டை இயக்கவும்
main "$@"
```

---

## Manual Validation Checklist

### Pre-Deployment Checklist

இந்த சோதனைப் பட்டியலை அச்சிடி, ஒவ்வொரு பொருளையும் வினியோகத்திற்கு முன் சரிபார்க்கவும்:

#### ✅ Environment Setup
- [ ] AZD CLI நிறுவப்பட்டு சமீபத்திய பதிப்பிற்கு புதுப்பிக்கப்பட்டது
- [ ] Azure CLI நிறுவப்பட்டு அங்கீகாரம் செய்யப்பட்டுள்ளது
- [ ] சரியான Azure subscription தேர்ந்தெடுக்கப்பட்டுள்ளது
- [ ] சுற்றுச்சூழல் பெயர் தனிச்சிறப்பாகவும் பெயரிடுதல் விதிகளை பின்பற்றுவதுமாக உள்ளது
- [ ] இலக்கு resource group அடையாளம் காணப்பட்டுள்ளதோ அல்லது உருவாக்கக்கூடியதோ ஆக உள்ளது

#### ✅ Authentication & Permissions
- [ ] `azd auth login` இல் வெற்றிகரமாக அங்கீகாரம் செய்யப்பட்டிருக்கிறீர்கள்
- [ ] பயனருக்கு இலக்கு subscription/resource group மீது Contributor பங்கு உள்ளது
- [ ] CI/CD க்கான service principal கட்டமைக்கப்பட்டிருக்கிறது (பொருந்துமானால்)
- [ ] காலாவதியாகி போன சான்றிதழ்கள் அல்லது அங்கீகாரத் தரவுகள் இல்லை

#### ✅ Template Validation
- [ ] `azure.yaml` உள்ளது மற்றும் செல்லுபடியாகும் YAML ஆக உள்ளது
- [ ] azure.yaml இல் வரையறுக்கப்பட்ட அனைத்து சேவைகளுக்கும் தொடர்புடைய மூலக் கோப்புகள் உள்ளன
- [ ] `infra/` அடைவில் Bicep templates உள்ளன
- [ ] `main.bicep` பிழைகள் இல்லாமல் ஆன்-கம்பைல் ஆகிறது (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 கட்டமைப்பு முன்னோட்டம் வெற்றிகரமாக இயங்குகிறது (`azd provision --preview`)
- [ ] தேவையான அனைத்து அளவுருக்களுக்கும் இயல்பான மதிப்புகள் உள்ளன அல்லது வழங்கப்பட உள்ளன
- [ ] டெம்ப்ளேட்களில் கடினமாக ஒட்டியுள்ள ரகசியங்கள் இல்லை

#### ✅ Resource Planning
- [ ] இலக்கு Azure பிரதேசம் தேர்ந்தெடுக்கப்பட்டு சரிபார்க்கப்பட்டுள்ளது
- [ ] இலக்கு பிரதேசத்தில் தேவையான Azure சேவைகள் கிடைக்கும்
- [ ] திட்டமிடப்பட்ட வளங்களுக்கு போதுமான குறியீட்டு வரம்புகள் உள்ளன
- [ ] வள பெயரிடப்படலில் மோதல்கள் சோதிக்கப்பட்டுள்ளன
- [ ] வளங்களிடையிலான சார்புகள் புரிந்துகொள்ளப்பட்டுள்ளன

#### ✅ Network & Security
- [ ] Azure முடிவுகளை நோக்கி நெட்வொர்க் இணைப்பு சரிபார்க்கப்பட்டுள்ளது
- [ ] தேவையானபடி firewall/proxy அமைப்புகள் கட்டமைக்கப்பட்டுள்ளன
- [ ] ரகசிய மேலாண்மைக்காக Key Vault கட்டமைக்கப்பட்டுள்ளது
- [ ] சாத்தியமான இடங்களில் நிர்வகிக்கப்பட்ட அடையாளங்கள் (managed identities) பயன்படுத்தப்படுகிறன
- [ ] வலை பயன்பாடுகளுக்கு HTTPS கட்டாயம் செய்துள்ளது

#### ✅ Cost Management
- [ ] Azure Pricing Calculator பயன்படுத்தி செலவு மதிப்பீடுகள் கணக்கிடப்பட்டுள்ளன
- [ ] தேவையானபடி பட்ஜெட் எச்சரிக்கை கணக்குகள் அமைக்கப்பட்டுள்ளன
- [ ] சூழல் வகைக்கேற்ற SKU-கள் தேர்ந்தெடுக்கப்பட்டுள்ளன
- [ ] உற்பத்தி பணிகளுக்காக முன்பதிவு திறன் (reserved capacity) பரிசீலிக்கப்பட்டுள்ளது

#### ✅ Monitoring & Observability
- [ ] Application Insights டெம்ப்ளேட்டுகளில் சேர்க்கப்பட்டுள்ளது
- [ ] Log Analytics workspace திட்டமிடப்பட்டுள்ளது
- [ ] முக்கிய அளவுகாறுகளுக்கான எச்சரிக்கை விதிகள் வரையறுக்கப்பட்டுள்ளன
- [ ] பயன்பாடுகளில் ஆரோக்கியச் சோதனை (health check) எண்ட்பாய்ண்டுகள் அமல்படுத்தப்பட்டுள்ளன

#### ✅ Backup & Recovery
- [ ] தரவுப் வளங்களுக்கு காப்புப்பிரதி (backup) நெறிமுறை வரையறுக்கப்பட்டுள்ளது
- [ ] மீட்பு நேர நோக்கங்கள் (RTO) பதிவாக உள்ளன
- [ ] மீட்பு பாயிண்ட் நோக்கங்கள் (RPO) பதிவாக உள்ளன
- [ ] உற்பத்திக்கான பேரருவ மீட்டெடுக்கும் திட்டம் (disaster recovery) உள்ளதா என உறுதி

---

## Environment Validation

### Development Environment Validation

```bash
#!/bin/bash
# மேம்பாட்டு சூழலுக்கான குறிப்பிட்ட சரிபார்ப்புகள்

validate_dev_environment() {
    echo "=== Development Environment Validation ==="
    
    # மேம்பாட்டிற்கு உகந்த கட்டமைப்புகளை சரிபார்க்கவும்
    if grep -q "sku.*Free\|sku.*F1\|sku.*Basic" infra/*.bicep; then
        echo "✓ Development-appropriate SKUs detected"
    else
        echo "⚠ Consider using lower-cost SKUs for development"
    fi
    
    # தானியக்க அணைப்பு அமைப்புகளை சரிபார்க்கவும்
    if grep -q "autoShutdown\|deallocate" infra/*.bicep; then
        echo "✓ Auto-shutdown configuration found"
    else
        echo "ℹ Consider adding auto-shutdown for cost savings"
    fi
    
    # மேம்பாட்டு தரவுத்தள அமைப்புகளை சரிபார்க்கவும்
    if grep -q "Basic\|S0\|S1" infra/*.bicep; then
        echo "✓ Development database tiers configured"
    else
        echo "⚠ Consider using Basic/Standard tiers for development databases"
    fi
}
```

### Production Environment Validation

```bash
#!/bin/bash
# உற்பத்தி சூழலுக்கான குறிப்பிட்ட சரிபார்ப்புகள்

validate_prod_environment() {
    echo "=== Production Environment Validation ==="
    
    # உயர்கிடைக்கும் தன்மை கொண்ட கட்டமைப்புகளைச் சரிபார்க்கவும்
    if grep -q "zoneRedundant.*true\|Premium\|Standard_GRS" infra/*.bicep; then
        echo "✓ High availability configurations detected"
    else
        echo "⚠ Consider enabling high availability for production"
    fi
    
    # காப்பு கட்டமைப்புகளைச் சரிபார்க்கவும்
    if grep -q "backup\|retention\|pointInTimeRestore" infra/*.bicep; then
        echo "✓ Backup configurations found"
    else
        echo "⚠ Ensure backup strategies are implemented"
    fi
    
    # மேற்பார்வை அமைப்பைச் சரிபார்க்கவும்
    if grep -q "Microsoft.Insights\|Application_Type.*web" infra/*.bicep; then
        echo "✓ Monitoring and observability configured"
    else
        echo "⚠ Add comprehensive monitoring for production"
    fi
    
    # பாதுகாப்பு கட்டமைப்புகளைச் சரிபார்க்கவும்
    if grep -q "Microsoft.KeyVault\|managedIdentity\|httpsOnly.*true" infra/*.bicep; then
        echo "✓ Security best practices implemented"
    else
        echo "⚠ Review security configurations for production"
    fi
}
```

---

## Resource Validation

### Quota Validation Script

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
    
    # சப்ஸ்கிரிப்ஷனில் உள்ள சேமிப்பு கணக்குகளைப் பெறவும்
    accounts = run_command(['az', 'storage', 'account', 'list'])
    
    if accounts is None:
        print("❌ Could not retrieve storage account information")
        return False
    
    account_count = len(accounts)
    max_accounts = 250  # Azure இன் இயல்புநிலை வரம்பு
    
    usage_percent = (account_count / max_accounts) * 100
    status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
    
    print(f"{status} Storage Accounts: {account_count}/{max_accounts} ({usage_percent:.1f}%)")
    
    return usage_percent < 95

def check_network_limits(location: str) -> bool:
    """Check network-related limits"""
    print(f"\n=== Network Limits Check ({location}) ===")
    
    # மெய்நிகர் நெட்வொர்க்குகளை சரிபார்க்கவும்
    vnets = run_command(['az', 'network', 'vnet', 'list'])
    if vnets is not None:
        vnet_count = len(vnets)
        print(f"✅ Virtual Networks: {vnet_count}/1000")
    
    # பொது IP முகவரிகளை சரிபார்க்கவும்
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
    
    # சரிபார்ப்புகளை இயக்கவும்
    all_passed &= check_compute_quotas(location)
    all_passed &= check_storage_limits(location)
    all_passed &= check_network_limits(location)
    
    # சுருக்கம்
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

## Security & Compliance Checks

### Security Validation Script

```bash
#!/bin/bash
# AZD டெப்ளாய்மெண்டுகளுக்கான பாதுகாப்பு மற்றும் இணக்கத்தன்மை சரிபார்ப்பு

check_security_practices() {
    echo "=== Security Best Practices Check ==="
    
    local issues_found=0
    
    # Key Vault பயன்பாடு உள்ளதா என்பதை சரிபார்
    if grep -r "Microsoft.KeyVault" infra/ >/dev/null 2>&1; then
        echo "✅ Key Vault detected in infrastructure"
    else
        echo "⚠️  Key Vault not found - consider using for secrets management"
        ((issues_found++))
    fi
    
    # Managed identity பயன்பாடு உள்ளதா என்பதை சரிபார்
    if grep -r "managedIdentity\|SystemAssigned\|UserAssigned" infra/ >/dev/null 2>&1; then
        echo "✅ Managed Identity configuration detected"
    else
        echo "⚠️  Managed Identity not found - consider using for service authentication"
        ((issues_found++))
    fi
    
    # HTTPS கட்டாயப்படுத்தல் உள்ளதா என்பதை சரிபார்
    if grep -r "httpsOnly.*true\|requireHttps.*true" infra/ >/dev/null 2>&1; then
        echo "✅ HTTPS enforcement detected"
    else
        echo "⚠️  HTTPS enforcement not found - ensure secure connections"
        ((issues_found++))
    fi
    
    # குறைந்தபட்ச TLS பதிப்பு இருப்பதா என்பதை சரிபார்
    if grep -r "minimumTlsVersion.*'TLS1_2'" infra/ >/dev/null 2>&1; then
        echo "✅ Minimum TLS 1.2 configuration detected"
    else
        echo "⚠️  Minimum TLS version not specified - consider requiring TLS 1.2+"
        ((issues_found++))
    fi
    
    # பொது அணுகல் வரம்புகள் உள்ளதா என்பதை சரிபார்
    if grep -r "allowBlobPublicAccess.*false\|publicNetworkAccess.*Disabled" infra/ >/dev/null 2>&1; then
        echo "✅ Public access restrictions detected"
    else
        echo "⚠️  Public access restrictions not found - consider limiting public access"
        ((issues_found++))
    fi
    
    # நெட்வொர்க் பாதுகாப்பு குழுக்களை சரிபார்
    if grep -r "Microsoft.Network/networkSecurityGroups" infra/ >/dev/null 2>&1; then
        echo "✅ Network Security Groups detected"
    else
        echo "ℹ️  Network Security Groups not found - may be acceptable depending on architecture"
    fi
    
    return $issues_found
}

check_compliance_requirements() {
    echo -e "\n=== Compliance Requirements Check ==="
    
    # தரவு எन्क்ரிப்ஷன் உள்ளதா என்பதை சரிபார்
    if grep -r "encryption\|encryptionAtRest\|transparentDataEncryption" infra/ >/dev/null 2>&1; then
        echo "✅ Encryption configurations detected"
    else
        echo "⚠️  Encryption configurations not found - ensure data is encrypted"
    fi
    
    # ஆடிட் பதிவு உள்ளதா என்பதை சரிபார்
    if grep -r "Microsoft.Insights.*auditingSettings\|diagnosticSettings" infra/ >/dev/null 2>&1; then
        echo "✅ Audit logging configurations detected"
    else
        echo "⚠️  Audit logging not found - consider enabling for compliance"
    fi
    
    # காப்புப் பிரதிகள் மற்றும் தக்கவைத்தல் கொள்கைகள் உள்ளதா என்பதை சரிபார்
    if grep -r "backup.*Policy\|retentionPolicy\|retention.*Days" infra/ >/dev/null 2>&1; then
        echo "✅ Backup and retention policies detected"
    else
        echo "⚠️  Backup/retention policies not found - required for data governance"
    fi
}

# முக்கிய செயல்பாடு
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

## Integration with CI/CD

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

## சிறந்த நடைமுறைகள் சுருக்கம்

### ✅ முன்-விமானச் சோதனை சிறந்த நடைமுறைகள்

1. **சாத்தியமான இடங்களில் தானியக்கமாக்கவும்**
   - சோதனைகளை CI/CD குழாய்களில் இணைக்கவும்
   - மீண்டும் பயன்படுத்தக்கூடிய சரிபார்ப்புக்காக ஸ்கிரிப்டுகளை பயன்படுத்தவும்
   - கணக்கெடுப்பு பாதைகளுக்காக முடிவுகளை சேமிக்கவும்

2. **சூழல்-சூழலால் தனியாக சரிபார்ப்பு**
   - dev/staging/prod ஆகியவற்றுக்கு வெவ்வேறு சோதனைகள்
   - சூழல் ஒவ்வொன்றிற்கும் ஏற்ற பாதுகாப்பு தேவைகள்
   - production அல்லாத சூழல்களுக்கு செலவுக் குறைத்தல்

3. **விரிவான கவரேஜ்**
   - அங்கீகாரம் மற்றும் அனுமதிகள்
   - வள குறியீட்டு வரம்புகள் மற்றும் கிடைமையின்மை
   - டெம்ப்ளேட் செல்லுபடித்தன்மை மற்றும் சொற்றுணர்ச்சி
   - பாதுகாப்பு மற்றும் அமையுதல் தேவைகள்

4. **தெளிவான அறிக்கை**
   - வண்ண-குறியிடப்பட்ட நிலை சொல்லிகள்
   - தீர்வு படிகளுடன் விரிவான பிழை செய்திகள்
   - விரைந்த மதிப்பீட்டிற்கு சுருக்க அறிக்கைகள்

5. **விரைந்து தோல்வி அடையவும் (Fail Fast)**
   - முக்கிய சோதனைகள் தோல்வியளித்தால் வினியோகத்தை நிறுத்தவும்
   - தீர்விற்கான தெளிவான வழிகாட்டுதலை வழங்கவும்
   - சோதனைகளை எளிதில் மீண்டும் இயக்க வசதியை உள் நுழையச் செய்யவும்

### பொதுவான முன்-விமான பிழைகள்

1. "விரைவு" வினியோகங்களுக்கு சரிபார்ப்பை தள்ளிப் போடுதல்
2. வினியோகத்திற்கு முன்னர் போதுமான அனுமதிகள் சரிபார்க்கப்படாமை
3. நிலைமை தோல்வியடையும் வரை குறியீட்டு வரம்புகளை கவனிக்காமல் இருப்பது
4. CI/CD குழாய்களில் டெம்ப்ளேட்டுகளை சரிபார்க்காதது
5. உற்பத்தி சூழலுக்கு பாதுகாப்பு சரிபார்ப்பை தவறவிடுதல்
6. போதிய செலவு மதிப்பீடு இல்லாததால் பட்ஜெட் அதிர்ச்சிகள்

---

**Pro Tip**: உண்மையான வினியோக வேலைக்கு முன் உங்கள் CI/CD குழாயில் முன்-விமான சோதனைகளை தனித்த வேலைவாய்ப்பாக இயக்கவும். இது பிழைகளை முதலில் பிடிக்க உதவுகிறது மற்றும் டெவலப்பர்களுக்கு அதிவிரைவான கருத்துகளைக் கொடுக்கின்றது.

---

**Navigation**
- **Previous Lesson**: [SKU தேர்வு](sku-selection.md)
- **Next Lesson**: [Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு குறிப்பு:
இந்த ஆவணம் செயற்கை நுண்ணறிவு மொழிபெயர்ப்பு சேவை Co-op Translator (https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்கு முயற்சி செய்தாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை தயவுசெய்து கவனத்தில் கொள்ளுங்கள். ஆவணத்தின் மூல மொழியில் உள்ள பதிப்பே அதிகாரபூர்வமான மூலமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழிற்முறை மனித மொழிபெயர்ப்பை பரிந்துரைக்கிறோம். இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதனால் ஏற்படும் எந்தவொரு தவறான புரிதலுக்கும் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பேற்க மாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
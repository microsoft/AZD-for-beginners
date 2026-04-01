# AZD ஒப்படைப்புகளுக்கான முன்-பரிசோதனைகள்

**அத்தியாய வழிசெலுத்தல்:**
- **📚 Course Home**: [ஆரம்பத்திற்கான AZD](../../README.md)
- **📖 Current Chapter**: அத்தியாயம் 6 - முன்-ஒப்படைப்பு சரிபார்ப்பு மற்றும் திட்டமிடல்
- **⬅️ Previous**: [SKU தேர்வு](sku-selection.md)
- **➡️ Next Chapter**: [அத்தியாயம் 7: பிழைத் தீர்வு](../chapter-07-troubleshooting/common-issues.md)
- **🔧 Related**: [அத்தியாயம் 4: ஒப்படைப்பு வழிகாட்டி](../chapter-04-infrastructure/deployment-guide.md)

## அறிமுகம்

இந்த விரிவான வழிகாட்டி துவங்குமுன் Azure Developer CLI ஒப்படைப்புகள் வெற்றியடைய உறுதி செய்ய முன்-ஒப்படைப்பு சரிபார்ப்பு ஸ்கிரிப்டுகள் மற்றும் நடைமுறைகளை வழங்குகிறது. அங்கீகாரம், வளங்கள் கிடைக்கும் நிலை, ஒதுக்கீடுகள், பாதுகாப்பு இணக்கம் மற்றும் செயல்திறன் தேவைகளுக்கான தானியக்க சோதனைகளை செயல்படுத்துவது மூலம் ஒப்படைப்பு தோல்விகளைத் தடுக்கும் மற்றும் ஒப்படைப்பு வெற்றியைக் உயர்த்த கற்றுக்கொள்ளுங்கள்.

## கற்றல் இலக்குகள்

By completing this guide, you will:
- தானியக்கமான முன்-ஒப்படைப்பு சரிபார்ப்பு நுட்பங்கள் மற்றும் ஸ்கிரிப்ட்களில் திறமை பெற்றிடுங்கள்
- அங்கீகாரம், அனுமதிகள் மற்றும் ஒதுக்கீடுகளுக்கான விரிவான சோதனை ஸ்ட்ராட்டஜிகளை புரிந்துகொள்ளுங்கள்
- வளங்களின் கிடைக்குமை மற்றும் திறன் சரிபார்ப்பு நடைமுறைகளை செயல்படுத்துங்கள்
- நிறுவனக் கொள்கைகளுக்கான பாதுகாப்பு மற்றும் இணக்கம் சோதனைகளை கட்டமைக்கவும்
- செலவு மதிப்பீடு மற்றும் பட்ஜெட் சரிபார்ப்பு வேலைப்பாடுகளை வடிவமைக்கவும்
- CI/CD குழாய்வழிகளில் தனிப்பயன் முன்-பரிசோதனை தானியக்கங்களை உருவாக்கவும்

## கற்றல் முடிவுகள்

Upon completion, you will be able to:
- முழுமையான முன்-பரிசோதனை சரிபார்ப்பு ஸ்கிரிப்ட்களை உருவாக்கி இயக்க முடியும்
- வெவ்வேறு ஒப்படைப்பு சூழ்நிலைகளுக்கான தானியக்க சோதனை வேலைப்பாடுகளை வடிவமைக்க முடியும்
- சூழல்-சார்ந்த சரிபார்ப்பு நடைமுறைகள் மற்றும் கொள்கைகளை செயல்படுத்த முடியும்
- ஒப்படைப்பு தயார் நிலைக்கான முன்நிலை கண்காணிப்பு மற்றும் அறிவிப்புகளை கட்டமைக்க முடியும்
- முன்னர்-ஒப்படைப்பு பிரச்சனைகளை கண்டறிந்து திருத்த நடவடிக்கைகளை செயல்படுத்த முடியும்
- DevOps குழாய்வழிகள் மற்றும் தானியக்க வேலைப்பாடுகளில் முன்-பரிசோதனைகளை ஒருங்கிணைக்க முடியும்

## உள்ளடக்க அட்டவணை

- [கண்ணோட்டம்](#overview)
- [தானியக்க முன்-பரிசோதனை ஸ்கிரிப்ட்](#automated-pre-flight-script)
- [கைமுறை சரிபார்ப்பு பட்டியல்](#codeblock1)
- [சூழல் சரிபார்ப்பு](#✅-காப்பு-மற்றும்-மீட்பு)
- [வள சரிபார்ப்பு](#production-environment-validation)
- [பாதுகாப்பு மற்றும் இணக்கம் சோதனைகள்](#security--compliance-checks)
- [செயல்திறன் மற்றும் திறன் திட்டமிடல்](#performance--capacity-planning)
- [பொதுவான பிரச்சனைகள் தீர்வு](#troubleshooting-common-issues)

---

## Overview

Pre-flight checks are essential validations performed before deploying to ensure:

- **வள கிடைப்புத்தன்மை** மற்றும் இலக்கு பகுதிகளில் உள்ள ஒதுக்கீடுகள்
- **அங்கீகாரம் மற்றும் அனுமதிகள்** சரியாக அமைக்கப்பட்டுள்ளன
- **டெம்ப்ளேட் செல்லுபடித்தன்மை** மற்றும் அளவுருக்கள் சரியானவை
- **நெட்வொர்க் இணைப்பு** மற்றும் சார்புகள்
- **பாதுகாப்பு இணக்கம்** நிறுவனக் கொள்கைகளுடன்
- **செலவு மதிப்பீடு** பட்ஜெட் வரம்புகளுக்குள்

### When to Run Pre-flight Checks

- **புதிய சூழலில் முதன் முறையாக ஒப்படைப்பு செய்வதற்கு முன்**
- **முக்கிய டெம்ப்ளேட் மாற்றங்களுக்குப் பிறகு**
- **உற்பத்தி ஒப்படைப்புகளுக்கு முன்**
- **Azure பிரிவுகளை மாற்றும் பொழுதில்**
- **CI/CD குழாய்வழிகளின் ஒரு பகுதியாக**

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

# வெளியீட்டுக்கான நிறக் குறியீடு
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
    
    # AZD நிறுவலை சரிபார்க்கவும்
    try {
        $azdVersion = azd version --output json | ConvertFrom-Json
        Write-Status "AZD CLI installed" "Success" "Version: $($azdVersion.azd.version)"
    }
    catch {
        Write-Status "AZD CLI not found" "Error" "Install from https://aka.ms/azd-install"
        return $false
    }
    
    # Azure CLI நிறுவலை சரிபார்க்கவும்
    try {
        $azVersion = az version --output json | ConvertFrom-Json
        Write-Status "Azure CLI installed" "Success" "Version: $($azVersion.'azure-cli')"
    }
    catch {
        Write-Status "Azure CLI not found" "Error" "Install from https://aka.ms/azcli"
        return $false
    }
    
    # PowerShell பதிப்பு சரிபார்க்கவும்
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
        # AZD அங்கீகாரத்தை சரிபார்க்கவும்
        $azdAuth = azd auth login --check-status --output json 2>$null | ConvertFrom-Json
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
        }
        else {
            Write-Status "AZD authentication" "Error" "Run 'azd auth login'"
            return $false
        }
        
        # Azure CLI அங்கீகாரத்தை சரிபார்க்கவும்
        $azAccount = az account show --output json | ConvertFrom-Json
        Write-Status "Azure CLI authentication" "Success" "Subscription: $($azAccount.name)"
        
        # சப்ஸ்கிரிப்ஷன் அணுகலை சரிபார்க்கவும்
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
        # தற்போதைய பயனரின் பங்கு ஒதுக்கீடுகளைப் பெறவும்
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
        
        # ரிசோர்ஸ் குழு உருவாக்கத்தை (குறிப்பிக்கப்பட்டால்) சோதிக்கவும்
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # ரிசோர்ஸ் குழுவை உருவாக்கும் திறன் சோதிக்கவும்
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
        # Compute ஒதுக்கீடு வரம்புகளைச் சரிபார்க்கவும்
        $computeUsage = az vm list-usage --location $Location --output json | ConvertFrom-Json
        
        # குறிப்பிட்ட ஒதுக்கீடுகளைச் சரிபார்க்கவும்
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
        
        # App Service வரம்புகளைச் சரிபார்க்கவும்
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
        
        # சேமிப்பு கணக்கு வரம்புகளைச் சரிபார்க்கவும்
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
        return $true # தடை இல்லாத
    }
}

function Test-NetworkConnectivity {
    Write-Host "`n${Blue}=== Network Connectivity Check ===${Reset}"
    
    # Azure endpoint-களை சோதிக்கவும்
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
    
    # DNS தீர்மானத்தை சோதிக்கவும்
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
    
    # azure.yaml உள்ளது என்பதை சரிபார்க்கவும்
    if (Test-Path "azure.yaml") {
        Write-Status "azure.yaml found" "Success"
        
        # azure.yaml ஐ பகுப்பாய்வு செய்யவும்
        try {
            $azureYaml = Get-Content "azure.yaml" -Raw | ConvertFrom-Yaml
            Write-Status "azure.yaml parsing" "Success"
            
            # சேவைகளை சரிபார்க்கவும்
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
    
    # அடித்தளக் கோப்புகளைச் சரிபார்க்கவும்
    if (Test-Path "infra") {
        $bicepFiles = Get-ChildItem -Path "infra" -Filter "*.bicep" -Recurse
        if ($bicepFiles.Count -gt 0) {
            Write-Status "Infrastructure templates" "Success" "$($bicepFiles.Count) Bicep files found"
            
            # main.bicep இருந்தால் அதை சரிபார்க்கவும்
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
    
    # 🧪 புதிய: அடித்தள முன்னோட்டத்தை (பாதுகாப்பான டிரை-ரன்) சோதிக்கவும்
    try {
        Write-Status "Infrastructure preview test" "Info" "Running safe dry-run validation..."
        $previewResult = azd provision --preview 2>$null
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
        # இலோக்கேஷன் செல்லுபடியாகுமா எனச் சரிபார்க்கவும்
        $locations = az account list-locations --output json | ConvertFrom-Json
        $validLocation = $locations | Where-Object { $_.name -eq $Location -or $_.displayName -eq $Location }
        
        if ($validLocation) {
            Write-Status "Azure region" "Success" "Location '$Location' is valid"
        }
        else {
            Write-Status "Azure region" "Error" "Location '$Location' is not valid"
            return $false
        }
        
        # மண்டலத்தில் சேவை கிடைப்பைச் சரிபார்க்கவும்
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
    
    # அடிப்படை செலவு மதிப்பீடு (துல்லியமான கணிப்புகளுக்கு Azure Pricing API தேவை)
    Write-Status "Cost estimation" "Info" "Use Azure Pricing Calculator for detailed estimates"
    Write-Status "Monitoring setup" "Info" "Set up Azure Cost Management alerts"
    
    # பட்ஜெட் உள்ளது என்பதை சரிபார்க்கவும்
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
    
    # பொதுவான பாதுகாப்பு நடைமுறைகளைக் சரிபார்க்கவும்
    try {
        # Key Vault அமைக்கப்பட்டுள்ளதா என்பதைச் சரிபார்க்கவும்
        if (Select-String -Path "infra/*.bicep" -Pattern "Microsoft.KeyVault" -Quiet) {
            Write-Status "Key Vault usage" "Success" "Key Vault detected in templates"
        }
        else {
            Write-Status "Key Vault usage" "Warning" "Consider using Key Vault for secrets"
        }
        
        # Managed Identity பயன்பாடு உள்ளதா என்பதைச் சரிபார்க்கவும்
        if (Select-String -Path "infra/*.bicep" -Pattern "managedIdentity|SystemAssigned" -Quiet) {
            Write-Status "Managed Identity" "Success" "Managed Identity detected"
        }
        else {
            Write-Status "Managed Identity" "Warning" "Consider using Managed Identity"
        }
        
        # HTTPS கட்டாயப்படுத்தல் உண்டா என்பதைச் சரிபார்க்கவும்
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

# முதன்மை இயக்கம்
function Invoke-PreflightCheck {
    Write-Host "${Green}AZD Pre-flight Check${Reset}" -ForegroundColor Green
    Write-Host "Environment: $EnvironmentName"
    Write-Host "Location: $Location"
    if ($ResourceGroup) { Write-Host "Resource Group: $ResourceGroup" }
    Write-Host "Time: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    Write-Host ""
    
    $allPassed = $true
    $results = @{}
    
    # அனைத்து சோதனைகளையும் இயக்கவும்
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

# முன்-பரிசோதனை சோதனையை இயக்கவும்
Invoke-PreflightCheck
```

### Bash Pre-flight Checker

```bash
#!/bin/bash
# Unix/Linux அமைப்புகளுக்கான முன்-சோதனைகளுக்கான Bash பதிப்பு

set -euo pipefail

# நிறக் குறியீடுகள்
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # நிறம் இல்லை

# உலகளாவிய மாறிகள்
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
    
    # AZD நிறுவலைச் சரிபார்க்கவும்
    if command -v azd >/dev/null 2>&1; then
        local azd_version=$(azd version --output json | jq -r '.azd.version')
        print_status "AZD CLI installed" "success" "Version: $azd_version"
    else
        print_status "AZD CLI not found" "error" "Install from https://aka.ms/azd-install"
        return 1
    fi
    
    # Azure CLI நிறுவலைச் சரிபார்க்கவும்
    if command -v az >/dev/null 2>&1; then
        local az_version=$(az version --output json | jq -r '."azure-cli"')
        print_status "Azure CLI installed" "success" "Version: $az_version"
    else
        print_status "Azure CLI not found" "error" "Install from https://aka.ms/azcli"
        return 1
    fi
    
    # jq நிறுவலைச் சரிபார்க்கவும்
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
    
    # azure.yaml ஐச் சரிபார்க்கவும்
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
    
    # அடித்தள அமைப்பு கோப்புகளைச் சரிபார்க்கவும்
    if [[ -d "infra" ]]; then
        local bicep_count=$(find infra -name "*.bicep" | wc -l)
        if [[ $bicep_count -gt 0 ]]; then
            print_status "Infrastructure templates" "success" "$bicep_count Bicep files found"
            
            # main.bicep இருந்தால் சரிபார்க்கவும்
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
    
    # இருப்பிடம் செல்லுபடியாகிறதா என்பதைச் சரிபார்க்கவும்
    if az account list-locations --query "[?name=='$LOCATION' || displayName=='$LOCATION']" --output tsv | grep -q .; then
        print_status "Azure region" "success" "Location '$LOCATION' is valid"
    else
        print_status "Azure region" "error" "Location '$LOCATION' is not valid"
        return 1
    fi
    
    # சேவையின் கிடைக்கும் நிலையைச் சரிபார்க்கவும்
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
    # கட்டளை வரி வாதங்களைப் பகுப்பாய்வு செய்க
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
    
    # தேவையான அளவுருக்களைச் சரிபார்க்கவும்
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
    
    # சோதனைகளை இயக்கவும்
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

# முக்கிய செயல்பாட்டை இயக்கவும்
main "$@"
```

---

## Manual Validation Checklist

### Pre-Deployment Checklist

Print this checklist and verify each item before deployment:

#### ✅ சூழல் அமைப்பு
- [ ] AZD CLI நிறுவப்பட்டு சமீபத்திய பதிப்பிற்கு புதுப்பிக்கப்பட்டுள்ளது
- [ ] Azure CLI நிறுவப்பட்டு அங்கீகரிக்கப்பட்டது
- [ ] சரியான Azure சப்ஸ்கிரிப்ஷன் தேர்ந்தெடுக்கப்பட்டது
- [ ] சூழல் பெயர் தனித்துவமானதும் பெயரிடுதலின் வழிகாட்டுதலின்படி இருக்க வேண்டும்
- [ ] இலக்கு வள குழு அடையாளம் காணப்பட்டது அல்லது உருவாக்க முடியும்

#### ✅ அங்கீகாரம் மற்றும் அனுமதிகள்
- [ ] `azd auth login` மூலம் வெற்றிகரமாக அங்கீகரிக்கப்பட்டது
- [ ] பயனர் இலக்கு சப்ஸ்கிரிப்ஷனில்/வள குழுவில் Contributor பாத்திரம் கொண்டிருக்கிறார்
- [ ] CI/CD க்காக Service principal அமைக்கப்பட்டிருக்கிறது (பொறுத்தவரை)
- [ ] காலாவதியான சான்றிதழ்கள் அல்லது அளவுரு அங்கீகாரங்கள் இல்லை

#### ✅ டெம்ப்ளேட் சரிபார்ப்பு
- [ ] `azure.yaml` உள்ளது மற்றும் செல்லுபடியாகும் YAML ஆகும்
- [ ] `azure.yaml` இல் வரையப்பட்ட அனைத்து சேவைகளுக்கும் தொடர்புடைய மூலக் குறியீடு உள்ளது
- [ ] `infra/` அடைவை உள்ள Bicep டெம்ப்ளேட்கள் உள்ளன
- [ ] `main.bicep` பிழைகள் இல்லாமல் தொகுக்கப்படுகிறது (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 Infrastructure முன்னோட்டம் வெற்றிகரமாக இயக்கப்படுகிறது (`azd provision --preview`)
- [ ] தேவையான அனைத்து அளவுருக்களுக்கும் இயல்புநிலை மதிப்புகள் உள்ளன அல்லது வழங்கப்படுவதாக இருக்கின்றன
- [ ] டெம்ப்ளேட்டுகளில் கடினமாக ஏற்றப்பட்ட ரகசியங்கள் இல்லை

#### ✅ வள திட்டமிடல்
- [ ] இலக்கு Azure பிரதேசம் தேர்ந்தெடுக்கப்பட்டு சரிபார்க்கப்பட்டது
- [ ] இலக்கு பிரதேசத்தில் தேவையான Azure சேவைகள் கிடைக்கின்றன
- [ ] திட்டமிடப்பட்ட வளங்களுக்கு போதுமான ஒதுக்கீடுகள் உள்ளன
- [ ] வள பெயரிடல் மோதல்கள் சரிபார்க்கப்பட்டன
- [ ] வளங்களுக்கிடையிலான சார்புகள் புரிந்துகொள்ளப்பட்டன

#### ✅ நெட்வொர்க் மற்றும் பாதுகாப்பு
- [ ] Azure எண்ட்பாயிண்ட்களுடன் நெட்வொர்க் இணைப்பு சரிபார்க்கப்பட்டது
- [ ] தேவையானால் ஃபைர்வால்/ப்ராக்ஸி அமைப்புகள் கட்டமைக்கப்பட்டுள்ளன
- [ ] ரகசிய மேலாண்மைக்காக Key Vault அமைக்கப்பட்டுள்ளது
- [ ] சாத்தியமான இடங்களில் Managed identities பயன்படுத்தப்பட்டுள்ளன
- [ ] வலை பயன்பாடுகளுக்கு HTTPS கட்டாயப்படுத்தல் இயல்பூட்டப்பட்டுள்ளது

#### ✅ செலவு மேலாண்மை
- [ ] செலவு மதிப்பீடுகள் Azure Pricing Calculator பயன்படுத்தி கணக்கிடப்பட்டன
- [ ] தேவையானால் பட்ஜெட் எச்சரிக்கைகள் கட்டமைக்கப்பட்டுள்ளன
- [ ] சூழல் வகைக்கு ஏற்ற SKUs தேர்ந்தெடுக்கப்பட்டுள்ளன
- [ ] உற்பத்தி பணிகளுக்காக ஒதுக்கி வைக்கப்பட்ட திறன் பரிசீலிக்கப்பட்டது

#### ✅ கண்காணிப்பு மற்றும் கண்டறிதல்
- [ ] டெம்ப்ளேட்டுகளில் Application Insights கட்டமைக்கப்பட்டுள்ளது
- [ ] Log Analytics workspace திட்டமிடப்பட்டுள்ளது
- [ ] முக்கிய அளவுகோல்களுக்கு எச்சரிக்கை விதிகள் வரையறுக்கப்பட்டுள்ளன
- [ ] செயலிகளில் Health check endpoints செயல்படுத்தப்பட்டுள்ளன

#### ✅ காப்பு மற்றும் மீட்பு
- [ ] தரவுப் வளங்களுக்கான காப்பு திட்டம் வரையறுக்கப்பட்டுள்ளது
- [ ] மீட்பு நேர நோக்கங்கள் (RTO) ஆவணப்படுத்தப்பட்டுள்ளன
- [ ] மீட்பு புள்ளி நோக்கங்கள் (RPO) ஆவணப்படுத்தப்பட்டுள்ளன
- [ ] உற்பத்திக்கான பேரழிவு மீட்பு திட்டம் இருக்கும்

---

## Environment Validation

### Development Environment Validation

```bash
#!/bin/bash
# வளர்ச்சி சுற்றுச்சூழலுக்கு தனித்துவமான சரிபார்ப்புகள்

validate_dev_environment() {
    echo "=== Development Environment Validation ==="
    
    # வளர்ச்சிக்கு உகந்த கட்டமைப்புகள் உள்ளதா எனச் சரிபார்க்கவும்
    if grep -q "sku.*Free\|sku.*F1\|sku.*Basic" infra/*.bicep; then
        echo "✓ Development-appropriate SKUs detected"
    else
        echo "⚠ Consider using lower-cost SKUs for development"
    fi
    
    # தானாக மூடப்படும் கட்டமைப்புகள் உள்ளதா எனச் சரிபார்க்கவும்
    if grep -q "autoShutdown\|deallocate" infra/*.bicep; then
        echo "✓ Auto-shutdown configuration found"
    else
        echo "ℹ Consider adding auto-shutdown for cost savings"
    fi
    
    # வளர்ச்சி தரவுத்தள கட்டமைப்புகளைச் சரிபார்க்கவும்
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
# உற்பத்தி சூழலுக்கு குறிப்பிட்ட சரிபார்ப்புகள்

validate_prod_environment() {
    echo "=== Production Environment Validation ==="
    
    # உயர் கிடைப்புத்தன்மை கட்டமைப்புகளை சரிபார்க்கவும்
    if grep -q "zoneRedundant.*true\|Premium\|Standard_GRS" infra/*.bicep; then
        echo "✓ High availability configurations detected"
    else
        echo "⚠ Consider enabling high availability for production"
    fi
    
    # காப்பு கட்டமைப்புகளை சரிபார்க்கவும்
    if grep -q "backup\|retention\|pointInTimeRestore" infra/*.bicep; then
        echo "✓ Backup configurations found"
    else
        echo "⚠ Ensure backup strategies are implemented"
    fi
    
    # மேற்பார்வை அமைப்பை சரிபார்க்கவும்
    if grep -q "Microsoft.Insights\|Application_Type.*web" infra/*.bicep; then
        echo "✓ Monitoring and observability configured"
    else
        echo "⚠ Add comprehensive monitoring for production"
    fi
    
    # பாதுகாப்பு கட்டமைப்புகளை சரிபார்க்கவும்
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
    
    # சப்ஸ்கிரிப்ஷனில் சேமிப்பு கணக்குகளை பெறுக
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
    
    # மெய்நிகர் நெட்வொர்க்குகளைச் சரிபார்க்கவும்
    vnets = run_command(['az', 'network', 'vnet', 'list'])
    if vnets is not None:
        vnet_count = len(vnets)
        print(f"✅ Virtual Networks: {vnet_count}/1000")
    
    # பொதுப் IP முகவரிகளைச் சரிபார்க்கவும்
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
# AZD வினியோகங்களுக்கு பாதுகாப்பு மற்றும் இணக்கச் சரிபார்ப்பு

check_security_practices() {
    echo "=== Security Best Practices Check ==="
    
    local issues_found=0
    
    # Key Vault பயன்பாட்டை சரிபாரிக்கவும்
    if grep -r "Microsoft.KeyVault" infra/ >/dev/null 2>&1; then
        echo "✅ Key Vault detected in infrastructure"
    else
        echo "⚠️  Key Vault not found - consider using for secrets management"
        ((issues_found++))
    fi
    
    # Managed identity பயன்பாட்டை சரிபாரிக்கவும்
    if grep -r "managedIdentity\|SystemAssigned\|UserAssigned" infra/ >/dev/null 2>&1; then
        echo "✅ Managed Identity configuration detected"
    else
        echo "⚠️  Managed Identity not found - consider using for service authentication"
        ((issues_found++))
    fi
    
    # HTTPS அமல்படுத்தலை சரிபாரிக்கவும்
    if grep -r "httpsOnly.*true\|requireHttps.*true" infra/ >/dev/null 2>&1; then
        echo "✅ HTTPS enforcement detected"
    else
        echo "⚠️  HTTPS enforcement not found - ensure secure connections"
        ((issues_found++))
    fi
    
    # குறைந்தபட்ச TLS பதிப்பைச் சரிபாரிக்கவும்
    if grep -r "minimumTlsVersion.*'TLS1_2'" infra/ >/dev/null 2>&1; then
        echo "✅ Minimum TLS 1.2 configuration detected"
    else
        echo "⚠️  Minimum TLS version not specified - consider requiring TLS 1.2+"
        ((issues_found++))
    fi
    
    # பொதுமுக அணுகல் வரம்புகளைச் சரிபாரிக்கவும்
    if grep -r "allowBlobPublicAccess.*false\|publicNetworkAccess.*Disabled" infra/ >/dev/null 2>&1; then
        echo "✅ Public access restrictions detected"
    else
        echo "⚠️  Public access restrictions not found - consider limiting public access"
        ((issues_found++))
    fi
    
    # நெட்வொர்க் பாதுகாப்பு குழுக்களைச் சரிபாரிக்கவும்
    if grep -r "Microsoft.Network/networkSecurityGroups" infra/ >/dev/null 2>&1; then
        echo "✅ Network Security Groups detected"
    else
        echo "ℹ️  Network Security Groups not found - may be acceptable depending on architecture"
    fi
    
    return $issues_found
}

check_compliance_requirements() {
    echo -e "\n=== Compliance Requirements Check ==="
    
    # தரவு குறியாக்கத்தைச் சரிபாரிக்கவும்
    if grep -r "encryption\|encryptionAtRest\|transparentDataEncryption" infra/ >/dev/null 2>&1; then
        echo "✅ Encryption configurations detected"
    else
        echo "⚠️  Encryption configurations not found - ensure data is encrypted"
    fi
    
    # ஆடிட் பதிவு அமைப்பைச் சரிபாரிக்கவும்
    if grep -r "Microsoft.Insights.*auditingSettings\|diagnosticSettings" infra/ >/dev/null 2>&1; then
        echo "✅ Audit logging configurations detected"
    else
        echo "⚠️  Audit logging not found - consider enabling for compliance"
    fi
    
    # காப்பு மற்றும் காப்பாற்றல் கொள்கைகளைச் சரிபாரிக்கவும்
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

## Best Practices Summary

### ✅ முன்-பரிசோதனை சிறந்த நடைமுறைகள்

1. **சாத்தியம் உள்ள இடங்களில் தானியக்கப்படுத்துங்கள்**
   - சோதனைகளை CI/CD குழாய்களில் இணைக்கவும்
   - மறு-மீண்டும் செய்யக்கூடிய சரிபார்ப்புகளுக்கு ஸ்கிரிப்ட்களை பயன்படுத்தவும்
   - ஆடிட் தடங்களை varten முடிவுகளை சேமிக்கவும்

2. **சூழல்-சார்ந்த சரிபார்ப்பு**
   - dev/staging/prod சூழல்களுக்கு வெவ்வேறு சோதனைகள்
   - ஒவ்வொரு சூழலுக்கும் பொருத்தமான பாதுகாப்பு தேவைகள்
   - உற்பத்தி அல்லாத சூழல்களுக்கு செலவு சிறப்பித்தல்

3. **முழுமையான பரிசோதனை**
   - அங்கீகாரம் மற்றும் அனுமதிகள்
   - வள ஒதுக்கீடுகள் மற்றும் கிடைப்புத்தன்மை
   - டெம்ப்ளேட் சரிபார்ப்பு மற்றும் உரை வடிவம் (syntax)
   - பாதுகாப்பு மற்றும் இணக்கம் தேவைகள்

4. **தெளிவான அறிக்கைகள்**
   - நிறமுறைப்பட்ட நிலைக் குறியீடுகள்
   - தீர்வு படிகளுடன் கூடிய விரிவான பிழை செய்திகள்
   - விரைவான மதிப்பீட்டிற்கான சுருக்க அறிக்கைகள்

5. **விரைவில் தோல்வி**
   - முக்கிய சோதனைகள் தோல்வியடைந்தால் ஒப்படைப்பை நிறுத்தவும்
   - தீர்வுக்கான தெளிவான வழிகாட்டுதலை வழங்கவும்
   - சோதனைகளை எளிதில் மீண்டும் இயக்கும் வசதியை இயக்கு

### பொதுவான முன்-பரிசோதனை தவறுகள்

1. "விரைவான" ஒப்படைப்புகளுக்கு சரிபார்ப்பை தவிர்த்தல்
2. ஒப்படைப்பு முந்தைய போதுமான அனுமதிகள் சரிபார்க்கப்படாமை
3. ஒதுக்கீடு வரம்புகளை புறக்கணித்தல் வரை ஒப்படைப்பு தோல்வியடையும்போது
4. CI/CD குழாய்களில் டெம்ப்ளேட்களை சரிபார்க்காமை
5. உற்பத்தி சூழல்களுக்கு பாதுகாப்பு சரிபார்ப்பை தவறவிடுதல்
6. போதுமானமற்ற செலவு மதிப்பீடு பட்ஜெட் அதிர்ச்சிகளை உண்டாக்கும்

---

**சிறந்த ஆலோசனை**: உண்மையான ஒப்படைப்பு வேலைக்கு முன்பு உங்கள் CI/CD குழாயில் முன்-பரிசோதனைகளை தனித்த வேலைவாக இயக்குங்கள். இது பிரச்சனைகளை முன்கூட்டியே கண்டறிய உதவுகிறது மற்றும் டெவலப்பர்களுக்கு வேகமான பின்னூட்டத்தை வழங்குகிறது.

---

**வழிசெலுத்தல்**
- **முந்தைய பாடம்**: [SKU தேர்வு](sku-selection.md)
- **அடுத்த பாடம்**: [சுருக்க குறிப்புகள்](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு அறிவிப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையான [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயன்றாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை தயவுசெய்து கருத்தில் கொள்ளவும். மூல ஆவணம் அதன் சொந்த மொழியிலேயே அதிகாரபூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்தவொரு தவறான புரிதலுக்கோ அல்லது தவறான விளக்கங்களுக்கோ நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
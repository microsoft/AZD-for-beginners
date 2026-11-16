# AZD ನಿಯೋಜನೆಗಳಿಗಾಗಿ ಪೂರ್ವ-ಯಾನ ತಪಾಸಣೆಗಳು

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [ಪ್ರಾರಂಭಿಕರಿಗಾಗಿ AZD](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 6 - ಪೂರ್ವ-ನಿಯೋಜನೆ ಪರಿಶೀಲನೆ ಮತ್ತು ಯೋಜನೆ
- **⬅️ ಹಿಂದಿನದ್ದು**: [SKU ಆಯ್ಕೆ](sku-selection.md)
- **➡️ ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 7: ತೊಂದರೆ ನಿರ್ಗಮನ](../chapter-07-troubleshooting/common-issues.md)
- **🔧 ಸಂಬಂಧಿಸಿದದ್ದು**: [ಅಧ್ಯಾಯ 4: ನಿಯೋಜನೆ ಮಾರ್ಗದರ್ಶಿ](../chapter-04-infrastructure/deployment-guide.md)

## ಪರಿಚಯ

ಈ ಸಮಗ್ರ ಮಾರ್ಗದರ್ಶಿ ಯಶಸ್ವಿಯಾದ ಅಜೂರ್ ಡೆವಲಪರ್ CLI ನಿಯೋಜನೆಗಳಿಗೆ ಪೂರ್ವ-ನಿಯೋಜನೆ ಪರಿಶೀಲನೆ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು ಮತ್ತು ಪ್ರಕ್ರಿಯೆಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ. ಪ್ರಾಮಾಣೀಕರಣ, ಸಂಪನ್ಮೂಲ ಲಭ್ಯತೆ, ಹಂಚಿಕೆಗಳು, ಭದ್ರತಾ ಅನುಗುಣತೆ ಮತ್ತು ಕಾರ್ಯಕ್ಷಮತೆ ಅವಶ್ಯಕತೆಗಳಿಗೆ ಸ್ವয়ಂಚಾಲಿತ ತಪಾಸಣೆಗಳನ್ನು ಜಾರಿ ಮಾಡಿ ನಿಯೋಜನೆ ವೈಫಲ್ಯಗಳನ್ನು ತಡೆದು, ಯಶಸ್ಸಿನ ದರಗಳನ್ನು ಗುರಿಯಾಗಿಸುವುದನ್ನು ಕಲಿಯಿರಿ.

## ಕಲಿಕೆಯ ಗುರಿಗಳು

ಈ ಮಾರ್ಗದರ್ಶಿಯನ್ನು ಪೂರ್ಣಗೊಳಿಸುವ ಮೂಲಕ ನೀವು:
- ಸ್ವಯಂಚಾಲಿತ ಪೂರ್ವ-ನಿಯೋಜನೆ ಪರಿಶೀಲನೆ ತಂತ್ರಗಳು ಮತ್ತು ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳನ್ನು ಆಳವಾಗಿ ನಿರ್ವಹಿಸುವಿರಿ
- ಪ್ರಾಮಾಣೀಕರಣ, ಅನುಮತಿಗಳು ಮತ್ತು ಹಂಚಿಕೆಗಳ ಸಮಗ್ರ ಪರಿಶೀಲನೆ ತಂತ್ರಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವಿರಿ
- ಸಂಪನ್ಮೂಲ ಲಭ್ಯತೆ ಮತ್ತು ಸಾಮರ್ಥ್ಯ ಪರಿಶೀಲನೆ ಪ್ರಕ್ರಿಯೆಗಳನ್ನು ಜಾರಿ ಮಾಡುವಿರಿ
- ಸಂಘಟನೆಯ ನೀತಿಗಳಿಗೆ ಭದ್ರತಾ ಮತ್ತು ಅನುಗುಣತೆ ತಪಾಸಣೆಗಳನ್ನು ಹೊಂದಿಸುವಿರಿ
- ವೆಚ್ಚ ಅಂದಾಜು ಮತ್ತು ಬಜೆಟ್ ಪರಿಶೀಲನೆ ಕಾರ್ಯಪ್ರವಾಹಗಳನ್ನು ವಿನ್ಯಾಸಗೊಳಿಸುವಿರಿ
- CI/CD ಪೈಪ್‌ಲೈನ್‌ಗಳಿಗೆ ಕಸ್ಟಮ್ ಪೂರ್ವ-ಯಾನ ತಪಾಸಣೆ ಸ್ವಯಂಕರಣವನ್ನು ಸೃಷ್ಟಿಸುವಿರಿ

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ, ನೀವು:
- ಸಮಗ್ರ ಪೂರ್ವ-ಯಾನ ಪರಿಶೀಲನೆ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳನ್ನು ನಿರ್ಮಿಸಿ ಕಾರ್ಯಗತಗೊಳಿಸುವಿರಿ
- ವಿವಿಧ ನಿಯೋಜನೆ ಪರಿಸ್ಥಿತಿಗಳಿಗೆ ಸ್ವಯಂಚಾಲಿತ ತಪಾಸಣೆ ಕಾರ್ಯಪ್ರವಾಹಗಳನ್ನು ವಿನ್ಯಾಸಗೊಳಿಸುವಿರಿ
- ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ಪರಿಶೀಲನೆ ಪ್ರಕ್ರಿಯೆ ಮತ್ತು ನೀತಿಗಳನ್ನು ಜಾರಿ ಮಾಡಿಕೊಳ್ಳುವಿರಿ
- ನಿಯೋಜನೆ ಸಿದ್ಧತೆಯ ಪ್ರಗತಿಗಾಗಿ ಪ್ರೊಎಕ್ಟಿವ್ ನಿಗಾ ಮತ್ತು ಜಾಗೃತಿ ಹೊಂದಿಸುವಿರಿ
- ಪೂರ್ವ-ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳನ್ನು ಪರಿಹರಿಸಿ ಸರಿಪಡಿಸುವ ಕ್ರಮಗಳನ್ನು ಜಾರಿ ಮಾಡಿಕೊಳ್ಳುವಿರಿ
- ಪೂರ್ವ-ಯಾನ ತಪಾಸಣೆಗಳನ್ನು ಡೆವ್ಓಪ್ಸ್ ಪೈಪ್‌ಲೈನ್ ಮತ್ತು ಸ್ವಯಂಕರಣ ಕಾರ್ಯಪ್ರವಾಹಗಳೊಂದಿಗೆ ಸಂಯೋಜಿಸುವಿರಿ

## ಅಧ್ಯಾಯ ಪಟ್ಟಿಯ

- [ಸಾರಾಂಶ](#overview)
- [ಸ್ವಯಂಚಾಲಿತ ಪೂರ್ವ-ಯಾನ ಸ್ಕ್ರಿಪ್ಟ್](#automated-pre-flight-script)
- [ಹಸ್ತಚಾಲಿತ ಪರಿಶೀಲನೆ ಪಟ್ಟಿ](#manual-validation-checklist)
- [ಪರಿಸರ ಪರಿಶೀಲನೆ](#environment-validation)
- [ಸಂಪನ್ಮೂಲ ಪರಿಶೀಲನೆ](#resource-validation)
- [ಭದ್ರತೆ ಮತ್ತು ಅನುಗುಣತೆ ತಪಾಸಣೆಗಳು](#security--compliance-checks)
- [ಕಾರ್ಯಕ್ಷಮತೆ ಮತ್ತು ಸಾಮರ್ಥ್ಯ ಸಂಚಿಕೆ](capacity-planning.md)
- [ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳ troubleshooting](../chapter-07-troubleshooting/common-issues.md)

---

## ಸಾರಾಂಶ

ಪೂರ್ವ-ಯಾನ ತಪಾಸಣೆಗಳು ಯಶಸ್ವಿಯಾಗಿ ನಿಯೋಜಿಸಲು ಅಗತ್ಯವಿರುವ ಪರಿಶೀಲನೆಗಳಾಗಿವೆ:

- **ಲಕ್ಷ್ಯ ಪ್ರದೇಶಗಳಲ್ಲಿನ ಸಂಪನ್ಮೂಲ ಲಭ್ಯತೆ** ಮತ್ತು ಹಂಚಿಕೆಗಳು
- **ಪ್ರಾಮಾಣೀಕರಣ ಮತ್ತು ಅನುಮತಿಗಳು** ಸರಿಯಾಗಿ ಸಂರಚಿಸಲಾಗಿವೆ
- **ಟೆಂಪ್ಲೇಟಿನ वैಧತೆ** ಮತ್ತು ಪರಿಮಾಣಗಳ ಶುದ್ಧತೆ
- **ನೆಟ್‌ವರ್ಕ್ ಸಂಪರ್ಕ** ಮತ್ತು ಅವಲಂಬನೆಗಳು
- **ಸಂಸ್ಥೆಯ ನೀತಿಗಳೊಂದಿಗೆ ಭದ್ರತಾ ಅನುಗುಣತೆ**
- **ಬಜೆಟ್ ಮಿತಿಗಳೊಳಗಿನ ವೆಚ್ಚ ಅಂದಾಜು**

### ಯಾವಾಗ ಪೂರ್ವ-ಯಾನ ತಪಾಸಣೆಗಳು ನಡೆಯಬೇಕು

- **ಹೊಸ ಪರಿಸರವಿರಿಸಿದ ಮೊದಲ ನಿಯೋಜನೆಯ ಮುನ್ನ**
- **ಗಂಭೀರ ಟೆಂಪ್ಲೇಟ್ ಬದಲಾವಣೆಗಳ ನಂತರ**
- **ಉತ್ಪಾದನಾ ನಿಯೋಜನೆಗಳ ಮುನ್ನ**
- **ಅಜೂರ್ ಪ್ರದೇಶಗಳನ್ನು ಬದಲಿಸುವಾಗ**
- **CI/CD ಪೈಪ್‌ಲೈನ್‌ಗಳ ಭಾಗವಾಗಿ**

---

## ಸ್ವಯಂಚಾಲಿತ ಪೂರ್ವ-ಯಾನ ಸ್ಕ್ರಿಪ್ಟ್

> **ವ್ಯಾಪ್ತಿಗೂ ಮುಂಭಾಗದ ಅಗತ್ಯಗಳು:** ಇವು ನಿಮ್ಮ ಸ್ವಂತ ಪ್ರಾಜೆಕ್ಟ್‌ನಲ್ಲಿ ಉಳಿಸುವ ಪ್ರಾರಂಭದ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳಾಗಿದ್ದು, ಈ ಅಧ್ಯಾಯದವರಿಂದ ಒದಗಿಸಲಾದ ಸ್ಥಳೀಯ ಫೈಲ್‌ಗಳು ಅಲ್ಲ. ಪವರ್‌ಶೆಲ್ ಆವೃತ್ತಿಗೆ PowerShell **7.3+** (ನೆಟಿವ್ ಕಮಾಂಡ್ ದೋಷ ಪ್ರಸರಣ) ಮತ್ತು `powershell-yaml` ಮೊ듉ಲ್ ಅಗತ್ಯವಿದೆ `ConvertFrom-Yaml` ಗಾಗಿ. ಬ್ಯಾಶ್ ಆವೃತ್ತಿಗೆ Bash, `jq`, ಪೈಥಾನ್ 3.10+, ಮತ್ತು PyYAML ಅಗತ್ಯ. ಎರಡೂ ಅಜೂರ್ CLI, azd, ಮತ್ತು ಸಕ್ರೀಯ Bicep ಪ್ರಾಜೆಕ್ಟ್ ಅಗತ್ಯ. ಇವು ನಿಯೋಜನೆ ಸಿದ್ಧತೆಯ ಪುರಾವೆ ಅಲ್ಲ, ಸಂಶೋಧನೆಗಳಾಗಿವೆ. `azd provision --preview` ಮುಂಚೆ ಟೆಂಪ್ಲೇಟ್ ಹೂಕ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ; ಹೂಕ್‌ಗಳು ಯಾವುದೇ ಪ್ರಾಜೆಕ್ಟ್ ಕಮಾಂಡ್‌ಗಳನ್ನು ನಿರ್ವಹಿಸಬಹುದು.

### PowerShell ಪೂರ್ವ-ಯಾನ ತಪಾಸಕ

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

### ಬ್ಯಾಶ್ ಪೂರ್ವ-ಯಾನ ತಪಾಸಕ

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

## ಹಸ್ತಚಾಲಿತ ಪರಿಶೀಲನೆ ಪಟ್ಟಿ

### ಪೂರ್ವ-ನಿಯೋಜನೆ ಪರಿಶೀಲನೆ ಪಟ್ಟಿ

ಈ ಪರಿಶೀಲನಾ ಪಟ್ಟಿಯನ್ನು ಮುದ್ರಿಸಿ ಮತ್ತು ನಿಯೋಜನೆಯ ಮೊದಲು ಪ್ರತಿಯೊಂದು ಐಟಂ ಪರಿಶೀಲಿಸಿ:

#### ✅ ಪರಿಸರ ಸಜ್ಜುಗೊಳಿಸುವಿಕೆ
- [ ] AZD CLI ಸ್ಥಾಪಿಸಲಾಗಿದೆ ಮತ್ತು ಇತ್ತೀಚಿನ ಆವೃತ್ತಿಗೆ ನವೀಕರಿಸಲಾಗಿದೆ
- [ ] ಅಜೂರ್ CLI ಸ್ಥಾಪಿಸಿದ್ದು ಮತ್ತು ಪ್ರಾಮಾಣೀಕರಿಸಲಾಗಿದೆ
- [ ] ಸರಿಯಾದ ಅಜೂರ್ ಸಬ್ಸ್ಕ್ರಿಪ್ಶನ್ ಆಯ್ಕೆಮಾಡಲಾಗಿದೆ
- [ ] ಪರಿಸರದ ಹೆಸರು ವಿಶಿಷ್ಟವಾಗಿದ್ದು ಹೆಸರಿಸುವ ನಿಯಮಗಳನ್ನು ಅನುಸರಿಸುತ್ತದೆ
- [ ] ಗುರಿ ಸಂಪನ್ಮೂಲ ಗುಂಪು ಗುರುತಿಸಲ್ಪಟ್ಟಿದೆ ಅಥವಾ ಸೃಷ್ಟಿಸಬಹುದು

#### ✅ ಪ್ರಾಮಾಣೀಕರಣ ಮತ್ತು ಅನುಮತಿಗಳು
- [ ] ಯಶಸ್ವಿಯಾಗಿ `azd auth login` ಮೂಲಕ ಪ್ರಾಮಾಣೀಕರಿಸಲಾಗಿದೆ
- [ ] ಬಳಕೆದಾರರಿಗೆ ಗುರಿ ಸಬ್ಸ್ಕ್ರಿಪ್ಶನ್/ಸಂಪನ್ಮೂಲ ಗುಂಪಿನ ಮೇಲೆ ಕೊಡುಗೆದಾರರ ಪಾತ್ರ ಇದೆ
- [ ] ಟೆಂಪ್ಲೇಟುಗಳು ಪಾತ್ರ ಹಂಚಿಕೆಯನ್ನು ಸೃಷ್ಟಿಸಿದರೆ, ನಿಯೋಜಿಸುವ ಗುರುತು ಕೂಡ ಪಾತ್ರ ಹಂಚಿಕೆ ಅನುಮತಿಗಳನ್ನು ಹೊಂದಿರಬೇಕು (ಕೊಡುಗೆದಾರರ ತಾನು ಮಾತ್ರ ಈ ಅನುಮತಿಯನ್ನು ನೀಡುವುದಿಲ್ಲ)
- [ ] CI/CD ಗಾಗಿ ಸೇವಾ ಪ್ರಾಂಶಿಪಲ್ ಸಂರಚಿಸಲಾಗಿದೆ (ಅನ್ವಯಿಸಿದರೆ)
- [ ] ಅವಧಿ ಮುಗಿದ ಪ್ರಮಾಣಪತ್ರಗಳು ಅಥವಾ ರಹಸ್ಯಗಳು ಇಲ್ಲ

#### ✅ ಟೆಂಪ್ಲೇಟ್ ಪರಿಶೀಲನೆ
- [ ] `azure.yaml` ಅಸ್ತಿತ್ವದಲ್ಲಿದ್ದು ಮಾನ್ಯ YAML ಆಗಿದೆ
- [ ] azure.yaml ನಲ್ಲಿ ವ್ಯಾಖ್ಯಾನಿಸಿದ ಎಲ್ಲಾ ಸೇವೆಗಳು ಅನುಗುಣವಾಗಿರುವ ಮೂಲ ಕೋಡ್ ಹೊಂದಿವೆ
- [ ] `infra/` ಡೈರೆಕ್ಟರಿಯಲ್ಲಿನ Bicep ಟೆಂಪ್ಲೇಟುಗಳು ಲಭ್ಯವಿವೆ
- [ ] `main.bicep` ದೋಷಗಳಿಲ್ಲದೆ ಸಂಕಲನಗೊಳ್ಳುತ್ತದೆ (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 ಸಂಸ್ಥಾಪನಾ ಪೂರ್ವನೋಟ ಯಶಸ್ವಿಯಾಗಿ ಚಾಲನೆಗೊಳ್ಳುತ್ತದೆ (`azd provision --preview`)
- [ ] ಎಲ್ಲಾ ಅಗತ್ಯವಾದ ಪರಿಮಾಣಗಳಿಗೆ ಡಿಫಾಲ್ಟ್ ಮೌಲ್ಯಗಳಿವೆ ಅಥವಾ ಮತ್ತು ಪೂರೈಸಲಿದ್ದೇವೆ
- [ ] ಟೆಂಪ್ಲೇಟ್‌ಗಳಲ್ಲಿ ಯಾವುದೇ ಹಾರ್ಡ್‌ಕೋಡಿರಾದ ರಹಸ್ಯಗಳಿಲ್ಲ

#### ✅ ಸಂಪನ್ಮೂಲ ಯೋಜನೆ
- [ ] ಗುರಿ ಅಜೂರ್ ಪ್ರದೇಶವನ್ನು ಆಯ್ಕೆಮಾಡಿ ಪರಿಶೀಲಿಸಲಾಗಿದೆ
- [ ] ಗುರಿ ಪ್ರದೇಶದಲ್ಲಿ ಅಗತ್ಯವಾದ ಅಜೂರ್ ಸೇವೆಗಳು ಲಭ್ಯವಿವೆ
- [ ] ಯೋಜಿತ ಸಂಪನ್ಮೂಲಗಳಿಗೆ ಸಾಕಷ್ಟು ಹಂಚಿಕೆ ಲಭ್ಯವಿದೆ
- [ ] ಸಂಪನ್ಮೂಲ ಹೆಸರಿನ ಸಂಘರ್ಷಗಳನ್ನು ಪರಿಶೀಲಿಸಲಾಗಿದೆ
- [ ] ಸಂಪನ್ಮೂಲಗಳ ನಡುವಿನ ಅವಲಂಬನೆಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಲಾಗಿದೆ

#### ✅ ನೆಟ್‌ವರ್ಕ್ ಮತ್ತು ಭದ್ರತೆ
- [ ] ಅಜೂರ್ ಅಂತಿಮಬಿಂದುಗಳಿಗೆ ನೆಟ್‌ವರ್ಕ್ ಸಂಪರ್ಕ ಪರಿಶೀಲಿಸಲಾಗಿದೆ
- [ ] ಅಗತ್ಯವಿದ್ದರೆ ಫೈರ್‌ವಾಲ್/ಪ್ರಾಕ್ಸಿ ಸೆಟ್ಟಿಂಗ್ಸ್ ಸಂರಚಿತವಾಗಿದೆ
- [ ] ಸೀಕ್ರೆಟ್ ನಿರ್ವಹಣೆಗೆ ಕೀ ವಾಲ್ಟ್ ಸಂರಚಿತವಾಗಿದೆ
- [ ] ಸಾಧ್ಯವಾದಲ್ಲಿ ನಿರ್ವಹಿತ ಗುರುತುಗಳು ಬಳಸಲ್ಪಟ್ಟಿವೆ
- [ ] ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್ಗಳಿಗೆ HTTPS ಜೋರಾಗಿ ಜಾರಿಗೊಳಿಸಲಾಗಿದೆ

#### ✅ ವೆಚ್ಚ ನಿರ್ವಹಣೆ
- [ ] ಅಜೂರ್ ಪ್ರೈಸಿಂಗ್ ಕ್ಯಾಲ್ಕ್ಯುಲೇಟರ್ ಬಳಸಿ ವೆಚ್ಚ ಅಂದಾಜು ಲೆಕ್ಕಿಸಲಾಗಿದೆ
- [ ] ಅಗತ್ಯವಿದ್ದರೆ ಬಜೆಟ್ ಎಚ್ಚರಿಕೆಗಳನ್ನು ಸಂರಚಿಸಲಾಗಿದೆ
- [ ] ಪರಿಸರ ಪ್ರಕಾರದ ಅನುಗುಣ SKUs ಆಯ್ಕೆಮಾಡಲಾಗಿದೆ
- [ ] ಉತ್ಪಾದನಾ ಕಾರ್ಯಭಾರಗಳಿಗೆ ಮೀسಿಟ್ಟಿರಿಸಲಾಗಿದೆ ಸಾಮರ್ಥ್ಯ ಪರಿಗಣಿಸಲಾಗಿದೆ

#### ✅ ನಿಗವಾರಿಕೆ ಮತ್ತು ದೃಶ್ಯೀಕರಣ
- [ ] ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್ ಟೆಂಪ್ಲೇಟುಗಳಲ್ಲಿ ಸಂರಚಿಸಲಾಗಿದೆ
- [ ] ಲಾಗ್ ಅನಾಲಿಟಿಕ್ಸ್ ವರ್ಕ್‌ಸ್ಪೇಸ್ ಯೋಜಿಸಲಾಗಿದೆ
- [ ] ಪ್ರಮುಖ ಮೆಟ್ರಿಕ್‌ಗಳಿಗೆ ಎಚ್ಚರಿಕೆ ನಿಯಮಗಳು ವ್ಯಾಖ್ಯಾನಿಸಲ್ಪಟ್ಟಿವೆ
- [ ] ಅಪ್ಲಿಕೇಶನ್‌ಗಳಲ್ಲಿ ಆರೋಗ್ಯ ಪರಿಶೀಲನೆ ಅಂತಿಮಬಿಂದುಗಳು ಅಳವಡಿಸಲಾಗಿದೆ

#### ✅ ಬ್ಯಾಕಪ್ ಮತ್ತು ರಿಕವರಿ
- [ ] ಡೇಟಾ ಸಂಪನ್ಮೂಲಗಳಿಗಾಗಿ ಬ್ಯಾಕಪ್ ತಂತ್ರಜ್ಞಾನದ ವ್ಯಾಖ್ಯಾನ
- [ ] ಪೂನರುತ್ಪಾದನಾ ಸಮಯ ಗುರಿಗಳು (RTO) ದಾಖಲಿಸಲಾಗಿದೆ
- [ ] ಪುನರ್ ಬಿಂದುವಿನ ಗುರಿಗಳು (RPO) ದಾಖಲಿಸಲಾಗಿದೆ
- [ ] ಉತ್ಪಾದನೆಗಾಗಿ ವಿಪತ್ತು ಪುನರುದ್ದಾರ ಯೋಜನೆ ಇದೆ

---

## ಪರಿಸರ ಪರಿಶೀಲನೆ

ಕೆಳಗಿನ `grep` ತಪಾಸಣೆಗಳು ಉದಾಹರಣಾತ್ಮಕ ಸ್ಮರಣೆಗಳಾಗಿವೆ. ಹೊಂದಾಣಿಕೆಯ ಪದವು ಸರಿಯಾದ ಸಂಪನ್ಮೂಲಕ್ಕಾಗಿ ವೈಶಿಷ್ಟ್ಯವನ್ನು ಸಂರಚಿಸಿರುವುದಕ್ಕೆ ಸಾಬೀತು ಕೊಡದು, ಮತ್ತು ಕೊರತೆಯ ಪದವು ಅದರ ಅಭಾವವನ್ನು ಸಾಬೀತು ಮಾಡದು (ಮೊ듉ಲ್‌ಗಳು/ಡೀಫಾಲ್ಟ್‌ಗಳು ಅದನ್ನು ಒದಗಿಸಬಹುದು). ಇವುಗಳನ್ನು ಉತ್ಪನ್ನ ಅನುಗುಣತೆಯ ಗೇಟುಗಳಾಗಿ ಬಳಸದಿರಿ.

### ಅಭಿವೃದ್ಧಿ ಪರಿಸರ ಪರಿಶೀಲನೆ

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

### ಉತ್ಪಾದನಾ ಪರಿಸರ ಪರಿಶೀಲನೆ

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

## ಸಂಪನ್ಮೂಲ ಪರಿಶೀಲನೆ

### ಹಂಚಿಕೆ ಪರಿಶೀಲನೆ ಸ್ಕ್ರಿಪ್ಟ್

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

## ಭದ್ರತೆ ಮತ್ತು ಅನುಗುಣತೆ ತಪಾಸಣೆಗಳು

### ಭದ್ರತೆ ಪರಿಶೀಲನೆ ಸ್ಕ್ರಿಪ್ಟ್

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

## CI/CD ಸಂಯೋಜನೆ

### GitHub Actions ಸಂಯೋಜನೆ

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

ಈ ಕಾರ್ಯಪ್ರವಾಹಕ್ಕೆ ಫೆಡರೇಟೆಡ್ ಪಾಸ್‌ವರ್ಡ್‌ಗಳನ್ನು ಸಂರಚಿಸಿ ಮತ್ತು ಉಳಿಸಿದ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳನ್ನು ಚಲಾಯಿಸುವ ಮೊದಲು ಆಯ್ದ azd ಪರಿಸರವನ್ನು ಸೃಷ್ಟಿಸಿ/ಮರುಸ್ಥಾಪಿಸಿ. ಈ ಉದಾಹರಣೆಗಳು ಕಾನ್ಸೋಲ್ ಔಟ್‌ಪುಟ್ ಮಾತ್ರ ಬರೆಯುತ್ತವೆ; ಯಾವುದೇ `preflight-results.json` ಅಥವಾ JUnit ಫೈಲ್ ರಚಿಸಲ್ಪಡದೆ.

### ಅಜೂರ್ ಡೆವ್‌ಓಪ್ಸ್ ಸಂಯೋಜನೆ

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

ಪೈಪ್‌ಲೈನ್ ತನ್ನ azd ಪರಿಸರವನ್ನು ಮರುಸ್ಥಾಪಿಸಬೇಕು/ಸೃಷ್ಟಿಸಬೇಕು ಮತ್ತು ಈ ಪಾಠದಲ್ಲಿ ತೋರಿಸಿಹ scಷ್ರಿಪ್ಟ್‌ಗಳನ್ನು ಉಳಿಸಬೇಕು ಈ ಕಾರ್ಯದಿಂದ ಮುಂಚೆ. ಫೆಡರೇಟೆಡ್ ಸೇವಾ ಸಂಪರ್ಕವನ್ನು ಸಂರಚಿಸಿ ಮತ್ತು ಪೈಪ್‌ಲೈನ್‌ಗೆ ಅಗತ್ಯ ಟೋಕನ್ ಅನುಮತಿಗಳನ್ನು ಒದಗಿಸಿ. ಹಿಂದಿನ `AzureCLI@2` ಕಾರ್ಯದ ಅಜೂರ್ CLI ಲಾಗಿನ್ ಒಂದು ನಂತರದ ಸರಳ ಬ್ಯಾಶ್ ಕಾರ್ಯಕ್ಕಾಗಿ ಪ್ರಾಮಾಣೀಕರಣ ಸಾಧ್ಯ ಎಂದು ನಿರೀಕ್ಷಿಸಬೇಡಿ.

---

## ಉತ್ತಮ ಅಭ್ಯಾಸಗಳ ಸಾರಾಂಶ

### ✅ ಪೂರ್ವ-ಯಾನ ತಪಾಸಣೆ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

1. **ಸಾಧ್ಯವಾದಲ್ಲಿ ಸ್ವಯಂಚಾಲಿತಗೊಳಿಸಿ**
   - ತಪಾಸಣೆಗಳನ್ನು CI/CD ಪೈಪ್ಲೈನಿಗೆ ಸಂಯೋಜಿಸಿ
   - ಪುನರಾವರ್ತಿಸಲ್ಪಡುವ ಪರಿಶೀಲನೆಗೋಸ್ಕರ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳನ್ನು ಬಳಸಿ
   - ಆಡಿಟ್ ಟ್ರೇಲ್‌ಗಾಗಿ ಫಲಿತಾಂಶಗಳನ್ನು ಸಂರಕ್ಷಿಸಿ

2. **ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ಪರಿಶೀಲನೆ**
   - ಡೆವ್/ಸ್ಟೇಜಿಂಗ್/ಉತ್ಪಾದನೆಗೆ ವಿಭಿನ್ನ ತಪಾಸಣೆಗಳು
   - ಪ್ರತಿಯೊಂದು ಪರಿಸರಕ್ಕೆ ತಕ್ಕ ಭದ್ರತಾ ಅವಶ್ಯಕತೆಗಳು
   - ಉತ್ಪಾದನಾತ್ಮಕವಲ್ಲದ ಪರಿಸರಗಳಿಗೆ ವೆಚ್ಚದ ಸಮೃದ್ಧ ತಂತ್ರಗಳು

3. **ಸಮಗ್ರ ವ್ಯಾಪ್ತಿ**
   - ಪ್ರಾಮಾಣೀಕರಣ ಮತ್ತು ಅನುಮತಿಗಳು
   - ಸಂಪನ್ಮೂಲ ಹಂಚಿಕೆ ಮತ್ತು ಲಭ್ಯತೆ
   - ಟೆಂಪ್ಲೇಟ್ ಪರಿಶೀಲನೆ ಮತ್ತು ವ್ಯಾಕರಣ
   - ಭದ್ರತೆ ಮತ್ತು ಅನುಗುಣತೆ ಅವಶ್ಯಕತೆಗಳು

4. **ಸ್ಪಷ್ಟ ವರದಿ**
   - ಬಣ್ಣ-ಕೋಡಿತ ಸ್ಥಿತಿ ಸೂಚಕಗಳು
   - ಪರಿಹಾರ ಕ್ರಮಗಳೊಂದಿಗೆ ವಿವರವಾದ ದೋಷ ಸಂದೇಶಗಳು
   - ಶೀಘ್ರ ಮೌಲ್ಯಮಾಪನಕ್ಕಾಗಿ ಸಾರಾಂಶ ವರದಿಗಳು

5. **ತ್ವರಿತ ವೈಫಲ್ಯ**
   - ಪ್ರಮುಖ ತಪಾಸಣೆಗಳು ವಿಫಲವಾದರೆ ನಿಯೋಜನೆಯನ್ನು ನಿಲ್ಲಿಸಿ
   - ಪರಿಹಾರಕ್ಕಾಗಿ ಸ್ಪಷ್ಟ ಮಾರ್ಗದರ್ಶನ ಒದಗಿಸಿ
   - ತಪಾಸಣೆಗಳನ್ನು ಸುಲಭವಾಗಿ ಮರುಚಲಾಯಿಸಲು ಅವಕಾಶ ನೀಡಿ

### ಸಾಮಾನ್ಯ ಪೂರ್ವ-ಯಾನ ತಪ್ಪುಗಳು

1. **"ಡ್ರೂಢ" ನಿಯೋಜನೆಗಳಿಗೆ ಪರಿಶೀಲನೆ ಮslanಬಿಡುವುದು**
2. **ನಿಯೋಜನೆಯ ಮುನ್ನ ಅನುಮತಿಗಳ ಕೊರತೆ ತನಿಖೆ ಮಾಡದೆ ಇಡುವುದು**
3. **ಹಂಚಿಕೆ ಮೀಮಾಂಸೆಗಳನ್ನು ನಿರ್ಲಕ್ಷಿಸುವುದು** ನಿಯೋಜನೆ ವಿಫಲವಾಗುವವರೆಗೆ
4. **CI/CD ಪೈಪ್‌ಲೈನ್‌ಗಳಲ್ಲಿ ಟೆಂಪ್ಲೇಟ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸದಿರುವುದು**
5. **ಉತ್ಪಾದನಾ ಪರಿಸರಗಳಿಗಾಗಿ ಭದ್ರತಾ ಪರಿಶೀಲನೆ ಇಲ್ಲದಿರುವುದು**
6. **ಅಪರ್ಯಾಪ್ತ ವೆಚ್ಚ ಅಂದಾಜು** ಕಾರಣ ಬಜೆಟ್ ಆಘಾತಗಳು

---

**ಪ್ರೋ ಟಿಪ್**: ನಿಜವಾದ ನಿಯೋಜನೆ ಕೆಲಸಕ್ಕೆ ಮುಂಚೆ ನಿಮ್ಮ CI/CD ಪೈಪ್ಲೈನಿನಲ್ಲಿ ಪೂರ್ವ-ಯಾನ ತಪಾಸಣೆಗಳನ್ನು ಪ್ರತ್ಯೇಕ ಕೆಲಸವಾಗಿ ನಡೆಸಿ. ಇದರರಿಂದ ಸಮಸ್ಯೆಗಳನ್ನು ಬೇಗ ಪತ್ತೆಮಾಡಬಹುದು ಮತ್ತು ಡೆವಲಪರ್‌ಗಳಿಗೆ ವೇಗವಾಗಿ ಪ್ರತಿಕ್ರಿಯೆ ಒದಗಿಸುತ್ತದೆ.

---

**ನ್ಯಾವಿಗೇಶನ್**
- **ಹಿಂದಿನ ಪಾಠ**: [SKU ಆಯ್ಕೆ](sku-selection.md)
- **ಮುಂದಿನ ಪಾಠ**: [ಚೀಟ್ ಶೀಟ್](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
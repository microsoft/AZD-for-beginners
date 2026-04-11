# AZD ನಿಯೋಜನೆಗಳಿಗೆ ಪೂರ್ವ-ಯಾತ್ರೆ ಪರಿಶೀಲನೆಗಳು

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಮನೆ**: [ಆಜಡ್ ಫಾರ್ ಬಿಗಿನರ್ಸ್](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 6 - ಪೂರ್ವ ನಿಯೋಜನೆ ಪರಿಶೀಲನೆ ಮತ್ತು ಯೋಜನೆ
- **⬅️ ಹಿಂದಿನ**: [SKU ಆಯ್ಕೆ](sku-selection.md)
- **➡️ ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 7: ಸಮಸ್ಯೆ ಪರಿಹಾರ](../chapter-07-troubleshooting/common-issues.md)
- **🔧 ಸಂಬಂಧಿಸಿದ**: [ಅಧ್ಯಾಯ 4: ನಿಯೋಜನೆ ಮಾರ್ಗದರ್ಶಿ](../chapter-04-infrastructure/deployment-guide.md)

## ಪರಿಚಯ

ಈ ಸಂಪೂರ್ಣ ಮಾರ್ಗದರ್ಶಿ ಆಜರ್ ಡೆವಲಪರ್ CLI ನಿಯೋಜನೆ ಆರಂಭವಾಗುವ ಮುನ್ನ ಯಶಸ್ವಿಯಾಗಿ ನಡೆಯುವುದಕ್ಕಾಗಿ ಪೂರ್ವ-ನಿಯೋಜನೆ ಪರಿಶೀಲನೆ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು ಮತ್ತು ಕ್ರಮಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ. ಪ್ರಾಮಾಣೀಕರಣ, ಸಂಪನ್ಮೂಲ ಲಭ್ಯತೆ, ಕೋಟ್, ಭದ್ರತೆ ಅನುಕೂಲತೆ ಮತ್ತು ಕಾರ್ಯಕ್ಷಮತೆ ಅಗತ್ಯಗಳನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಪರಿಶೀಲಿಸುವುದನ್ನು ಕಲಿಯಿರಿ, ನಿಯೋಜನೆ ವೈಫಲ್ಯಗಳನ್ನು ತಡೆಹಿಡಿಯಲು ಮತ್ತು ಯಶಸ್ಸಿನ ಪ್ರಮಾಣಗಳನ್ನು ಗಟ್ಟಿಗೊಳಿಸಲು.

## ಕಲಿಕೆಯ ಗುರಿಗಳು

ಈ ಮಾರ್ಗದರ್ಶಿಯನ್ನು ಪೂರ್ಣಗೊಳಿಸುವ ಮೂಲಕ ನೀವು:
- ಸ್ವಯಂಚಾಲಿತ ಪೂರ್ವ-ನಿಯೋಜನೆ ಪರಿಶೀಲನೆ ತಂತ್ರಗಳು ಮತ್ತು ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳಲ್ಲಿ ಪರಿಣತಿ ಪಡೆಯುವಿರಿ
- ಪ್ರಾಮಾಣೀಕರಣ, ಅನುಮತಿಗಳು ಮತ್ತು ಕೋಟ್‌ಗಳ ಸಮಗ್ರ ಪರಿಶೀಲನಾ ತಂತ್ರಗಳು ಅರಿತುಕೊಳ್ಳುವಿರಿ
- ಸಂಪನ್ಮೂಲ ಲಭ್ಯತೆ ಮತ್ತು ಸಾಮರ್ಥ್ಯ ಪರಿಶೀಲನೆ ಕ್ರಮಗಳನ್ನು ಜರುಗಿಸುವಿರಿ
- ಸಂಸ್ಥೆಯ ನೀತಿಗಳಿಗಾಗಿ ಭದ್ರತೆ ಮತ್ತು ಅನುಕೂಲತೆ ಪರಿಶೀಲನೆಗಳನ್ನು ಸಂರಚಿಸುವಿರಿ
- ವೆಚ್ಚ ಅಂದಾಜು ಮತ್ತು ಬಜೆಟ್ ಪರಿಶೀಲನೆ ಕಾರ್ಯಪ್ರವಾಹಗಳನ್ನು ರೂಪಿಸುವಿರಿ
- CI/CD ಪೈಪ್ಲೈನ್ಗಳಿಗಾಗಿ ಕಸ್ಟಮ್ ಪೂರ್ವ-ಯಾತ್ರೆ ಪರಿಶೀಲನೆ ಆटोಮೇಷನ್ ಸೃಷ್ಟಿಸುವಿರಿ

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ, ನೀವು:
- ಸಮಗ್ರ ಪೂರ್ವ-ಯಾತ್ರೆ ಪರಿಶೀಲನೆ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳನ್ನು ರಚಿಸಿ ನಿರ್ವಹಿಸಬಹುದು
- ವಿಭಿನ್ನ ನಿಯೋಜನೆ ಸಂದರ್ಭಗಳಿಗೆ ಸ್ವಯಂಚಾಲಿತ ಪರಿಶೀಲನೆ ಕಾರ್ಯಪ್ರವಾಹಗಳನ್ನು ವಿನ್ಯಾಸಗೊಳಿಸಬಹುದು
- ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ಪರಿಶೀಲನೆ ಕ್ರಮಗಳು ಮತ್ತು ನीतಿಗಳನ್ನು ಜಾರಿಗೊಳಿಸಬಹುದು
- ನಿಯೋಜನೆ ಸಿದ್ಧತೆಗೆ ಪ್ರಾಕ್ಟಿವ್ ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಅಲರ್ಟ್‌ಗಳನ್ನು ಸಂರಚಿಸಬಹುದು
- ಪೂರ್ವ-ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳನ್ನು ಪರಿಹರಿಸಿ ತಿದ್ದುಪಡಿ ಕ್ರಮಗಳನ್ನು ಅನುಷ್ಠान ಮಾಡಬಹುದು
- ಡೆವ್ಓಪ್ಸ್ ಪೈಪ್ಲೈನ್ಗಳಲ್ಲಿ ಪೂರ್ವ-ಯాత్రೆ ಪರಿಶೀಲನೆಗಳನ್ನು ಇಂಟಿಗ್ರೇಟ್ ಮಾಡಬಹುದು

## ವಿಷಯಸಾರणी

- [ಸಾರಾಂಶ](#ಸಾರಾಂಶ)
- [ಸ್ವಯಂಚಾಲಿತ ಪೂರ್ವ-ಯಾತ್ರೆ ಸ್ಕ್ರಿಪ್ಟ್](#ಸ್ವಯಂಚಾಲಿತ-ಪೂರ್ವ-ಯಾತ್ರೆ-ಸ್ಕ್ರಿಪ್ಟ್)
- [ಮಾನುಯಲ್ ಪರಿಶೀಲನೆ ಚಕೇಶ್](#codeblock1)
- [ಪರಿಸರ ಪರಿಶೀಲನೆ](#✅-ಬ್ಯಾಕಪ್-ಮತ್ತು-ಪುನಃಪಡೆಯಿಕೆ)
- [ಸಂಪನ್ಮೂಲ ಪರಿಶೀಲನೆ](#ಉತ್ಪಾದನಾ-ಪರಿಸರ-ಪರಿಶೀಲನೆ)
- [ಭದ್ರತೆ ಮತ್ತು ಅನುಕೂಲತೆ ಪರಿಶೀಲನೆ](#security--compliance-checks)
- [ಕಾರ್ಯಕ್ಷಮತೆ ಮತ್ತು ಸಾಮರ್ಥ್ಯ ಯೋಜನೆ](#performance--capacity-planning)
- [ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು ಪರಿಹಾರ](#troubleshooting-common-issues)

---

## ಸಾರಾಂಶ

ನಿಯೋಜಿಸುವ ಮುನ್ನ ಸಂಪೂರ್ಣ ಪರಿಶೀಲನೆಗಳು ಖಚಿತಪಡಿಸಲು ಅಗತ್ಯವಿದೆ:

- ಗುರಿ ಪ್ರದೇಶಗಳಲ್ಲಿ **ಸಂಪನ್ಮೂಲ ಲಭ್ಯತೆ** ಮತ್ತು ಕೋಟ್‌ಗಳು
- **ಪ್ರಾಮಾಣೀಕರಣ ಮತ್ತು ಅನುಮತಿಗಳು** ಸರಿಯಾಗಿ ಸಂರಚಿತವಾಗಿವೆ
- **ಟೆಂಪ್ಲೆಟ್ ಸತ್ಯತೆಯ** ಮತ್ತು ನಿಯಮಗಳ ಸರಿಯಾದತೆ
- **ಜಾಲ ಸಂಚರಣೆ** ಮತ್ತು ಅವಲಂಬನೆಗಳು
- **ಸಂಸ್ಥೆಯ ನೀತಿಗಳ ಭದ್ರತಾ ಅನುಕೂಲತೆ**
- **ಬಜೆಟ್ ಮಿತಿಗಳೊಳಗಿನ** ವೆಚ್ಚ ಅಂದಾಜು

### ಪೂರ್ವ-ಯಾತ್ರೆ ಪರಿಶೀಲನೆ ನಡೆಸುವ ಸಮಯ

- **ಹೊಸ ಪರಿಸರಕ್ಕೆ ಮೊದಲು** ನಿಯೋಜಿಸಲು
- **ಪ್ರಮುಖ ಟೆಂಪ್ಲೆಟ್ ಬದಲಾವಣೆಗಳಿಗೆ ನಂತರ**
- **ಆದಾಯ್ಯದ ನಿಯೋಜನೆಗಳ ಮೊದಲು**
- **ಆಜರ್ ಪ್ರದೇಶ ಬದಲಾಯಿಸುವಾಗ**
- **CI/CD ಪೈಪ್ಲೈನ್ಗಳ ಭಾಗವಾಗಿ**

---

## ಸ್ವಯಂಚಾಲಿತ ಪೂರ್ವ-ಯಾತ್ರೆ ಸ್ಕ್ರಿಪ್ಟ್

### ಪವರ್‌ಶೆಲ್ ಪೂರ್ವ-ಯಾತ್ರೆ ಪರಿಶೀಲಕ

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

# ಔಟ್‌ಪುಟ್‌ಗಾಗಿ ಬಣ್ಣ ಕೋಡಿಂಗ್
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
    
    # AZD ಸ್ಥಾಪನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
    try {
        $azdVersion = azd version --output json | ConvertFrom-Json
        Write-Status "AZD CLI installed" "Success" "Version: $($azdVersion.azd.version)"
    }
    catch {
        Write-Status "AZD CLI not found" "Error" "Install from https://aka.ms/azd-install"
        return $false
    }
    
    # Azure CLI ಸ್ಥಾಪನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
    try {
        $azVersion = az version --output json | ConvertFrom-Json
        Write-Status "Azure CLI installed" "Success" "Version: $($azVersion.'azure-cli')"
    }
    catch {
        Write-Status "Azure CLI not found" "Error" "Install from https://aka.ms/azcli"
        return $false
    }
    
    # PowerShell ಆವೃತ್ತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
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
        # AZD ಪ್ರমাণೀಕರಣವನ್ನು ಪರಿಶೀಲಿಸಿ
        $azdAuth = azd auth login --check-status --output json 2>$null | ConvertFrom-Json
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
        }
        else {
            Write-Status "AZD authentication" "Error" "Run 'azd auth login'"
            return $false
        }
        
        # Azure CLI ಪ್ರমাণೀಕರಣವನ್ನು ಪರಿಶೀಲಿಸಿ
        $azAccount = az account show --output json | ConvertFrom-Json
        Write-Status "Azure CLI authentication" "Success" "Subscription: $($azAccount.name)"
        
        # ಸಬ್ಸ್ಕ್ರಿಪ್ಶನ್ ಪ್ರವೇಶವನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
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
        # ಪ್ರಸ್ತುತ ಬಳಕೆದಾರರ ಪಾತ್ರ ನಿಯೋಜನೆಗಳನ್ನು ಪಡೆಯಿರಿ
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
        
        # ರಿಸೋರ್ಸ್ ಗುಂಪು ರಚನೆಗೆ ಪರೀಕ್ಷೆ (ನಿರ್ದೇಶಿಸಿದರೆ)
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # ರಿಸೋರ್ಸ್ ಗುಂಪು ರಚಿಸುವ ಸಾಮರ್ಥ್ಯವನ್ನು ಪರೀಕ್ಷಿಸಿ
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
        # ಕಂಪ್ಯೂಟ್ ಕೊಟ್ಟಾಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
        $computeUsage = az vm list-usage --location $Location --output json | ConvertFrom-Json
        
        # ನಿರ್ದಿಷ್ಟ ಕೊಟ್ಟಾಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
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
        
        # ಅಪ್ಲಿಕೇಶನ್ ಸೇವೆ ಮಿತಿಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
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
        
        # ಸಂಗ್ರಹಣೆ ಖಾತೆ ಮಿತಿಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
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
        return $true # ವಿರಾಮರಹಿತ
    }
}

function Test-NetworkConnectivity {
    Write-Host "`n${Blue}=== Network Connectivity Check ===${Reset}"
    
    # Azure ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪರೀಕ್ಷಿಸಿ
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
    
    # DNS ಪರಿಹಾರ ಸಾಮರ್ಥ್ಯವನ್ನು ಪರೀಕ್ಷಿಸಿ
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
    
    # azure.yaml ಇದೆ ಎಂದು ಪರಿಶೀಲಿಸಿ
    if (Test-Path "azure.yaml") {
        Write-Status "azure.yaml found" "Success"
        
        # azure.yaml ಅನ್ನು ವಿಶ್ಲೇಷಿಸಿ
        try {
            $azureYaml = Get-Content "azure.yaml" -Raw | ConvertFrom-Yaml
            Write-Status "azure.yaml parsing" "Success"
            
            # ಸೇವೆಗಳನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
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
    
    # ರಚನಾ ಕಡತಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ
    if (Test-Path "infra") {
        $bicepFiles = Get-ChildItem -Path "infra" -Filter "*.bicep" -Recurse
        if ($bicepFiles.Count -gt 0) {
            Write-Status "Infrastructure templates" "Success" "$($bicepFiles.Count) Bicep files found"
            
            # main.bicep ಇದ್ದರೆ ಮಾನ್ಯಗೊಳಿಸಿ
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
    
    # 🧪 ಹೊಸದು: ರಚನಾ ಪೂರ್ವದೃಷ್ಟಿ (ಸುರಕ್ಷಿತ ಡ್ರೈ-ರನ್) ಪರೀಕ್ಷೆ
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
        # ಸ್ಥಳ ಮಾನ್ಯವೋ ಅಥವಾ ಇಲ್ಲವೋ ಪರಿಶೀಲಿಸಿ
        $locations = az account list-locations --output json | ConvertFrom-Json
        $validLocation = $locations | Where-Object { $_.name -eq $Location -or $_.displayName -eq $Location }
        
        if ($validLocation) {
            Write-Status "Azure region" "Success" "Location '$Location' is valid"
        }
        else {
            Write-Status "Azure region" "Error" "Location '$Location' is not valid"
            return $false
        }
        
        # ಪ್ರಾಂತ್ಯದಲ್ಲಿ ಸೇವೆಯ ಲಭ್ಯತೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
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
    
    # ಮೂಲಭೂತ ವೆಚ್ಚ ಅಂದಾಜು (ನಿಖರ ಅಂದಾಜುಗಳಿಗೆ Azure ಬೆಲೆ ಏಪಿಐ ಅಗತ್ಯ)
    Write-Status "Cost estimation" "Info" "Use Azure Pricing Calculator for detailed estimates"
    Write-Status "Monitoring setup" "Info" "Set up Azure Cost Management alerts"
    
    # ಬಜೆಟ್ ಇದೆ ಎಂದು ಪರಿಶೀಲಿಸಿ
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
    
    # ಸಾಮಾನ್ಯ ಭದ್ರತಾ ಅಭ್ಯಾಸಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
    try {
        # ಕೀ ವಾಲ್ಟ್ ಅನ್ನು ಸಂರಚಿತವಾಗಿದೆ ಎಂದು ಪರೀಕ್ಷಿಸಿ
        if (Select-String -Path "infra/*.bicep" -Pattern "Microsoft.KeyVault" -Quiet) {
            Write-Status "Key Vault usage" "Success" "Key Vault detected in templates"
        }
        else {
            Write-Status "Key Vault usage" "Warning" "Consider using Key Vault for secrets"
        }
        
        # ನಿರ್ವಹಿತ ಗುರುತಿನ ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
        if (Select-String -Path "infra/*.bicep" -Pattern "managedIdentity|SystemAssigned" -Quiet) {
            Write-Status "Managed Identity" "Success" "Managed Identity detected"
        }
        else {
            Write-Status "Managed Identity" "Warning" "Consider using Managed Identity"
        }
        
        # HTTPS ವಿಧಿಯ ಅನುಸರಣೆ ಪರೀಕ್ಷಿಸಿ
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

# ಮುಖ್ಯ ಕಾರ್ಯನಿರ್ವಹಣೆ
function Invoke-PreflightCheck {
    Write-Host "${Green}AZD Pre-flight Check${Reset}" -ForegroundColor Green
    Write-Host "Environment: $EnvironmentName"
    Write-Host "Location: $Location"
    if ($ResourceGroup) { Write-Host "Resource Group: $ResourceGroup" }
    Write-Host "Time: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    Write-Host ""
    
    $allPassed = $true
    $results = @{}
    
    # ಎಲ್ಲಾ ಪರಿಶೀಲನೆಗಳನ್ನು ನಡೆಸಿ
    $results["Prerequisites"] = Test-Prerequisites
    $results["Authentication"] = Test-Authentication
    $results["Permissions"] = Test-Permissions
    $results["QuotasAndLimits"] = Test-QuotasAndLimits
    $results["NetworkConnectivity"] = Test-NetworkConnectivity
    $results["TemplateValidation"] = Test-TemplateValidation
    $results["RegionalAvailability"] = Test-RegionalAvailability
    $results["CostEstimation"] = Test-CostEstimation
    $results["SecurityCompliance"] = Test-SecurityCompliance
    
    # ಸಾರಾಂಶ
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

# ಪೂರ್ವ ವಿಮಾನ ಪರಿಶೀಲನೆಯನ್ನು ನಡೆಸಿ
Invoke-PreflightCheck
```

### ಬ್ಯಾಶ್ ಪೂರ್ವ-ಯಾತ್ರೆ ಪರಿಶೀಲಕ

```bash
#!/bin/bash
# ಯುನಿಕ್ಸ್/ಲಿನಕ್ಸ್ ಸಿಸ್ಟಮ್ಗಳಿಗಾಗಿ ಮುಂಗಡ-flight ಪರಿಶೀಲನೆಗಳ ಬಾಷ್ ಆವೃತ್ತಿ

set -euo pipefail

# ಬಣ್ಣ ಕೋಡ್‌ಗಳು
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # ಯಾವುದೇ ಬಣ್ಣವಿಲ್ಲ

# ಜಾಗತಿಕ ಚರಗಳು
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
    
    # AZD ಸ್ಥಾಪನೆ ಪರಿಶೀಲಿಸಿ
    if command -v azd >/dev/null 2>&1; then
        local azd_version=$(azd version --output json | jq -r '.azd.version')
        print_status "AZD CLI installed" "success" "Version: $azd_version"
    else
        print_status "AZD CLI not found" "error" "Install from https://aka.ms/azd-install"
        return 1
    fi
    
    # Azure CLI ಸ್ಥಾಪನೆ ಪರಿಶೀಲಿಸಿ
    if command -v az >/dev/null 2>&1; then
        local az_version=$(az version --output json | jq -r '."azure-cli"')
        print_status "Azure CLI installed" "success" "Version: $az_version"
    else
        print_status "Azure CLI not found" "error" "Install from https://aka.ms/azcli"
        return 1
    fi
    
    # jq ಸ್ಥಾಪನೆ ಪರಿಶೀಲಿಸಿ
    if command -v jq >/dev/null 2>&1; then
        print_status "jq installed" "success"
    else
        print_status "jq not found" "warning" "Install jq for better JSON parsing"
    fi
    
    return 0
}

check_authentication() {
    echo -e "\n${BLUE}=== Authentication Check ===${NC}"
    
    # AZD ದೃಢೀಕರಣ ಪರಿಶೀಲಿಸಿ
    if azd auth login --check-status >/dev/null 2>&1; then
        local principal_name=$(azd auth login --check-status --output json 2>/dev/null | jq -r '.principalName // "Unknown"')
        print_status "AZD authentication" "success" "User: $principal_name"
    else
        print_status "AZD authentication" "error" "Run 'azd auth login'"
        return 1
    fi
    
    # Azure CLI ದೃಢೀಕರಣ ಪರಿಶೀಲಿಸಿ
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
    
    # azure.yaml ಪರಿಶೀಲಿಸಿ
    if [[ -f "azure.yaml" ]]; then
        print_status "azure.yaml found" "success"
        
        # ಮೂಲ YAML ಮಾನ್ಯತೆ
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
    
    # ಮೂಲಸೌಕರ್ಯ ಕಡತಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
    if [[ -d "infra" ]]; then
        local bicep_count=$(find infra -name "*.bicep" | wc -l)
        if [[ $bicep_count -gt 0 ]]; then
            print_status "Infrastructure templates" "success" "$bicep_count Bicep files found"
            
            # main.bicep ಇದ್ದರೆ ಮಾನ್ಯತೆ ಮಾಡಿ
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
    
    # ಸ್ಥಳ ಮಾನ್ಯವೋ ಎಂದು ಪರಿಶೀಲಿಸಿ
    if az account list-locations --query "[?name=='$LOCATION' || displayName=='$LOCATION']" --output tsv | grep -q .; then
        print_status "Azure region" "success" "Location '$LOCATION' is valid"
    else
        print_status "Azure region" "error" "Location '$LOCATION' is not valid"
        return 1
    fi
    
    # ಸೇವಾ ಲಭ್ಯತೆ ಪರಿಶೀಲಿಸಿ
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
    # ಕಮಾಂಡ್ ಲೈನ್ ಆರ್ಗ್ಯುಮೆಂಟ್ಗಳನ್ನು ವಿಂಗಡಿಸಿ
    while [[ $# -gt 0 ]]; ಮಾಡು
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
    
    # ಅಗತ್ಯ պարಾಮೀಟರ್ಗಳನ್ನು ಮಾನ್ಯತೆ ಮಾಡಿರಿ
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
    
    # ಪರಿಶೀಲನೆಗಳನ್ನು ಚಾಲನೆ ಮಾಡಿರಿ
    local all_passed=true
    
    check_prerequisites || all_passed=false
    check_authentication || all_passed=false
    check_template_validation || all_passed=false
    check_regional_availability || all_passed=false
    
    # ಸಾರಾಂಶ
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

# ಮುಖ್ಯ ಕಾರ್ಯವನ್ನು ಚಾಲನೆ ಮಾಡಿರಿ
main "$@"
```

---

## ಮಾನುವಲ್ ಪರಿಶೀಲನೆ ಚಕೇಶ್

### ಪೂರ್ವ-ನಿಯೋಜನೆ ಚಕೇಶ್

ಈ ಚಕೇಶ್ ಅನ್ನು ಮುದ್ರಿಸಿ ಮತ್ತು ನಿಯೋಜನೆಯ ಮುನ್ನ ಪ್ರತಿ ವಿಷಯವನ್ನು ಪರಿಶೀಲಿಸಿ:

#### ✅ ಪರಿಸರ ಸಜ್ಜುಗೊಳಿಸುವಿಕೆ
- [ ] AZD CLI ಇನ್ಸ್ಟಾಲ್ ಆಗಿದ್ದು ಇತ್ತೀಚಿನ ಆವೃತ್ತಿಗೆ ನವೀಕರಿಸಲಾಗಿದೆ
- [ ] ಆಜರ್ CLI ಇನ್ಸ್ಟാള് ಆಗಿದ್ದು ಪ್ರಾಮಾಣೀಕರಿಸಲಾಗಿದೆ
- [ ] ಸರಿಯಾದ ಆಜರ್ ಚಂದಾದಾರಿಕೆ ಆಯ್ಕೆ ಮಾಡಲಾಗಿದೆ
- [ ] ಪರಿಸರದ ಹೆಸರು ವಿಶಿಷ್ಟವಾಗಿದ್ದು ಹೆಸರಿಸುವ ನಿಯಮಗಳನ್ನು ಅನುಸರಿಸುತ್ತದೆ
- [ ] ಗುರಿಯಾಗಿ ಸಂಪನ್ಮೂಲ ಗುಂಪು ಗುರುತಿಸಲಾಗಿದೆ ಅಥವಾ ಸೃಷ್ಟಿಸಬಹುದು

#### ✅ ಪ್ರಾಮಾಣೀಕರಣ ಮತ್ತು ಅನುಮತಿಗಳು
- [ ] `azd auth login` ಮೂಲಕ ಯಶಸ್ವಿಯಾಗಿ ಪ್ರಾಮಾಣೀಕರಿಸಲಾಗಿದೆ
- [ ] ಬಳಕೆದಾರನಿಗೆ ಗುರಿ ಚಂದಾದಾರಿಕೆ/ಸಂಪನ್ಮೂಲ ಗುಂಪಿನ ಮೇಲೆ ಕೊಡುಗೆದಾರ ಪಾತ್ರವಿದೆ
- [ ] CI/CD ಗಾಗಿ ಸೇವಾ ಪ್ರಿಂಸಿಪಲ್ ಜೋಡಿಸಲಾಗಿದೆ (ಅದೃಷ್ಟಲ್ಲಿ)
- [ ] ಯಾವುದೇ ಅವಧಿ ಮುಗಿಯುವ ಪ್ರಮಾಣಪತ್ರಗಳು ಅಥವಾ ದಾಖಲೆಗಳು ಇಲ್ಲ

#### ✅ ಟೆಂಪ್ಲೆಟ್ ಪರಿಶೀಲನೆ
- [ ] `azure.yaml` ಅಸ್ತಿತ್ವದಲ್ಲಿದ್ದು ಮಾನ್ಯ YAML ಆಗಿದೆ
- [ ] azure.yaml ನಲ್ಲಿ ಎಲ್ಲಾ ಸೇವೆಗಳು ಸಂಬಂಧಪಟ್ಟ ಮೂಲಕೋಡ್ ಸಹಿತ ಇವೆ
- [ ] `infra/` ಡೈರೆಕ್ಟರಿಯಲ್ಲಿ ಬೈಸಿಕ್ ಟೆಂಪ್ಲೆಟ್‌ಗಳು ಇವೆ
- [ ] `main.bicep` ದೋಷರಹಿತವಾಗಿ ಸಂಯೋಜಿತವಾಗಿದೆ (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಪೂರ್ವದೃಷ್ಟಿ ಯಶಸ್ವಿಯಾಗಿ ನಡೆಯುತ್ತದೆ (`azd provision --preview`)
- [ ] ಎಲ್ಲಾ ಅಗತ್ಯ ನಿಯಮಗಳು ಡિફಾಲ್ಟ್ ಮೌಲ್ಯಗಳು ಅಥವಾ ಒದಗಿಸಲಾಗುತ್ತದೆ
- [ ] ಟೆಂಪ್ಲೆಟ್‌ಗಳಲ್ಲಿ ಯಾವುದೇ ಕಠಿಣವಾಗಿ ಬರೆದ ರಹಸ್ಯಗಳು ಇಲ್ಲ

#### ✅ ಸಂಪನ್ಮೂಲ ಯೋಜನೆ
- [ ] ಗುರಿ ಆಜರ್ ಪ್ರದೇಶವನ್ನು ಆಯ್ಕೆ ಮಾಡಿ ಪರಿಶೀಲಿಸಲಾಗಿದೆ
- [ ] ಗುರಿ ಪ್ರದೇಶದಲ್ಲಿ ಅಗತ್ಯ ಆಜರ್ ಸೇವೆಗಳು ಲಭ್ಯವಿವೆ
- [ ] ಯೋಜಿತ ಸಂಪನ್ಮೂಲಗಳಿಗೆ ಸಾಕಷ್ಟು ಕೋಟ್ ಲಭ್ಯವಿದೆ
- [ ] ಸಂಪನ್ಮೂಲ ಹೆಸರು ಒದಗಿತೆಗಳ ತಪಾಸಣೆ ಮಾಡಿದವು
- [ ] ಸಂಪನ್ಮೂಲಗಳ ನಡುವೆ ಅವಲಂಬನೆಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಂಡಿದ್ದಾರೆ

#### ✅ ಜಾಲ ಸಂಚರಣೆ ಮತ್ತು ಭದ್ರತೆ
- [ ] ಆಜರ್ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳಿಗೆ ಜಾಲ ಸಂಪರ್ಕ ಪರಿಶೀಲಿಸಲಾಗಿದೆ
- [ ] ಅಗತ್ಯವಿದ್ದಲ್ಲಿ ಫೈರ್ವಾಲ್/ಪ್ರಾಕ್ಸಿ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಸಂರಚಿಸಲಾಗಿದೆ
- [ ] ರಹಸ್ಯ ನಿರ್ವಹಣೆಗೆ ಕೀ ವಾಲ್ಟ್ ಕಂಫಿಗರ್ ಮಾಡಲಾಗಿದೆ
- [ ] ಸಾಧ್ಯವಿರುವಲ್ಲಿ ನಿರ್ವಹಣಾ ಗುರುತುಗಳು ಬಳಸಲಾಗಿದೆ
- [ ] ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗೆ HTTPS ಅನುಷ್ಠಾನಗೊಂಡಿದೆ

#### ✅ ವೆಚ್ಚ ನಿರ್ವಹಣೆ
- [ ] ಆಜರ್ ಪ್ರೈಸಿಂಗ್ ಕ್ಯಾಲ್ಕ್ಯುಲೇಟರ್ ಬಳಸಿ ವೆಚ್ಚ ಅಂದಾಜು ಮಾಡಲಾಗಿದೆ
- [ ] ಬಜೆಟ್ ಅಲರ್ಟ್‌ಗಳನ್ನು ಅಗತ್ಯವಿದ್ದಲ್ಲಿ ಸಂರಚಿಸಲಾಗಿದೆ
- [ ] ಪರಿಸರ ಪ್ರಕಾರವು ಸೂಕ್ತ SKU ಆಯ್ಕೆ ಮಾಡಲಾಗಿದೆ
- [ ] ಉತ್ಪಾದನಾ ಕಾರ್ಯಭಾರಗಳಿಗೆ ಮೀಸಲಾದ ಸಾಮರ್ಥ್ಯ ಪರಿಗಣಿಸಲಾಗಿದೆ

#### ✅ ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಪ سروפּ

- [ ] ಟೆಂಪ್ಲೆಟ್‌ಗಳಲ್ಲಿ ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್ ಕಂಫಿಗರ್ ಮಾಡಲಾಗಿದೆ
- [ ] ಲಾಗ್ ಅನಾಲಿಟಿಕ್ಸ್ ಕಾರ್ಯಸ್ಥಳ ಪ್ಲಾನ್ ಮಾಡಲಾಗಿದೆ
- [ ] ಪ್ರಮುಖ ಮетрಿಕ್‌ಗಳಿಗಾಗಿ ಅಲರ್ಟ್ ನಿಯಮಗಳು ವ್ಯಾಖ್ಯಾನಿಸಲಾಗಿದೆ
- [ ] ಅಪ್ಲಿಕೇಶನ್‌ಗಳಲ್ಲಿ ಆರೋಗ್ಯ ಪರಿಶೀಲನೆ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಜಾರಿಗೊಳಿಸಲಾಗಿದೆ

#### ✅ ಬ್ಯಾಕಪ್ ಮತ್ತು ಪುನಃಪಡೆಯಿಕೆ
- [ ] ಡೇಟಾ ಸಂಪನ್ಮೂಲಗಳಿಗೆ ಬ್ಯಾಕಪ್ ತಂತ್ರವನ್ನು ವ್ಯಾಖ್ಯಾನಿಸಲಾಗಿದೆ
- [ ] ಪುನಃಪ್ರಾಪ್ತ ಸಮಯ ಉದ್ದೇಶಗಳು (RTO) ದಾಖಲಿಸಲಾಗಿದೆ
- [ ] ಪುನಃಪ್ರಾಪ್ತ ಬಿಂದು ಉದ್ದೇಶಗಳು (RPO) ದಾಖಲಾಗಿದೆ
- [ ] ಉತ್ಪಾದನೆಗಾಗಿ ವಿಪತ್ತು ಪುನಃಪಡೆಯಿಕೆ ಯೋಜನೆ ಇದೆ

---

## ಪರಿಸರ ಪರಿಶೀಲನೆ

### ಅಭಿವೃದ್ಧಿ ಪರಿಸರ ಪರಿಶೀಲನೆ

```bash
#!/bin/bash
# ಅಭಿವೃದ್ಧಿ ಪರಿಸರಕ್ಕೆ ವಿಶೇಷವಾದ ಪರಿಶೀಲನೆಗಳು

validate_dev_environment() {
    echo "=== Development Environment Validation ==="
    
    # ಅಭಿವೃದ್ಧಿ ಸ್ನೇಹಿ ಸಂರಚನೆಗಳ ಪರಿಶೀಲನೆ
    if grep -q "sku.*Free\|sku.*F1\|sku.*Basic" infra/*.bicep; then
        echo "✓ Development-appropriate SKUs detected"
    else
        echo "⚠ Consider using lower-cost SKUs for development"
    fi
    
    # ಸ್ವಯಂಚಾಲಿತ-shutdown ಸಂರಚನೆಗಳ ಪರಿಶೀಲನೆ
    if grep -q "autoShutdown\|deallocate" infra/*.bicep; then
        echo "✓ Auto-shutdown configuration found"
    else
        echo "ℹ Consider adding auto-shutdown for cost savings"
    fi
    
    # ಅಭಿವೃದ್ಧಿ ಡೇಟಾಬೇಸ್ ಸಂರಚನೆಗಳ ನಿರ್ವಹಣೆ
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
# ಉತ್ಪಾದನಾ ಪರಿಸರಕ್ಕೆ ವಿಶೇಷವಾದ ಮಾನ್ಯತೆಗಳು

validate_prod_environment() {
    echo "=== Production Environment Validation ==="
    
    # ಉಚ್ಛ ಲಭ್ಯತೆಯ ಸಂರಚನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
    if grep -q "zoneRedundant.*true\|Premium\|Standard_GRS" infra/*.bicep; then
        echo "✓ High availability configurations detected"
    else
        echo "⚠ Consider enabling high availability for production"
    fi
    
    # ಬ್ಯಾಕಪ್ ಸಂರಚನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
    if grep -q "backup\|retention\|pointInTimeRestore" infra/*.bicep; then
        echo "✓ Backup configurations found"
    else
        echo "⚠ Ensure backup strategies are implemented"
    fi
    
    # ನಿಗಾ ವ್ಯವಸ್ಥೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
    if grep -q "Microsoft.Insights\|Application_Type.*web" infra/*.bicep; then
        echo "✓ Monitoring and observability configured"
    else
        echo "⚠ Add comprehensive monitoring for production"
    fi
    
    # ಭದ್ರತಾ ಸಂರಚನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
    if grep -q "Microsoft.KeyVault\|managedIdentity\|httpsOnly.*true" infra/*.bicep; then
        echo "✓ Security best practices implemented"
    else
        echo "⚠ Review security configurations for production"
    fi
}
```

---

## ಸಂಪನ್ಮೂಲ ಪರಿಶೀಲನೆ

### ಕೋಟ್ ಪರಿಶೀಲನೆ ಸ್ಕ್ರಿಪ್ಟ್

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
    
    # ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್‌ನಲ್ಲಿ ಸಂಗ್ರಹ ಖಾತೆಗಳನ್ನು ಪಡೆಯಿರಿ
    accounts = run_command(['az', 'storage', 'account', 'list'])
    
    if accounts is None:
        print("❌ Could not retrieve storage account information")
        return False
    
    account_count = len(accounts)
    max_accounts = 250  # ಡೀಫಾಲ್ಟ್ ಅಜುರ್ ಮಿತಿ
    
    usage_percent = (account_count / max_accounts) * 100
    status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
    
    print(f"{status} Storage Accounts: {account_count}/{max_accounts} ({usage_percent:.1f}%)")
    
    return usage_percent < 95

def check_network_limits(location: str) -> bool:
    """Check network-related limits"""
    print(f"\n=== Network Limits Check ({location}) ===")
    
    # ವರ್ಚುವಲ್ ನೆಟ್ವರ್ಕ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
    vnets = run_command(['az', 'network', 'vnet', 'list'])
    if vnets is not None:
        vnet_count = len(vnets)
        print(f"✅ Virtual Networks: {vnet_count}/1000")
    
    # ಸಾರ್ವಜನಿಕ IP ವಿಳಾಸಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
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
    
    # ಪರಿಶೀಲನೆಗಳನ್ನು ನಡೆಸಿ
    all_passed &= check_compute_quotas(location)
    all_passed &= check_storage_limits(location)
    all_passed &= check_network_limits(location)
    
    # ಸಾರಾಂಶ
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

## ಭದ್ರತೆ ಮತ್ತು ಅನುಕೂಲತೆ ಪರಿಶೀಲನೆ

### ಭದ್ರತೆ ಪರಿಶೀಲನೆ ಸ್ಕ್ರಿಪ್ಟ್

```bash
#!/bin/bash
# AZD ನಿಯೋಜನೆಗಳಿಗಾಗಿ ಭದ್ರತೆ ಮತ್ತು ಅನುಕೂಲ ಪರಿಶೀಲನೆ

check_security_practices() {
    echo "=== Security Best Practices Check ==="
    
    local issues_found=0
    
    # ಕೀ ವಾಲ್ಟ್ ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
    if grep -r "Microsoft.KeyVault" infra/ >/dev/null 2>&1; then
        echo "✅ Key Vault detected in infrastructure"
    else
        echo "⚠️  Key Vault not found - consider using for secrets management"
        ((issues_found++))
    fi
    
    # ನಿರ್ವಹಿತ ಗುರುತು ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
    if grep -r "managedIdentity\|SystemAssigned\|UserAssigned" infra/ >/dev/null 2>&1; then
        echo "✅ Managed Identity configuration detected"
    else
        echo "⚠️  Managed Identity not found - consider using for service authentication"
        ((issues_found++))
    fi
    
    # HTTPS ಅನುವ್ರುತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
    if grep -r "httpsOnly.*true\|requireHttps.*true" infra/ >/dev/null 2>&1; then
        echo "✅ HTTPS enforcement detected"
    else
        echo "⚠️  HTTPS enforcement not found - ensure secure connections"
        ((issues_found++))
    fi
    
    # ಕನಿಷ್ಠ TLS ಆವೃತ್ತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
    if grep -r "minimumTlsVersion.*'TLS1_2'" infra/ >/dev/null 2>&1; then
        echo "✅ Minimum TLS 1.2 configuration detected"
    else
        echo "⚠️  Minimum TLS version not specified - consider requiring TLS 1.2+"
        ((issues_found++))
    fi
    
    # ಸಾರ್ವಜನಿಕ ಪ್ರವೇಶ ನಿರ್ಬಂಧಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
    if grep -r "allowBlobPublicAccess.*false\|publicNetworkAccess.*Disabled" infra/ >/dev/null 2>&1; then
        echo "✅ Public access restrictions detected"
    else
        echo "⚠️  Public access restrictions not found - consider limiting public access"
        ((issues_found++))
    fi
    
    # ನೆಟ್ವರ್ಕ್ ಭದ್ರತಾ ಗುಂಪುಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
    if grep -r "Microsoft.Network/networkSecurityGroups" infra/ >/dev/null 2>&1; then
        echo "✅ Network Security Groups detected"
    else
        echo "ℹ️  Network Security Groups not found - may be acceptable depending on architecture"
    fi
    
    return $issues_found
}

check_compliance_requirements() {
    echo -e "\n=== Compliance Requirements Check ==="
    
    # ಡೇಟಾ ಗುಪ್ತೀಕರಣವನ್ನು ಪರಿಶೀಲಿಸಿ
    if grep -r "encryption\|encryptionAtRest\|transparentDataEncryption" infra/ >/dev/null 2>&1; then
        echo "✅ Encryption configurations detected"
    else
        echo "⚠️  Encryption configurations not found - ensure data is encrypted"
    fi
    
    # ಅಡಿಟ್ ಲಾಗ್ ಪರಿಶೀಲನೆ
    if grep -r "Microsoft.Insights.*auditingSettings\|diagnosticSettings" infra/ >/dev/null 2>&1; then
        echo "✅ Audit logging configurations detected"
    else
        echo "⚠️  Audit logging not found - consider enabling for compliance"
    fi
    
    # ಬ್ಯಾಕಪ್ ಮತ್ತು ಸಂರಕ್ಷಣೆ ನೀತಿಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
    if grep -r "backup.*Policy\|retentionPolicy\|retention.*Days" infra/ >/dev/null 2>&1; then
        echo "✅ Backup and retention policies detected"
    else
        echo "⚠️  Backup/retention policies not found - required for data governance"
    fi
}

# ಪ್ರಮುಖ ಕಾರ್ಯಾಂವತಿ
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

## CI/CD ಇಂಟಿಗ್ರೇಶನ್

### GitHub ಕ್ರಿಯೆಗಳ ಸಂಯೋಜನೆ

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

### ಆಜರ್ ಡೆವ್ಓಪ್ಸ್ ಇಂಟಿಗ್ರೇಶನ್

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

## ಉತ್ತಮ ಅಭ್ಯಾಸಗಳ ಸಾರಾಂಶ

### ✅ ಪೂರ್ವ-ಯಾತ್ರೆ ಪರಿಶೀಲನೆ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

1. **ಸ್ವಯಂಚಾಲಿತಗೊಳಿಸಿ ಸಾಧ್ಯವಾದಷ್ಟು**
   - CI/CD ಪೈಪ್ಲೈನ್‌ಗಳಲ್ಲಿ ಪರಿಶೀಲನೆಗಳನ್ನು ಇಂಟಿಗ್ರೇಟ್ ಮಾಡಿ
   - ಪುನರಾವರ್ತನೆಯ ಪರೀಕ್ಷೆಗಳಿಗೆ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳನ್ನು ಬಳಸಿ
   - ಪರಿಶೀಲನೆ ಫಲಿತಾಂಶಗಳನ್ನು ಪರಿಶೀಲನಾ ದೃಢಪಡಿಸಲು ಸಂರಕ್ಷಿಸಿ

2. **ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ಪರಿಶೀಲನೆ**
   - ಅಭಿವೃದ್ಧಿ/ಸ್ಟೇಜಿಂಗ್/ಉತ್ಪಾದನೆಗೆ ವಿಭಿನ್ನ ಪರೀಕ್ಷೆಗಳು
   - ಪ್ರತಿ ಪರಿಸರಕ್ಕೆ ಸೂಕ್ತ ಭದ್ರತಾ ಅಗತ್ಯಗಳು
   - ಉಳಿದ ಪರಿಸರಗಳಿಗೆ ವೆಚ್ಚದ ಆತ್ಮಕಷ್ಟುಮ

3. **ಸಂಪೂರ್ಣ ಕವಚ**
   - ಪ್ರಾಮಾಣೀಕರಣ ಮತ್ತು ಅನುಮತಿಗಳು
   - ಸಂಪನ್ಮೂರು ಕೋಟ್ ಮತ್ತು ಲಭ್ಯತೆ
   - ಟೆಂಪ್ಲೆಟ್ ಪರಿಶೀಲನೆ ಮತ್ತು ವ್ಯಾಕರಣ
   - ಭದ್ರತೆ ಮತ್ತು ಅನುಕೂಲತೆ ಅಗತ್ಯಗಳು

4. **ಸ್ವಚ್ಚ ವರದಿ ನೀಡುವುದು**
   - ಬಣ್ಣ ಸಂಕೇತಿತ ಸ್ಥಿತಿ ಸೂಚಕಗಳು
   - ಪರಿಹಾರ ಕ್ರಮಗಳೊಂದಿಗೆ ವಿವರವಾದ ದೋಷ ಸಂದೇಶಗಳು
   - ತ್ವರಿತ ಮೌಲ್ಯಮಾಪನಕ್ಕಾಗಿ ಸಾರಾಂಶ ವರದಿ

5. **ವಿಫಲವಾಗುವುದು ವೇಗವಾಗಿ**
   - ಪ್ರಮುಖ ಪರೀಕ್ಷೆಗಳು ವಿಫಲವಾಗುವಲ್ಲಿ ನಿಯೋಜನೆ ನಿಲ್ಲಿಸು
   - ಪರಿಹಾರಕ್ಕಾಗಿ ಸರಳ ಮಾರ್ಗದರ್ಶನ ಒದಗಿಸು
   - ಪರೀಕ್ಷೆಗಳನ್ನು ಸರಳವಾಗಿ ಮರುಚಲಾಯಿಸಬಹುದು

### ಸಾಮಾನ್ಯ ಪೂರ್ವ-ಯಾತ್ರೆ ದೋಷಗಳು

1. "ತ್ವರಿತ" ನಿಯೋಜನೆಗಳಿಗಾಗಿ ಪರಿಶೀಲನೆ ಬಿಟ್ಟುಹಾಕುವುದು
2. ನಿಯೋಜನೆಯ ಮೊದಲು ಅನುಮತಿಗಳ ಅವ್ಯವಸ್ಥೆ ಪರಿಶೀಲನೆ ಇಲ್ಲ
3. ನಿಯೋಜನೆ ವಿಫಲವಾಗುವವರೆಗೆ ಕೋಟ್ ಸೀಮಿತಗಳನ್ನು ನಿರ್ಲಕ್ಷಿಸುವುದು
4. CI/CD ಪೈಪ್ಲೈನ್ಗಳಲ್ಲಿ ಟೆಂಪ್ಲೆಟ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸದಿರುವುದು
5. ಉತ್ಪಾದನಾ ಪರಿಸರಗಳಿಗೆ ಭದ್ರತೆ ಪರಿಶೀಲನೆ ನೀಡದಿರುವುದು
6. ಅತಿಯಾದ ವೆಚ್ಚ ಅಂದಾಜು, ಬಜೆಟ್ ಆಘಾತಗಳಿಗೆ ಹಾದಿ ಮಾಡುವುದು

---

**ಪ್ರೋ ಟಿಪ್**: ನಿಜವಾದ ನಿಯೋಜನೆ ಕೆಲಸಕ್ಕೆ ಮುನ್ನ ನಿಮ್ಮ CI/CD ಪೈಪ್ಲೈನಿನಲ್ಲಿ ಪೂರ್ವ-ಯಾತ್ರೆ ಪರಿಶೀಲನೆ ಕಾರ್ಯವನ್ನು ಪ್ರತ್ಯೇಕವಾಗಿ ನಡೆಸಿ. ಇದು ಸಮಸ್ಯೆಗಳನ್ನು ಬೇಗ ಹಿಡಿದುಕೊಳ್ಳಲು ಸಹಾಯಮಾಡುತ್ತದೆ ಮತ್ತು ಡೆವಲಪರ್‌ಗಳಿಗೆ ತ್ವರಿತ ಪ್ರತಿಕ್ರಿಯೆಯನ್ನು ಒದಗಿಸುತ್ತದೆ.

---

**ನ್ಯಾವಿಗೇಶನ್**
- **ಹಿಂದಿನ ಪಾಠ**: [SKU ಆಯ್ಕೆ](sku-selection.md)
- **ಮುಂದಿನ ಪಾಠ**: [ಚೀಟ್ ಶೀಟ್](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ತ್ಯಜ್ಯತೆ**:  
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಗೆ ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ತಪ್ಪುಗಳು ಅಥವಾ ಅತಿವಿಶ್ಲೇಷಣೆಯಾಗಬಹುದು ಎನ್ನುವದನ್ನು ತಿಳಿದುಕೊಳ್ಳಿ. મૂળ ದಸ್ತಾವೇಜನ್ನು ಅದರ ಸ್ವಾಭಾವಿಕ ಭಾಷೆಯಲ್ಲಿ ಪ್ರಾಧಿಕೃತ ಮೂಲ ಎಂದು ಪರಿಗಣಿಸಬೇಕಾಗಿದ್ದು, ಮಹತ್ವಪೂರ್ಣ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ. ಈ ಅನುವಾದದಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಬಗೆಹರಿಸುವಿಕೆಗೆ ಅಥವಾ ಅರ್ಥಭ್ರಮೆಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
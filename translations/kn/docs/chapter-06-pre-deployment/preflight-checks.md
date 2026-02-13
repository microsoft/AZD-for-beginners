# AZD ನಿಯೋಜನೆಗಳ ಪೂರ್ವ ತಪಾಸಣೆಗಳು

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD ಪ್ರಾರಂಭಿಕರಿಗೆ](../../README.md)
- **📖 ಹಾಲಿನ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 6 - ಪೂರ್ವ-ನಿಯೋಜನೆ ಪರಿಶೀಲನೆ ಮತ್ತು ಯೋಜನೆ
- **⬅️ ಹಿಂದಿನ**: [SKU ಆಯ್ಕೆ](sku-selection.md)
- **➡️ ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 7: ಸಮಸ್ಯೆ ಪರಿಹಾರ](../chapter-07-troubleshooting/common-issues.md)
- **🔧 ಸಂಬಂಧಿಸಿದದ್ದು**: [ಅಧ್ಯಾಯ 4: ನಿಯೋಜನೆ ಮಾರ್ಗದರ್ಶಿ](../chapter-04-infrastructure/deployment-guide.md)

## ಪರಿಚಯ

ಈ ವ್ಯಾಪಕ ಮಾರ್ಗದರ್ಶಿಕೆ ಪೂರ್ವ-ನಿಯೋಜನೆ ಪರಿಶೀಲನೆ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳನ್ನೂ ಮತ್ತು ಪ್ರಕ್ರಿಯೆಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ, ಇದು Azure Developer CLI ನಿಯೋಜನೆಗಳು ಆರಂಭವಾಗುವ ಮೊದಲು ಯಶಸ್ವಿಯಾಗುವಂತೆ ಖಚಿತಪಡಿಸುತ್ತದೆ. ಪ್ರಮಾಣೀಕರಣ, ಸಂಪನ್ಮೂಲ ಲಭ್ಯತೆ, ಕೋಟಾಗಳು, ಭದ್ರತಾ ಅನುಪಾಲನೆ ಮತ್ತು ಕಾರ್ಯಕ್ಷಮತಾ ಅವಶ್ಯಕತೆಗಳಿಗೆ ಸ್ವಯಂಚಾಲಿತ ತಪಾಸಣೆಗಳನ್ನು ಜಾರಿಗೆ ತರಲು ಕಲಿಯಿರಿ, ಇದರಿಂದ ನಿಯೋಜನೆ ವೈಫಲ್ಯಗಳನ್ನು ತಡೆಯಬಹುದು ಮತ್ತು ನಿಯೋಜನೆ ಯಶಸ್ಸಿನ ದರಗಳನ್ನು ಒತ್ತಾಯಿಸಬಹುದು.

## ಕಲಿಕೆಯ ಗುರಿಗಳು

By completing this guide, you will:
- ಸ್ವಯಂಚಾಲಿತ ಪೂರ್ವ-ನಿಯೋಜನೆ ಪರಿಶೀಲನೆ ತಂತ್ರಗಳು ಮತ್ತು ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳಲ್ಲಿ ನಿಪುಣರಾಗುವುದು
- ಪ್ರಮಾಣೀಕರಣ, ಅನುಮತಿಗಳು ಮತ್ತು ಕೋಟಾಗಳಿಗಾಗಿ ಸಮಗ್ರ ತಪಾಸಣಾ ತಂತ್ರಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು
- ಸಂಪನ್ಮೂಲ ಲಭ್ಯತೆ ಮತ್ತು ಸಾಮರ್ಥ್ಯ ಪರಿಶೀಲನೆ ಪ್ರಕ್ರಿಯೆಗಳನ್ನು ಜಾರಿಗೆ ತರುವುದು
- ಸಂಸ್ಥೆಯ ನೀತಿಗಳಿಗೆ ಸುರಕ್ಷತೆ ಮತ್ತು ಅನುಪಾಲನೆ ಪರಿಶೀಲನೆಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡುವುದು
- ಖರ್ಚು ಅಂದಾಜು ಮತ್ತು ಬಜೆಟ್ ಪರಿಶೀಲನೆ ಕಾರ್ಯಪ್ರವಾಹಗಳನ್ನು ವಿನ್ಯಾಸಗೊಳಿಸುವುದು
- CI/CD ಪೈಪ್‌ಲೈನ್ಗಳಿಗಾಗಿ ಕಸ್ಟಮ್ ಪೂರ್ವ-ಪರೀಕ್ಷೆ ಸ್ವಯಂಕರಣ ರಚಿಸುವುದು

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

Upon completion, you will be able to:
- ಸಮಗ್ರ ಪೂರ್ವ-ಫ್ಲೈಟ್ ಪರಿಶೀಲನೆ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳನ್ನು ರಚಿಸಿ ಮತ್ತು ನಿರ್ವಹಿಸಬಹುದು
- ವಿವಿಧ ನಿಯೋಜನೆ ಪರಿಸ್ಥಿತಿಗಳಿಗಾಗಿ ಸ್ವಯಂಚಾಲಿತ ತಪಾಸಣಾ ಕಾರ್ಯಪ್ರವಾಹಗಳನ್ನು ವಿನ್ಯಾಸಗೊಳಿಸಬಹುದು
- ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ಪರಿಶೀಲನೆ ಪ್ರಕ್ರಿಯೆಗಳು ಮತ್ತು ನೀತಿಗಳನ್ನು ಜಾರಿಗೆ ತರುತ್ತೀರಿ
- ನಿಯೋಜನೆ ತಯಾರಿತಿಗೆ ಪ್ರೋತ್ಸಾಹಕ_monitoring_ ಮತ್ತು ಎಚ್ಚರಿಕೆಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಬಹುದು
- ಪೂರ್ವ-ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳನ್ನು ತಿದ್ದುಪಡಿಸಿ ಮತ್ತು ಪರಿಹಾರಗಳನ್ನು ಜಾರಿಗೆ ತರುತ್ತೀರಿ
- ಪೂರ್ವ-ಫ್ಲೈಟ್ ಪರಿಶೀಲನೆಗಳನ್ನು DevOps ಪೈಪ್‌ಲೈನ್ಗಳಿಗೆ ಮತ್ತು ಸ್ವಯಂಕರಣ ಕಾರ್ಯಪ್ರವಾಹಗಳಿಗೆ ಸಂಯೋಜಿಸಬಹುದು

## ವಿಷಯಸೂಚಿ

- [ಅವಲೋಕನ](../../../../docs/chapter-06-pre-deployment)
- [ಸ್ವಯಂಚಾಲಿತ ಪೂರ್ವ-ಪರೀಕ್ಷಾ ಸ್ಕ್ರಿಪ್ಟ್](../../../../docs/chapter-06-pre-deployment)
- [ಕೈಯ ಪರಿಶೀಲನೆ ಚೆಕ್‌ಲಿಸ್ಟ್](../../../../docs/chapter-06-pre-deployment)
- [ಪರಿಸರ ಪರಿಶೀಲನೆ](../../../../docs/chapter-06-pre-deployment)
- [ಸಂಪನ್ಮೂಲ ಪರಿಶೀಲನೆ](../../../../docs/chapter-06-pre-deployment)
- [ಭದ್ರತೆ ಮತ್ತು ಅನುಪಾಲನೆ ಪರಿಶೀಲನೆಗಳು](../../../../docs/chapter-06-pre-deployment)
- [ಕಾರ್ಯಕ್ಷಮತೆ ಮತ್ತು ಸಾಮರ್ಥ್ಯ ಯೋಜನೆ](../../../../docs/chapter-06-pre-deployment)
- [ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳ ಪರಿಹಾರ](../../../../docs/chapter-06-pre-deployment)

---

## ಅವಲೋಕನ

ಪೂರ್ವ-ಫ್ಲೈಟ್ ತಪಾಸಣೆಗಳು ನಿಯೋಜಿಸುವ ಮುನ್ನ ನಡೆಸುವ ಅಗತ್ಯ ಪರೀಕ್ಷೆಗಳಾಗಿವೆ, ಅವುಗಳು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಲು ನೆರವಾಗುತ್ತವೆ:

- **ಸಂಪನ್ಮೂಲ ಲಭ್ಯತೆ** ಮತ್ತು ಗುರಿ ಪ್ರಾಂತ್ಯಗಳಲ್ಲಿ ಕೋಟಾಗಳು
- **ಪ್ರಮಾಣೀಕರಣ ಮತ್ತು ಅನುಮತಿಗಳು** ಸರಿಯಾಗಿ ಸಂರಚಿಸಲ್ಪಟ್ಟಿವೆ
- **ಟೆಂಪ್ಲೇಟ್ ಮಾನ್ಯತೆ** ಮತ್ತು ಪ್ಯಾರಾಮೀಟರ್ ಸರಿಯಾಗಿವೆ
- **ಜಾಲತಂತ್ರ ಸಂಪರ್ಕತೆ** ಮತ್ತು ಅವಲಂಬಿತಗಳು
- **ಸುರಕ್ಷತಾ ಅನುಪಾಲನೆ** ಸಂಸ್ಥೆಯ ನೀತಿಗಳಿಗೆ ಅನುಗುಣವಾಗಿರುವುದು
- **ಖರ್ಚು ಅಂದಾಜು** ಬಜೆಟ್ ಮಿತಿಗಳಲ್ಲಿದೆ

### ಪೂರ್ವ-ಪರೀಕ್ಷೆಗಳನ್ನು ಯಾವಾಗ ನಡೆಸಬೇಕು

- **ಹೊಸ ಪರಿಸರಕ್ಕೆ** ಮೊದಲ ನಿಯೋಜನೆಯ ಮೊದಲು
- **ಗಂಭೀರ ಟೆಂಪ್ಲೇಟ್ ಬದಲಾವಣೆಗಳ ನಂತರ**
- **ಉತ್ಪಾದನಾ ನಿಯೋಜನೆಗಳ ಮೊದಲು**
- **Azure ಪ್ರಾಂತ್ಯಗಳನ್ನು ಬದಲಾಯಿಸುವಾಗ**
- **CI/CD ಪೈಪ್‌ಲೈನ್ಗಳ的一 ಭಾಗವಾಗಿ**

---

## ಸ್ವಯಂಚಾಲಿತ ಪೂರ್ವ-ಪರೀಕ್ಷಾ ಸ್ಕ್ರಿಪ್ಟ್

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
    
    # AZD ಸ್ಥಾಪನೆ ಪರಿಶೀಲಿಸಿ
    try {
        $azdVersion = azd version --output json | ConvertFrom-Json
        Write-Status "AZD CLI installed" "Success" "Version: $($azdVersion.azd.version)"
    }
    catch {
        Write-Status "AZD CLI not found" "Error" "Install from https://aka.ms/azd-install"
        return $false
    }
    
    # Azure CLI ಸ್ಥಾಪನೆ ಪರಿಶೀಲಿಸಿ
    try {
        $azVersion = az version --output json | ConvertFrom-Json
        Write-Status "Azure CLI installed" "Success" "Version: $($azVersion.'azure-cli')"
    }
    catch {
        Write-Status "Azure CLI not found" "Error" "Install from https://aka.ms/azcli"
        return $false
    }
    
    # PowerShell ಆವೃತ್ತಿ ಪರಿಶೀಲಿಸಿ
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
        # AZD ಪ್ರಾಮಾಣೀಕರಣ ಪರಿಶೀಲಿಸಿ
        $azdAuth = azd auth login --check-status --output json 2>$null | ConvertFrom-Json
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
        }
        else {
            Write-Status "AZD authentication" "Error" "Run 'azd auth login'"
            return $false
        }
        
        # Azure CLI ಪ್ರಾಮಾಣೀಕರಣ ಪರಿಶೀಲಿಸಿ
        $azAccount = az account show --output json | ConvertFrom-Json
        Write-Status "Azure CLI authentication" "Success" "Subscription: $($azAccount.name)"
        
        # ಸಬ್ಸ್ಕ್ರಿಪ್ಶನ್ ಪ್ರವೇಶವನ್ನು ಪರಿಶೀಲಿಸಿ
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
        # ಪ್ರಸ್ತುತ ಬಳಕೆದಾರನ ಪಾತ್ರ ನಿಯೋಜನೆಗಳನ್ನು ಪಡೆಯಿ
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
        
        # ಸಂಪನ್ಮೂಲ ಗುಂಪಿನ ರಚನೆಯನ್ನು ಪರೀಕ್ಷಿಸಿ (ನಿರ್ದಿಷ್ಟಪಡಿಸಿದಲ್ಲಿ)
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # ಸಂಪನ್ಮೂಲ ಗುಂಪನ್ನು ರಚಿಸುವ ಸಾಮರ್ಥ್ಯವನ್ನು ಪರೀಕ್ಷಿಸಿ
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
        # ಕಂಪ್ಯೂಟ್ ಕ್ವೋಟಾಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
        $computeUsage = az vm list-usage --location $Location --output json | ConvertFrom-Json
        
        # ನಿರ್ದಿಷ್ಟ ಕ್ವೋಟಾಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
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
        
        # App Service ಮಿತಿಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
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
        
        # ಸ್ಟೋರೇಜ್ ಅಕೌಂಟ್ ಮಿತಿಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
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
        return $true # ಅಡ್ಡಿಪಡಿಸುವುದಿಲ್ಲ
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
    
    # DNS ಪರಿಹಾರವನ್ನು ಪರೀಕ್ಷಿಸಿ
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
    
    # azure.yaml ಅಸ್ತಿತ್ವದಲ್ಲಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ
    if (Test-Path "azure.yaml") {
        Write-Status "azure.yaml found" "Success"
        
        # azure.yaml ಅನ್ನು ಪಾರ್ಸ್ ಮಾಡಿ
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
    
    # ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಫೈಲ್‌ಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ
    if (Test-Path "infra") {
        $bicepFiles = Get-ChildItem -Path "infra" -Filter "*.bicep" -Recurse
        if ($bicepFiles.Count -gt 0) {
            Write-Status "Infrastructure templates" "Success" "$($bicepFiles.Count) Bicep files found"
            
            # main.bicep ಅಸ್ತಿತ್ವದಲ್ಲಿದ್ದರೆ ಮಾನ್ಯಗೊಳಿಸಿ
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
    
    # 🧪 ಹೊಸ: ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಪೂರ್ವದರ್ಶನವನ್ನು ಪರೀಕ್ಷಿಸಿ (ಸುರಕ್ಷಿತ ಡ್ರೈ-ರನ್)
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
        # ಸ್ಥಳ ಮಾನ್ಯವಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ
        $locations = az account list-locations --output json | ConvertFrom-Json
        $validLocation = $locations | Where-Object { $_.name -eq $Location -or $_.displayName -eq $Location }
        
        if ($validLocation) {
            Write-Status "Azure region" "Success" "Location '$Location' is valid"
        }
        else {
            Write-Status "Azure region" "Error" "Location '$Location' is not valid"
            return $false
        }
        
        # ಪ್ರಾಂತ್ಯದಲ್ಲಿ ಸೇವಾ ಲಭ್ಯತೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
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
    
    # ಮೂಲಭೂತ ವೆಚ್ಚ ಅಂದಾಜು (ನಿಖರ ಅಂದಾಜುಗಳಿಗೆ Azure ಪ್ರೈಸಿಂಗ್ API ಅಗತ್ಯ)
    Write-Status "Cost estimation" "Info" "Use Azure Pricing Calculator for detailed estimates"
    Write-Status "Monitoring setup" "Info" "Set up Azure Cost Management alerts"
    
    # ಬಜೆಟ್ ಅಸ್ತಿತ್ವದಲ್ಲಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ
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
        # Key Vault ಸಂರಚಿಸಲಾಗಿದೆ ಎಂದು ಪರಿಶೀಲಿಸಿ
        if (Select-String -Path "infra/*.bicep" -Pattern "Microsoft.KeyVault" -Quiet) {
            Write-Status "Key Vault usage" "Success" "Key Vault detected in templates"
        }
        else {
            Write-Status "Key Vault usage" "Warning" "Consider using Key Vault for secrets"
        }
        
        # ಮ್ಯಾನೇಜ್ಡ್ ಐಡೆಂಟಿಟಿ ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
        if (Select-String -Path "infra/*.bicep" -Pattern "managedIdentity|SystemAssigned" -Quiet) {
            Write-Status "Managed Identity" "Success" "Managed Identity detected"
        }
        else {
            Write-Status "Managed Identity" "Warning" "Consider using Managed Identity"
        }
        
        # HTTPS ಜಾರಿಗೆ ಇಡಲಾಗಿದೆ ಎಂದು ಪರಿಶೀಲಿಸಿ
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

# ಪ್ರಿ-ಫ್ಲೈಟ್ ಪರಿಶೀಲನೆಯನ್ನು ನಡೆಸಿ
Invoke-PreflightCheck
```

### Bash Pre-flight Checker

```bash
#!/bin/bash
# Unix/Linux ವ್ಯವಸ್ಥೆಗಳಿಗೆ ಮುಂಚಿತ ತಪಾಸಣೆಗಳ Bash ಆವೃತ್ತಿ

set -euo pipefail

# ಬಣ್ಣ ಕೋಡ್‌ಗಳು
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # ಬಣ್ಣವಿಲ್ಲ

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
    
    # AZD ಪ್ರಮಾಣೀಕರಣ ಪರಿಶೀಲಿಸಿ
    if azd auth login --check-status >/dev/null 2>&1; then
        local principal_name=$(azd auth login --check-status --output json 2>/dev/null | jq -r '.principalName // "Unknown"')
        print_status "AZD authentication" "success" "User: $principal_name"
    else
        print_status "AZD authentication" "error" "Run 'azd auth login'"
        return 1
    fi
    
    # Azure CLI ಪ್ರಮಾಣೀಕರಣ ಪರಿಶೀಲಿಸಿ
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
        
        # ಮೂಲಭೂತ YAML ಮಾನ್ಯತಾ ಪರಿಶೀಲನೆ
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
    
    # ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಕಡತಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
    if [[ -d "infra" ]]; then
        local bicep_count=$(find infra -name "*.bicep" | wc -l)
        if [[ $bicep_count -gt 0 ]]; then
            print_status "Infrastructure templates" "success" "$bicep_count Bicep files found"
            
            # main.bicep ಇದ್ದರೆ ಮಾನ್ಯಗೊಳಿಸಿ
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
    
    # ಸ್ಥಳವು ಮಾನ್ಯವೋ ಎಂದು ಪರಿಶೀಲಿಸಿ
    if az account list-locations --query "[?name=='$LOCATION' || displayName=='$LOCATION']" --output tsv | grep -q .; then
        print_status "Azure region" "success" "Location '$LOCATION' is valid"
    else
        print_status "Azure region" "error" "Location '$LOCATION' is not valid"
        return 1
    fi
    
    # ಸೇವೆ ಲಭ್ಯತೆ ಪರಿಶೀಲಿಸಿ
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
    # ಕಮಾಂಡ್ ಲೈನ್ ಆರ್ಗ್ಯುಮೆಂಟ್‌ಗಳನ್ನು ವಿಶ್ಲೇಷಿಸಿ
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
    
    # ಅವಶ್ಯಕ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
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
    
    # ಪರಿಶೀಲನೆಗಳನ್ನು ನಡೆಸಿ
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

# ಮುಖ್ಯ ಕಾರ್ಯವನ್ನು ನಡೆಸಿ
main "$@"
```

---

## ಕೈಯ ಪರಿಶೀಲನೆ ಚೆಕ್‌ಲಿಸ್ಟ್

### ಪೂರ್ವ-ನಿಯೋಜನೆ ಚೆಕ್‌ಲಿಸ್ಟ್

ಈ ಚೆಕ್‌ಲಿಸ್ಟ್ ಅನ್ನು ಮುದ್ರಿಸಿ ಮತ್ತು ನಿಯೋಜನೆಗೂ ಮುನ್ನ ಪ್ರತಿಯೊಂದು ಐಟಮ್ ಅನ್ನು ಪರಿಶೀಲಿಸಿ:

#### ✅ ಪರಿಸರ ಸೆಟ್‌ಅಪ್
- [ ] AZD CLI ಸ್ಥಾಪಿತವಾಗಿದ್ದು ತಾಜಾ ಆವೃತ್ತಿಗೆ ನವೀಕರಿಸಲಾಗಿದೆ
- [ ] Azure CLI ಸ್ಥಾಪಿತ ಆಗಿದ್ದು ಪ್ರಾಮಾಣೀಕರಿಸಲಾಗಿದೆ
- [ ] ಸರಿಯಾದ Azure ಸಬ್ಸ್ಕ್ರಿಪ್ಶನ್ ಆಯ್ಕೆಮಾಡಲಾಗಿದೆ
- [ ] ಪರಿಸರದ ಹೆಸರು ಅನನ್ಯವಾಗಿದ್ದು ನಾಮಕರಣ ನಿಯಮಗಳನ್ನು ಅನುಸರಿಸುತ್ತದೆ
- [ ] ಗುರಿ ಸಂಪನ್ಮೂಲ ಗುಂಪು ಗುರುತಿಸಲಾಗಿದೆ ಅಥವಾ ಸೃಷ್ಟಿಸಲಾಗಬಹುದು

#### ✅ Authentication & Permissions
- [ ] ಯಶಸ್ವಿಯಾಗಿ `azd auth login` ಮೂಲಕ ಪ್ರಮಾಣೀಕರಿಸಲಾಗಿದೆ
- [ ] ಬಳಕೆದಾರನಿಗೆ ಗುರಿ ಸಬ್ಸ್ಕ್ರಿಪ್ಶನ್/ಸಂಪನ್ಮೂಲ ಗುಂಪಿನಲ್ಲಿ Contributor ಪಾತ್ರ ಇದೆ
- [ ] CI/CD (ಬಳಕೆ ಇದ್ದರೆ)ಗಾಗಿ Service Principal ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿದೆ
- [ ] ಕಾಲಹರಣಗೊಂಡ ಪ್ರಮಾಣಪತ್ರಗಳು ಅಥವಾ ಮಾನ್ಯತೆಗಳಿಲ್ಲ

#### ✅ Template Validation
- [ ] `azure.yaml` ಇದೆ ಮತ್ತು ಮಾನ್ಯ YAML ಆಗಿದೆ
- [ ] `azure.yaml` ನಲ್ಲಿ ನಿರ್ದಿಷ್ಟಪಡಿಸಿದ ಎಲ್ಲಾ ಸೇವೆಗಳಿಗೂ ಅನುಸಾರವಾದ ಮೂಲ ಕೋಡ್ ಅಸ್ತಿತ್ವದಲ್ಲಿದೆ
- [ ] `infra/` ಡೈರೆಕ್ಟರಿಯಲ್ಲಿನ Bicep ಟೆಂಪ್ಲೇಟುಗಳು ಲಭ್ಯವಿವೆ
- [ ] `main.bicep` ದೋಷವಿಲ್ಲದೆ ಕಂಪೈಲ್ ಆಗುತ್ತದೆ (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 Infrastructure preview ಯಶಸ್ವಿಯಾಗಿ ಓಡುತ್ತದೆ (`azd provision --preview`)
- [ ] ಎಲ್ಲಾ ಅಗತ್ಯ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳಿಗೆ ಡೀಫಾಲ್ಟ್ ಮೌಲ್ಯಗಳಿವೆ ಅಥವಾ ಒದಗಿಸಲಿದ್ದುದು
- [ ] ಟೆಂಪ್ಲೇಟುಗಳಲ್ಲಿ ಹಾರ್ಡ್‌ಕೋಡ್ಡ್ ರಹಸ್ಯಗಳಿಲ್ಲ

#### ✅ Resource Planning
- [ ] ಗುರಿ Azure ಪ್ರಾಂತ್ಯ ಆಯ್ಕೆಮಾಡಲಾಗಿದೆ ಮತ್ತು ಮಾನ್ಯಗೊಳಿಸಲಾಗಿದೆ
- [ ] ಗುರಿ ಪ್ರಾಂತ್ಯದಲ್ಲಿ ಅಗತ್ಯ Azure ಸೇವೆಗಳು ಲಭ್ಯವಿವೆ
- [ ] ಯೋಜಿಸಿದ ಸಂಪನ್ಮೂಲಗಳಿಗಾಗಿ ಸಾಕಷ್ಟು ಕೋಟಾಗಳು ಲಭ್ಯವಿವೆ
- [ ] ಸಂಪನ್ಮೂಲ ಹೆಸರು ಸಂಘರ್ಷಗಳು ಪರಿಶೀಲಿಸಲಾಗಿದೆ
- [ ] ಸಂಪನ್ಮೂಲಗಳ ನಡುವಿನ ಅವಲಂಬನೆಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಂಡಿದ್ದಾರೆ

#### ✅ Network & Security
- [ ] Azure ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳಿಗೆ ಜಾಲ ಸಂಪರ್ಕ ಪರಿಶೀಲಿಸಲಾಗಿದೆ
- [ ] ಅಗತ್ಯವಿದ್ದರೆ ಫೈರ್ವಾಲ್/ಪ್ರಾಕ್ಸಿ ಸೆಟ್ಟಿಂಗ್ಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿದೆ
- [ ] ಗುಪ್ತತೆ ನಿರ್ವಹಣೆಗೆ Key Vault ಸಂರಚಿಸಲಾಗಿದೆ
- [ ] ಸಾಧ್ಯವಾದ ಸ್ಥಳಗಳಲ್ಲಿ Managed identities ಉಪಯೋಗಿಸಲಾಗಿದೆ
- [ ] ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗೆ HTTPS ಅನಿವಾರ್ಯಗೊಳಿಸಲಾಗಿದೆ

#### ✅ Cost Management
- [ ] Azure Pricing Calculator ಬಳಸಿ ಖರ್ಚು ಅಂದಾಜುಗಳು ಲೆಕ್ಕಿಸಲ್ಪಟ್ಟಿವೆ
- [ ] ಅಗತ್ಯವಿದ್ದರೆ ಬಜೆಟ್ ಎಚ್ಚರಿಕೆಗಳು ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿದೆ
- [ ] ಪರಿಸರ ಪ್ರಕಾರಕ್ಕೆ ತಕ್ಕ SKUs ಆಯ್ಕೆಮಾಡಲಾಗಿದೆ
- [ ] ಉತ್ಪಾದನಾ ಕೆಲಸಗಳಿಗೆ ರಿಸರ್ವ್ಡ್ ಸಾಮರ್ಥ್ಯ ಪರಿಗಣಿಸಲಾಗಿದೆ

#### ✅ Monitoring & Observability
- [ ] ಟೆಂಪ್ಲೇಟುಗಳಲ್ಲಿ Application Insights ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿದೆ
- [ ] Log Analytics ವರ್ಕ್‌ಸ್ಪೇಸ್ ಯೋಜಿಸಲಾಗಿದೆ
- [ ] ಆವಶ್ಯಕಮಾದ ಮೆಟ್ರಿಕ್‌ಗಳಿಗಾಗಿ ಎಚ್ಚರಿಕೆ ನಿಯಮಗಳು ನಿರ್ಧಾರಿಸಲಾಗಿದೆ
- [ ] ಅಪ್ಲಿಕೇಶನ್‌ಗಳಲ್ಲಿ ಆರೋಗ್ಯ ಪರಿಶೀಲನೆ ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಜಾರಿ ಮಾಡಲಾಗಿದೆ

#### ✅ Backup & Recovery
- [ ] ಡೇಟಾ ಸಂಪನ್ಮೂಲಗಳಿಗಾಗಿ ಬ್ಯಾಕಪ್ ತಂತ್ರವಿಧಾನ ನಿರ್ಧರಿಸಲಾಗಿದೆ
- [ ] Recovery Time Objectives (RTO) ದಾಖಲಿಸಲಾಗಿದೆ
- [ ] Recovery Point Objectives (RPO) ದಾಖಲಿಸಲಾಗಿದೆ
- [ ] ಉತ್ಪಾದನೆಗಾಗಿ ದುರ್ಘಟನೆ ಪುನರುತ್ಥಾನ ಯೋಜನೆ ಇಡಲಾಗಿದೆ

---

## ಪರಿಸರ ಪರಿಶೀಲನೆ

### Development Environment Validation

```bash
#!/bin/bash
# ಡೆವಲಪ್‌ಮೆಂಟ್ ಪರಿಸರಕ್ಕೆ ಸಂಬಂಧಿಸಿದ ಪರಿಶೀಲನೆಗಳು

validate_dev_environment() {
    echo "=== Development Environment Validation ==="
    
    # ಡೆವಲಪ್‌ಮೆಂಟ್-ಸ್ನೇಹಿ ಸಂರಚನೆಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ
    if grep -q "sku.*Free\|sku.*F1\|sku.*Basic" infra/*.bicep; then
        echo "✓ Development-appropriate SKUs detected"
    else
        echo "⚠ Consider using lower-cost SKUs for development"
    fi
    
    # ಸ್ವಯಂ ಶಟ್‌ಡೌನ್ ಸಂರಚನೆಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸು
    if grep -q "autoShutdown\|deallocate" infra/*.bicep; then
        echo "✓ Auto-shutdown configuration found"
    else
        echo "ℹ Consider adding auto-shutdown for cost savings"
    fi
    
    # ಡೆವಲಪ್‌ಮೆಂಟ್ ಡೇಟಾಬೇಸ್ ಸಂರಚನೆಗಳನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
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
# ಉತ್ಪಾದನಾ ಪರಿಸರಕ್ಕೆ ನಿರ್ದಿಷ್ಟವಾದ ಪರಿಶೀಲನೆಗಳು

validate_prod_environment() {
    echo "=== Production Environment Validation ==="
    
    # ಉನ್ನತ ಲಭ್ಯತೆ ಸಂರಚನೆಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ
    if grep -q "zoneRedundant.*true\|Premium\|Standard_GRS" infra/*.bicep; then
        echo "✓ High availability configurations detected"
    else
        echo "⚠ Consider enabling high availability for production"
    fi
    
    # ಬ್ಯಾಕಪ್ ಸಂರಚನೆಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ
    if grep -q "backup\|retention\|pointInTimeRestore" infra/*.bicep; then
        echo "✓ Backup configurations found"
    else
        echo "⚠ Ensure backup strategies are implemented"
    fi
    
    # ನಿರೀಕ್ಷಣಾ ವ್ಯವಸ್ಥೆಯನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
    if grep -q "Microsoft.Insights\|Application_Type.*web" infra/*.bicep; then
        echo "✓ Monitoring and observability configured"
    else
        echo "⚠ Add comprehensive monitoring for production"
    fi
    
    # ಭದ್ರತಾ ಸಂರಚನೆಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ
    if grep -q "Microsoft.KeyVault\|managedIdentity\|httpsOnly.*true" infra/*.bicep; then
        echo "✓ Security best practices implemented"
    else
        echo "⚠ Review security configurations for production"
    fi
}
```

---

## ಸಂಪನ್ಮೂಲ ಪರಿಶೀಲನೆ

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
    
    # ಸಬ್ಸ್ಕ್ರಿಪ್ಶನ್‌ನಲ್ಲಿನ ಸ್ಟೋರೇಜ್ ಖಾತೆಗಳನ್ನು ಪಡೆಯಿರಿ
    accounts = run_command(['az', 'storage', 'account', 'list'])
    
    if accounts is None:
        print("❌ Could not retrieve storage account information")
        return False
    
    account_count = len(accounts)
    max_accounts = 250  # ಡೀಫಾಲ್ಟ್ ಏಜ್ಯೂರ್ ಮಿತಿ
    
    usage_percent = (account_count / max_accounts) * 100
    status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
    
    print(f"{status} Storage Accounts: {account_count}/{max_accounts} ({usage_percent:.1f}%)")
    
    return usage_percent < 95

def check_network_limits(location: str) -> bool:
    """Check network-related limits"""
    print(f"\n=== Network Limits Check ({location}) ===")
    
    # ವರ್ಚುವಲ್ ನೆಟ್‌ವರ್ಕ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
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

## ಭದ್ರತೆ ಮತ್ತು ಅನುಪಾಲನೆ ಪರಿಶೀಲನೆಗಳು

### Security Validation Script

```bash
#!/bin/bash
# AZD ನಿಯೋಜನೆಗಳಿಗಾಗಿ ಭದ್ರತೆ ಮತ್ತು ಅನುಪಾಲನೆ ಪರಿಶೀಲನೆ

check_security_practices() {
    echo "=== Security Best Practices Check ==="
    
    local issues_found=0
    
    # Key Vault ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
    if grep -r "Microsoft.KeyVault" infra/ >/dev/null 2>&1; then
        echo "✅ Key Vault detected in infrastructure"
    else
        echo "⚠️  Key Vault not found - consider using for secrets management"
        ((issues_found++))
    fi
    
    # Managed identity ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
    if grep -r "managedIdentity\|SystemAssigned\|UserAssigned" infra/ >/dev/null 2>&1; then
        echo "✅ Managed Identity configuration detected"
    else
        echo "⚠️  Managed Identity not found - consider using for service authentication"
        ((issues_found++))
    fi
    
    # HTTPS ಕಡ್ಡಾಯಗೊಳಿಸುವಿಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
    if grep -r "httpsOnly.*true\|requireHttps.*true" infra/ >/dev/null 2>&1; then
        echo "✅ HTTPS enforcement detected"
    else
        echo "⚠️  HTTPS enforcement not found - ensure secure connections"
        ((issues_found++))
    fi
    
    # ಕನಿಷ್ಠ TLS ಆವೃತ್ತಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ
    if grep -r "minimumTlsVersion.*'TLS1_2'" infra/ >/dev/null 2>&1; then
        echo "✅ Minimum TLS 1.2 configuration detected"
    else
        echo "⚠️  Minimum TLS version not specified - consider requiring TLS 1.2+"
        ((issues_found++))
    fi
    
    # ಸಾರ್ವಜನಿಕ ಪ್ರವೇಶ ನಿರ್ಬಂಧಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ
    if grep -r "allowBlobPublicAccess.*false\|publicNetworkAccess.*Disabled" infra/ >/dev/null 2>&1; then
        echo "✅ Public access restrictions detected"
    else
        echo "⚠️  Public access restrictions not found - consider limiting public access"
        ((issues_found++))
    fi
    
    # ನೆಟ್‌ವರ್ಕ್ ಭದ್ರತಾ ಗುಂಪುಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
    if grep -r "Microsoft.Network/networkSecurityGroups" infra/ >/dev/null 2>&1; then
        echo "✅ Network Security Groups detected"
    else
        echo "ℹ️  Network Security Groups not found - may be acceptable depending on architecture"
    fi
    
    return $issues_found
}

check_compliance_requirements() {
    echo -e "\n=== Compliance Requirements Check ==="
    
    # ಡೇಟಾ ಎನ್‌ಕ್ರಿಪ್ಷನ್ ಇರುವುದನ್ನು ಪರಿಶೀಲಿಸಿ
    if grep -r "encryption\|encryptionAtRest\|transparentDataEncryption" infra/ >/dev/null 2>&1; then
        echo "✅ Encryption configurations detected"
    else
        echo "⚠️  Encryption configurations not found - ensure data is encrypted"
    fi
    
    # ಆಡಿಟ್ ಲಾಗಿಂಗ್ ಅನ್ನು ಪರಿಶೀಲಿಸಿ
    if grep -r "Microsoft.Insights.*auditingSettings\|diagnosticSettings" infra/ >/dev/null 2>&1; then
        echo "✅ Audit logging configurations detected"
    else
        echo "⚠️  Audit logging not found - consider enabling for compliance"
    fi
    
    # ಬ್ಯಾಕಪ್ ಮತ್ತು ಉಳಿಸುವ ನೀತಿಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
    if grep -r "backup.*Policy\|retentionPolicy\|retention.*Days" infra/ >/dev/null 2>&1; then
        echo "✅ Backup and retention policies detected"
    else
        echo "⚠️  Backup/retention policies not found - required for data governance"
    fi
}

# ಮುಖ್ಯ ಕಾರ್ಯನಿರ್ವಹಣೆ
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

## CI/CD ಜೊತೆಗೆ ಒಟ್ಟುಗೂಡಿಕೆ

### GitHub Actions ಏಕೀಕರಣ

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

### Azure DevOps ಏಕೀಕರಣ

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

### ✅ ಪೂರ್ವ-ಪರೀಕ್ಷೆ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

1. **ಸಾಧ್ಯವಾದರೆ ಸ್ವಯಂಚಾಲಿತಗೊಳಿಸಿ**
   - CI/CD ಪೈಪ್‌ಲೈನ್ಗಳಿಗೆ ತಪಾಸಣೆಗಳನ್ನು ಒಳಗೊಂಡಿಡಿ
   - ಪುನರಾವರ್ತನೆಯ ಮಾನ್ಯತೆಗಳಿಗಾಗಿ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳನ್ನು ಬಳಸಿ
   - ಆಡಿಟ್ ಟ್ರೇಲ್ಗಾಗಿ ಫಲಿತಾಂಶಗಳನ್ನು ಸಂಗ್ರಹಿಸಿ

2. **ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ಪರಿಶೀಲನೆ**
   - dev/staging/prod ಗಾಗಿ ವಿಭಿನ್ನ ತಪಾಸಣೆಗಳು
   - ಪ್ರತಿ ಪರಿಸರಕ್ಕೆ ತಕ್ಕ ಭದ್ರತಾ ಅಗತ್ಯಗಳು
   - ಅನುದಾನಾಂತರದ ಹೊರಗಿನ ಪರಿಸರಗಳಿಗೆ ಖರ್ಚು ಉತ್ತಮೀಕರಣ

3. **ಸಮಗ್ರ ವ್ಯಾಪ್ತಿ**
   - ಪ್ರಮಾಣೀಕರಣ ಮತ್ತು ಅನುಮತಿಗಳು
   - ಸಂಪನ್ಮೂಲ ಕೋಟಾಗಳು ಮತ್ತು ಲಭ್ಯತೆ
   - ಟೆಂಪ್ಲೇಟು ಮಾನ್ಯತೆ ಮತ್ತು ಸಿಂಟ್ಯಾಕ್ಸ್
   - ಭದ್ರತೆ ಮತ್ತು ಅನುಪಾಲನೆ ಅಗತ್ಯಗಳು

4. **ಸ್ಪಷ್ಟ ವರದಿ**
   - ಬಣ್ಣ-ಕೋಡ್ ಮಾಡಿದ ಸ್ಥಿತಿ ಸೂಚಕಗಳು
   - ಪರಿಹಾರದ ಹೆಜ್ಜೆಗಳಿಂದ ಸಂಪೂರ್ಣ ದೋಷ ಸಂದೇಶಗಳು
   - ತ್ವರಿತ ಅಂಕಣಗಳಿಗಾಗಿ ಸಾರಾಂಶ ವರದಿಗಳು

5. **ವೇಗವಾಗಿ ವಿಫಲಗೊಳ್ಳಿ**
   - ಪ್ರಮುಖ ತಪಾಸಣೆಗಳು ವಿಫಲವಾದರೆ ನಿಯೋಜನೆಯನ್ನು ನಿಲ್ಲಿಸಿ
   - ಪರಿಹಾರಕ್ಕಾಗಿ ಸ್ಪಷ್ಟ ಮಾರ್ಗದರ್ಶನವನ್ನು ಒದಗಿಸಿ
   - ತಪಾಸಣೆಗಳನ್ನು ಸುಲಭವಾಗಿ ಮರುನೆಡಿಸಲು ಸಾದ್ಯಮಾಡಿ

### ಸಾಮಾನ್ಯ ಪೂರ್ವ-ಪರೀಕ್ಷೆ ಸಮಸ್ಯೆಗಳು

1. **ಪರಿಶೀಲನೆಯನ್ನು ಬಿಟ್ಟುಕೊಡುವುದು** "ತ್ವರಿತ" ನಿಯೋಜನೆಗಳಿಗಾಗಿ
2. **ಅಪರ್ಯाप्त ಅನುಮತಿಗಳು** ನಿಯೋಜನೆಯ ಮೊದಲು ಪರಿಶೀಲಿಕೆ ಮಾಡದೆ இருப்பನ್ನು
3. **ಕೋಟಾ ಮಿತಿಗಳನ್ನು ನಿರ್ಲಕ್ಷಿಸುವುದು** ನಿಯೋಜನೆ ವಿಫಲವಾಗುವವರೆಗೆ
4. **ಟೆಂಪ್ಲೇಟುಗಳನ್ನು CI/CD ನಲ್ಲಿ ಮಾನ್ಯಗೊಳಿಸದೆ ಇರುವುದು**
5. **ಉತ್ಪಾದನಾ ಪರಿಸರಗಳಿಗಾಗಿ ಭದ್ರತಾ ಪರಿಶೀಲನೆಯನ್ನು ತಪ್ಪಿಸುವುದು**
6. **ಅಪರ್ಯಾಪ್ತ ಖರ್ಚು ಅಂದಾಜು** ಬಜೆಟ್ ಅನುಮಾನಗಳಿಗೂ ಕಾರಣವಾಗುವುದು

---

**ಪ್ರೊ ಟಿಪ್**: ನಿಜವಾದ ನಿಯೋಜನೆ ಜಾಬ್‌ನ ಮುನ್ನ ನಿಮ್ಮ CI/CD ಪೈಪ್‌ಲೈನಿನಲ್ಲಿ ಪೂರ್ವ-ಪರೀಕ್ಷೆಗಳನ್ನು ಪ್ರತ್ಯೇಕ ಜಾಬ್ ಆಗಿ ಓಡಿಸಿ. ಇದು ಸಮಸ್ಯೆಗಳನ್ನು ಮುಂಚಿತವಾಗಿ ಹಿಡಿಯಲು ಸಹಾಯಮಾಡುತ್ತದೆ ಮತ್ತು ಡೆವಲಪರ್‌ರಿಗೆ ವೇಗವಾದ ಪ್ರತಿಕ್ರಿಯೆ ನೀಡುತ್ತದೆ.

---

**ನ್ಯಾವಿಗೇಶನ್**
- **ಹಿಂದುಿನ ಪಾಠ**: [SKU ಆಯ್ಕೆ](sku-selection.md)
- **ಮುಂದಿನ ಪಾಠ**: [ಚೀಟ್ ಶೀಟ್](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕರಣ**:
ಈ ದಸ್ತಾವೇಜನ್ನು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗmıştır. ನಾವು ಶುದ್ಧತೆಗೆ ಪ್ರಯತ್ನಿಸಿದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸತ್ಯತೆಗಳು ಇರಬಹುದು ಎಂದು ದಯವಿಟ್ಟು ಗಮನಿಸಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿನ ಮೂಲ ದಸ್ತಾವೇಜನ್ನು ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಯಿತು. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ಭ್ರಮೆ ಅಥವಾ ತಪ್ಪಾದ ವ್ಯಾಖ್ಯಾನಗಳಿಗೆ ನಾವು ಜವಾಬ್ದಾರಿಯಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
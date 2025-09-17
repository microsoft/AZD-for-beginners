<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "faaf041a7f92fb1ced7f3322a4cf0b2a",
  "translation_date": "2025-09-17T21:04:39+00:00",
  "source_file": "docs/pre-deployment/preflight-checks.md",
  "language_code": "pa"
}
-->
# AZD ਡਿਪਲੌਇਮੈਂਟ ਲਈ ਪ੍ਰੀ-ਫਲਾਈਟ ਚੈਕਸ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਮੁੱਖ ਪੰਨਾ**: [AZD ਫਾਰ ਬਿਗਿਨਰਜ਼](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 6 - ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਦੀ ਤਸਦੀਕ ਅਤੇ ਯੋਜਨਾ
- **⬅️ ਪਿਛਲਾ**: [SKU ਚੋਣ](sku-selection.md)
- **➡️ ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 7: ਟਰਬਲਸ਼ੂਟਿੰਗ](../troubleshooting/common-issues.md)
- **🔧 ਸੰਬੰਧਤ**: [ਅਧਿਆਇ 4: ਡਿਪਲੌਇਮੈਂਟ ਗਾਈਡ](../deployment/deployment-guide.md)

## ਪਰਿਚਯ

ਇਹ ਵਿਸਥਾਰਕ ਗਾਈਡ AZD CLI ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਸਫਲਤਾ ਨੂੰ ਯਕੀਨੀ ਬਣਾਉਣ ਲਈ ਪ੍ਰੀ-ਡਿਪਲੌਇਮੈਂਟ ਤਸਦੀਕ ਸਕ੍ਰਿਪਟ ਅਤੇ ਪ੍ਰਕਿਰਿਆਵਾਂ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ। ਡਿਪਲੌਇਮੈਂਟ ਫੇਲ੍ਹ ਹੋਣ ਤੋਂ ਬਚਾਉਣ ਅਤੇ ਸਫਲਤਾ ਦੀ ਦਰ ਨੂੰ ਵਧਾਉਣ ਲਈ ਪ੍ਰਮਾਣਿਕਤਾ, ਸਰੋਤ ਉਪਲਬਧਤਾ, ਕੋਟੇ, ਸੁਰੱਖਿਆ ਪਾਲਣਾ ਅਤੇ ਪ੍ਰਦਰਸ਼ਨ ਦੀਆਂ ਲੋੜਾਂ ਲਈ ਆਟੋਮੇਟਿਕ ਚੈਕਸ ਲਾਗੂ ਕਰਨਾ ਸਿੱਖੋ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਕੇ, ਤੁਸੀਂ:
- ਆਟੋਮੇਟਿਕ ਪ੍ਰੀ-ਡਿਪਲੌਇਮੈਂਟ ਤਸਦੀਕ ਤਕਨੀਕਾਂ ਅਤੇ ਸਕ੍ਰਿਪਟਾਂ ਵਿੱਚ ਮਾਹਰ ਹੋ ਜਾਵੋਗੇ
- ਪ੍ਰਮਾਣਿਕਤਾ, ਅਧਿਕਾਰ ਅਤੇ ਕੋਟੇ ਲਈ ਵਿਸਥਾਰਕ ਜਾਂਚ ਰਣਨੀਤੀਆਂ ਨੂੰ ਸਮਝੋਗੇ
- ਸਰੋਤ ਉਪਲਬਧਤਾ ਅਤੇ ਸਮਰੱਥਾ ਤਸਦੀਕ ਪ੍ਰਕਿਰਿਆਵਾਂ ਲਾਗੂ ਕਰੋਗੇ
- ਸੰਗਠਨਕ ਨੀਤੀਆਂ ਲਈ ਸੁਰੱਖਿਆ ਅਤੇ ਪਾਲਣਾ ਚੈਕਸ ਸੰਰਚਿਤ ਕਰੋਗੇ
- ਲਾਗਤ ਅਨੁਮਾਨ ਅਤੇ ਬਜਟ ਤਸਦੀਕ ਵਰਕਫਲੋਜ਼ ਡਿਜ਼ਾਈਨ ਕਰੋਗੇ
- CI/CD ਪਾਈਪਲਾਈਨਾਂ ਲਈ ਕਸਟਮ ਪ੍ਰੀ-ਫਲਾਈਟ ਚੈਕ ਆਟੋਮੇਸ਼ਨ ਬਣਾਉਣਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਇਸ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ:
- ਵਿਸਥਾਰਕ ਪ੍ਰੀ-ਫਲਾਈਟ ਤਸਦੀਕ ਸਕ੍ਰਿਪਟ ਬਣਾਉਣ ਅਤੇ ਚਲਾਉਣ ਦੇ ਯੋਗ ਹੋਵੋਗੇ
- ਵੱਖ-ਵੱਖ ਡਿਪਲੌਇਮੈਂਟ ਸਥਿਤੀਆਂ ਲਈ ਆਟੋਮੇਟਿਕ ਜਾਂਚ ਵਰਕਫਲੋਜ਼ ਡਿਜ਼ਾਈਨ ਕਰ ਸਕੋਗੇ
- ਵਾਤਾਵਰਣ-ਵਿਸ਼ੇਸ਼ ਤਸਦੀਕ ਪ੍ਰਕਿਰਿਆਵਾਂ ਅਤੇ ਨੀਤੀਆਂ ਲਾਗੂ ਕਰ ਸਕੋਗੇ
- ਡਿਪਲੌਇਮੈਂਟ ਤਿਆਰੀ ਲਈ ਪ੍ਰੋਐਕਟਿਵ ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਅਲਰਟਿੰਗ ਸੰਰਚਿਤ ਕਰ ਸਕੋਗੇ
- ਪ੍ਰੀ-ਡਿਪਲੌਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਦਾ ਨਿਪਟਾਰਾ ਕਰ ਸਕੋਗੇ ਅਤੇ ਸੁਧਾਰਾਤਮਕ ਕਾਰਵਾਈਆਂ ਲਾਗੂ ਕਰ ਸਕੋਗੇ
- ਪ੍ਰੀ-ਫਲਾਈਟ ਚੈਕਸ ਨੂੰ ਡੈਵਓਪਸ ਪਾਈਪਲਾਈਨਾਂ ਅਤੇ ਆਟੋਮੇਸ਼ਨ ਵਰਕਫਲੋਜ਼ ਵਿੱਚ ਇਕੱਠਾ ਕਰ ਸਕੋਗੇ

## ਸੂਚੀ

- [ਸੰਖੇਪ](../../../../docs/pre-deployment)
- [ਆਟੋਮੇਟਿਕ ਪ੍ਰੀ-ਫਲਾਈਟ ਸਕ੍ਰਿਪਟ](../../../../docs/pre-deployment)
- [ਮੈਨੂਅਲ ਤਸਦੀਕ ਚੈਕਲਿਸਟ](../../../../docs/pre-deployment)
- [ਵਾਤਾਵਰਣ ਤਸਦੀਕ](../../../../docs/pre-deployment)
- [ਸਰੋਤ ਤਸਦੀਕ](../../../../docs/pre-deployment)
- [ਸੁਰੱਖਿਆ ਅਤੇ ਪਾਲਣਾ ਚੈਕਸ](../../../../docs/pre-deployment)
- [ਪ੍ਰਦਰਸ਼ਨ ਅਤੇ ਸਮਰੱਥਾ ਯੋਜਨਾ](../../../../docs/pre-deployment)
- [ਆਮ ਸਮੱਸਿਆਵਾਂ ਦਾ ਨਿਪਟਾਰਾ](../../../../docs/pre-deployment)

---

## ਸੰਖੇਪ

ਪ੍ਰੀ-ਫਲਾਈਟ ਚੈਕਸ ਉਹ ਜ਼ਰੂਰੀ ਤਸਦੀਕਾਂ ਹਨ ਜੋ ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਕੀਤੀਆਂ ਜਾਂਦੀਆਂ ਹਨ ਤਾਂ ਜੋ ਇਹ ਯਕੀਨੀ ਬਣਾਇਆ ਜਾ ਸਕੇ ਕਿ:

- ਟਾਰਗੇਟ ਖੇਤਰਾਂ ਵਿੱਚ **ਸਰੋਤ ਉਪਲਬਧਤਾ** ਅਤੇ ਕੋਟੇ
- **ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਅਧਿਕਾਰ** ਸਹੀ ਤਰੀਕੇ ਨਾਲ ਸੰਰਚਿਤ ਹਨ
- **ਟੈਂਪਲੇਟ ਦੀ ਮਾਨਤਾ** ਅਤੇ ਪੈਰਾਮੀਟਰ ਦੀ ਸਹੀਤਾ
- **ਨੈੱਟਵਰਕ ਕਨੈਕਟਿਵਿਟੀ** ਅਤੇ ਨਿਰਭਰਤਾਵਾਂ
- ਸੰਗਠਨਕ ਨੀਤੀਆਂ ਨਾਲ **ਸੁਰੱਖਿਆ ਪਾਲਣਾ**
- ਬਜਟ ਸੀਮਾਵਾਂ ਦੇ ਅੰਦਰ **ਲਾਗਤ ਅਨੁਮਾਨ**

### ਪ੍ਰੀ-ਫਲਾਈਟ ਚੈਕਸ ਕਦੋਂ ਚਲਾਉਣੇ ਹਨ

- **ਨਵੇਂ ਵਾਤਾਵਰਣ** ਵਿੱਚ ਪਹਿਲੀ ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ
- **ਟੈਂਪਲੇਟ ਵਿੱਚ ਮਹੱਤਵਪੂਰਨ ਬਦਲਾਅ** ਕਰਨ ਤੋਂ ਬਾਅਦ
- **ਪ੍ਰੋਡਕਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ**
- **ਐਜ਼ਰ ਖੇਤਰ ਬਦਲਣ** ਸਮੇਂ
- **CI/CD ਪਾਈਪਲਾਈਨਾਂ ਦੇ ਹਿੱਸੇ ਵਜੋਂ**

---

## ਆਟੋਮੇਟਿਕ ਪ੍ਰੀ-ਫਲਾਈਟ ਸਕ੍ਰਿਪਟ

### ਪਾਵਰਸ਼ੈੱਲ ਪ੍ਰੀ-ਫਲਾਈਟ ਚੈੱਕਰ

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

### ਬੈਸ਼ ਪ੍ਰੀ-ਫਲਾਈਟ ਚੈੱਕਰ

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

## ਮੈਨੂਅਲ ਤਸਦੀਕ ਚੈਕਲਿਸਟ

### ਪ੍ਰੀ-ਡਿਪਲੌਇਮੈਂਟ ਚੈਕਲਿਸਟ

ਇਸ ਚੈਕਲਿਸਟ ਨੂੰ ਪ੍ਰਿੰਟ ਕਰੋ ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਹਰ ਆਈਟਮ ਦੀ ਤਸਦੀਕ ਕਰੋ:

#### ✅ ਵਾਤਾਵਰਣ ਸੈਟਅੱਪ
- [ ] AZD CLI ਇੰਸਟਾਲ ਅਤੇ ਨਵੀਂ ਵਰਜਨ 'ਤੇ ਅੱਪਡੇਟ ਕੀਤਾ ਗਿਆ
- [ ] ਐਜ਼ਰ CLI ਇੰਸਟਾਲ ਅਤੇ ਪ੍ਰਮਾਣਿਤ
- [ ] ਸਹੀ ਐਜ਼ਰ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਚੁਣੀ ਗਈ
- [ ] ਵਾਤਾਵਰਣ ਦਾ ਨਾਮ ਵਿਲੱਖਣ ਹੈ ਅਤੇ ਨਾਂਕਰਨ ਦੇ ਨਿਯਮਾਂ ਦਾ ਪਾਲਣ ਕਰਦਾ ਹੈ
- [ ] ਟਾਰਗੇਟ ਰਿਸੋਰਸ ਗਰੁੱਪ ਦੀ ਪਛਾਣ ਕੀਤੀ ਗਈ ਜਾਂ ਬਣਾਇਆ ਜਾ ਸਕਦਾ ਹੈ

#### ✅ ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਅਧਿਕਾਰ
- [ ] `azd auth login` ਨਾਲ ਸਫਲਤਾਪੂਰਵਕ ਪ੍ਰਮਾਣਿਤ
- [ ] ਯੂਜ਼ਰ ਕੋਲ ਟਾਰਗੇਟ ਸਬਸਕ੍ਰਿਪਸ਼ਨ/ਰਿਸੋਰਸ ਗਰੁੱਪ 'ਤੇ ਕਨਟ੍ਰਿਬਿਊਟਰ ਰੋਲ ਹੈ
- [ ] CI/CD ਲਈ ਸਰਵਿਸ ਪ੍ਰਿੰਸੀਪਲ ਸੰਰਚਿਤ (ਜੇ ਲਾਗੂ ਹੋਵੇ)
- [ ] ਕੋਈ ਮਿਆਦ ਪੂਰੀ ਹੋਈ ਸਰਟੀਫਿਕੇਟ ਜਾਂ ਪ੍ਰਮਾਣ ਪੱਤਰ ਨਹੀਂ ਹਨ

#### ✅ ਟੈਂਪਲੇਟ ਤਸਦੀਕ
- [ ] `azure.yaml` ਮੌਜੂਦ ਹੈ ਅਤੇ ਵੈਧ YAML ਹੈ
- [ ] `azure.yaml` ਵਿੱਚ ਪਰਿਭਾਸ਼ਿਤ ਸਾਰੀਆਂ ਸੇਵਾਵਾਂ ਲਈ ਸਬੰਧਤ ਸਰੋਤ ਕੋਡ ਹੈ
- [ ] `infra/` ਡਾਇਰੈਕਟਰੀ ਵਿੱਚ Bicep ਟੈਂਪਲੇਟ ਮੌਜੂਦ ਹਨ
- [ ] `main.bicep` ਬਿਨਾ ਗਲਤੀਆਂ ਦੇ ਕੰਪਾਇਲ ਹੁੰਦਾ ਹੈ (`az bicep build --file infra/main.bicep`)
- [ ] ਸਾਰੇ ਲੋੜੀਂਦੇ ਪੈਰਾਮੀਟਰਾਂ ਦੇ ਡਿਫਾਲਟ ਮੁੱਲ ਹਨ ਜਾਂ ਪ੍ਰਦਾਨ ਕੀਤੇ ਜਾਣਗੇ
- [ ] ਟੈਂਪਲੇਟ ਵਿੱਚ ਕੋਈ ਹਾਰਡਕੋਡਡ ਸਿਕ੍ਰੇਟ ਨਹੀਂ ਹਨ

#### ✅ ਸਰੋਤ ਯੋਜਨਾ
- [ ] ਟਾਰਗੇਟ ਐਜ਼ਰ ਖੇਤਰ ਚੁਣਿਆ ਅਤੇ ਤਸਦੀਕ ਕੀਤਾ ਗਿਆ
- [ ] ਟਾਰਗੇਟ ਖੇਤਰ ਵਿੱਚ ਲੋੜੀਂਦੀਆਂ ਐਜ਼ਰ ਸੇਵਾਵਾਂ ਉਪਲਬਧ ਹਨ
- [ ] ਯੋਜਿਤ ਸਰੋਤਾਂ ਲਈ ਕਾਫ਼ੀ ਕੋਟੇ ਉਪਲਬਧ ਹਨ
- [ ] ਸਰੋਤ ਨਾਂਕਰਨ ਦੇ ਟਕਰਾਅ ਦੀ ਜਾਂਚ ਕੀਤੀ ਗਈ
- [ ] ਸਰੋਤਾਂ ਦੇ ਵਿਚਕਾਰ ਨਿਰਭਰਤਾਵਾਂ ਨੂੰ ਸਮਝਿਆ ਗਿਆ

#### ✅ ਨੈੱਟਵਰਕ ਅਤੇ ਸੁਰੱਖਿਆ
- [ ] ਐਜ਼ਰ ਐਂਡਪੌਇੰਟਸ ਲਈ ਨੈੱਟਵਰਕ ਕਨੈਕਟਿਵਿਟੀ ਦੀ ਤਸਦੀਕ ਕੀਤੀ ਗਈ
- [ ] ਜੇ ਲੋੜੀਂਦਾ ਹੋਵੇ ਤਾਂ ਫਾਇਰਵਾਲ/ਪ੍ਰੌਕਸੀ ਸੈਟਿੰਗਾਂ ਸੰਰਚਿਤ ਕੀਤੀਆਂ ਗਈਆਂ
- [ ] ਸਿਕ੍ਰੇਟ ਪ੍ਰਬੰਧਨ ਲਈ ਕੀ ਵੌਲਟ ਸੰਰਚਿਤ ਕੀਤਾ ਗਿਆ
- [ ] ਜਿੱਥੇ ਸੰਭਵ ਹੋਵੇ, ਮੈਨੇਜਡ ਆਈਡੈਂਟੀਟੀਆਂ ਦੀ ਵਰਤੋਂ ਕੀਤੀ ਗਈ
- [ ] ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ HTTPS ਲਾਗੂ ਕੀਤਾ ਗਿਆ

#### ✅ ਲਾਗਤ ਪ੍ਰਬੰਧਨ
- [ ] ਐਜ਼ਰ ਪ੍ਰਾਈਸਿੰਗ ਕੈਲਕੂਲੇਟਰ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਲਾਗਤ ਦਾ ਅਨੁਮਾਨ ਲਗਾਇਆ ਗਿਆ
- [ ] ਜੇ ਲੋੜੀਂਦਾ ਹੋਵੇ ਤਾਂ ਬਜਟ ਅਲਰਟ ਸੰਰਚਿਤ ਕੀਤੇ ਗਏ
- [ ] ਵਾਤਾਵਰਣ ਦੀ ਕਿਸਮ ਲਈ ਉਚਿਤ SKU ਚੁਣੇ ਗਏ
- [ ] ਪ੍ਰੋਡਕਸ਼ਨ ਵਰਕਲੋਡ ਲਈ ਰਿਜ਼ਰਵਡ ਸਮਰੱਥਾ 'ਤੇ ਵਿਚਾਰ ਕੀਤਾ ਗਿਆ

#### ✅ ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਦ੍ਰਿਸ਼ਟੀਕੋਣ
- [ ] ਟੈਂਪਲੇਟ ਵਿੱਚ ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ ਸੰਰਚਿਤ ਕੀਤੇ ਗਏ
- [ ] ਲੌਗ ਐਨਾਲਿਟਿਕਸ ਵਰਕਸਪੇਸ ਦੀ ਯੋਜਨਾ ਬਣਾਈ ਗਈ
- [ ] ਮਹੱਤਵਪੂਰਨ ਮੈਟ੍ਰਿਕਸ ਲਈ ਅਲਰਟ ਨਿਯਮ ਪਰਿਭਾਸ਼ਿਤ ਕੀਤੇ ਗਏ
- [ ] ਐਪਲੀਕੇਸ਼ਨਾਂ ਵਿੱਚ ਹੈਲਥ ਚੈਕ ਐਂਡਪੌਇੰਟਸ ਲਾਗੂ ਕੀਤੇ ਗਏ

#### ✅ ਬੈਕਅੱਪ ਅਤੇ ਰਿਕਵਰੀ
- [ ] ਡਾਟਾ ਸਰੋਤਾਂ ਲਈ ਬੈਕਅੱਪ ਰਣਨੀਤੀ ਪਰਿਭਾਸ਼ਿਤ ਕੀਤੀ ਗਈ
- [ ] ਰਿਕਵਰੀ ਟਾਈਮ ਉਦੇਸ਼ (RTO) ਦਸਤਾਵੇਜ਼ ਕੀਤੇ ਗਏ
- [ ] ਰਿਕਵਰੀ ਪੌਇੰਟ ਉਦੇਸ਼ (RPO) ਦਸਤਾਵੇਜ਼ ਕੀਤੇ ਗਏ
- [ ] ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਡਿਜਾਸਟਰ ਰਿਕਵਰੀ ਯੋਜਨਾ ਮੌਜੂਦ ਹੈ

---

## ਵਾਤਾਵਰਣ ਤਸਦੀਕ

### ਵਿਕਾਸ ਵਾਤਾਵਰਣ ਤਸਦੀਕ

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

### ਪ੍ਰੋਡਕਸ਼ਨ ਵਾਤਾਵਰਣ ਤਸਦੀਕ

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

## ਸਰੋਤ ਤਸਦੀਕ

### ਕੋਟਾ ਤਸਦੀਕ ਸਕ੍ਰਿਪਟ

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

## ਸੁਰੱਖਿਆ ਅਤੇ ਪਾਲਣਾ ਚੈਕਸ

### ਸੁਰੱਖਿਆ ਤਸਦੀਕ ਸਕ੍ਰਿਪਟ

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

## CI/CD ਨਾਲ ਇਕੱਠਾ ਕਰਨਾ

### GitHub Actions ਇੰਟਿਗ੍ਰੇਸ਼ਨ

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

### Azure DevOps ਇੰਟਿਗ੍ਰੇਸ਼ਨ

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

## ਸਭ ਤੋਂ ਵਧੀਆ ਅਭਿਆਸਾਂ ਦਾ ਸਾਰ

### ✅ ਪ੍ਰੀ-ਫਲਾਈਟ ਚੈਕ ਸਭ ਤੋਂ ਵਧੀਆ ਅਭਿਆਸ

1. **ਜਿੱਥੇ ਸੰਭਵ ਹੋਵੇ ਆਟੋਮੇਟ ਕਰੋ**
   - ਚੈਕਸ ਨੂੰ CI/CD ਪਾਈਪਲਾਈਨਾਂ ਵਿੱਚ ਇਕੱਠਾ ਕਰੋ
   - ਦੁਹਰਾਏ ਜਾਣ ਵਾਲੇ ਤਸਦੀਕਾਂ ਲਈ ਸਕ੍ਰਿਪਟ ਦੀ ਵਰਤੋਂ ਕਰੋ
   - ਨਤੀਜੇ ਆਡਿਟ ਟ੍ਰੇਲ ਲਈ ਸਟੋਰ ਕਰੋ

2. **ਵਾਤਾਵਰਣ-ਵਿਸ਼ੇਸ਼ ਤਸਦੀਕ**
   - ਡਿਵ/ਸਟੇਜਿੰਗ/ਪ੍ਰੋਡ ਲਈ ਵੱਖ-ਵੱਖ ਚੈਕ
   - ਹਰ ਵਾਤਾਵਰਣ ਲਈ ਉਚਿਤ ਸੁਰੱਖਿਆ ਲੋੜਾਂ
   - ਗੈਰ-ਪ੍ਰੋਡਕਸ਼ਨ ਵਾਤਾਵਰਣਾਂ ਲਈ ਲਾਗਤ ਦਾ ਅਧਿਕਤਮ ਪ੍ਰਬੰਧਨ

3. **ਵਿਸਥਾਰਕ ਕਵਰੇਜ**
   - ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਅਧਿਕਾਰ
   - ਸਰੋਤ ਕੋਟੇ ਅਤੇ ਉਪਲਬਧਤਾ
   - ਟੈਂਪਲੇਟ ਤਸਦੀਕ ਅਤੇ ਸਿੰਟੈਕਸ
   - ਸੁਰੱਖਿਆ ਅਤੇ ਪਾਲਣਾ ਦੀਆਂ ਲੋੜਾਂ

4. **ਸਪਸ਼ਟ ਰਿਪੋਰਟਿੰਗ**
   - ਰੰਗ-ਕੋਡੇਡ ਸਥਿਤੀ ਸੂਚਕ
   - ਸੁਧਾਰਾਤਮਕ ਕਦਮਾਂ ਨਾਲ ਵਿਸਥਾਰਕ ਗਲਤੀ ਸੁਨੇਹੇ
   - ਤੇਜ਼ ਮੁਲਾਂਕਣ ਲਈ ਸਾਰ ਰਿਪੋਰਟਾਂ

5. **ਫੇਲ੍ਹ ਫਾਸਟ**
   - ਜੇ ਮਹੱਤਵਪੂਰਨ ਚੈਕ ਫੇਲ੍ਹ ਹੁੰਦੇ ਹਨ ਤਾਂ ਡਿਪਲੌਇਮੈਂਟ ਰੋਕੋ
   - ਸੁਧਾਰ ਲਈ ਸਪਸ਼ਟ ਦਿਸ਼ਾ-ਨਿਰਦੇਸ਼ ਪ੍ਰਦਾਨ ਕਰੋ
   - ਚੈਕਸ ਨੂੰ ਦੁਬਾਰਾ ਚਲਾਉਣ ਲਈ ਆਸਾਨ ਬਣਾਓ

### ਆਮ ਪ੍ਰੀ-ਫਲਾਈਟ ਗਲਤੀਆਂ

1. "ਤੇਜ਼" ਡਿਪਲੌਇਮੈਂਟ ਲਈ ਤਸਦੀਕ ਨੂੰ ਛੱਡਣਾ
2. ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਅਧਿਕਾਰਾਂ ਦੀ ਅਪਰਿਆਪਤ ਜਾਂਚ
3. ਕੋਟਾ ਸੀਮਾਵਾਂ ਨੂੰ ਨਜ਼ਰਅੰਦਾਜ਼ ਕਰਨਾ ਜਦੋਂ ਤੱਕ ਡਿਪਲੌਇਮੈਂਟ ਫੇਲ੍ਹ ਨਹੀਂ ਹੁੰਦਾ
4. CI/CD ਪਾਈਪਲਾਈਨਾਂ ਵਿੱਚ ਟੈਂਪਲੇਟ ਤਸਦੀਕ ਨਾ ਕਰਨਾ
5. ਪ੍ਰੋਡਕਸ਼ਨ ਵਾਤਾਵਰਣਾਂ ਲਈ ਸੁਰੱਖਿਆ ਤਸਦੀਕ ਨੂੰ ਛੱਡਣਾ
6. ਬਜਟ ਹੈਰਾਨੀਆਂ ਵੱਲ ਲੈ ਜਾਣ ਵਾਲੇ ਅਧਿਕਤਮ ਲਾਗਤ ਅਨੁਮਾਨ ਦੀ ਕਮੀ

---

**ਪ੍ਰੋ ਟਿਪ**: ਪ੍ਰੀ-ਫਲਾਈਟ ਚੈਕਸ ਨੂੰ ਆਪਣੇ CI/CD ਪਾਈਪਲਾਈਨ ਵਿੱਚ ਇੱਕ ਵੱਖਰੇ ਜੌਬ ਵਜੋਂ ਚਲਾਓ, ਅਸਲ ਡਿਪਲੌਇਮੈਂਟ ਜੌਬ ਤੋਂ ਪਹਿਲਾਂ। ਇਹ ਤੁਹਾਨੂੰ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਜਲਦੀ ਫੜਨ ਦੀ ਆਗਿਆ ਦਿੰਦਾ ਹੈ ਅਤੇ ਡਿਵੈਲਪਰਾਂ ਨੂੰ ਤੇਜ਼ ਫੀਡਬੈਕ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ।

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [SKU ਚੋਣ](sku-selection.md)
- **ਅਗਲਾ ਪਾਠ**: [ਚੀਟ ਸ਼ੀਟ](../../resources/cheat-sheet.md)

---

**ਅਸਵੀਕਰਤੀ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦਾ ਯਤਨ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁੱਚੀਤਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੌਜੂਦ ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੇ ਪ੍ਰਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।  
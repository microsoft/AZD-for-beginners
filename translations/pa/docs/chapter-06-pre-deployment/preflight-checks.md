# AZD ਡਿਪਲੋਇਮੈਂਟ ਲਈ ਪ੍ਰੀ-ਫਲਾਈਟ ਜਾਂਚਾਂ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਮੁੱਖਪੰਨਾ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 6 - ਪ੍ਰੀ-ਡਿਪਲੋਇਮੈਂਟ ਵੈਰੀਫਿਕੇਸ਼ਨ & ਯੋਜਨਾ
- **⬅️ ਪਿਛਲਾ**: [SKU Selection](sku-selection.md)
- **➡️ ਅਗਲਾ ਅਧਿਆਇ**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/common-issues.md)
- **🔧 ਸੰਬੰਧਿਤ**: [Chapter 4: Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

## ਪ੍ਰਸਤਾਵਨਾ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ ਪ੍ਰੀ-ਡਿਪਲੋਇਮੈਂਟ ਵੈਰੀਫਿਕੇਸ਼ਨ ਸਕ੍ਰਿਪਟਾਂ ਅਤੇ ਕਾਰਜਵਿਧੀਆਂ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ ਤਾਂ ਜੋ Azure Developer CLI ਡਿਪਲੋਇਮੈਂਟਾਂ ਦੀ ਸ਼ੁਰੂਆਤ ਤੋਂ ਪਹਿਲਾਂ ਸਫਲਤਾ ਨੂੰ ਯਕੀਨੀ ਬਣਾਇਆ ਜਾ ਸਕੇ। ਪ੍ਰਮਾਣੀਕਰਨ, ਰਿਸੋਰਸ ਉਪਲਬਧਤਾ, ਕੁਆਟਾ, ਸੁਰੱਖਿਆ ਪਾਲਨਾ ਅਤੇ ਪ੍ਰਦਰਸ਼ਨ ਲੋੜਾਂ ਲਈ ਆਟੋਮੇਟਡ ਜਾਂਚਾਂ ਲਾਗੂ ਕਰਨਾ ਸਿੱਖੋ ਤਾਂ ਜੋ ਡਿਪਲੋਇਮੈਂਟ ਅਸਫਲਤਾਵਾਂ ਨੂੰ ਰੋਕਿਆ ਜਾ ਸਕੇ ਅਤੇ ਸਫਲਤਾ ਦਰਾਂ ਨੂੰ ਅਪਟਿਮਾਈਜ਼ ਕੀਤਾ ਜਾ ਸਕੇ।

## ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

ਇਸ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਨ ਨਾਲ, ਤੁਸੀਂ:
- ਪ੍ਰੀ-ਡਿਪਲੋਇਮੈਂਟ ਵੈਰੀਫਿਕੇਸ਼ਨ ਤਕਨੀਕਾਂ ਅਤੇ ਸਕ੍ਰਿਪਟਾਂ ਵਿੱਚ ਮਾਹਿਰ ਹੋ ਜਾਓਗੇ
- ਪ੍ਰਮਾਣੀਕਰਨ, ਅਨੁਮਤੀਆਂ ਅਤੇ ਕੁਆਟਾ ਲਈ ਵਿਸਤ੍ਰਿਤ ਜਾਂਚ ਰਣਨੀਤੀਆਂ ਨੂੰ ਸਮਝੋਗੇ
- ਰਿਸੋਰਸ ਉਪਲਬਧਤਾ ਅਤੇ ਸਮਰਥਾ ਵੈਰੀਫਿਕੇਸ਼ਨ ਕਾਰਜਵਿਧੀਆਂ ਨੂੰ ਲਾਗੂ ਕਰੋਗੇ
- ਸੰਗਠਨਾਤਮਕ ਨੀਤੀਆਂ ਲਈ ਸੁਰੱਖਿਆ ਅਤੇ ਅਨੁਕੂਲਤਾ ਜਾਂਚਾਂ ਸੰਰਚਿਤ ਕਰੋਗੇ
- ਲਾਗਤ ਅੰਦਾਜ਼ਾ ਅਤੇ ਬਜਟ ਵੈਧਤਾ ਕਾਰਜਪ੍ਰਵਾਹ ਡਿਜ਼ਾਈਨ ਕਰੋਗੇ
- CI/CD ਪਾਈਪਲਾਈਨਾਂ ਲਈ ਕਸਟਮ ਪ੍ਰੀ-ਫਲਾਈਟ ਚੈੱਕ ਆਟੋਮੇਸ਼ਨ ਬਣਾਉਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਪੂਰਾ ਕਰਨ 'ਤੇ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਵਿਸਤ੍ਰਿਤ ਪ੍ਰੀ-ਫਲਾਈਟ ਵੈਰੀਫਿਕੇਸ਼ਨ ਸਕ੍ਰਿਪਟਾਂ ਬਣਾਉਣ ਅਤੇ ਚਲਾਉਣ ਲਈ
- ਵੱਖ-ਵੱਖ ਡਿਪਲੋਇਮੈਂਟ ਪਰੀਦਰਸ਼ਾਂ ਲਈ ਆਟੋਮੇਟਡ ਜਾਂਚ ਕਾਰਜਪ੍ਰਵਾਹ ਡਿਜ਼ਾਈਨ ਕਰਨ ਲਈ
- ਵਾਤਾਵਰਣ-ਨਿਰਧਾਰਤ ਵੈਰੀਫਿਕੇਸ਼ਨ ਕਾਰਜਵਿਧੀਆਂ ਅਤੇ ਨੀਤੀਆਂ ਲਾਗੂ ਕਰਨ ਲਈ
- ਡਿਪਲੋਇਮੈਂਟ ਤਿਆਰੀ ਲਈ ਪ੍ਰੋਐਕਟਿਵ ਮਾਨਿਟਰਿੰਗ ਅਤੇ ਅਲਰਟਿੰਗ ਸੰਰਚਿਤ ਕਰਨ ਲਈ
- ਪ੍ਰੀ-ਡਿਪਲੋਇਮੈਂਟ ਮੁੱਦਿਆਂ ਦਾ ਟ੍ਰਬਲਸ਼ੂਟ ਕਰਨ ਅਤੇ ਸਹੀ ਕਾਰਵਾਈਆਂ ਲਾਗੂ ਕਰਨ ਲਈ
- ਪ੍ਰੀ-ਫਲਾਈਟ ਚੈੱਕਾਂ ਨੂੰ DevOps ਪਾਈਪਲਾਈਨਾਂ ਅਤੇ ਆਟੋਮੇਸ਼ਨ ਵਰਕਫਲੋਜ਼ ਵਿੱਚ ਇਕੀਕ੍ਰਿਤ ਕਰਨ ਲਈ

## ਸੂਚੀ (Table of Contents)

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

ਪ੍ਰੀ-ਫਲਾਈਟ ਜਾਂਚਾਂ ਇਹ ਅਹੰਕਾਰਕ ਵੈਰੀਫਿਕੇਸ਼ਨ ਹਨ ਜੋ ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਕੀਤੀਆਂ ਜਾਂਦੀਆਂ ਹਨ ਤਾਂ ਜੋ ਯਕੀਨੀ ਬਣਾਇਆ ਜਾ ਸਕੇ:

- **Resource availability** ਅਤੇ ਟਾਰਗਟ ਰੀਜਨਾਂ ਵਿੱਚ ਕੁਆਟਾ
- **Authentication and permissions** ਸਹੀ ਤਰੀਕੇ ਨਾਲ ਸੰਰਚਿਤ ਹੋਣ
- **Template validity** ਅਤੇ ਪੈਰਾਮੀਟਰ ਸਹੀਤਾ
- **Network connectivity** ਅਤੇ ਨਿਰਭਰਤਾਵਾਂ
- **Security compliance** ਸੰਗਠਨਾਤਮਕ ਨੀਤੀਆਂ ਦੇ ਅਨੁਕੂਲ
- **Cost estimation** ਬਜਟ ਦੀਆਂ ਸੀਮਾਵਾਂ ਵਿੱਚ

### ਕਦੋਂ ਪ੍ਰੀ-ਫਲਾਈਟ ਜਾਂਚ ਚਲਾਣੀਆਂ

- **ਨਵੇਂ ਵਾਤਾਵਰਣ** ਲਈ ਪਹਿਲੇ ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ
- **ਟੈਮਪਲੇਟਾਂ ਵਿੱਚ ਮਹੱਤਵਪੂਰਨ ਬਦਲਾਅ** ਤੋਂ ਬਾਅਦ
- **ਪ੍ਰੋਡਕਸ਼ਨ ਡਿਪਲੋਇਮੈਂਟਾਂ** ਤੋਂ ਪਹਿਲਾਂ
- **Azure ਰੀਜਨਾਂ ਨੂੰ ਬਦਲਣ ਵੇਲੇ**
- **CI/CD ਪਾਈਪਲਾਈਨਾਂ ਦੇ ਹਿੱਸੇ ਵਜੋਂ**

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

# ਆਉਟਪੁੱਟ ਲਈ ਰੰਗ-ਕੋਡਿੰਗ
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
    
    # AZD ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
    try {
        $azdVersion = azd version --output json | ConvertFrom-Json
        Write-Status "AZD CLI installed" "Success" "Version: $($azdVersion.azd.version)"
    }
    catch {
        Write-Status "AZD CLI not found" "Error" "Install from https://aka.ms/azd-install"
        return $false
    }
    
    # Azure CLI ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
    try {
        $azVersion = az version --output json | ConvertFrom-Json
        Write-Status "Azure CLI installed" "Success" "Version: $($azVersion.'azure-cli')"
    }
    catch {
        Write-Status "Azure CLI not found" "Error" "Install from https://aka.ms/azcli"
        return $false
    }
    
    # PowerShell ਦਾ ਵਰਜਨ ਜਾਂਚੋ
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
        # AZD ਪ੍ਰਮਾਣਿਕਤਾ ਦੀ ਜਾਂਚ ਕਰੋ
        $azdAuth = azd auth login --check-status --output json 2>$null | ConvertFrom-Json
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
        }
        else {
            Write-Status "AZD authentication" "Error" "Run 'azd auth login'"
            return $false
        }
        
        # Azure CLI ਪ੍ਰਮਾਣਿਕਤਾ ਦੀ ਜਾਂਚ ਕਰੋ
        $azAccount = az account show --output json | ConvertFrom-Json
        Write-Status "Azure CLI authentication" "Success" "Subscription: $($azAccount.name)"
        
        # ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਐਕਸੈਸ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
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
        # ਮੌਜੂਦਾ ਯੂਜ਼ਰ ਦੇ ਰੋਲ ਅਸਾਈਨਮੈਂਟ ਪ੍ਰਾਪਤ ਕਰੋ
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
        
        # ਰਿਸੋਰਸ ਗਰੁੱਪ ਬਣਾਉਣ ਦੀ ਟੈਸਟ ਕਰੋ (ਜੇ ਦਿੱਤਾ ਹੋਵੇ)
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # ਰਿਸੋਰਸ ਗਰੁੱਪ ਬਣਾਉਣ ਦੀ ਯੋਗਤਾ ਦੀ ਜਾਂਚ
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
        # ਕੰਪਿਊਟ ਕੋਟਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
        $computeUsage = az vm list-usage --location $Location --output json | ConvertFrom-Json
        
        # ਖਾਸ ਕੋਟਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
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
        
        # App Service ਦੀਆਂ ਸੀਮਾਵਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
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
        
        # ਸਟੋਰੇਜ ਅਕਾਊਂਟ ਦੀਆਂ ਸੀਮਾਵਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
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
        return $true # ਗੈਰ-ਬਲਾਕਿੰਗ
    }
}

function Test-NetworkConnectivity {
    Write-Host "`n${Blue}=== Network Connectivity Check ===${Reset}"
    
    # Azure ਐਂਡਪੋਇੰਟਸ ਦੀ ਜਾਂਚ ਕਰੋ
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
    
    # DNS ਰਿਜ਼ੋਲਿਊਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
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
    
    # ਜਾਂਚੋ ਕਿ azure.yaml ਮੌਜੂਦ ਹੈ ਜਾਂ ਨਹੀਂ
    if (Test-Path "azure.yaml") {
        Write-Status "azure.yaml found" "Success"
        
        # azure.yaml ਨੂੰ ਪਾਰਸ ਕਰੋ
        try {
            $azureYaml = Get-Content "azure.yaml" -Raw | ConvertFrom-Yaml
            Write-Status "azure.yaml parsing" "Success"
            
            # ਸੇਵਾਵਾਂ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
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
    
    # ਇੰਫਰਾਸਟਰਕਚਰ ਫਾਇਲਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
    if (Test-Path "infra") {
        $bicepFiles = Get-ChildItem -Path "infra" -Filter "*.bicep" -Recurse
        if ($bicepFiles.Count -gt 0) {
            Write-Status "Infrastructure templates" "Success" "$($bicepFiles.Count) Bicep files found"
            
            # ਜੇ main.bicep ਮੌਜੂਦ ਹੈ ਤਾਂ ਉਸ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
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
    
    # 🧪 ਨਵਾਂ: ਇੰਫਰਾਸਟਰਕਚਰ ਪ੍ਰੀਵਿਊ ਦੀ ਜਾਂਚ (ਸੁਰੱਖਿਅਤ ਡ੍ਰਾਈ-ਰਨ)
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
        # ਜਾਂਚੋ ਕਿ ਲੋਕੇਸ਼ਨ ਵੈਧ ਹੈ ਜਾਂ ਨਹੀਂ
        $locations = az account list-locations --output json | ConvertFrom-Json
        $validLocation = $locations | Where-Object { $_.name -eq $Location -or $_.displayName -eq $Location }
        
        if ($validLocation) {
            Write-Status "Azure region" "Success" "Location '$Location' is valid"
        }
        else {
            Write-Status "Azure region" "Error" "Location '$Location' is not valid"
            return $false
        }
        
        # ਖੇਤਰ ਵਿੱਚ ਸੇਵਾ ਦੀ ਉਪਲਬਧਤਾ ਦੀ ਜਾਂਚ ਕਰੋ
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
    
    # ਮੂਲ ਖਰਚ ਅਨੁਮਾਨ (ਸਹੀ ਅਨੁਮਾਨ ਲਈ Azure Pricing API ਦੀ ਲੋੜ ਹੋਏਗੀ)
    Write-Status "Cost estimation" "Info" "Use Azure Pricing Calculator for detailed estimates"
    Write-Status "Monitoring setup" "Info" "Set up Azure Cost Management alerts"
    
    # ਜਾਂਚੋ ਕਿ ਬਜਟ ਮੌਜੂਦ ਹੈ ਜਾਂ ਨਹੀਂ
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
    
    # ਆਮ ਸੁਰੱਖਿਆ ਅਭਿਆਸਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
    try {
        # ਜਾਂਚੋ ਕਿ Key Vault ਸੰਰਚਿਤ ਹੈ ਜਾਂ ਨਹੀਂ
        if (Select-String -Path "infra/*.bicep" -Pattern "Microsoft.KeyVault" -Quiet) {
            Write-Status "Key Vault usage" "Success" "Key Vault detected in templates"
        }
        else {
            Write-Status "Key Vault usage" "Warning" "Consider using Key Vault for secrets"
        }
        
        # ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀ ਦੇ ਉਪਯੋਗ ਦੀ ਜਾਂਚ ਕਰੋ
        if (Select-String -Path "infra/*.bicep" -Pattern "managedIdentity|SystemAssigned" -Quiet) {
            Write-Status "Managed Identity" "Success" "Managed Identity detected"
        }
        else {
            Write-Status "Managed Identity" "Warning" "Consider using Managed Identity"
        }
        
        # HTTPS ਲਾਗੂ ਹੋਣ ਦੀ ਜਾਂਚ ਕਰੋ
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

# ਮੁੱਖ ਕਾਰਜਨਿਰਵਾਹ
function Invoke-PreflightCheck {
    Write-Host "${Green}AZD Pre-flight Check${Reset}" -ForegroundColor Green
    Write-Host "Environment: $EnvironmentName"
    Write-Host "Location: $Location"
    if ($ResourceGroup) { Write-Host "Resource Group: $ResourceGroup" }
    Write-Host "Time: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    Write-Host ""
    
    $allPassed = $true
    $results = @{}
    
    # ਸਭ ਜਾਂਚਾਂ ਚਲਾਓ
    $results["Prerequisites"] = Test-Prerequisites
    $results["Authentication"] = Test-Authentication
    $results["Permissions"] = Test-Permissions
    $results["QuotasAndLimits"] = Test-QuotasAndLimits
    $results["NetworkConnectivity"] = Test-NetworkConnectivity
    $results["TemplateValidation"] = Test-TemplateValidation
    $results["RegionalAvailability"] = Test-RegionalAvailability
    $results["CostEstimation"] = Test-CostEstimation
    $results["SecurityCompliance"] = Test-SecurityCompliance
    
    # ਸੰਖੇਪ
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

# ਪ੍ਰੀ-ਫਲਾਈਟ ਚੈੱਕ ਚਲਾਓ
Invoke-PreflightCheck
```

### Bash Pre-flight Checker

```bash
#!/bin/bash
# Unix/Linux ਸਿਸਟਮਾਂ ਲਈ ਪ੍ਰੀ-ਫਲਾਈਟ ਚੈੱਕਾਂ ਦੀ Bash ਵਰਜਨ

set -euo pipefail

# ਰੰਗ ਕੋਡ
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # ਕੋਈ ਰੰਗ ਨਹੀਂ

# ਗਲੋਬਲ ਵੈਰੀਏਬਲ
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
    
    # AZD ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਜਾਂਚ
    if command -v azd >/dev/null 2>&1; then
        local azd_version=$(azd version --output json | jq -r '.azd.version')
        print_status "AZD CLI installed" "success" "Version: $azd_version"
    else
        print_status "AZD CLI not found" "error" "Install from https://aka.ms/azd-install"
        return 1
    fi
    
    # Azure CLI ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਜਾਂਚ
    if command -v az >/dev/null 2>&1; then
        local az_version=$(az version --output json | jq -r '."azure-cli"')
        print_status "Azure CLI installed" "success" "Version: $az_version"
    else
        print_status "Azure CLI not found" "error" "Install from https://aka.ms/azcli"
        return 1
    fi
    
    # jq ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਜਾਂਚ
    if command -v jq >/dev/null 2>&1; then
        print_status "jq installed" "success"
    else
        print_status "jq not found" "warning" "Install jq for better JSON parsing"
    fi
    
    return 0
}

check_authentication() {
    echo -e "\n${BLUE}=== Authentication Check ===${NC}"
    
    # AZD ਪ੍ਰਮਾਣਿਕਤਾ ਦੀ ਜਾਂਚ
    if azd auth login --check-status >/dev/null 2>&1; then
        local principal_name=$(azd auth login --check-status --output json 2>/dev/null | jq -r '.principalName // "Unknown"')
        print_status "AZD authentication" "success" "User: $principal_name"
    else
        print_status "AZD authentication" "error" "Run 'azd auth login'"
        return 1
    fi
    
    # Azure CLI ਪ੍ਰਮਾਣਿਕਤਾ ਦੀ ਜਾਂਚ
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
    
    # azure.yaml ਦੀ ਜਾਂਚ
    if [[ -f "azure.yaml" ]]; then
        print_status "azure.yaml found" "success"
        
        # ਮੂਲ YAML ਵੈਧਤਾ
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
    
    # ਇੰਫ੍ਰਾਸਟ੍ਰਕਚਰ ਫਾਈਲਾਂ ਦੀ ਜਾਂਚ
    if [[ -d "infra" ]]; then
        local bicep_count=$(find infra -name "*.bicep" | wc -l)
        if [[ $bicep_count -gt 0 ]]; then
            print_status "Infrastructure templates" "success" "$bicep_count Bicep files found"
            
            # ਜੇ ਮੌਜੂਦ ਹੋਵੇ ਤਾਂ main.bicep ਦੀ ਵੈਧਤਾ ਕਰੋ
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
    
    # ਜਾਂਚੋ ਕਿ ਸਥਾਨ ਵੈਧ ਹੈ ਜਾਂ ਨਹੀਂ
    if az account list-locations --query "[?name=='$LOCATION' || displayName=='$LOCATION']" --output tsv | grep -q .; then
        print_status "Azure region" "success" "Location '$LOCATION' is valid"
    else
        print_status "Azure region" "error" "Location '$LOCATION' is not valid"
        return 1
    fi
    
    # ਸੇਵਾ ਦੀ ਉਪਲਬਧਤਾ ਦੀ ਜਾਂਚ
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
    # ਕਮਾਂਡ ਲਾਈਨ ਆਰਗੁਮੈਂਟਾਂ ਨੂੰ ਪਾਰਸ ਕਰੋ
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
    
    # ਜ਼ਰੂਰੀ ਪੈਰਾਮੀਟਰਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
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
    
    # ਚੈੱਕ ਚਲਾਓ
    local all_passed=true
    
    check_prerequisites || all_passed=false
    check_authentication || all_passed=false
    check_template_validation || all_passed=false
    check_regional_availability || all_passed=false
    
    # ਸਾਰ
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

# ਮੁੱਖ ਫੰਕਸ਼ਨ ਚਲਾਓ
main "$@"
```

---

## Manual Validation Checklist

### Pre-Deployment Checklist

ਇਸ ਚੈੱਕਲਿਸਟ ਨੂੰ ਪ੍ਰਿੰਟ ਕਰੋ ਅਤੇ ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਹਰ ਆਈਟਮ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ:

#### ✅ Environment Setup
- [ ] AZD CLI ਇੰਸਟਾਲ ਅਤੇ ਨਵੀਨਤਮ ਸੰਸਕਰਣ 'ਤੇ ਅਪਡੇਟ ਕੀਤਾ ਹੋਇਆ
- [ ] Azure CLI ਇੰਸਟਾਲ ਅਤੇ ਪ੍ਰਮਾਣੀਕृत
- [ ] ਸਹੀ Azure subscription ਚੁਣੀ ਗਈ
- [ ] ਵਾਤਾਵਰਣ ਦਾ ਨਾਮ ਵਿਲੱਖਣ ਹੈ ਅਤੇ ਨੈਮਿੰਗ ਪ੍ਰਣਾਲੀ ਅਨੁਸਾਰ ਹੈ
- [ ] ਟਾਰਗਟ ਰਿਸੋਰਸ ਗਰੁੱਪ ਪਛਾਣਿਆ ਗਿਆ ਜਾਂ ਬਣਾਇਆ ਜਾ ਸਕਦਾ ਹੈ

#### ✅ Authentication & Permissions
- [ ] ਸਫਲਤਾਪੂਰਵਕ ਪ੍ਰਮਾਣੀਕਰਨ ਕੀਤਾ ਗਿਆ `azd auth login`
- [ ] ਯੂਜ਼ਰ ਕੋਲ ਟਾਰਗਟ subscription/resource group 'ਤੇ Contributor ਰੋਲ ਹੈ
- [ ] CI/CD ਲਈ ਸੇਵਾ ਪ੍ਰਿੰਸੀਪਲ ਸੰਰਚਿਤ (ਜੇ ਲਾਗੂ ਹੋਵੇ)
- [ ] ਕੋਈ ਮਿਆਦ ਖਤਮ ਹੋਈਆਂ ਸਰਟੀਫਿਕੇਟ ਜਾਂ ਪ੍ਰਮਾਣਪੱਤਰ ਨਹੀਂ

#### ✅ Template Validation
- [ ] `azure.yaml` ਮੌਜੂਦ ਹੈ ਅਤੇ ਵੈਧ YAML ਹੈ
- [ ] azure.yaml ਵਿੱਚ ਪਰਿਭਾਸ਼ਤ ਸਾਰੇ ਸੇਵਾਵਾਂ ਦੇ ਲੀਏ ਸਬੰਧਤ ਸੋర్స్ ਕੋਡ ਹੈ
- [ ] `infra/` ਡਾਇਰੈਕਟਰੀ ਵਿੱਚ Bicep ਟੈਮਪਲੇਟ ਮੌਜੂਦ ਹਨ
- [ ] `main.bicep` ਬਿਨਾਂ ਐਰਰ ਦੇ ਕੰਪਾਇਲ ਹੁੰਦਾ ਹੈ (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 Infrastructure preview ਸਫਲਤਾਪੂਰਵਕ ਚਲਦੀ ਹੈ (`azd provision --preview`)
- [ ] ਸਾਰੇ ਲੋੜੀਂਦੇ ਪੈਰਾਮੀਟਰਾਂ ਦੇ ਡੀਫਾਲਟ ਮੁੱਲ ਹਨ ਜਾਂ ਪ੍ਰਦਾਨ ਕੀਤੇ ਜਾਣਗੇ
- [ ] ਟੈਮਪਲੇਟਾਂ ਵਿੱਚ ਕੋਈ ਹਾਰਡਕੋਡ ਕੀਤੇ ਗਏ ਸੈਕਰੇਟਸ ਨਹੀਂ

#### ✅ Resource Planning
- [ ] ਟਾਰਗਟ Azure ਰੀਜਨ ਚੁਣੀ ਅਤੇ ਵੈਰੀਫਾਈ ਕੀਤੀ ਗਈ
- [ ] ਲੋੜੀਂਦੇ Azure ਸੇਵਾਵਾਂ ਟਾਰਗਟ ਰੀਜਨ ਵਿੱਚ ਉਪਲਬਧ ਹਨ
- [ ] ਯੋਜਨਾਬੱਧ ਰਿਸੋਰਸ ਲਈ ਪ੍ਰਯਾਪਤ ਕੁਆਟਾ ਉਪਲਬਧ ਹੈ
- [ ] ਰਿਸੋਰਸ ਨਾਂਕਰਨ ਟਕਰਾਅ ਚੈੱਕ ਕੀਤੇ ਗਏ
- [ ] ਰਿਸੋਰਸਾਂ ਵਿੱਚ ਨਿਰਭਰਤਾਵਾਂ ਸਮਝੀਆਂ ਗਈਆਂ

#### ✅ Network & Security
- [ ] Azure ਐਂਡਪੋਇੰਟਸ ਲਈ ਨੈੱਟਵਰਕ ਕਨੈਕਟਿਵਿਟੀ ਦੀ ਜਾਂਚ ਕੀਤੀ ਗਈ
- [ ] ਲੋੜ ਪੈਣ 'ਤੇ ਫਾਇਰਵਾਲ/ਪਰੋਕਸੀ ਸੈਟਿੰਗਜ਼ ਸੰਰਚਿਤ
- [ ] Key Vault ਗੋਪਨੀਯਤਾ ਪ੍ਰਬੰਧਨ ਲਈ ਸੰਰਚਿਤ
- [ ] ਸੰਭਵ ਥਾਵਾਂ 'ਤੇ ਮੈਨੇਜਡ ਆਇਡੈਂਟਿਟੀਆਂ ਦੀ ਵਰਤੋਂ ਕੀਤੀ ਗਈ
- [ ] ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ HTTPS ਜ਼ੋਰ ਦਿੱਤਾ ਗਿਆ

#### ✅ Cost Management
- [ ] ਲਾਗਤ ਅੰਦਾਜ਼ੇ Azure Pricing Calculator ਦੀ ਵਰਤੋਂ ਨਾਲ ਗਣਨਾ ਕੀਤੇ ਗਏ
- [ ] ਲੋੜ ਹੋਣ 'ਤੇ ਬਜਟ ਅਲਰਟਸ ਸੰਰਚਿਤ ਕੀਤੇ ਗਏ
- [ ] ਵਾਤਾਵਰਣ ਕਿਸਮ ਲਈ ਉਚਿਤ SKUs ਚੁਣੇ ਗਏ
- [ ] ਪ੍ਰੋਡਕਸ਼ਨ ਵਰਕਲੋਡ ਲਈ ਰਿਜ਼ਰਵਡ ਸਮਰੱਥਾ 'ਤੇ ਵਿਚਾਰ ਕੀਤਾ ਗਿਆ

#### ✅ Monitoring & Observability
- [ ] ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ ਟੈਮਪਲੇਟਾਂ ਵਿੱਚ ਸੰਰਚਿਤ
- [ ] Log Analytics ਵਰਕਸਪੇਸ ਯੋਜਨਾ ਬਣਾਈ ਗਈ
- [ ] ਨਾਜ਼ੁੱਕ ਮੈਟਰਿਕਸ ਲਈ ਅਲਰਟ ਨਿਯਮ ਪਰਿਭਾਸ਼ਿਤ
- [ ] ਐਪਲੀਕੇਸ਼ਨਾਂ ਵਿੱਚ ਹੈਲਥ ਚੈੱਕ ਐਂਡਪੋਇੰਟ ਲਾਗੂ ਕੀਤੇ ਗਏ

#### ✅ Backup & Recovery
- [ ] ਡੇਟਾ ਰਿਸੋਰਸਾਂ ਲਈ ਬੈਕਅੱਪ ਰਣਨੀਤੀ ਪਰਿਭਾਸ਼ਿਤ
- [ ] Recovery time objectives (RTO) ਦਸਤਾਵੇਜ਼ ਕੀਤੇ ਗਏ
- [ ] Recovery point objectives (RPO) ਦਸਤਾਵੇਜ਼ ਕੀਤੇ ਗਏ
- [ ] ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਡਿਜਾਸਟਰ ਰਿਕਵਰੀ ਯੋਜਨਾ ਮੌਜੂਦ

---

## Environment Validation

### Development Environment Validation

```bash
#!/bin/bash
# ਡਿਵੈਲਪਮੈਂਟ ਵਾਤਾਵਰਣ ਲਈ ਵਿਸ਼ੇਸ਼ ਵੈਧਤਾ ਜਾਂਚਾਂ

validate_dev_environment() {
    echo "=== Development Environment Validation ==="
    
    # ਡਿਵੈਲਪਮੈਂਟ ਅਨੁਕੂਲ ਸੰਰਚਨਾਵਾਂ ਲਈ ਜਾਂਚ ਕਰੋ
    if grep -q "sku.*Free\|sku.*F1\|sku.*Basic" infra/*.bicep; then
        echo "✓ Development-appropriate SKUs detected"
    else
        echo "⚠ Consider using lower-cost SKUs for development"
    fi
    
    # ਸਵੈਚਲਿਤ ਬੰਦ ਕਰਨ ਵਾਲੀਆਂ ਸੰਰਚਨਾਵਾਂ ਲਈ ਜਾਂਚ ਕਰੋ
    if grep -q "autoShutdown\|deallocate" infra/*.bicep; then
        echo "✓ Auto-shutdown configuration found"
    else
        echo "ℹ Consider adding auto-shutdown for cost savings"
    fi
    
    # ਡਿਵੈਲਪਮੈਂਟ ਡੇਟਾਬੇਸ ਸੰਰਚਨਾਵਾਂ ਦੀ ਵੈਧਤਾ ਜਾਂਚੋ
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
# ਉਤਪਾਦਨ ਮਾਹੌਲ ਲਈ ਖਾਸ ਜਾਂਚਾਂ

validate_prod_environment() {
    echo "=== Production Environment Validation ==="
    
    # ਉੱਚ ਉਪਲਬਧਤਾ ਸੰਰਚਨਾਵਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
    if grep -q "zoneRedundant.*true\|Premium\|Standard_GRS" infra/*.bicep; then
        echo "✓ High availability configurations detected"
    else
        echo "⚠ Consider enabling high availability for production"
    fi
    
    # ਬੈਕਅੱਪ ਸੰਰਚਨਾਵਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
    if grep -q "backup\|retention\|pointInTimeRestore" infra/*.bicep; then
        echo "✓ Backup configurations found"
    else
        echo "⚠ Ensure backup strategies are implemented"
    fi
    
    # ਮਾਨੀਟਰਿੰਗ ਸੈਟਅਪ ਦੀ ਜਾਂਚ ਕਰੋ
    if grep -q "Microsoft.Insights\|Application_Type.*web" infra/*.bicep; then
        echo "✓ Monitoring and observability configured"
    else
        echo "⚠ Add comprehensive monitoring for production"
    fi
    
    # ਸੁਰੱਖਿਆ ਸੰਰਚਨਾਵਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
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
    
    # ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਵਿੱਚ ਸਟੋਰੇਜ ਅਕਾਊਂਟ ਪ੍ਰਾਪਤ ਕਰੋ
    accounts = run_command(['az', 'storage', 'account', 'list'])
    
    if accounts is None:
        print("❌ Could not retrieve storage account information")
        return False
    
    account_count = len(accounts)
    max_accounts = 250  # ਏਜ਼ਰ ਦੀ ਡਿਫੌਲਟ ਸੀਮਾ
    
    usage_percent = (account_count / max_accounts) * 100
    status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
    
    print(f"{status} Storage Accounts: {account_count}/{max_accounts} ({usage_percent:.1f}%)")
    
    return usage_percent < 95

def check_network_limits(location: str) -> bool:
    """Check network-related limits"""
    print(f"\n=== Network Limits Check ({location}) ===")
    
    # ਵਰਚੁਅਲ ਨੈੱਟਵਰਕਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
    vnets = run_command(['az', 'network', 'vnet', 'list'])
    if vnets is not None:
        vnet_count = len(vnets)
        print(f"✅ Virtual Networks: {vnet_count}/1000")
    
    # ਸਰਵਜਨਿਕ IP ਪਤਿਆਂ ਦੀ ਜਾਂਚ ਕਰੋ
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
    
    # ਜਾਂਚ ਚਲਾਓ
    all_passed &= check_compute_quotas(location)
    all_passed &= check_storage_limits(location)
    all_passed &= check_network_limits(location)
    
    # ਸਾਰਾਂਸ਼
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
# AZD ਡਿਪਲੋਇਮੈਂਟਾਂ ਲਈ ਸੁਰੱਖਿਆ ਅਤੇ ਅਨੁਕੂਲਤਾ ਦੀ ਜਾਂਚ

check_security_practices() {
    echo "=== Security Best Practices Check ==="
    
    local issues_found=0
    
    # Key Vault ਦੀ ਵਰਤੋਂ ਲਈ ਜਾਂਚ
    if grep -r "Microsoft.KeyVault" infra/ >/dev/null 2>&1; then
        echo "✅ Key Vault detected in infrastructure"
    else
        echo "⚠️  Key Vault not found - consider using for secrets management"
        ((issues_found++))
    fi
    
    # Managed identity ਦੀ ਵਰਤੋਂ ਦੀ ਜਾਂਚ
    if grep -r "managedIdentity\|SystemAssigned\|UserAssigned" infra/ >/dev/null 2>&1; then
        echo "✅ Managed Identity configuration detected"
    else
        echo "⚠️  Managed Identity not found - consider using for service authentication"
        ((issues_found++))
    fi
    
    # HTTPS ਲਾਗੂ ਕਰਨ ਦੀ ਜਾਂਚ
    if grep -r "httpsOnly.*true\|requireHttps.*true" infra/ >/dev/null 2>&1; then
        echo "✅ HTTPS enforcement detected"
    else
        echo "⚠️  HTTPS enforcement not found - ensure secure connections"
        ((issues_found++))
    fi
    
    # ਘੱਟੋ-ਘੱਟ TLS ਵਰਜ਼ਨ ਦੀ ਜਾਂਚ
    if grep -r "minimumTlsVersion.*'TLS1_2'" infra/ >/dev/null 2>&1; then
        echo "✅ Minimum TLS 1.2 configuration detected"
    else
        echo "⚠️  Minimum TLS version not specified - consider requiring TLS 1.2+"
        ((issues_found++))
    fi
    
    # ਜਨਤਕ ਪਹੁੰਚ ਪਾਬੰਦੀਆਂ ਦੀ ਜਾਂਚ
    if grep -r "allowBlobPublicAccess.*false\|publicNetworkAccess.*Disabled" infra/ >/dev/null 2>&1; then
        echo "✅ Public access restrictions detected"
    else
        echo "⚠️  Public access restrictions not found - consider limiting public access"
        ((issues_found++))
    fi
    
    # Network Security Groups ਦੀ ਜਾਂਚ
    if grep -r "Microsoft.Network/networkSecurityGroups" infra/ >/dev/null 2>&1; then
        echo "✅ Network Security Groups detected"
    else
        echo "ℹ️  Network Security Groups not found - may be acceptable depending on architecture"
    fi
    
    return $issues_found
}

check_compliance_requirements() {
    echo -e "\n=== Compliance Requirements Check ==="
    
    # ਡਾਟਾ ਐਨਕ੍ਰਿਪਸ਼ਨ ਦੀ ਜਾਂਚ
    if grep -r "encryption\|encryptionAtRest\|transparentDataEncryption" infra/ >/dev/null 2>&1; then
        echo "✅ Encryption configurations detected"
    else
        echo "⚠️  Encryption configurations not found - ensure data is encrypted"
    fi
    
    # ਆਡਿਟ ਲੌਗਿੰਗ ਦੀ ਜਾਂਚ
    if grep -r "Microsoft.Insights.*auditingSettings\|diagnosticSettings" infra/ >/dev/null 2>&1; then
        echo "✅ Audit logging configurations detected"
    else
        echo "⚠️  Audit logging not found - consider enabling for compliance"
    fi
    
    # ਬੈਕਅੱਪ ਅਤੇ ਰੱਖਣ ਨੀਤੀਆਂ ਦੀ ਜਾਂਚ
    if grep -r "backup.*Policy\|retentionPolicy\|retention.*Days" infra/ >/dev/null 2>&1; then
        echo "✅ Backup and retention policies detected"
    else
        echo "⚠️  Backup/retention policies not found - required for data governance"
    fi
}

# ਮੁੱਖ ਕਾਰਜਨਵਾਈ
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

## ਸਰਵੋਤਮ ਪ੍ਰਥਾਵਾਂ ਦਾ ਸਾਰ

### ✅ ਪ੍ਰੀ-ਫਲਾਈਟ ਚੈਕ ਲਈ ਸਰਵੋਤਮ ਅਭਿਆਸ

1. **ਜਿੱਥੇ ਸੰਭਵ ਆਟੋਮੇਟ ਕਰੋ**
   - ਚੈੱਕਾਂ ਨੂੰ CI/CD ਪਾਈਪਲਾਈਨਾਂ ਵਿੱਚ ਸ਼ਾਮِل ਕਰੋ
   - ਦੋਹਰਾਏ ਜਾਣ ਯੋਗ ਵੈਰੀਫਿਕੇਸ਼ਨਾਂ ਲਈ ਸਕ੍ਰਿਪਟਾਂ ਦੀ ਵਰਤੋਂ ਕਰੋ
   - ਆਡਿਟ ਟਰੇਲ ਲਈ ਨਤੀਜੇ ਸਟੋਰ ਕਰੋ

2. **ਵਾਤਾਵਰਣ-ਨਿਰਧਾਰਤ ਵੈਰੀਫਿਕੇਸ਼ਨ**
   - dev/staging/prod ਲਈ ਵੱਖ-ਵੱਖ ਚੈੱਕ
   - ਹਰ ਵਾਤਾਵਰਣ ਲਈ ਉਚਿਤ ਸੁਰੱਖਿਆ ਲੋੜਾਂ
   - ਗੈਰ-ਪ੍ਰੋਡਕਸ਼ਨ ਵਾਤਾਵਰਣਾਂ ਲਈ ਲਾਗਤ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ

3. **ਵਿਸਤ੍ਰਿਤ ਕਵਰੇਜ**
   - ਪ੍ਰਮਾਣੀਕਰਨ ਅਤੇ ਅਨੁਮਤੀਆਂ
   - ਰਿਸੋਰਸ ਕੁਆਟਾ ਅਤੇ ਉਪਲਬਧਤਾ
   - ਟੈਮਪਲੇਟ ਵੈਰੀਫਿਕੇਸ਼ਨ ਅਤੇ ਸਿੰਟੈਕਸ
   - ਸੁਰੱਖਿਆ ਅਤੇ ਅਨੁਕੂਲਤਾ ਲੋੜਾਂ

4. **ਸਪੱਸ਼ਟ ਰਿਪੋਰਟਿੰਗ**
   - ਰੰਗ-ਕੋਡਡ ਸਥਿਤੀ ਇੰਡੀਕੇਟਰ
   - ਰੀਮੇਡੀਏਸ਼ਨ ਕਦਮਾਂ ਨਾਲ ਵਿਸਤ੍ਰਿਤ ਐਰਰ ਸੁਨੇਹੇ
   - ਤੇਜ਼ ਅੰਕਲਨ ਲਈ ਸਾਰ ਰਿਪੋਰਟਾਂ

5. **Fail Fast**
   - ਜੇ ਅਹਿਮ ਚੈੱਕ ਫੇਲ ਹੋਣ ਤਾਂ ਡਿਪਲੋਇਮੈਂਟ ਰੋਕੋ
   - ਰਿਜ਼ੋਲੂਸ਼ਨ ਲਈ ਸਪਸ਼ਟ ਦਿਸ਼ਾ-ਨਿਰਦੇਸ਼ ਦਿਓ
   - ਚੈੱਕਾਂ ਨੂੰ ਮੁੜ ਚਲਾਉਣਾ ਆਸਾਨ ਬਣਾਉ

### ਆਮ ਪ੍ਰੀ-ਫਲਾਈਟ ਗਲਤੀਆਂ

1. **ਤੁਰੰਤ** ਡਿਪਲੋਇਮੈਂਟ ਲਈ ਵੈਰੀਫਿਕੇਸ਼ਨ ਛੱਡ ਦੇਣਾ
2. ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ **ਅਪਰਯਾਪਤ ਅਨੁਮਤੀਆਂ** ਜਾਂਚ
3. ਡਿਪਲੋਇਮੈਂਟ ਫੇਲ ਹੋਣ ਤੱਕ **ਕੁਆਟਾ ਸੀਮਾਵਾਂ ਨੂੰ ਨਜ਼ਰਅੰਦਾਜ਼** ਕਰਨਾ
4. CI/CD ਪਾਈਪਲਾਈਨਾਂ ਵਿੱਚ **ਟੈਮਪਲੇਟਾਂ ਨੂੰ ਨਾਹ ਵੈਰੀਫਾਈ ਕਰਨਾ**
5. ਪ੍ਰੋਡਕਸ਼ਨ ਵਾਤਾਵਰਣਾਂ ਲਈ **ਸੁਰੱਖਿਆ ਵੈਰੀਫਿਕੇਸ਼ਨ ਦੀ ਘਾਟ**
6. **ਅਪੇක්ෂਾ ਤੋਂ ਵੱਧ ਕਾਰਜਾਂ ਲਈ ਅਣਜਾਣ ਲਾਗਤ ਅੰਦਾਜ਼ੇ** ਜਿਸ ਨਾਲ ਬਜਟ ਵਿੱਚ ਹੈਰਾਨੀ ਹੋ ਸਕਦੀ ਹੈ

---

**ਪ੍ਰੋ ਟਿਪ**: ਆਪਣੀ CI/CD ਪਾਈਪਲਾਈਨ ਵਿੱਚ ਅਸਲ ਡਿਪਲੋਇਮੈਂਟ ਜੌਬ ਤੋਂ ਪਹਿਲਾਂ ਪ੍ਰੀ-ਫਲਾਈਟ ਚੈੱਕਾਂ ਨੂੰ ਵਿਭਿੰਨ ਜੌਬ ਵਜੋਂ ਚਲਾਓ। ਇਹ ਤੁਹਾਨੂੰ ਜਲਦੀ ਮੁੱਦਿਆਂ ਨੂੰ ਪਕੜਨ ਅਤੇ ਡਿਵੈਲਪਰਾਂ ਨੂੰ ਤੇਜ਼ ਫੀਡਬੈਕ ਦੇਣ ਯੋਗ ਬਣਾਉਂਦਾ ਹੈ।

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [SKU Selection](sku-selection.md)
- **ਅਗਲਾ ਪਾਠ**: [Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਅਸਵੀਕਾਰਨ:
ਇਹ ਦਸਤਾਵੇਜ਼ ਏ.ਆਈ. ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਹਾਲਾਂਕਿ ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਤ੍ਰੁੱਟੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੌਜੂਦ ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਅਧਿਕਾਰਿਕ ਸਰੋਤ ਸਮਝਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਉਪਜਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
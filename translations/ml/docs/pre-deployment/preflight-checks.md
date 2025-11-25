<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "943c0b72e253ba63ff813a2a580ebf10",
  "translation_date": "2025-11-24T23:09:10+00:00",
  "source_file": "docs/pre-deployment/preflight-checks.md",
  "language_code": "ml"
}
-->
# AZD ഡിപ്ലോയ്‌മെന്റുകൾക്കുള്ള പ്രീ-ഫ്ലൈറ്റ് പരിശോധനകൾ

**അധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: അധ്യായം 6 - പ്രീ-ഡിപ്ലോയ്‌മെന്റ് വാലിഡേഷൻ & പ്ലാനിംഗ്
- **⬅️ മുൻപ്**: [SKU തിരഞ്ഞെടുപ്പ്](sku-selection.md)
- **➡️ അടുത്ത അധ്യായം**: [അധ്യായം 7: പ്രശ്നപരിഹാരം](../troubleshooting/common-issues.md)
- **🔧 ബന്ധപ്പെട്ടത്**: [അധ്യായം 4: ഡിപ്ലോയ്‌മെന്റ് ഗൈഡ്](../deployment/deployment-guide.md)

## പരിചയം

ഈ സമഗ്രമായ ഗൈഡ്, Azure Developer CLI ഡിപ്ലോയ്‌മെന്റുകൾ ആരംഭിക്കുന്നതിന് മുമ്പ് വിജയകരമായ പ്രീ-ഡിപ്ലോയ്‌മെന്റിനായി വാലിഡേഷൻ സ്ക്രിപ്റ്റുകളും പ്രക്രിയകളും നൽകുന്നു. ഡിപ്ലോയ്‌മെന്റ് പരാജയങ്ങൾ തടയാനും ഡിപ്ലോയ്‌മെന്റ് വിജയ നിരക്കുകൾ മെച്ചപ്പെടുത്താനും ഓട്ടോമേറ്റഡ് പരിശോധനകൾ പ്രാവർത്തികമാക്കാൻ പഠിക്കുക.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ഗൈഡ് പൂർത്തിയാക്കുന്നതിലൂടെ, നിങ്ങൾ:
- ഓട്ടോമേറ്റഡ് പ്രീ-ഡിപ്ലോയ്‌മെന്റ് വാലിഡേഷൻ സാങ്കേതികതകളും സ്ക്രിപ്റ്റുകളും കൈവരിക്കും
- ഓത്തന്റിക്കേഷൻ, അനുമതികൾ, ക്വോട്ടകൾ എന്നിവയ്ക്കുള്ള സമഗ്രമായ പരിശോധനാ തന്ത്രങ്ങൾ മനസ്സിലാക്കും
- റിസോഴ്‌സ് ലഭ്യതയും ശേഷിയും വാലിഡേറ്റ് ചെയ്യാനുള്ള പ്രക്രിയകൾ പ്രാവർത്തികമാക്കും
- സംഘടനാ നയങ്ങൾക്ക് അനുയോജ്യമായ സുരക്ഷാ പരിശോധനകൾ കോൺഫിഗർ ചെയ്യും
- ചെലവ് കണക്കുകൂട്ടലും ബജറ്റ് വാലിഡേഷൻ വർക്ക്‌ഫ്ലോകളും രൂപകൽപ്പന ചെയ്യും
- CI/CD പൈപ്പ്ലൈനുകൾക്കായി കസ്റ്റം പ്രീ-ഫ്ലൈറ്റ് ചെക്ക് ഓട്ടോമേഷൻ സൃഷ്ടിക്കും

## പഠന ഫലങ്ങൾ

പൂർത്തിയാക്കുന്നതോടെ, നിങ്ങൾക്ക് കഴിയും:
- സമഗ്രമായ പ്രീ-ഫ്ലൈറ്റ് വാലിഡേഷൻ സ്ക്രിപ്റ്റുകൾ സൃഷ്ടിക്കുകയും പ്രവർത്തിപ്പിക്കുകയും ചെയ്യുക
- വ്യത്യസ്ത ഡിപ്ലോയ്‌മെന്റ് സാഹചര്യങ്ങൾക്ക് ഓട്ടോമേറ്റഡ് പരിശോധനാ വർക്ക്‌ഫ്ലോകൾ രൂപകൽപ്പന ചെയ്യുക
- പരിസ്ഥിതി-നിർദ്ദിഷ്ട വാലിഡേഷൻ പ്രക്രിയകളും നയങ്ങളും പ്രാവർത്തികമാക്കുക
- ഡിപ്ലോയ്‌മെന്റ് റെഡിനസിനായി പ്രോആക്റ്റീവ് മോണിറ്ററിംഗും അലർട്ടിംഗും കോൺഫിഗർ ചെയ്യുക
- പ്രീ-ഡിപ്ലോയ്‌മെന്റ് പ്രശ്നങ്ങൾ പരിഹരിക്കുകയും ശരിയാക്കൽ നടപടികൾ നടപ്പിലാക്കുകയും ചെയ്യുക
- പ്രീ-ഫ്ലൈറ്റ് ചെക്കുകൾ DevOps പൈപ്പ്ലൈനുകളിലും ഓട്ടോമേഷൻ വർക്ക്‌ഫ്ലോകളിലും സംയോജിപ്പിക്കുക

## ഉള്ളടക്ക പട്ടിക

- [അവലോകനം](../../../../docs/pre-deployment)
- [ഓട്ടോമേറ്റഡ് പ്രീ-ഫ്ലൈറ്റ് സ്ക്രിപ്റ്റ്](../../../../docs/pre-deployment)
- [മാനുവൽ വാലിഡേഷൻ ചെക്ക്ലിസ്റ്റ്](../../../../docs/pre-deployment)
- [പരിസ്ഥിതി വാലിഡേഷൻ](../../../../docs/pre-deployment)
- [റിസോഴ്‌സ് വാലിഡേഷൻ](../../../../docs/pre-deployment)
- [സുരക്ഷ & അനുസരണ പരിശോധനകൾ](../../../../docs/pre-deployment)
- [പ്രകടന & ശേഷി പ്ലാനിംഗ്](../../../../docs/pre-deployment)
- [സാധാരണ പ്രശ്നങ്ങൾ പരിഹരിക്കൽ](../../../../docs/pre-deployment)

---

## അവലോകനം

പ്രീ-ഫ്ലൈറ്റ് ചെക്കുകൾ ഡിപ്ലോയ്‌മെന്റിന് മുമ്പ് നിർവ്വഹിക്കുന്ന പ്രധാന വാലിഡേഷനുകളാണ്, ഇത് ഉറപ്പാക്കുന്നു:

- **റിസോഴ്‌സ് ലഭ്യത**യും ലക്ഷ്യ പ്രദേശങ്ങളിലെ ക്വോട്ടകളും
- **ഓത്തന്റിക്കേഷൻ & അനുമതികൾ** ശരിയായി കോൺഫിഗർ ചെയ്തിരിക്കുന്നു
- **ടെംപ്ലേറ്റ് സാധുത**യും പാരാമീറ്റർ ശരിവും
- **നെറ്റ്‌വർക്കിന്റെ കണക്റ്റിവിറ്റി**യും ആശ്രിതത്വങ്ങളും
- **സുരക്ഷാ അനുസരണം** സംഘടനാ നയങ്ങൾക്കനുസൃതമായി
- **ചെലവ് കണക്കുകൂട്ടൽ** ബജറ്റ് പരിധിയിൽ

### പ്രീ-ഫ്ലൈറ്റ് ചെക്കുകൾ എപ്പോൾ നടത്തണം

- **പുതിയ പരിസ്ഥിതിയിലേക്ക് ആദ്യ ഡിപ്ലോയ്‌മെന്റിന് മുമ്പ്**
- **പ്രധാനമായ ടെംപ്ലേറ്റ് മാറ്റങ്ങൾക്കു ശേഷം**
- **പ്രൊഡക്ഷൻ ഡിപ്ലോയ്‌മെന്റുകൾക്ക് മുമ്പ്**
- **Azure പ്രദേശങ്ങൾ മാറ്റുമ്പോൾ**
- **CI/CD പൈപ്പ്ലൈനുകളുടെ ഭാഗമായും**

---

## ഓട്ടോമേറ്റഡ് പ്രീ-ഫ്ലൈറ്റ് സ്ക്രിപ്റ്റ്

### PowerShell പ്രീ-ഫ്ലൈറ്റ് ചെക്കർ

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

# ഔട്ട്പുട്ടിനുള്ള നിറം കോഡിംഗ്
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
    
    # AZD ഇൻസ്റ്റലേഷൻ പരിശോധിക്കുക
    try {
        $azdVersion = azd version --output json | ConvertFrom-Json
        Write-Status "AZD CLI installed" "Success" "Version: $($azdVersion.azd.version)"
    }
    catch {
        Write-Status "AZD CLI not found" "Error" "Install from https://aka.ms/azd-install"
        return $false
    }
    
    # Azure CLI ഇൻസ്റ്റലേഷൻ പരിശോധിക്കുക
    try {
        $azVersion = az version --output json | ConvertFrom-Json
        Write-Status "Azure CLI installed" "Success" "Version: $($azVersion.'azure-cli')"
    }
    catch {
        Write-Status "Azure CLI not found" "Error" "Install from https://aka.ms/azcli"
        return $false
    }
    
    # PowerShell പതിപ്പ് പരിശോധിക്കുക
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
        # AZD ഓത്തന്റിക്കേഷൻ പരിശോധിക്കുക
        $azdAuth = azd auth login --check-status --output json 2>$null | ConvertFrom-Json
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
        }
        else {
            Write-Status "AZD authentication" "Error" "Run 'azd auth login'"
            return $false
        }
        
        # Azure CLI ഓത്തന്റിക്കേഷൻ പരിശോധിക്കുക
        $azAccount = az account show --output json | ConvertFrom-Json
        Write-Status "Azure CLI authentication" "Success" "Subscription: $($azAccount.name)"
        
        # സബ്സ്ക്രിപ്ഷൻ ആക്സസ് സാധൂകരിക്കുക
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
        # നിലവിലെ ഉപയോക്താവിന്റെ റോൾ അസൈൻമെന്റുകൾ നേടുക
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
        
        # റിസോഴ്‌സ് ഗ്രൂപ്പ് സൃഷ്ടി പരീക്ഷിക്കുക (നിർവചിച്ചാൽ)
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # റിസോഴ്‌സ് ഗ്രൂപ്പ് സൃഷ്ടിക്കാനുള്ള കഴിവ് പരീക്ഷിക്കുക
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
        # കംപ്യൂട്ട് ക്വോട്ടകൾ പരിശോധിക്കുക
        $computeUsage = az vm list-usage --location $Location --output json | ConvertFrom-Json
        
        # പ്രത്യേക ക്വോട്ടകൾ പരിശോധിക്കുക
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
        
        # ആപ്പ് സർവീസ് പരിധികൾ പരിശോധിക്കുക
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
        
        # സ്റ്റോറേജ് അക്കൗണ്ട് പരിധികൾ പരിശോധിക്കുക
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
        return $true # ബ്ലോക്ക് ചെയ്യാത്തത്
    }
}

function Test-NetworkConnectivity {
    Write-Host "`n${Blue}=== Network Connectivity Check ===${Reset}"
    
    # Azure എൻഡ്പോയിന്റുകൾ പരീക്ഷിക്കുക
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
    
    # DNS റെസല്യൂഷൻ പരീക്ഷിക്കുക
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
    
    # azure.yaml നിലവിലുണ്ടോ എന്ന് പരിശോധിക്കുക
    if (Test-Path "azure.yaml") {
        Write-Status "azure.yaml found" "Success"
        
        # azure.yaml പാഴ്സ് ചെയ്യുക
        try {
            $azureYaml = Get-Content "azure.yaml" -Raw | ConvertFrom-Yaml
            Write-Status "azure.yaml parsing" "Success"
            
            # സേവനങ്ങൾ സാധൂകരിക്കുക
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
    
    # ഇൻഫ്രാസ്ട്രക്ചർ ഫയലുകൾക്കായി പരിശോധിക്കുക
    if (Test-Path "infra") {
        $bicepFiles = Get-ChildItem -Path "infra" -Filter "*.bicep" -Recurse
        if ($bicepFiles.Count -gt 0) {
            Write-Status "Infrastructure templates" "Success" "$($bicepFiles.Count) Bicep files found"
            
            # main.bicep നിലവിലുണ്ടെങ്കിൽ സാധൂകരിക്കുക
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
    
    # 🧪 പുതിയത്: ഇൻഫ്രാസ്ട്രക്ചർ പ്രിവ്യൂ പരീക്ഷിക്കുക (സുരക്ഷിത ഡ്രൈ-റൺ)
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
        # ലൊക്കേഷൻ സാധുവാണോ എന്ന് പരിശോധിക്കുക
        $locations = az account list-locations --output json | ConvertFrom-Json
        $validLocation = $locations | Where-Object { $_.name -eq $Location -or $_.displayName -eq $Location }
        
        if ($validLocation) {
            Write-Status "Azure region" "Success" "Location '$Location' is valid"
        }
        else {
            Write-Status "Azure region" "Error" "Location '$Location' is not valid"
            return $false
        }
        
        # പ്രദേശത്ത് സേവന ലഭ്യത പരിശോധിക്കുക
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
    
    # അടിസ്ഥാന ചെലവ് കണക്കുകൂട്ടൽ (കൃത്യമായ കണക്കുകൾക്കായി Azure Pricing API ആവശ്യമുണ്ട്)
    Write-Status "Cost estimation" "Info" "Use Azure Pricing Calculator for detailed estimates"
    Write-Status "Monitoring setup" "Info" "Set up Azure Cost Management alerts"
    
    # ബജറ്റ് നിലവിലുണ്ടോ എന്ന് പരിശോധിക്കുക
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
    
    # സാധാരണ സുരക്ഷാ പ്രാക്ടീസുകൾക്കായി പരിശോധിക്കുക
    try {
        # Key Vault കോൺഫിഗർ ചെയ്തിട്ടുണ്ടോ എന്ന് പരിശോധിക്കുക
        if (Select-String -Path "infra/*.bicep" -Pattern "Microsoft.KeyVault" -Quiet) {
            Write-Status "Key Vault usage" "Success" "Key Vault detected in templates"
        }
        else {
            Write-Status "Key Vault usage" "Warning" "Consider using Key Vault for secrets"
        }
        
        # മാനേജ്ഡ് ഐഡന്റിറ്റി ഉപയോഗത്തിനായി പരിശോധിക്കുക
        if (Select-String -Path "infra/*.bicep" -Pattern "managedIdentity|SystemAssigned" -Quiet) {
            Write-Status "Managed Identity" "Success" "Managed Identity detected"
        }
        else {
            Write-Status "Managed Identity" "Warning" "Consider using Managed Identity"
        }
        
        # HTTPS എൻഫോഴ്സ്മെന്റ് പരിശോധിക്കുക
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

# പ്രധാന പ്രവർത്തനം
function Invoke-PreflightCheck {
    Write-Host "${Green}AZD Pre-flight Check${Reset}" -ForegroundColor Green
    Write-Host "Environment: $EnvironmentName"
    Write-Host "Location: $Location"
    if ($ResourceGroup) { Write-Host "Resource Group: $ResourceGroup" }
    Write-Host "Time: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    Write-Host ""
    
    $allPassed = $true
    $results = @{}
    
    # എല്ലാ പരിശോധനകളും പ്രവർത്തിപ്പിക്കുക
    $results["Prerequisites"] = Test-Prerequisites
    $results["Authentication"] = Test-Authentication
    $results["Permissions"] = Test-Permissions
    $results["QuotasAndLimits"] = Test-QuotasAndLimits
    $results["NetworkConnectivity"] = Test-NetworkConnectivity
    $results["TemplateValidation"] = Test-TemplateValidation
    $results["RegionalAvailability"] = Test-RegionalAvailability
    $results["CostEstimation"] = Test-CostEstimation
    $results["SecurityCompliance"] = Test-SecurityCompliance
    
    # സംഗ്രഹം
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

# പ്രീ-ഫ്ലൈറ്റ് പരിശോധന പ്രവർത്തിപ്പിക്കുക
Invoke-PreflightCheck
```

### Bash പ്രീ-ഫ്ലൈറ്റ് ചെക്കർ

```bash
#!/bin/bash
# യൂണിക്സ്/ലിനക്സ് സിസ്റ്റങ്ങൾക്കായുള്ള പ്രീ-ഫ്ലൈറ്റ് ചെക്കുകളുടെ ബാഷ് പതിപ്പ്

set -euo pipefail

# നിറ കോഡുകൾ
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # നിറമില്ല

# ഗ്ലോബൽ വേരിയബിളുകൾ
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
    
    # AZD ഇൻസ്റ്റലേഷൻ പരിശോധിക്കുക
    if command -v azd >/dev/null 2>&1; then
        local azd_version=$(azd version --output json | jq -r '.azd.version')
        print_status "AZD CLI installed" "success" "Version: $azd_version"
    else
        print_status "AZD CLI not found" "error" "Install from https://aka.ms/azd-install"
        return 1
    fi
    
    # Azure CLI ഇൻസ്റ്റലേഷൻ പരിശോധിക്കുക
    if command -v az >/dev/null 2>&1; then
        local az_version=$(az version --output json | jq -r '."azure-cli"')
        print_status "Azure CLI installed" "success" "Version: $az_version"
    else
        print_status "Azure CLI not found" "error" "Install from https://aka.ms/azcli"
        return 1
    fi
    
    # jq ഇൻസ്റ്റലേഷൻ പരിശോധിക്കുക
    if command -v jq >/dev/null 2>&1; then
        print_status "jq installed" "success"
    else
        print_status "jq not found" "warning" "Install jq for better JSON parsing"
    fi
    
    return 0
}

check_authentication() {
    echo -e "\n${BLUE}=== Authentication Check ===${NC}"
    
    # AZD ഓതന്റിക്കേഷൻ പരിശോധിക്കുക
    if azd auth login --check-status >/dev/null 2>&1; then
        local principal_name=$(azd auth login --check-status --output json 2>/dev/null | jq -r '.principalName // "Unknown"')
        print_status "AZD authentication" "success" "User: $principal_name"
    else
        print_status "AZD authentication" "error" "Run 'azd auth login'"
        return 1
    fi
    
    # Azure CLI ഓതന്റിക്കേഷൻ പരിശോധിക്കുക
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
    
    # azure.yaml പരിശോധിക്കുക
    if [[ -f "azure.yaml" ]]; then
        print_status "azure.yaml found" "success"
        
        # അടിസ്ഥാന YAML സാധൂകരണം
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
    
    # ഇൻഫ്രാസ്ട്രക്ചർ ഫയലുകൾ പരിശോധിക്കുക
    if [[ -d "infra" ]]; then
        local bicep_count=$(find infra -name "*.bicep" | wc -l)
        if [[ $bicep_count -gt 0 ]]; then
            print_status "Infrastructure templates" "success" "$bicep_count Bicep files found"
            
            # main.bicep നിലവിലുണ്ടെങ്കിൽ സാധൂകരിക്കുക
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
    
    # സ്ഥലം സാധുവാണോ എന്ന് പരിശോധിക്കുക
    if az account list-locations --query "[?name=='$LOCATION' || displayName=='$LOCATION']" --output tsv | grep -q .; then
        print_status "Azure region" "success" "Location '$LOCATION' is valid"
    else
        print_status "Azure region" "error" "Location '$LOCATION' is not valid"
        return 1
    fi
    
    # സേവന ലഭ്യത പരിശോധിക്കുക
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
    # കമാൻഡ് ലൈൻ ആർഗ്യുമെന്റുകൾ പാഴ്സ് ചെയ്യുക
    while [[ $# -gt 0 ]]; ചെയ്യുക
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
    
    # ആവശ്യമായ പാരാമീറ്ററുകൾ സാധൂകരിക്കുക
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
    
    # ചെക്കുകൾ നടത്തുക
    local all_passed=true
    
    check_prerequisites || all_passed=false
    check_authentication || all_passed=false
    check_template_validation || all_passed=false
    check_regional_availability || all_passed=false
    
    # സംഗ്രഹം
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

# പ്രധാന ഫംഗ്ഷൻ പ്രവർത്തിപ്പിക്കുക
main "$@"
```

---

## മാനുവൽ വാലിഡേഷൻ ചെക്ക്ലിസ്റ്റ്

### പ്രീ-ഡിപ്ലോയ്‌മെന്റ് ചെക്ക്ലിസ്റ്റ്

ഈ ചെക്ക്ലിസ്റ്റ് പ്രിന്റ് ചെയ്ത് ഡിപ്ലോയ്‌മെന്റിന് മുമ്പ് ഓരോ ഇനവും പരിശോധിക്കുക:

#### ✅ പരിസ്ഥിതി സജ്ജീകരണം
- [ ] AZD CLI ഇൻസ്റ്റാൾ ചെയ്ത് ഏറ്റവും പുതിയ പതിപ്പിലേക്ക് അപ്ഡേറ്റ് ചെയ്തിരിക്കുന്നു
- [ ] Azure CLI ഇൻസ്റ്റാൾ ചെയ്ത് ഓത്തന്റിക്കേറ്റ് ചെയ്തിരിക്കുന്നു
- [ ] ശരിയായ Azure സബ്‌സ്‌ക്രിപ്ഷൻ തിരഞ്ഞെടുക്കുക
- [ ] പരിസ്ഥിതി പേര് യഥാർത്ഥവും നാമകരണം മാനദണ്ഡങ്ങൾ പാലിക്കുന്നതുമാണ്
- [ ] ലക്ഷ്യ റിസോഴ്‌സ് ഗ്രൂപ്പ് തിരിച്ചറിയുക അല്ലെങ്കിൽ സൃഷ്ടിക്കാവുന്നതാണ്

#### ✅ ഓത്തന്റിക്കേഷൻ & അനുമതികൾ
- [ ] `azd auth login` ഉപയോഗിച്ച് വിജയകരമായി ഓത്തന്റിക്കേറ്റ് ചെയ്തു
- [ ] ഉപയോക്താവിന് ലക്ഷ്യ സബ്‌സ്‌ക്രിപ്ഷൻ/റിസോഴ്‌സ് ഗ്രൂപ്പിൽ Contributor റോൾ ഉണ്ട്
- [ ] CI/CD-ക്കായി സർവീസ് പ്രിൻസിപ്പൽ കോൺഫിഗർ ചെയ്തിരിക്കുന്നു (ആവശ്യമെങ്കിൽ)
- [ ] കാലഹരണപ്പെട്ട സർട്ടിഫിക്കറ്റുകൾ അല്ലെങ്കിൽ ക്രെഡൻഷ്യലുകൾ ഇല്ല

#### ✅ ടെംപ്ലേറ്റ് വാലിഡേഷൻ
- [ ] `azure.yaml` നിലവിലുണ്ട്, ഇത് സാധുവായ YAML ആണ്
- [ ] azure.yaml-ൽ നിർവചിച്ച എല്ലാ സേവനങ്ങൾക്കും അനുബന്ധ സോഴ്‌സ് കോഡ് ഉണ്ട്
- [ ] `infra/` ഡയറക്ടറിയിലെ Bicep ടെംപ്ലേറ്റുകൾ നിലവിലുണ്ട്
- [ ] `main.bicep` പിശകുകൾ ഇല്ലാതെ കംപൈൽ ചെയ്യുന്നു (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 ഇൻഫ്രാസ്ട്രക്ചർ പ്രിവ്യൂ വിജയകരമായി പ്രവർത്തിക്കുന്നു (`azd provision --preview`)
- [ ] ആവശ്യമായ എല്ലാ പാരാമീറ്ററുകൾക്കും ഡിഫോൾട്ട് മൂല്യങ്ങൾ ഉണ്ട് അല്ലെങ്കിൽ നൽകും
- [ ] ടെംപ്ലേറ്റുകളിൽ ഹാർഡ്‌കോഡ് ചെയ്ത രഹസ്യങ്ങൾ ഇല്ല

#### ✅ റിസോഴ്‌സ് പ്ലാനിംഗ്
- [ ] ലക്ഷ്യ Azure പ്രദേശം തിരഞ്ഞെടുക്കുകയും വാലിഡേറ്റ് ചെയ്യുകയും ചെയ്തു
- [ ] ലക്ഷ്യ പ്രദേശത്ത് ആവശ്യമായ Azure സേവനങ്ങൾ ലഭ്യമാണ്
- [ ] പദ്ധതിയിട്ട റിസോഴ്‌സുകൾക്കുള്ള മതിയായ ക്വോട്ടകൾ ലഭ്യമാണ്
- [ ] റിസോഴ്‌സ് നാമകരണം സംഘർഷങ്ങൾ പരിശോധിച്ചു
- [ ] റിസോഴ്‌സുകൾ തമ്മിലുള്ള ആശ്രിതത്വങ്ങൾ മനസ്സിലാക്കി

#### ✅ നെറ്റ്‌വർക്കും സുരക്ഷയും
- [ ] Azure എൻഡ്പോയിന്റുകളിലേക്ക് നെറ്റ്‌വർക്കിന്റെ കണക്റ്റിവിറ്റി സ്ഥിരീകരിച്ചു
- [ ] ഫയർവാൾ/പ്രോക്സി ക്രമീകരണങ്ങൾ ആവശ്യമെങ്കിൽ കോൺഫിഗർ ചെയ്തു
- [ ] രഹസ്യങ്ങൾ കൈകാര്യം ചെയ്യുന്നതിനായി Key Vault കോൺഫിഗർ ചെയ്തു
- [ ] സാധ്യമായിടത്ത് മാനേജ്ഡ് ഐഡന്റിറ്റികൾ ഉപയോഗിച്ചു
- [ ] വെബ് ആപ്ലിക്കേഷനുകൾക്കായി HTTPS പ്രാബല്യത്തിൽ വരുത്തി

#### ✅ ചെലവ് മാനേജ്മെന്റ്
- [ ] Azure Pricing Calculator ഉപയോഗിച്ച് ചെലവ് കണക്കുകൾ കണക്കാക്കി
- [ ] ആവശ്യമെങ്കിൽ ബജറ്റ് അലർട്ടുകൾ കോൺഫിഗർ ചെയ്തു
- [ ] പരിസ്ഥിതി തരം അനുസരിച്ച് അനുയോജ്യമായ SKUs തിരഞ്ഞെടുക്കുക
- [ ] പ്രൊഡക്ഷൻ വർക്ക്‌ലോഡുകൾക്കായി റിസർവ്ഡ് ശേഷി പരിഗണിച്ചു

#### ✅ മോണിറ്ററിംഗും ഓബ്സർവബിലിറ്റിയും
- [ ] ടെംപ്ലേറ്റുകളിൽ Application Insights കോൺഫിഗർ ചെയ്തു
- [ ] Log Analytics വർക്ക്സ്പേസ് പ്ലാൻ ചെയ്തു
- [ ] നിർണായക മെട്രിക്‌സിനായി അലർട്ട് റൂളുകൾ നിർവചിച്ചു
- [ ] ആപ്ലിക്കേഷനുകളിൽ ഹെൽത്ത് ചെക്ക് എൻഡ്പോയിന്റുകൾ നടപ്പിലാക്കി

#### ✅ ബാക്കപ്പ് & റിക്കവറി
- [ ] ഡാറ്റാ റിസോഴ്‌സുകൾക്കായി ബാക്കപ്പ് തന്ത്രം നിർവചിച്ചു
- [ ] റിക്കവറി ടൈം ഒബ്ജക്റ്റീവുകൾ (RTO) രേഖപ്പെടുത്തി
- [ ] റിക്കവറി പോയിന്റ് ഒബ്ജക്റ്റീവുകൾ (RPO) രേഖപ്പെടുത്തി
- [ ] പ്രൊഡക്ഷനായി ദുരന്തം പുനരുദ്ധാരണ പദ്ധതി നിലവിലുണ്ട്

---

## പരിസ്ഥിതി വാലിഡേഷൻ

### ഡെവലപ്മെന്റ് പരിസ്ഥിതി വാലിഡേഷൻ

```bash
#!/bin/bash
# വികസന പരിസ്ഥിതി പ്രത്യേകമായ പരിശോധനകൾ

validate_dev_environment() {
    echo "=== Development Environment Validation ==="
    
    # വികസന സൗഹൃദമായ കോൺഫിഗറേഷനുകൾ പരിശോധിക്കുക
    if grep -q "sku.*Free\|sku.*F1\|sku.*Basic" infra/*.bicep; then
        echo "✓ Development-appropriate SKUs detected"
    else
        echo "⚠ Consider using lower-cost SKUs for development"
    fi
    
    # ഓട്ടോ-ഷട്ട്ഡൗൺ കോൺഫിഗറേഷനുകൾ പരിശോധിക്കുക
    if grep -q "autoShutdown\|deallocate" infra/*.bicep; then
        echo "✓ Auto-shutdown configuration found"
    else
        echo "ℹ Consider adding auto-shutdown for cost savings"
    fi
    
    # വികസന ഡാറ്റാബേസ് കോൺഫിഗറേഷനുകൾ പരിശോധിക്കുക
    if grep -q "Basic\|S0\|S1" infra/*.bicep; then
        echo "✓ Development database tiers configured"
    else
        echo "⚠ Consider using Basic/Standard tiers for development databases"
    fi
}
```

### പ്രൊഡക്ഷൻ പരിസ്ഥിതി വാലിഡേഷൻ

```bash
#!/bin/bash
# ഉത്പാദന പരിസ്ഥിതി പ്രത്യേകമായ പരിശോധനകൾ

validate_prod_environment() {
    echo "=== Production Environment Validation ==="
    
    # ഉയർന്ന ലഭ്യത കോൺഫിഗറേഷനുകൾ പരിശോധിക്കുക
    if grep -q "zoneRedundant.*true\|Premium\|Standard_GRS" infra/*.bicep; then
        echo "✓ High availability configurations detected"
    else
        echo "⚠ Consider enabling high availability for production"
    fi
    
    # ബാക്കപ്പ് കോൺഫിഗറേഷനുകൾ പരിശോധിക്കുക
    if grep -q "backup\|retention\|pointInTimeRestore" infra/*.bicep; then
        echo "✓ Backup configurations found"
    else
        echo "⚠ Ensure backup strategies are implemented"
    fi
    
    # നിരീക്ഷണ ക്രമീകരണം സാധൂകരിക്കുക
    if grep -q "Microsoft.Insights\|Application_Type.*web" infra/*.bicep; then
        echo "✓ Monitoring and observability configured"
    else
        echo "⚠ Add comprehensive monitoring for production"
    fi
    
    # സുരക്ഷാ കോൺഫിഗറേഷനുകൾ പരിശോധിക്കുക
    if grep -q "Microsoft.KeyVault\|managedIdentity\|httpsOnly.*true" infra/*.bicep; then
        echo "✓ Security best practices implemented"
    else
        echo "⚠ Review security configurations for production"
    fi
}
```

---

## റിസോഴ്‌സ് വാലിഡേഷൻ

### ക്വോട്ടാ വാലിഡേഷൻ സ്ക്രിപ്റ്റ്

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
    
    # സബ്സ്ക്രിപ്ഷനിലെ സ്റ്റോറേജ് അക്കൗണ്ടുകൾ നേടുക
    accounts = run_command(['az', 'storage', 'account', 'list'])
    
    if accounts is None:
        print("❌ Could not retrieve storage account information")
        return False
    
    account_count = len(accounts)
    max_accounts = 250  # ഡിഫോൾട്ട് Azure പരിധി
    
    usage_percent = (account_count / max_accounts) * 100
    status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
    
    print(f"{status} Storage Accounts: {account_count}/{max_accounts} ({usage_percent:.1f}%)")
    
    return usage_percent < 95

def check_network_limits(location: str) -> bool:
    """Check network-related limits"""
    print(f"\n=== Network Limits Check ({location}) ===")
    
    # വെർച്വൽ നെറ്റ്‌വർക്കുകൾ പരിശോധിക്കുക
    vnets = run_command(['az', 'network', 'vnet', 'list'])
    if vnets is not None:
        vnet_count = len(vnets)
        print(f"✅ Virtual Networks: {vnet_count}/1000")
    
    # പബ്ലിക് IP വിലാസങ്ങൾ പരിശോധിക്കുക
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
    
    # പരിശോധനകൾ നടത്തുക
    all_passed &= check_compute_quotas(location)
    all_passed &= check_storage_limits(location)
    all_passed &= check_network_limits(location)
    
    # സംഗ്രഹം
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

## സുരക്ഷ & അനുസരണ പരിശോധനകൾ

### സുരക്ഷാ വാലിഡേഷൻ സ്ക്രിപ്റ്റ്

```bash
#!/bin/bash
# AZD വിന്യാസങ്ങൾക്കുള്ള സുരക്ഷയും അനുസരണവും സ്ഥിരീകരിക്കുക

check_security_practices() {
    echo "=== Security Best Practices Check ==="
    
    local issues_found=0
    
    # കീ വോൾട്ട് ഉപയോഗം പരിശോധിക്കുക
    if grep -r "Microsoft.KeyVault" infra/ >/dev/null 2>&1; then
        echo "✅ Key Vault detected in infrastructure"
    else
        echo "⚠️  Key Vault not found - consider using for secrets management"
        ((issues_found++))
    fi
    
    # മാനേജുചെയ്യുന്ന ഐഡന്റിറ്റി ഉപയോഗം പരിശോധിക്കുക
    if grep -r "managedIdentity\|SystemAssigned\|UserAssigned" infra/ >/dev/null 2>&1; then
        echo "✅ Managed Identity configuration detected"
    else
        echo "⚠️  Managed Identity not found - consider using for service authentication"
        ((issues_found++))
    fi
    
    # HTTPS പ്രാബല്യം പരിശോധിക്കുക
    if grep -r "httpsOnly.*true\|requireHttps.*true" infra/ >/dev/null 2>&1; then
        echo "✅ HTTPS enforcement detected"
    else
        echo "⚠️  HTTPS enforcement not found - ensure secure connections"
        ((issues_found++))
    fi
    
    # കുറഞ്ഞ TLS പതിപ്പ് പരിശോധിക്കുക
    if grep -r "minimumTlsVersion.*'TLS1_2'" infra/ >/dev/null 2>&1; then
        echo "✅ Minimum TLS 1.2 configuration detected"
    else
        echo "⚠️  Minimum TLS version not specified - consider requiring TLS 1.2+"
        ((issues_found++))
    fi
    
    # പൊതുഅക്സസ് നിയന്ത്രണങ്ങൾ പരിശോധിക്കുക
    if grep -r "allowBlobPublicAccess.*false\|publicNetworkAccess.*Disabled" infra/ >/dev/null 2>&1; then
        echo "✅ Public access restrictions detected"
    else
        echo "⚠️  Public access restrictions not found - consider limiting public access"
        ((issues_found++))
    fi
    
    # നെറ്റ്‌വർക്കിന്റെ സുരക്ഷാ ഗ്രൂപ്പുകൾ പരിശോധിക്കുക
    if grep -r "Microsoft.Network/networkSecurityGroups" infra/ >/dev/null 2>&1; then
        echo "✅ Network Security Groups detected"
    else
        echo "ℹ️  Network Security Groups not found - may be acceptable depending on architecture"
    fi
    
    return $issues_found
}

check_compliance_requirements() {
    echo -e "\n=== Compliance Requirements Check ==="
    
    # ഡാറ്റ എൻക്രിപ്ഷൻ പരിശോധിക്കുക
    if grep -r "encryption\|encryptionAtRest\|transparentDataEncryption" infra/ >/dev/null 2>&1; then
        echo "✅ Encryption configurations detected"
    else
        echo "⚠️  Encryption configurations not found - ensure data is encrypted"
    fi
    
    # ഓഡിറ്റ് ലോഗിംഗ് പരിശോധിക്കുക
    if grep -r "Microsoft.Insights.*auditingSettings\|diagnosticSettings" infra/ >/dev/null 2>&1; then
        echo "✅ Audit logging configurations detected"
    else
        echo "⚠️  Audit logging not found - consider enabling for compliance"
    fi
    
    # ബാക്കപ്പ്, നിലനിർത്തൽ നയങ്ങൾ പരിശോധിക്കുക
    if grep -r "backup.*Policy\|retentionPolicy\|retention.*Days" infra/ >/dev/null 2>&1; then
        echo "✅ Backup and retention policies detected"
    else
        echo "⚠️  Backup/retention policies not found - required for data governance"
    fi
}

# പ്രധാന പ്രവർത്തനം
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

## CI/CD-യുമായി സംയോജനം

### GitHub Actions സംയോജനം

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

### Azure DevOps സംയോജനം

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

## മികച്ച പ്രാക്ടീസുകളുടെ സംഗ്രഹം

### ✅ പ്രീ-ഫ്ലൈറ്റ് ചെക്ക് മികച്ച പ്രാക്ടീസുകൾ

1. **സാധ്യമായിടത്ത് ഓട്ടോമേറ്റ് ചെയ്യുക**
   - ചെക്കുകൾ CI/CD പൈപ്പ്ലൈനുകളിൽ സംയോജിപ്പിക്കുക
   - ആവർത്തനയോഗ്യമായ വാലിഡേഷനുകൾക്കായി സ്ക്രിപ്റ്റുകൾ ഉപയോഗിക്കുക
   - ഫലങ്ങൾ ഓഡിറ്റ് ട്രെയിലുകൾക്കായി സംഭരിക്കുക

2. **പരിസ്ഥിതി-നിർദ്ദിഷ്ട വാലിഡേഷൻ**
   - ഡെവ്/സ്റ്റേജിംഗ്/പ്രൊഡക്ഷനായി വ്യത്യസ്ത ചെക്കുകൾ
   - പരിസ്ഥിതിയനുസരിച്ചുള്ള സുരക്ഷാ ആവശ്യങ്ങൾ
   - ഉൽപാദനേതര പരിസ്ഥിതികൾക്കായി ചെലവ് ഓപ്റ്റിമൈസേഷൻ

3. **സമഗ്രമായ കവറേജ്**
   - ഓത്തന്റിക്കേഷൻ & അനുമതികൾ
   - റിസോഴ്‌സ് ക്വോട്ടകളും ലഭ്യതയും
   - ടെംപ്ലേറ്റ് വാലിഡേഷൻ & സിന്റാക്സ്
   - സുരക്ഷ & അനുസരണ ആവശ്യങ്ങൾ

4. **വ്യക്തമായ റിപ്പോർട്ടിംഗ്**
   - കളർ-കോഡഡ് സ്റ്റാറ്റസ് സൂചകങ്ങൾ
   - പിശകുകൾക്ക് വിശദമായ പരിഹാര നടപടികളുള്ള മെസേജുകൾ
   - ദ്രുതമായ വിലയിരുത്തലിനായി സംഗ്രഹ റിപ്പോർട്ടുകൾ

5. **വേഗത്തിൽ പരാജയപ്പെടുക**
   - നിർണായക ചെക്കുകൾ പരാജയപ്പെട്ടാൽ ഡിപ്ലോയ്‌മെന്റ് നിർത്തുക
   - പരിഹാരത്തിനുള്ള വ്യക്തമായ മാർഗനിർദ്ദേശങ്ങൾ നൽകുക
   - ചെക്കുകൾ എളുപ്പത്തിൽ വീണ്ടും പ്രവർത്തിപ്പിക്കാൻ സാധ്യമാക്കുക

### സാധാരണ പ്രീ-ഫ്ലൈറ്റ് പിഴവുകൾ

1. **"വേഗത്തിൽ" ഡിപ്ലോയ്‌മെന്റുകൾക്കായി വാലിഡേഷൻ ഒഴിവാക്കുന്നു**
2. **ഡിപ്ലോയ്‌മെന്റിന് മുമ്പ് അപര്യാപ്തമായ അനുമതികൾ**
3. **ക്വോട്ടാ പരിധികൾ അവഗണിക്കുന്നു** ഡിപ്ലോയ്‌മെന്റ് പരാജയപ്പെടുന്നതുവരെ
4. **CI/CD പൈപ്പ്ലൈനുകളിൽ ടെംപ്ലേറ്റുകൾ വാലിഡേറ്റ് ചെയ്യാത്തത്**
5. **പ്രൊഡക്ഷൻ പരിസ്ഥിതികൾക്കുള്ള സുരക്ഷാ വാലിഡേഷൻ നഷ്ടപ്പെടുന്നു**
6. **അപര്യാപ്തമായ ചെലവ് കണക്കുകൂട്ടൽ** ബജറ്റ് ആശ്ചര്യങ്ങൾ ഉണ്ടാക്കുന്നു

---

**പ്രൊ ടിപ്പ്**: പ്രീ-ഫ്ലൈറ്റ് ചെക്കുകൾ നിങ്ങളുടെ CI/CD പൈപ്പ്ലൈനിൽ ഡിപ്ലോയ്‌മെന്റ് ജോബിന് മുമ്പ് ഒരു പ്രത്യേക ജോബായി പ്രവർത്തിപ്പിക്കുക. ഇത് പ്രശ്നങ്ങൾ നേരത്തേ കണ്ടെത്താനും ഡെവലപ്പർമാർക്ക് വേഗത്തിൽ ഫീഡ്ബാക്ക് നൽകാനും സഹായിക്കുന്നു.

---

**നാവിഗേഷൻ**
- **മുൻപത്തെ പാഠം**: [SKU തിരഞ്ഞെടുപ്പ്](sku-selection.md)
- **അടുത്ത പാഠം**: [ചീറ്റ് ഷീറ്റ്](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:  
ഈ രേഖ AI വിവർത്തന സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് വിവർത്തനങ്ങളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വഭാവ ഭാഷയിലുള്ള അസൽ രേഖയാണ് വിശ്വസനീയമായ ഉറവിടം എന്ന് പരിഗണിക്കേണ്ടത്. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ വിവർത്തനം ശുപാർശ ചെയ്യുന്നു. ഈ വിവർത്തനം ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾക്കോ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കോ ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
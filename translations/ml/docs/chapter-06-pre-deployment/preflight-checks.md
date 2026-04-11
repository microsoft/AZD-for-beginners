# AZD വിന്യാസങ്ങൾക്ക് മുൻ‍പുള്ള പരിശോധനകൾ

**അദ്ധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [ആസിഡി ഫോർ ബിഗിന്നേഴ്സ്](../../README.md)
- **📖 നിലവിലുള്ള അദ്ധ്യായം**: അദ്ധ്യായം 6 - മുൻവിന്യാസ പരിശോധന & പദ്ധതികരണം
- **⬅️ മുൻപത്തെ**: [SKU തിരഞ്ഞെടുപ്പ്](sku-selection.md)
- **➡️ അടുത്ത അദ്ധ്യായം**: [അദ്ധ്യായം 7: പ്രശ്നപരിഹാരം](../chapter-07-troubleshooting/common-issues.md)
- **🔧 ബന്ധപ്പെട്ടവ**: [അദ്ധ്യായം 4: വിന്യാസ മാൻുവൽ](../chapter-04-infrastructure/deployment-guide.md)

## പരിചയം

ഈ സമഗ്രമായ ഗൈഡ് ആരംഭിക്കാനായി azure developer CLI വിന്യാസങ്ങൾ വിജയകരമായി നടത്തുന്നതിനായി മുൻവിന്യാസ പരിശോധനാ സ്ക്രിപ്റ്റുകളും നടപടിക്രമങ്ങളും നൽകുന്നു. തെളിവുകൾ, സ്രോതസി ലഭ്യത, ക്വോട്ടകൾ, സുരക്ഷാ അനുസരണം, പ്രകടന ആവശ്യകതകൾ എന്നിവയ്ക്കായി ഓട്ടോമേറ്റഡ് പരിശോധനകൾ എങ്ങനെ നടപ്പിലാക്കാമെന്ന് പഠിക്കുക, വിന്യാസ പരാജയങ്ങളെ തടയുകയും വിജയ സാധ്യത വർദ്ധിപ്പിക്കുകയും ചെയ്യുക.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ഗൈഡ് പൂർത്തിയാക്കിയാൽ, നിങ്ങൾക്ക് കഴിയും:
- ഓട്ടോമേറ്റഡ് മുൻവിന്യാസ പരിശോധനാ техനിക്കുകളും സ്ക്രിപ്റ്റുകളും കൈകാര്യം ചെയ്യുക
- തെളീവുകൾ, അനുവാദങ്ങൾ, ക്വോട്ടുകൾ എന്നിവയുടെ സമഗ്ര പരിശോധന തന്ത്രങ്ങൾ മനസ്സിലാക്കുക
- സ്രോതസി ലഭ്യതയും ശേഷിയും സംബന്ധിച്ച പരിശോധനാ നടപടിക്രമങ്ങൾ നടപ്പിലാക്കുക
- സംഘടനയിലെ നയങ്ങൾക്കു വേണ്ടി സുരക്ഷാ അനുസരണപരിശോധനകൾ ക്രമീകരിക്കുക
- ചെലവുകൊണ്ടുള്ള കണക്കുകൂട്ടലും ബജറ്റ് പരിശോധന പ്രക്രിയകളും രൂപകൽപ്പന ചെയ്യുക
- CI/CD പൈപ്പ്ലൈനുകൾക്കുള്ള കസ്റ്റം മുൻഫ്ലൈറ്റ് പരിശോധന ഓട്ടോമേഷൻ രൂപകൽപ്പന ചെയ്യുക

## പഠനഫലങ്ങൾ

പൂർത്തിയാക്കിയപ്പോൾ, നിങ്ങൾക്ക് കഴിയും:
- സമഗ്ര മുൻഫ്ലൈറ്റ് പരിശോധന സ്ക്രിപ്റ്റുകൾ സൃഷ്ടിക്കുകയും നടത്തുകയും ചെയ്യുക
- വ്യത്യസ്ത വിന്യാസ സാഹചര്യങ്ങൾക്ക് ഓട്ടോമേറ്റഡ് പരിശോധന പ്രവാഹങ്ങൾ രൂപകൽപ്പന ചെയ്യുക
- പരിസ്ഥിതി-സ്പെസിഫിക് പരിശോധനാ നടപടിക്രമങ്ങളും നയങ്ങളും നടപ്പിലാക്കുക
- വിന്യാസത്തിന്റെ തയ്യാറെടുപ്പിന് മുൻകൂട്ടി നിരീക്ഷണവും അലർട്ടും ക്രമീകരിക്കുക
- മുൻവിന്യാസ പ്രശ്നങ്ങൾ പരിഹരിക്കുകയും ശരിയ്ക്കലുകൾ നടപ്പിലാക്കുകയും ചെയ്യുക
- DevOps പൈപ്പ്ലൈൻസിലും ഓട്ടോമേഷൻ പ്രവാഹങ്ങളിലും മുൻഫ്ലൈറ്റ് പരിശോധനകൾ സംയോജിപ്പിക്കുക

## ഉള്ളടക്ക പട്ടിക

- [അവലോകനം](#അവലോകനം)
- [ഓട്ടോമേറ്റഡ് മുൻഫ്ലൈറ്റ് സ്ക്രിപ്റ്റ്](#ഓട്ടോമേറ്റഡ്-മുൻഫ്ലൈറ്റ്-സ്ക്രിപ്റ്റ്)
- [മാനുവൽ പരിശോധന ചെക്ക്ലിസ്റ്റ്](#codeblock1)
- [പരിസ്ഥിതി പരിശോധന](#പരിസ്ഥിതി-പരിശോധന)
- [സ്രോതസി പരിശോധന](#codeblock3)
- [സുരക്ഷ & അനുസരണ പരിശോധനകൾ](#security--compliance-checks)
- [പ്രകടന & ശേഷി പദ്ധതികരണം](#performance--capacity-planning)
- [സാധാരണ പ്രശ്നങ്ങൾ പരിഹരിക്കൽ](#troubleshooting-common-issues)

---

## അവലോകനം

വിന്യാസം ആരംഭിക്കാനുമുമ്പുള്ള മുൻഫ്ലൈറ്റ് പരിശോധനകൾ നിർണായകമായ പരിശോധനകളാണ്, ഇത് ഉറപ്പാക്കുന്നു:

- **ലക്ഷ്യപ്രദേശങ്ങളിലെ** സ്രോതസി ലഭ്യതയും ക്വോട്ടകളും
- **തെളിവും അനുമതികളും** ശരിയായി ക്രമീകരിച്ചിരിക്കുന്നതും
- **ടെംപ്ലേറ്റ് സാധുത**യും പാരാമീറ്ററുകളുടെ ശരിത്വവും
- **നെറ്റ്‌വർക്കോ ബന്ധവും ആശ്രിതത്വങ്ങളും**
- **സുരക്ഷാ അനുസരണം** സ്ഥാപന നയങ്ങൾ പാലിക്കുന്നത്
- **ചിലവ് കണക്കുകൂട്ടൽ** ബജറ്റ് പരിധികളിനു ഉള്ളിൽ

### മുൻഫ്ലൈറ്റ് പരിശോധനകൾ എപ്പോൾ നടത്താം

- **പുതിയ പരിസ്ഥിതിയിലേക്ക് ആദ്യ വിന്യാസത്തിന് മുമ്പ്**
- **പ്രധാന ടെംപ്ലേറ്റ് മാറ്റങ്ങൾക്ക് ശേഷം**
- **പ്രോഡക്ഷൻ വിന്യാസങ്ങൾക്ക് മുമ്പ്**
- **ആസ്യൂർ പ്രദേശങ്ങൾ മാറ്റുമ്പോൾ**
- **CI/CD പൈപ്പ്ലൈനുകളുടെ ഭാഗമായ when**

---

## ഓട്ടോമേറ്റഡ് മുൻഫ്ലൈറ്റ് സ്ക്രിപ്റ്റ്

### പവർഷെൽ മുൻഫ്ലൈറ്റ് ചെക്കർ

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
        # AZD ആധാരീകരണം പരിശോധിക്കുക
        $azdAuth = azd auth login --check-status --output json 2>$null | ConvertFrom-Json
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
        }
        else {
            Write-Status "AZD authentication" "Error" "Run 'azd auth login'"
            return $false
        }
        
        # Azure CLI ആധാരീകരണം പരിശോധിക്കുക
        $azAccount = az account show --output json | ConvertFrom-Json
        Write-Status "Azure CLI authentication" "Success" "Subscription: $($azAccount.name)"
        
        # സബ്സ്ക്രിപ്ഷൻ ആക്‌സസ് സ്ഥിരീകരിക്കുക
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
        # നിലവിലെ ഉപയോക്താവിന്റെ റൂൾ നിയുക്തികൾ നേടുക
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
        
        # റിസോഴ്‌സ് ഗ്രൂപ്പ് സൃഷ്ടി പരിശോധന (നിർദ്ദിഷ്‌ടമായിട്ടുള്ള പക്ഷം)
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # റിസോഴ്‌സ് ഗ്രൂപ്പ് സൃഷ്ടിക്കാൻ കഴിവുള്ളതോ പരിശോധിക്കുക
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
        # കമ്പ്യൂട്ട് കോറ്റാസുകൾ പരിശോധിക്കുക
        $computeUsage = az vm list-usage --location $Location --output json | ConvertFrom-Json
        
        # പ്രത്യേക കോറ്റാസുകൾ പരിശോധിക്കുക
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
        
        # ആപ്പ് സർവീസ് പരിമിതികൾ പരിശോധിക്കുക
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
        
        # സ്റ്റോറേജ് അക്കൗണ്ട് പരിമിതികൾ പരിശോധിക്കുക
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
        return $true # തടസമില്ലാതെ
    }
}

function Test-NetworkConnectivity {
    Write-Host "`n${Blue}=== Network Connectivity Check ===${Reset}"
    
    # Azure എൻഡ്‌പോയിന്റുകൾ പരിശോധന
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
    
    # DNS പരിഹാര പരിശോധന
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
    
    # azure.yaml ഉണ്ട് എങ്കിൽ പരിശോധിക്കുക
    if (Test-Path "azure.yaml") {
        Write-Status "azure.yaml found" "Success"
        
        # azure.yaml നിയന്ത്രിക്കുക
        try {
            $azureYaml = Get-Content "azure.yaml" -Raw | ConvertFrom-Yaml
            Write-Status "azure.yaml parsing" "Success"
            
            # സേവനങ്ങൾ സ്ഥിരീകരിക്കുക
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
    
    # ഇൻഫ്രാസ്ട്രക്ചർ ഫയലുകൾ അന്വേഷിക്കുക
    if (Test-Path "infra") {
        $bicepFiles = Get-ChildItem -Path "infra" -Filter "*.bicep" -Recurse
        if ($bicepFiles.Count -gt 0) {
            Write-Status "Infrastructure templates" "Success" "$($bicepFiles.Count) Bicep files found"
            
            # main.bicep ഉണ്ടെങ്കിൽ സ്ഥിരീകരിക്കുക
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
    
    # 🧪 പുതിയത്: ഇൻഫ്രാസ്ട്രക്ചർ പ്രിവ്യൂ സൗകര്യകരമായ ഡ്രൈ-റൺ പരിശോധന
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
        # സ്ഥലം സാധുവാണോ പരിശോധിക്കുക
        $locations = az account list-locations --output json | ConvertFrom-Json
        $validLocation = $locations | Where-Object { $_.name -eq $Location -or $_.displayName -eq $Location }
        
        if ($validLocation) {
            Write-Status "Azure region" "Success" "Location '$Location' is valid"
        }
        else {
            Write-Status "Azure region" "Error" "Location '$Location' is not valid"
            return $false
        }
        
        # സേവന ലഭ്യത പ്രദേശത്ത് പരിശോധിക്കുക
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
    
    # അടിസ്ഥാന ചെലവ് മൂല്യനിർണ്ണയം (സുസ്പഷ്ടമായ കണക്കുകൾക്കായി Azure പ്ലാനിംഗ് API ആവശ്യമുണ്ട്)
    Write-Status "Cost estimation" "Info" "Use Azure Pricing Calculator for detailed estimates"
    Write-Status "Monitoring setup" "Info" "Set up Azure Cost Management alerts"
    
    # ബഡ്ജറ്റ് ഉണ്ടോ പരിശോധിക്കുക
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
    
    # സാധാരണ സുരക്ഷാ პრაქტിസുകൾ പരിശോധിക്കുക
    try {
        # കീ വാൾട്ട് ക്രമീകരിച്ചിട്ടുണ്ടോ പരിശോധിക്കുക
        if (Select-String -Path "infra/*.bicep" -Pattern "Microsoft.KeyVault" -Quiet) {
            Write-Status "Key Vault usage" "Success" "Key Vault detected in templates"
        }
        else {
            Write-Status "Key Vault usage" "Warning" "Consider using Key Vault for secrets"
        }
        
        # മാനേജ്ഡ് ഐഡന്റിറ്റി ഉപയോഗം പരിശോധിക്കുക
        if (Select-String -Path "infra/*.bicep" -Pattern "managedIdentity|SystemAssigned" -Quiet) {
            Write-Status "Managed Identity" "Success" "Managed Identity detected"
        }
        else {
            Write-Status "Managed Identity" "Warning" "Consider using Managed Identity"
        }
        
        # HTTPS നിർബന്ധിതം പരിശോധിക്കുക
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

# പ്രധാന നിർവഹണം
function Invoke-PreflightCheck {
    Write-Host "${Green}AZD Pre-flight Check${Reset}" -ForegroundColor Green
    Write-Host "Environment: $EnvironmentName"
    Write-Host "Location: $Location"
    if ($ResourceGroup) { Write-Host "Resource Group: $ResourceGroup" }
    Write-Host "Time: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    Write-Host ""
    
    $allPassed = $true
    $results = @{}
    
    # എല്ലാ പരിശോധനകളും നടത്തുക
    $results["Prerequisites"] = Test-Prerequisites
    $results["Authentication"] = Test-Authentication
    $results["Permissions"] = Test-Permissions
    $results["QuotasAndLimits"] = Test-QuotasAndLimits
    $results["NetworkConnectivity"] = Test-NetworkConnectivity
    $results["TemplateValidation"] = Test-TemplateValidation
    $results["RegionalAvailability"] = Test-RegionalAvailability
    $results["CostEstimation"] = Test-CostEstimation
    $results["SecurityCompliance"] = Test-SecurityCompliance
    
    # സംക്ഷേപം
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

# പ്രി-ഫ്ലൈറ്റ് പരിശോധന നടത്തുക
Invoke-PreflightCheck
```

### ബാഷ് മുൻഫ്ലൈറ്റ് ചെക്കർ

```bash
#!/bin/bash
# യൂണിക്സ്/ലിനക്സ് സิส്റ്റങ്ങളിലെ പ്രീ-ഫ്ലൈറ്റ് ചെക്കുകൾക്കുള്ള ബാഷ് പതിപ്പ്

set -euo pipefail

# നിറം കോഡുകൾ
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # നിറമില്ല

# ഗ്ലോബൽ വ്യാറിയബിൾസ്
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
    
    # AZD ഇൻസ്റ്റാളേഷൻ പരിശോധിക്കുക
    if command -v azd >/dev/null 2>&1; then
        local azd_version=$(azd version --output json | jq -r '.azd.version')
        print_status "AZD CLI installed" "success" "Version: $azd_version"
    else
        print_status "AZD CLI not found" "error" "Install from https://aka.ms/azd-install"
        return 1
    fi
    
    # Azure CLI ഇൻസ്റ്റാളേഷൻ പരിശോധിക്കുക
    if command -v az >/dev/null 2>&1; then
        local az_version=$(az version --output json | jq -r '."azure-cli"')
        print_status "Azure CLI installed" "success" "Version: $az_version"
    else
        print_status "Azure CLI not found" "error" "Install from https://aka.ms/azcli"
        return 1
    fi
    
    # jq ഇൻസ്റ്റാളേഷൻ പരിശോധിക്കുക
    if command -v jq >/dev/null 2>&1; then
        print_status "jq installed" "success"
    else
        print_status "jq not found" "warning" "Install jq for better JSON parsing"
    fi
    
    return 0
}

check_authentication() {
    echo -e "\n${BLUE}=== Authentication Check ===${NC}"
    
    # AZD അംഗീകാരം പരിശോധിക്കുക
    if azd auth login --check-status >/dev/null 2>&1; then
        local principal_name=$(azd auth login --check-status --output json 2>/dev/null | jq -r '.principalName // "Unknown"')
        print_status "AZD authentication" "success" "User: $principal_name"
    else
        print_status "AZD authentication" "error" "Run 'azd auth login'"
        return 1
    fi
    
    # Azure CLI അംഗീകാരം പരിശോധിക്കുക
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
        
        # അടിസ്ഥാന YAML പരിശോധന
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
            
            # നിലവിലുള്ള പക്ഷം main.bicep ശരിവക്കുക
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
    
    # ലൊക്കേഷൻ സാധുവാണോ പരിശോധിക്കുക
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
    # കമാൻഡ് ലൈൻ ആർഗ്യുമെന്റുകൾ पार്സ് ചെയ്യുക
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
    
    # ആവശ്യമായ പരാമീറ്ററുകൾ പരിശോധന നടത്തുക
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
    
    # പരിശോധനകൾ നടത്തുക
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

# പ്രധാന ഫംഗ്ഷൻ ഓടിക്കുക
main "$@"
```

---

##manuel പരിശോധന ചെക്ക്ലിസ്റ്റ്

### മുൻവിന്യാസ ചെക്ക്ലിസ്റ്റ്

ഈ ചെക്ക്ലിസ്റ്റു പ്രിന്റ് ചെയ്ത് വിന്യാസത്തിനു മുമ്പ് ഓരോ ഇനവും പരിശോധിക്കുക:

#### ✅ പരിസ്ഥിതി ക്രമീകരണം
- [ ] AZD CLI ഇൻസ്റ്റാൾ ചെയ്ത് ഏറ്റവും പുതിയ പതിപ്പ് അപ്‌ഡേറ്റ് ചെയ്തിരിക്കുന്നു
- [ ] Azure CLI ഇൻസ്റ്റാൾ ചെയ്ത് തെളിവടക്കം ചെയ്തിരിക്കുന്നു
- [ ] ശരിയായ Azure സബ്‌സ്‌ക്രിപ്ഷൻ തിരഞ്ഞെടുക്കപ്പെട്ടു
- [ ] പരിസ്ഥിതി നാമം പ്രവൃത്തിപൂര്‍വം ഒന്നിച്ചും നാമകരണം മാനദണ്ഡങ്ങൾ പാലിച്ചുകൊണ്ടുള്ളതും
- [ ] ലക്ഷ്യമിടുന്ന റിസോഴ്‌സ് ഗ്രൂപ്പ് തിരിച്ചറിഞ്ഞുവോ ഉണ്ടാക്കാവുന്നതാണോ

#### ✅ തെളിവും അനുമതികളും
- [ ] `azd auth login` ഉപയോഗിച്ച് വിജയകരമായി പാസ്സ് നടന്നിരിക്കുന്നു
- [ ] ഉപയോക്താവിന് ലക്ഷ്യ സബ്‌സ്‌ക്രിപ്ഷനിൽ/റിസോഴ്‌സ് ഗ്രൂപ്പിൽ Contributor റോളുണ്ട്
- [ ] CI/CD സവാളെക്കായി സർവീസ് പ്രിന്‍സിപ്പൽ ക്രമീകരിച്ചതുണ്ടോ (പ്രസക്തമാണെങ്കിൽ)
- [ ] കാലഹരണപ്പെട്ട സേർട്ടിഫിക്കറ്റുകളും ക്രെഡൻഷ്യലുകളും ഇല്ല

#### ✅ ടെംപ്ലേറ്റ് പരിശോദനം
- [ ] `azure.yaml` ഉണ്ട്, സാധുവായ YAML ആണ്
- [ ] azure.yamlൽ നിർവചിച്ച എല്ലാ സേവനങ്ങൾക്കും അനുയോജ്യമായ സോഴ്‌സ് കോഡ് ഉണ്ട്
- [ ] `infra/` ഡയറക്‌ടറിയിലുള്ള Bicep ടെംപ്ലേറ്റ്‌സ് ലഭ്യമാണ്
- [ ] `main.bicep` പിഴവുകൾ കൂടാതെ കംപൈൽ ചെയ്യുന്നു (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 ഇൻഫ്രാസ്ട്രക്ചർ മുൻനിരീക്ഷണം വിജയകരമായി നടത്തി (`azd provision --preview`)
- [ ] ആവശ്യമായ എല്ലാ പാരാമീറ്ററുകൾക്കും ഡിഫോൾട്ട് മൂല്യങ്ങളോ നൽകപ്പെടുന്നവയോ
- [ ] ടെംപ്ലേറ്റുകളിൽ സ്റ്റാറ്റിക് രഹസ്യങ്ങൾ ഇല്ലാതിരിക്കണം

#### ✅ സ്രോതസി പദ്ധതി
- [ ] ലക്ഷ്യമിടുന്ന ആസ്യൂർ പ്രദേശം തിരഞ്ഞെടുത്ത് പരിശോധിച്ചു
- [ ] ആവശ്യമായ ആസ്യൂർ സേവനങ്ങൾ ലക്ഷ്യ പ്രദേശത്ത് ലഭ്യമാണ്
- [ ] പദ്ധതിചെയ്ത സ്രോതസികൾക്കായി മതിയായ ക്വോട്ടകൾ ലഭ്യമാണ്
- [ ] റിസോഴ്‌സ് നാമകരണം എന്നിവയുടെ പൊരുത്തം പരിശോധിച്ചു
- [ ] റിസോഴ്‌സുകൾ തമ്മിലുള്ള ആശ്രിതത്വങ്ങൾ മനസ്സിലാക്കപ്പെട്ടിരിക്കുന്നു

#### ✅ നെറ്റ്‌വർക്ക് & സുരക്ഷ
- [ ] ആസ്യൂർ എൻ‌ഡ്‌പോയിന്റുകളിലേക്ക് നെറ്റ്‌വർക്ക് കണക്റ്റിവിറ്റി സ്ഥിരീകരിച്ചു
- [ ] ഫയർവാൾ/പ്രോക്സി സെറ്റിംഗുകൾ ആവശ്യത്തിനു ക്രമീകരിച്ചു
- [ ] രഹസ്യ നിയന്ത്രണത്തിന് കീ വാൾട്ട് ക്രമീകരിച്ചു
- [ ] പരിപാലന ഐഡന്റിറ്റികളിൽ വ്യാപകമായി ഉപയോഗിച്ചു
- [ ] വെബ് ആപ്ലിക്കേഷനുകൾക്കായി HTTPS നിർബന്ധിത നിശ്ചയിച്ചിരിക്കുന്നു

#### ✅ ചെലവ് മാനേജ്മെന്റ്
- [ ] ആസ്യൂർ പ്രൈസിംഗ് കാൽക്കുലേറ്റർ ഉപയോഗിച്ച് ചെലവ് കണക്കുകൂട്ടി
- [ ] ആവശ്യമായെങ്കിൽ ബജറ്റ് അലർട്ടുകൾ ക്രമീകരിച്ചു
- [ ] പരിസ്ഥിതി തരംകേട് കൊണ്ട് യോജിച്ച SKUകൾ തിരഞ്ഞെടുത്തു
- [ ] പ്രോഡക്ഷൻ ജോലികൾക്കായി റിസർവ്വ് ചെയ്ത ശേഷി പരിഗണിച്ചു

#### ✅ നിരീക്ഷണം & നിരീക്ഷണയോഗ്യത
- [ ] ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് ടെംപ്ലേറ്റുകളിൽ ക്രമീകരിച്ചു
- [ ] ലോഗ് അനലിറ്റിക്‌സ് വർക്ക്സ്പേസ് പദ്ധതിയിടുക
- [ ] നിർണായക മീറ്റ്രിക്കുകൾക്ക് അലർട്ട് നിയമങ്ങൾ നിർവചിച്ചു
- [ ] ആപ്ലിക്കേഷനുകളിൽ ഹെൽത്ത് ചെക്ക് എൻഡ്പോയിന്റുകൾ നടപ്പിലാക്കി

#### ✅ ബാക്കപ്പ് & പുനരുദ്ധാരം
- [ ] ഡാറ്റാ റിസോഴ്‌സുകൾക്ക് ബാക്കപ്പ് തന്ത്രം നിർവചിച്ചു
- [ ] പുനരുദ്ധാരണം സമയലക്ഷ്യങ്ങൾ (RTO) രേഖപ്പെടുത്തി
- [ ] പുനരുദ്ധാരണം പോയിന്റ് ലക്ഷ്യങ്ങൾ (RPO) രേഖപ്പെടുത്തി
- [ ] പ്രോഡക്ഷൻ സിസ്റ്റങ്ങൾക്ക് ദുരന്ത പുനരുദ്ധാരണം പദ്ധതി ഉണ്ട്

---

## പരിസ്ഥിതി പരിശോധന

### ഡെവലപ്പ്മെന്റ് പരിസ്ഥിതി പരിശോധന

```bash
#!/bin/bash
# വികസന പരിസ്ഥിതിക്ക് പ്രത്യേകമായ സ്ഥിരീകരണങ്ങൾ

validate_dev_environment() {
    echo "=== Development Environment Validation ==="
    
    # വികസനത്തിനെ അനുയോജ്യമായ ക്രമീകരണങ്ങൾ പരിശോധിക്കുക
    if grep -q "sku.*Free\|sku.*F1\|sku.*Basic" infra/*.bicep; then
        echo "✓ Development-appropriate SKUs detected"
    else
        echo "⚠ Consider using lower-cost SKUs for development"
    fi
    
    # സ്വയം-shutdown ക്രമീകരണങ്ങൾ പരിശോധിക്കുക
    if grep -q "autoShutdown\|deallocate" infra/*.bicep; then
        echo "✓ Auto-shutdown configuration found"
    else
        echo "ℹ Consider adding auto-shutdown for cost savings"
    fi
    
    # വികസന ഡാറ്റാബേസ് ക്രമീകരണങ്ങൾ പരിശോധിക്കുക
    if grep -q "Basic\|S0\|S1" infra/*.bicep; then
        echo "✓ Development database tiers configured"
    else
        echo "⚠ Consider using Basic/Standard tiers for development databases"
    fi
}
```

### പ്രോഡക്ഷൻ പരിസ്ഥിതി പരിശോധന

```bash
#!/bin/bash
# പ്രൊഡക്ഷൻ പരിസ്ഥിതി നിഷ്‌ചിത പരിശോധനകൾ

validate_prod_environment() {
    echo "=== Production Environment Validation ==="
    
    # ഹൈ അവൈലബിലിറ്റി കോൺഫിഗറേഷനുകൾ പരിശോധിക്കുക
    if grep -q "zoneRedundant.*true\|Premium\|Standard_GRS" infra/*.bicep; then
        echo "✓ High availability configurations detected"
    else
        echo "⚠ Consider enabling high availability for production"
    fi
    
    # ബേക്കപ്പ് കോൺഫിഗറേഷനുകൾ പരിശോധിക്കുക
    if grep -q "backup\|retention\|pointInTimeRestore" infra/*.bicep; then
        echo "✓ Backup configurations found"
    else
        echo "⚠ Ensure backup strategies are implemented"
    fi
    
    # മോണിറ്ററിംഗ് സജ്ജീകരണം നിഷ്‌ചയിക്കുക
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

## സ്രോതസി പരിശോധന

### ക്വോട്ട പരിശോധന സ്ക്രിപ്റ്റ്

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
    max_accounts = 250  # ഡിഫോൾട്ട് അസ്യൂർ പരിധി
    
    usage_percent = (account_count / max_accounts) * 100
    status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
    
    print(f"{status} Storage Accounts: {account_count}/{max_accounts} ({usage_percent:.1f}%)")
    
    return usage_percent < 95

def check_network_limits(location: str) -> bool:
    """Check network-related limits"""
    print(f"\n=== Network Limits Check ({location}) ===")
    
    # വിർച്വൽ നെറ്റ്‌വർകുകൾ പരിശോദിക്കുക
    vnets = run_command(['az', 'network', 'vnet', 'list'])
    if vnets is not None:
        vnet_count = len(vnets)
        print(f"✅ Virtual Networks: {vnet_count}/1000")
    
    # പബ്ലിക് ഐപി വിലാസങ്ങൾ പരിശോധിക്കുക
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

### സുരക്ഷ പരിശോധന സ്ക്രിപ്റ്റ്

```bash
#!/bin/bash
# AZD വിന്യസങ്ങൾക്ക് സുരക്ഷയും പാലന പരിശോധനയും

check_security_practices() {
    echo "=== Security Best Practices Check ==="
    
    local issues_found=0
    
    # കീ വാൾട്ട് ഉപയോഗം പരിശോധിക്കുക
    if grep -r "Microsoft.KeyVault" infra/ >/dev/null 2>&1; then
        echo "✅ Key Vault detected in infrastructure"
    else
        echo "⚠️  Key Vault not found - consider using for secrets management"
        ((issues_found++))
    fi
    
    # മാനേജ് ചെയ്ത ഐഡന്റിറ്റി ഉപയോഗം പരിശോധിക്കുക
    if grep -r "managedIdentity\|SystemAssigned\|UserAssigned" infra/ >/dev/null 2>&1; then
        echo "✅ Managed Identity configuration detected"
    else
        echo "⚠️  Managed Identity not found - consider using for service authentication"
        ((issues_found++))
    fi
    
    # HTTPS ബാധ്യത പരിശോധിക്കുക
    if grep -r "httpsOnly.*true\|requireHttps.*true" infra/ >/dev/null 2>&1; then
        echo "✅ HTTPS enforcement detected"
    else
        echo "⚠️  HTTPS enforcement not found - ensure secure connections"
        ((issues_found++))
    fi
    
    # ಕನಿಷ್ಠ TLS പതിപ്പ് പരിശോധിക്കുക
    if grep -r "minimumTlsVersion.*'TLS1_2'" infra/ >/dev/null 2>&1; then
        echo "✅ Minimum TLS 1.2 configuration detected"
    else
        echo "⚠️  Minimum TLS version not specified - consider requiring TLS 1.2+"
        ((issues_found++))
    fi
    
    # പൊതു പ്രവേശന നിയന്ത്രണങ്ങൾ പരിശോധിക്കുക
    if grep -r "allowBlobPublicAccess.*false\|publicNetworkAccess.*Disabled" infra/ >/dev/null 2>&1; then
        echo "✅ Public access restrictions detected"
    else
        echo "⚠️  Public access restrictions not found - consider limiting public access"
        ((issues_found++))
    fi
    
    # നെറ്റ്‌വർക്ക് സുരക്ഷ സംഘം പരിശോധിക്കുക
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
    
    # ബാക്കപ്പ് ഉം നിലനിർത്തൽ നയങ്ങൾ പരിശോധിക്കുക
    if grep -r "backup.*Policy\|retentionPolicy\|retention.*Days" infra/ >/dev/null 2>&1; then
        echo "✅ Backup and retention policies detected"
    else
        echo "⚠️  Backup/retention policies not found - required for data governance"
    fi
}

# പ്രധാന നിർവഹണം
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

## CI/CD ഒരுங்கലിൽ സംയോജനം

### GitHub ആക്ഷൻസിനോടുള്ള സംയോജനം

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

## മികച്ച പ്രാക്ടീസുകൾ സംഗ്രഹം

### ✅ മുൻഫ്ലൈറ്റ് പരിശോധന മികച്ച പ്രാക്ടീസുകൾ

1. **ഓട്ടോമേഷൻ സാധ്യമാകാൻ**
   - CI/CD പൈപ്പ്ലൈനുകളിൽ പരിശോധനകൾ സംയോജിപ്പിക്കുക
   - ആവർത്തന പരിശോധനകൾക്കായി സ്ക്രിപ്റ്റുകൾ ഉപയോഗിക്കുക
   - ഓഡിറ്റ് ട്രെയിലുകൾക്കായി ഫലങ്ങൾ സൂക്ഷിക്കുക

2. **പരിസ്ഥിതി-സ്പെസിഫിക് പരിശോധന**
   - ഡെവ്/സ്റ്റേജിംഗ്/പ്രോഡിന് വ്യത്യസ്ത പരിശോധനകൾ
   - അനുയോജ്യമായ സുരക്ഷാ ആവശ്യങ്ങൾ ഓരോ പരിസ്ഥിതിക്കും
   - പ്രോഡക്ഷൻ അല്ലാത്ത പരിസ്ഥിതികൾക്കുള്ള ചെലവ് പ്രതിഫലം

3. **സമഗ്ര പരിധി**
   - തെളിവും അനുമതികളും
   - സ്രോതസി ക്വോട്ടകളും ലഭ്യതയും
   - ടെംപ്ലേറ്റ് പരിശോധനയും വ്യാകരണവും
   - സുരക്ഷയും അനുസരണ ആവശ്യങ്ങളും

4. **വ്യക്തമായ റിപ്പോർട്ടിംഗ്**
   - നിറത്തോട് ചേർന്ന സ്ഥിതി സൂചകങ്ങൾ
   - പരിഹാര നടപടിക്രമങ്ങളോടുള്ള വിശദമായ പിശക് സന്ദേശങ്ങൾ
   - വേഗത്തിലുള്ള വിലയിരുത്തലിന് സംഗ്രഹ റിപ്പോർട്ടുകൾ

5. **വേഗത്തിൽ പരാജയപ്പെടൽ**
   - നിർണായക പരിശോധനകൾ പരാജയപ്പെട്ടാൽ വിന്യാസം അവസാനിപ്പിക്കുക
   - പരിഹാരത്തിന് വ്യക്തമായ മാർഗ നിർദ്ദേശം നൽകുക
   - പരിശോധനകൾ പുനഃക്രമീകരിക്കാൻ എളുപ്പമാക്കുക

### സാധാരണ മുൻഫ്ലൈറ്റ് പിഴവുകൾ

1. "വേഗതയുള്ള" വിന്യാസങ്ങൾക്ക് പരിശോധന ഒഴിവാക്കൽ
2. വേണ്ടത്ര അനുവാദങ്ങൾ പരിശോധിക്കാതെ വിന്യാസം
3. വിന്യാസ പരാജയമായത് വരെ ക്വോട്ടാ പരിധികൾ അവഗണിക്കൽ
4. CI/CD പൈപ്പ്ലൈനുകളിൽ ടെംപ്ലേറ്റുകൾ പരിശോദിക്കാതെ പോകൽ
5. പ്രോഡക്ഷൻ പരിസ്ഥിതിക്ക് സുരക്ഷാ പരിശോധന നഷ്ടപ്പെട്ടത്
6. ചെലവ് കണക്കുകൂട്ടൽ അപര്യാപ്തത കൊണ്ട് ബജറ്റ് അപ്രതീക്ഷിതം

---

**പ്രോ ടിപ്പ്**: മുൻഫ്ലൈറ്റ് പരിശോധനകൾ പ്രോഡക്ഷൻ ജോബിന് മുമ്പായി CI/CD പൈപ്പ്ലൈനിൽ വിച്ഛേദിച്ച ജോബായി നടത്തുക. ഇതു പ്രശ്നങ്ങൾ നേരത്തേ കണ്ടെത്താനും ഡെവലപ്പർമാർക്ക് വേഗത്തിലുള്ള ഫീഡ്ബാക്ക് നൽകാനും സഹായിക്കുമെന്നു കരുതൂ.

---

**നാവിഗേഷൻ**
- **മുൻപത്തെ പാഠം**: [SKU തെരഞ്ഞെടുപ്പ്](sku-selection.md)
- **അടുത്ത പാഠം**: [ചീറ്റ്ഷീറ്റ്](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**പരിചയപ്പെടുത്തല്‍**:  
ഈ ഡോക്യുമെന്‍ट [Co-op Translator](https://github.com/Azure/co-op-translator) എന്ന എഐ വിവര്‍ത്തന സേവനം ഉപയോഗിച്ചാണ് വിവര്‍ത്തനം ചെയ്തിരിക്കുന്നത്. ഞങ്ങള്‍ ശുദ്ധതയെത്തിക്കാന്‍ ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമാറ്റഡ് വിവര്‍ത്തനങ്ങളില്‍ പിഴവുകള്‍ അഥവാ തെറ്റായ വിവരങ്ങള്‍ ഉണ്ടായിരിക്കാമെന്ന് ദയവായി ശ്രദ്ധിക്കുക. സത്യസന്ധമായ ഉറവിടം ആത്മജനഭാഷയിലെ മൗലിക ഡോക്യുമെന്‍റാണ്. അത്യന്താപേക്ഷിതമായ വിവരങ്ങള്‍ക്ക് പ്രൊഫഷണല്‍ മാനവ വിവര്‍ത്തനം പ്രയോജനപ്പെടും. ഈ വിവര്‍ത്തനത്തിന്റെ ഉപയോഗത്തില്‍ ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകള്‍ക്കും തെറ്റായ വ്യാഖ്യാനങ്ങള്‍ക്കും ഞങ്ങള്‍ ഉത്തരവാദികള്‍ അല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
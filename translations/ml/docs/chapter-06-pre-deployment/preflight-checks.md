# AZD വിന്യസതലങ്ങൾക്ക് മുമ്പുള്ള പരിശോധനകൾ

**അധ്യായം നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [ആസിഡി ഫോർ ബിഗിനേഴ്സ്](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: അധ്യായം 6 - പ്രീ-ഡിപ്ലോയ്മെന്റ് സ്ഥിരീകരണവും പദ്ധതിയിടലും
- **⬅️ മുമ്പത്തെ**: [SKU തിരഞ്ഞെടുപ്പ്](sku-selection.md)
- **➡️ അടുത്ത അധ്യായം**: [അദ്ധ്യായം 7: പ്രശ്നപരിഹാരം](../chapter-07-troubleshooting/common-issues.md)
- **🔧 ബന്ധപ്പെടുന്നവർ**: [അധ്യായം 4: വിന്യസന ഗൈഡ്](../chapter-04-infrastructure/deployment-guide.md)

## പരിചയം

വിജയകരമായ ആസ്യൂർ ഡെവലപ്പർ CLI വിന്യസനങ്ങൾ ആരംഭിക്കുന്നതിന് മുമ്പ് ഉറപ്പുവരുത്തുന്നതിനായി പ്രീ-ഡിപ്ലോയ്മെന്റ് സ്ഥിരീകരണ സ്ക്രിപ്റ്റുകളും നടപടികളും ഈ സമഗ്ര ഗൈഡ് നൽകുന്നു. ഓതന്റിക്കേഷൻ, സ്രോതസ്സുകളുടെ ലഭ്യത, ക്വോട്ടകൾ, സുരക്ഷാ പാലനവും പ്രകടന ആവശ്യകതകളും എന്നിവയ്ക്കായി സ്വയമേവ പരിശോധനകൾ നടപ്പിലാക്കാൻ പഠിക്കുക, ഇത് വിന്യസനമായ പിഴവുകൾ തടയുകയും വിജയകരമായ വിന്യസനത്തിന്റെ നിരക്കുകൾ മെച്ചപ്പെടുത്തുകയും ചെയ്യുന്നു.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ഗൈഡ് പൂർത്തിയാക്കിയാൽ നിങ്ങൾ:
- സ്വയമേവ പ്രീ-ഡിപ്ലോയ്മെന്റ് സ്ഥിരീകരണ രീതികളും സ്ക്രിപ്റ്റുകളും നൽകുവാൻ പ്രാവീണ്യം കൈവരിക്കുക
- ഓതന്റിക്കേഷൻ, അനുവാദങ്ങൾ, ക്വോട്ടുകൾ എന്നിവയ്‌ക്കുള്ള സമഗ്ര പരിശോധന തന്ത്രങ്ങൾ മനസ്സിലാക്കുക
- സ്രോതസ്സിന്റെ ലഭ്യതയും ശേഷിയും വിലയിരുത്തുന്ന നടപടിക്രമങ്ങൾ നടപ്പിലാക്കുക
- സംഘടനാ നയം പാലനത്തിനായി സുരക്ഷയും പാലന പരിശോധനകളും ക്രമീകരിക്കുക
- ചെലവ് കണക്കാകലും ബജറ്റ് പരിശോധന പ്രവാഹങ്ങളും രൂപകല്‍പ്പന ചെയ്യുക
- CI/CD പൈപ്പ്ലൈനുകൾക്ക് വേണ്ടി കസ്റ്റം പ്രീ-ഫ്ലൈറ്റ് പരിശോധന ഓട്ടോമേഷൻ സൃഷ്‌ടിക്കുക

## പഠന ഫലം

പൂർത്തിയായ ശേഷം നിങ്ങള് കഴിയും:
- സമഗ്ര പ്രീ-ഫ്ലൈറ്റ് സ്രിപ്റ്റുകൾ സൃഷ്ടിക്കുകയും നടപ്പിലാക്കുകയും ചെയ്യുക
- വ്യത്യസ്ത വിന്യസന സാഹചര്യങ്ങൾക്ക് സ്വയമേവ പരിശോധന പ്രവാഹങ്ങൾ രൂപകൽപ്പന ചെയ്യുക
- പരിസ്ഥിതിബന്ധമായ സ്ഥിരീകരണ നടപടിക്രമങ്ങളും നയങ്ങളും നടപ്പിലാക്കുക
- വിന്യസന ഒരുക്കത്തിനായി പ്രൊആക്ടീവ് മോണിറ്ററിങ്ങും അലർട്ടിങ്ങും ക്രമീകരിക്കുക
- പ്രീ-ഡിപ്ലോയ്മെന്റ് പ്രശ്നസമാധാനവും പരിഹാര ക്രിയകളും നടപ്പിലാക്കുക
- പ്രീ-ഫ്ലൈറ്റ് പരിശോധനകള്‍ DevOps പൈപ്പ്ലൈനുകളിലും ഓട്ടോമേഷൻ പ്രവാഹങ്ങളിലുമായി സംയോജിപ്പിക്കുക

## ഉള്ളടക്കത്തിന്റെ പട്ടിക

- [പരിചയം](#overview)
- [സ്വയമേവ പ്രീ-ഫ്ലൈറ്റ് സ്രിപ്റ്റ്](#automated-pre-flight-script)
- [മാനുവൽ സ്ഥിരീകരണ ചെക്ക്ലിസ്റ്റ്](#manual-validation-checklist)
- [പരിസ്ഥിതി പരിശോധന](#environment-validation)
- [സ്രോതസാദ്ധ്യത പരിശോധന](#resource-validation)
- [സുരക്ഷയും പാലനവും](#security--compliance-checks)
- [പ്രകടനവും ശേഷിയും പദ്ധതിയിടലും](capacity-planning.md)
- [സൗകാര്യപരമായ പ്രശ്ന പരിഹാരങ്ങൾ](../chapter-07-troubleshooting/common-issues.md)

---

## പരിചയം

ഇൻസ്റ്റാളേഷനായതിനുമുമ്പുള്ള പ്രീ-ഫ്ലൈറ്റ്പരിശോധനകൾ നിർണ്ണായക സ്ഥാപിതങ്ങൾ:

- **ലക്ഷ്യ മേഖലകളിലെ സ്രോതസാദ്ധ്യതയും ക്വോട്ടകളും**
- **ഓതന്റിക്കേഷൻ, അനുവാദങ്ങൾ ശരിയായി ക്രമീകരിച്ചിട്ടുണ്ട്**
- **ടെംപ്ലേറ്റിന്റെ സാധുതയും പാരാമീറ്റർ ശരിതന്നതായിരിക്കുന്നു**
- **നെട്വർക്ക് കണക്റ്റിവിറ്റിയും ആശ്രിതത്വങ്ങളും**
- **സംഘടനാ നയങ്ങൾക്ക് മേൽനോട്ടം നൽകുന്ന സുരക്ഷാ പാലനം**
- **ബജറ്റ് പരിധികളിൽ ചെലവ് കണക്കുകൾ**

### പ്രീ-ഫ്ലൈറ്റ് പരിശോധന എപ്പോഴാണ് നടത്തേണ്ടത്

- **പുതിയ പരിസ്ഥിതിയിൽ ആദ്യ വിന്യസനത്തിന് മുൻപ്**
- **പ്രധാന ടെംപ്ലേറ്റ് മാറ്റങ്ങൾ കഴിഞ്ഞ്**
- **പ്രൊഡക്ഷൻ വിന്യസനത്തിനു മുന്‍പ്**
- **ആസ്യൂർ മേഖല മാറുമ്പോൾ**
- **CI/CD പൈപ്പ്ലൈനുകളുടെ ഭാഗമായിട്ട്**

---

## സ്വയമേവ പ്രീ-ഫ്ലൈറ്റ് സ്രിപ്റ്റ്

> **പരിധിയും മുൻകൂട്ടി ആവശ്യങ്ങളും:** നിങ്ങളുടെ സ്വന്തം പ്രോജക്റ്റിൽ സേവ് ചെയ്യാനുള്ള ആരംഭിസ്ഥാപന സ്ക്രിപ്റ്റുകളാണ് ഇവ; ഈ അധ്യായം നൽകുന്ന പ്രാദേശിക ഫയലുകൾ അല്ല. PowerShell പതിപ്പ് PowerShell **7.3+** (സ്വദേശ നിയമം പിഴവ് പ്രചാരണം) ആവശ്യമുണ്ട്, കൂടാതെ `powershell-yaml` മോഡ്യൂൾ `ConvertFrom-Yaml`-ക്കായി. ബാഷ് പതിപ്പ് ബാഷ്, `jq`, Python 3.10+, PyYAML എന്നിവ ആവശ്യമാണ്. രണ്ടിനും Azure CLI, azd, ഒരു പ്രവർത്തനക്ഷമമായ Bicep പ്രോജക്റ്റ് ആവശ്യമുണ്ട്. ഇവ ഡയഗ്നോസ്റ്റിക്‌സ് വേണ്ടി ആണ്, വിന്യസന ഒരുക്കം, ശേഷി, അല്ലെങ്കിൽ പാലനം തെളിയിക്കുന്നതല്ല. `azd provision --preview`-ക്ക് മുമ്പ് ടെംപ്ലേറ്റ് ഹുക്കുകൾ പരിശോധിക്കുക; ഹുക്കുകൾ എന്തെങ്കിലും പ്രോജക്റ്റ് കമാൻഡുകൾ പ്രവർത്തിപ്പിക്കാം.

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

### ബാഷ് പ്രീ-ഫ്ലൈറ്റ് ചെക്കർ

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

## മാനുവൽ സ്ഥിരീകരണ ചെക്ക്ലിസ്റ്റ്

### പ്രീ-ഡിപ്ലോയ്മെന്റ് ചെക്ക്ലിസ്റ്റ്

ഈ ചെക്ക്ലിസ്റ്റ് പ്രിന്റ് ചെയ്ത് വിന്യസനത്തിന് മുമ്പ് ഓരോ ഇനം പരിശോധന നടത്തുക:

#### ✅ പരിസ്ഥിതി ക്രമീകരണം
- [ ] അടുത്ത തവണ വയർഷൻ പുതിയതായി അപ്‌ഡേറ്റ് ചെയ്യപ്പെട്ട AZD CLI ഇൻസ്റ്റാൾ ചെയ്യുക
- [ ] Azure CLI ഇൻസ്റ്റാൾ ചെയ്തു ഓതന്റിക്കേറ്റ് ചെയ്‌തിട്ടുണ്ട്
- [ ] ശരിയായ Azure സബ്സ്ക്രിപ്ഷൻ തിരഞ്ഞെടുക്കുക
- [ ] പരിസ്ഥിതിയുടെ പേര് വ്യത്യസ്തവും നാമകരണം ആചാരങ്ങൾ പാലിക്കുന്നതുമായിരിക്കണം
- [ ] ലക്ഷ്യ റിസോഴ്സ് ഗ്രൂപ്പ് തിരിച്ചറിഞ്ഞിട്ടുണ്ടോ അല്ലെങ്കിൽ സൃഷ്‌ടിക്കാമോ

#### ✅ ഓതന്റിക്കേഷൻ & അനുവാദങ്ങൾ
- [ ] വിജയകരമായി `azd auth login` ഓതന്റിക്കേറ്റ് ചെയ്തത്
- [ ] ഉപയോക്താവിന് ലക്ഷ്യ സബ്സ്ക്രിപ്ഷനിൽ / റിസോഴ്‌സ് ഗ്രൂപ്പിൽ Contributor റോളുണ്ട്
- [ ] ടെംപ്ലേറ്റുകൾ റോളുസംഭരണങ്ങൾ സൃഷ്‌ടിക്കുന്ന പക്ഷം, വിന്യസിക്കുന്ന ഐഡന്റിറ്റിക്കും അതിന്റേതായ സ്കോപ് ചെയ്ത റോളസ് അസ്‌സൈൻമെന്റ് അനുവാദങ്ങൾ ഉണ്ടാകണം (Contributor മാത്രമല്ലത് നൽകുന്നത്)
- [ ] CI/CD-ക്കായി സർവീസ് പ്രിൻസിപ്പൽ ക്രമീകരിച്ചിട്ടുണ്ടെങ്കിൽ
- [ ] കാലഹരണപ്പെട്ട സർട്ടിഫിക്കറ്റുകളും ക്രെഡൻഷ്യലുകളും ഇല്ല

#### ✅ ടെംപ്ലേറ്റ് പരിശോധന
- [ ] `azure.yaml` ഉണ്ടെന്നും സാധുവായ YAML ആണെന്നും
- [ ] azure.yaml-ൽ നിർവചിച്ച എല്ലാ സേവനങ്ങൾക്കും അനുയായിയായ സ്രോതസ് കോഡ് ഉണ്ടെന്നും
- [ ] `infra/` ഡയറക്ടറിയിലുള്ള Bicep ടെംപ്ലേറ്റുകൾ ലഭ്യമാണ്
- [ ] `main.bicep` പിശകുകളില്ലാതെ കംപൈൽ ചെയ്യുന്നു (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 ഇൻഫ്രാസ്ട്രക്ചർ പ്രിവ്യൂ വിജയകരമായി ഓടുന്നു (`azd provision --preview`)
- [ ] എല്ലാ ആവശ്യമായ പാരാമീറ്ററുകൾക്ക് ഡീഫോൾട്ട് മൂല്യങ്ങൾ ഉണ്ടോ അല്ലെങ്കിൽ നൽകും
- [ ] ടെംപ്ലേറ്റുകളിൽ ഹാർഡ്കോടഡ് രഹസ്യങ്ങൾ ഇല്ല

#### ✅ സ്രോതസ്സ് പദ്ധതിയിടൽ
- [ ] ലക്ഷ്യമിടുന്ന ആസ്യൂർ മേഖല തിരഞ്ഞെടുക്കുകയും സാധൂകരിക്കുകയും ചെയ്തു
- [ ] ലക്ഷ്യ മേഖലയിൽ ആവശ്യമായ ആസ്യൂർ സേവനങ്ങൾ ലഭ്യമാണ്
- [ ] പദ്ധതിയിട്ട സ്രോതസിന് വേണ്ടിയുള്ള പാഷ്ണക്കുള്ള ക്വോട്ടകൾ ഉണ്ട്
- [ ] സ്രോതസുകളുടെ പേരിടൽ ഏറ്റുമുട്ടലുകൾ പരിശോധിച്ചു
- [ ] സ്രോതസുകൾ തമ്മിലുള്ള ആശ്രിതത്വങ്ങൾ മനസ്സിലാക്കി

#### ✅ നെറ്റ്‌വർക്ക് & സുരക്ഷ
- [ ] ആസ്യൂർ എൻഡ്പോയിന്റുകളിലേക്കുള്ള നെറ്റ്‌വർക്ക് കണക്റ്റിവിറ്റി സ്ഥിരീകരിച്ചു
- [ ] ഫയർവാൾ/പ്രോക്സി ക്രമീകരണങ്ങൾ ആവശ്യമെങ്കിൽ ക്രമീകരിച്ചത്
- [ ] രഹസ്യസംഭരണം සඳහා കീ വോൾട്ട് ക്രമീകരണം
- [ ] അടിഞ്ഞിരിക്കുന്ന ഐഡന്റിറ്റികൾ ആവശ്യമായിടത്ത് ഉപയോഗിക്കുന്നത്
- [ ] വെബ് അപ്ലിക്കേഷനുകൾക്ക് HTTPS പ്രാബല്യത്തിൽ കൊണ്ടുവന്നിട്ടുണ്ടോ

#### ✅ ചെലവ് മാനേജ്‌മെന്റ്
- [ ] ചെലവ് കണക്കുകൾ ആസ്യൂർ പ്രൈസിംഗ് കാൽക്കുലേറ്റർ ഉപയോഗിച്ച് കണക്കാക്കി
- [ ] ബജറ്റ് അലർട്ട് ക്രമീകരിച്ചത് (ആവശ്യമായ പക്ഷം)
- [ ] പരിസ്ഥിതി തരം അനുസരിച്ച് അനുയോജ്യമായ SKU-കൾ തിരഞ്ഞെടുക്കുക
- [ ] പ്രൊഡക്ഷൻ വര്‍ക്ക്ലോഡുകള്‍ക്ക് റിസർവ്ഡ് ശേഷി പരിഗണിക്കപ്പെടുന്നു

#### ✅ മേൽനോട്ടവും ദൃശ്യീയതയും
- [ ] ടെംപ്ലേറ്റിൽ അപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് ക്രമീകരിച്ചിട്ടുണ്ടോ
- [ ] ലോഗ് അനലിറ്റിക്സ് വർക്ക്‌സ്പേസ് പദ്ധതി ചെയ്തിട്ടുണ്ടോ
- [ ] നിർണ്ണായക മെട്രിക്‌സിന് അലർട്ട് നിയമങ്ങൾ നിർവചിച്ചു
- [ ] ആപ്ലിക്കേഷനുകളിൽ ഹെൽത്ത് ചെക്ക് എൻഡ്പോയിന്റുകൾ നടപ്പിലാക്കിയിട്ടുണ്ടോ

#### ✅ ബാക്കപ്പ് & പുനരുദ്ധാരണം
- [ ] ഡേറ്റാ സ്രോതസിനായുള്ള ബാക്കപ്പ് തന്ത്രം നിർവചിച്ചിട്ടുണ്ട്
- [ ] പുനരുദ്ധാരണ സമയ ലക്‌ഷ്യങ്ങൾ (RTO) ഡോക്യുമെന്റുചെയ്തു
- [ ] പുനരുദ്ധാരണ പോയിന്റ് ലക്‌ഷ്യങ്ങൾ (RPO) രേഖപ്പെടുത്തിയിട്ടുണ്ട്
- [ ] പ്രൊഡക്ഷൻ വേണ്ടി ദുരന്ത പുനരുദ്ധാരണ പദ്ധതി സജ്ജമാക്കി

---

## പരിസ്ഥിതി പരിശോധന

താഴെ കൊടുത്തിട്ടുള്ള `grep` പരിശോധനകൾ ഓർമ്മപ്പെടുത്തലിനാണ് മാത്രം. ഒരു പദം കാണുന്നതിലൂടെ അത് ശരിയായ സ്രോതസിന് കോൺഫിഗർ ചെയ്തിരിക്കുന്നു എന്നുള്ളതല്ല; കാണാതിരിക്കുക അതിന്റെ അഭാവം തെളിയിക്കുന്നുമല്ല (മോഡ്യൂളുകളും ഡിഫോൾട്ടുകളും അത് നൽകാം). ഇവ പ്രൊഡക്ഷൻ പാലനത്തിനുള്ള വാതിലുകൾ ആയി ഉപയോഗിക്കരുത്.

### വികസന പരിസ്ഥിതിയുടെ പരിശോധന

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

### പ്രൊഡക്ഷൻ പരിസ്ഥിതി പരിശോധന

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

## സ്രോതസ്സ് പരിശോധന

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

## സുരക്ഷയും പാലനവും പരിശോധനകൾ

### സുരക്ഷാ പരിശോധനാ സ്ക്രിപ്റ്റ്

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

## CI/CD-യുമായി സംയോജനം

### GitHub പ്രവർത്തനങ്ങളുടെ സംയോജനം

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

ഈ പ്രവാഹത്തിന് ഫെഡറേറ്റഡ് ക്രെഡൻഷ്യലുകൾ ക്രമീകരിക്കുകയും തിരഞ്ഞെടുക്കപ്പെട്ട azd പരിസ്ഥിതി സൃഷ്‌ടിക്കുകയും പുനസംസ്ഥാപിക്കുകയും ചെയ്ത് സേവ് ചെയ്ത സ്ക്രിപ്റ്റുകൾ പ്രവർത്തിപ്പിക്കുക. ഈ ഉദാഹരണങ്ങൾ കൺസോൾ ഔട്ട്പുട്ട് മാത്രമാണ് നൽകുന്നത്; `preflight-results.json` അല്ലെങ്കിൽ JUnit ഫയൽ ഉണ്ടാകുന്നില്ല.

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

പൈപ്പ്ലൈൻ താൻ‍റെ azd പരിസ്ഥിതി പുനരുദ്ധാരണം/സൃഷ്ടി ചെയ്ത് ഈ പാഠത്തിൽ കാണിച്ച സ്ക്രിപ്റ്റുകൾ സേവ് ചെയ്യുകയും ഈ ജോബ് മുമ്പ് നടത്തുകയും വേണം. ഫെഡറേറ്റഡ് സർവീസ് കണക്ഷൻ ക്രമീകരിക്കുക, പൈപ്പ്‌ലൈന് ആവശ്യമായ ടോക്കൺ അനുവാദങ്ങൾ അനുവദിക്കുക. മുൻപ് നടന്ന `AzureCLI@2` ടാസ്‌കിലെ Azure CLI ലോഗിൻ പിന്നീട് നടക്കുന്ന സാധാരണ ബാഷ് ടാസ്‌ക് ഓതന്റിക്കേറ്റു ചെയ്യും എന്ന് കരുതി മിക്കവാറും പ്രതീക്ഷിക്കുന്നുതല്ല.

---

## മികച്ച നടപ്പാക്കൽ ചുരുങ്ങിയത്

### ✅ പ്രീ-ഫ്ലൈറ്റ് പരിശോധന മികച്ച രീതികൾ

1. **സാധ്യമായിടത്ത് സ്വയംമാറ്റം വരുത്തുക**
   - CI/CD പൈപ്പ്ലൈനുകളിൽ പരിശോധനകൾ സംയോജിപ്പിക്കുക
   - പരിശോധനകൾ ആവർത്തിക്കാവുന്നതായി സ്ക്രിപ്റ്റുകൾ ഉപയോഗിക്കുക
   - ഓഡിറ്റ് ട്രെയ്ലുകൾക്കായി ഫലങ്ങൾ സൂക്ഷിക്കുക

2. **പരിസ്ഥിതിബന്ധമായ സ്ഥിരീകരണം**
   - ഡെവ്ലപ്‌മെന്റ് / സ്റ്റേജിംഗ് / പ്രൊഡക്ഷൻ വ്യത്യസ്ത പരിശോധനകൾ
   - പരിസ്ഥിതിക്ക് അനുയോജ്യമായ സുരക്ഷാ ആവശ്യകതകൾ
   - പ്രൊഡക്ഷൻ അല്ലാത്ത പരിസ്ഥിതികൾക്കുള്ള ചെലവ് തകൃതിയായമായുള്ള വിനിയോഗം

3. **സമഗ്ര പരിധി**
   - ഓതന്റിക്കേഷൻയും അനുമതികളും
   - സ്രോതസുകളുടെ ക്വോട്ടകളും ലഭ്യതയും
   - ടെംപ്ലേറ്റ് പരിശോധനയും സംഘാടകയിലും
   - സുരക്ഷയും പാലന ആവശ്യകതകളും

4. **വാർത്താ വ്യക്തമാക്കൽ**
   - നിറം സംജ്ഞ അടിസ്ഥാനത്തിൽ നില സൂചനകൾ
   - പിഴവ് സന്ദേശങ്ങൾ പരിഹാര ചുവടുകൾ ഉൾപ്പെടെ
   - തൽപരിശോധനക്കുള്ള സംക്ഷിപ്ത റിപ്പോർട്ടുകൾ

5. **വേഗത്തിൽ പരാജയമാകുക**
   - നിർണ്ണായക പരിശേധനകൾ പരാജയപ്പെട്ടാൽ വിന്യസനം നിർത്തുക
   - പരിഹാരത്തിനുള്ള ശുശ്രൂഷിത നിർദ്ദേശങ്ങൾ നൽകുക
   - പരിശോധന പുനരാരംഭിക്കാൻ എളുപ്പമാക്കുക

### പൊതുവായ പ്രീ-ഫ്ലൈറ്റ് പിഴവ് പിഴകൽ

1. **"വേഗത്തിലുള്ള" വിന്യസനത്തിനായി സ്ഥിരീകരണം ഒഴിവാക്കുക**
2. **വിന്യസനത്തിന് മുമ്പിലെ അനുയോജ്യമായ അനുവാദം പരിശോധിക്കാത്തത്**
3. **ക്വോട്ട പരിധികൾ അവഗണിച്ച് വിന്യസനം പരാജയപ്പെടുന്നത് വരെ കാത്തിരിക്കുക**
4. **CI/CD പൈപ്പ്ലൈനുകളിൽ ടെംപ്ലേറ്റുകൾ പരിശോധിക്കാത്തത്**
5. **പ്രൊഡക്ഷൻ പരിസ്ഥിതികൾക്ക് സുരക്ഷാ പരിശോധന നഷ്ടപ്പെടുന്നത്**
6. **ചിലവുകൂട് കണക്കാക്കൽ കൂട്ടിയപ്പോൾ ബജറ്റ് ഞെട്ടലുകൾ ഉണ്ടാകുന്നത്**

---

**പ്രൊ ടിപ്പ്**: യഥാർത്ഥ വിന്യസനം ജോബിന് മുൻപായി CI/CD പൈപ്പ്‌ലൈനിൽ പ്രീ-ഫ്ലൈറ്റ് പരിശോധനകൾ വേർതിരിച്ചുള്ള ജോബായി നടത്തുക. ഇത് പ്രശ്നങ്ങൾ മുൻകൂട്ടി പിടിക്കാൻ സഹായിക്കും, ഡെവലപ്പർമാർക്ക് വേഗത്തിലുള്ള ഫീഡ്ബാക്ക് നൽകും.

---

**നാവിഗേഷൻ**
- **മുമ്പത്തേ പാഠം**: [SKU തിരഞ്ഞെടുപ്പ്](sku-selection.md)
- **അടുത്ത പാഠം**: [ചീറ്റ്ഷീറ്റ്](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് പരിഭാഷകളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വാഭാവിക ഭാഷയിലുള്ള അസൽ രേഖയാണ് പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കേണ്ടത്. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യുന്നു. ഈ പരിഭാഷ ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾ അല്ലെങ്കിൽ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കായി ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# AZD വിന്യസങ്ങൾക്ക് മുന്‍-ഫ്ലൈറ്റ് പരിശോധനകൾ

**Chapter Navigation:**
- **📚 Course Home**: [AZD ആരംഭക്കാർക്കുള്ള](../../README.md)
- **📖 Current Chapter**: അധ്യായം 6 - വിന്യസത്തിനു മുമ്പുള്ള പരിശോധനകളും പദ്ധതിയിടലും
- **⬅️ Previous**: [SKU തിരഞ്ഞെടുപ്പ്](sku-selection.md)
- **➡️ Next Chapter**: [അധ്യായം 7: പ്രശ്നപരിഹാരം](../chapter-07-troubleshooting/common-issues.md)
- **🔧 Related**: [അധ്യായം 4: വിന്യാസ മാർഗ്ഗനിർദ്ദേശം](../chapter-04-infrastructure/deployment-guide.md)

## പരിചയം

ഈ സമഗ്ര ഗൈഡ് വിന്യാസങ്ങൾ ആരംഭിക്കുന്നതിനുമുമ്പ് വിജയകരമായ Azure Developer CLI വിന്യസങ്ങൾ ഉറപ്പാക്കാൻ ആവശ്യമായ മുന്‍-ഡിപ്ലോയ്‌മെന്റ് സാധുത പരിശോധനാ സ്ക്രിപ്റ്റുകളും നടപടിക്രമങ്ങളും നൽകുന്നു. ഓഥന്റിക്കേഷൻ, റിസോഴ്‌സ് ലഭ്യത, ക്വോട്ടാകൾ, സുരക്ഷ പാലനം, പ്രകടന ആവശ്യങ്ങൾ എന്നിവയ്ക്ക് автоматിക് പരിശോധിനകൾ നടപ്പാക്കുവാനും വിന്യാസ പരാജയങ്ങൾ തടയാനും വിന്യാസ വിജയം മെച്ചപ്പെടുത്താനുമുള്ള രീതികൾ ഇവയിൽ പഠിക്കും.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ഗൈഡ് പൂർത്തീകരിച്ച് നിങ്ങൾക്ക്:
- ഓട്ടോമേറ്റഡ് മുന്‍-ഡിപ്ലോയ്മെന്റ് സാധുത പരിശോധന കളും സ്ക്രിപ്റ്റുകളും меңയർചെയ്യൽ
- പ്രാമാണീകരണം, അനുമതികൾ, ക്വോട്ടകൾ എന്നിവയ്ക്കുള്ള സമഗ്ര പരിശോധന തന്ത്രങ്ങൾ മനസ്സിലാക്കൽ
- റിസോഴ്‌സ് ലഭ്യതയും ശേഷിയുമുള്ള അലവലോകന നടപടികൾ നടപ്പിലാക്കൽ
- സംഘടനാ നയങ്ങളോട് സംരക്ഷണവും പാലനവും ഉറപ്പാക്കുന്ന സുരക്ഷ പരിശോധനകൾ ക്രമീകരിക്കൽ
- ചെലവ് നിർണ്ണയവും ബജറ്റ് പരിശോധനാ പ്രവാഹങ്ങളും രൂപകൽപ്പന ചെയ്യൽ
- CI/CD പൈപ്പ്ലൈൻസിനുള്ള സ്വതന്ത്ര മുന്‍-ഫ്ലൈറ്റ് പരിശോധന ഓട്ടോമേഷൻ സൃഷ്ടിക്കല്

## പഠനഫലം

പൂർത്തീകരിച്ചതിനുശേഷം, നിങ്ങൾക്ക് സാധ്യമാകും:
- സമഗ്ര മുന്‍-ഫ്ലൈറ്റ് സാധുത പരിശോധന സ്ക്രിപ്റ്റുകൾ സൃഷ്ടിക്കുകയും നടപ്പിലാക്കുകയും ചെയ്യുക
- വിവിധ വിന്യാസ പരിദൃശ്യങ്ങൾക്കുള്ള ഓട്ടോമേറ്റഡ് പരിശോധന പ്രവാഹങ്ങൾ രൂപകൽപ്പന ചെയ്യുക
- പരിസ്ഥിതി-നിഷ്പക്ഷ സാധുത നടപടിക്രമങ്ങളും നയങ്ങളും നടപ്പാക്കുക
- വിന്യാസ തയ്യാറെടുപ്പിന് പ്രവക്ത സ്വരൂപണവും അലേർട്ടിംഗും ക്രമീകരിക്കുക
- മുന്‍-ഡിപ്ലോയ്മെന്റ് പ്രശ്നങ്ങൾTroubleshootചെയ്യുകയും ശരിയാക്കിയ നടപടികൾ നടപ്പിലാക്കുകയും ചെയ്യുക
- DevOps പൈപ്പ്‌ലൈനുകളിലേക്കും ഓട്ടോമേഷൻ പ്രവാഹത്തിലേക്കും മുന്‍-ഫ്ലൈറ്റ് പരിശോധനകൾ ഇന്റഗ്രേറ്റ് ചെയ്യുക

## ഉള്ളടക്കങ്ങളുടെ പട്ടിക

- [Overview](../../../../docs/chapter-06-pre-deployment)
- [Automated Pre-flight Script](../../../../docs/chapter-06-pre-deployment)
- [Manual Validation Checklist](../../../../docs/chapter-06-pre-deployment)
- [Environment Validation](../../../../docs/chapter-06-pre-deployment)
- [Resource Validation](../../../../docs/chapter-06-pre-deployment)
- [Security & Compliance Checks](../../../../docs/chapter-06-pre-deployment)
- [Performance & Capacity Planning](../../../../docs/chapter-06-pre-deployment)
- [Troubleshooting Common Issues](../../../../docs/chapter-06-pre-deployment)

---

## അവലോകനം

പ്രിവ്ലൈറ്റ് പരിശോധനകൾ വിന്യാസം തുടങ്ങുന്നതിന് മുമ്പ് നടത്തപ്പെടുന്ന അനിവാര്യമായ പരിശോധനകളാണ്, ഇത് ഉറപ്പാക്കാൻ സഹായിക്കുന്നു:

- **റിസോഴ്‌സ് ലഭ്യത** and quotas in target regions
- **പ്രാമാണീകരണവും അനുമതികളും** ശരിയായി ക്രമീകരിച്ചിട്ടുണ്ടോ എന്ന്
- **ടെംപ്ലേറ്റിന്റെ സാധുത** and parameter correctness
- **നെറ്റ്‌വർക്ക് കണക്ടിവിറ്റി** and dependencies
- **സുരക്ഷാ പാലനങ്ങൾ** with organizational policies
- **ചെലവ് നിർണ്ണയം** within budget constraints

### 언제 പ്രിവ്ലൈറ്റ് പരിശോധനകൾ നടത്താം

- **ഒരു പുതിയ പരിസ്ഥിതിയിൽ ആദ്യ വിന്യാസത്തിന് മുമ്പ്**
- **പ്രധാനപ്പെട്ട ടെംപ്ലേറ്റ് മാറ്റങ്ങൾക്കുശേഷം**
- **പ്രൊഡക്ഷൻ വിന്യാസങ്ങൾക്ക് മുമ്പ്**
- **Azure പ്രദേശം മാറുമ്പോൾ**
- **CI/CD പൈപ്പ്‌ലൈനിന്റെ ഭാഗമായിരിക്കുമ്പോൾ**

---

## ഓട്ടോമേറ്റഡ് മുന്‍-ഫ്ലൈറ്റ് സ്ക്രിപ്റ്റ്

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

# ഔട്ട്പുട്ടിന്റെ നിറ കോഡിംഗ്
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
        # AZD പ്രാമാണീകരണം പരിശോധിക്കുക
        $azdAuth = azd auth login --check-status --output json 2>$null | ConvertFrom-Json
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
        }
        else {
            Write-Status "AZD authentication" "Error" "Run 'azd auth login'"
            return $false
        }
        
        # Azure CLI പ്രാമാണീകരണം പരിശോധിക്കുക
        $azAccount = az account show --output json | ConvertFrom-Json
        Write-Status "Azure CLI authentication" "Success" "Subscription: $($azAccount.name)"
        
        # സബ്സ്ക്രിപ്ഷൻ ആക്‌സസ് സാധൂകരിക്കുക
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
        # നിലവിലുള്ള ഉപയോക്താവിന്റെ റോൾ നിയുക്തികൾ ലഭിക്കുക
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
        
        # റിസോഴ്‌സ് ഗ്രൂപ്പ് സൃഷ്ടി പരിശോധിക്കുക (നിർദിഷ്ടമാണെങ്കിൽ)
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # റിസോഴ്‌സ് ഗ്രൂപ്പ് സൃഷ്ടിക്കാൻ ശേഷി പരിശോധിക്കുക
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
        # കമ്പ്യൂട്ട് ക്വോട്ടകൾ പരിശോധിക്കുക
        $computeUsage = az vm list-usage --location $Location --output json | ConvertFrom-Json
        
        # നിർദിഷ്ട ക്വോട്ടുകൾ പരിശോധിക്കുക
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
        
        # App Service പരിധികൾ പരിശോധിക്കുക
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
        return $true # തടസ്സമില്ലാത്ത
    }
}

function Test-NetworkConnectivity {
    Write-Host "`n${Blue}=== Network Connectivity Check ===${Reset}"
    
    # Azure എൻഡ്‌പോയിന്റുകൾ പരിശോധിക്കുക
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
    
    # DNS റെസൊല്യൂഷൻ പരിശോധിക്കുക
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
    
    # azure.yaml ഉണ്ടോ എന്ന് പരിശോധിക്കുക
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
    
    # ഇൻഫ്രാസ്ട്രക്ചർ ഫയലുകൾ ഉണ്ടോ എന്ന് പരിശോധിക്കുക
    if (Test-Path "infra") {
        $bicepFiles = Get-ChildItem -Path "infra" -Filter "*.bicep" -Recurse
        if ($bicepFiles.Count -gt 0) {
            Write-Status "Infrastructure templates" "Success" "$($bicepFiles.Count) Bicep files found"
            
            # main.bicep ഉണ്ടായാൽ സാധൂകരിക്കുക
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
    
    # 🧪 പുതിയത്: ഇൻഫ്രാസ്ട്രക്ചർ പ്രിവ്യൂ പരിശോധന (സുരക്ഷിത ഡ്രൈ-റൺ)
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
        
        # പ്രദേശത്തിലെ സേവന ലഭ്യത പരിശോധിക്കുക
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
    
    # അടിസ്ഥാനം ചെലവ് കണക്കുകൂട്ടൽ (കൃത്യമായ കണക്കുകൾക്കായി Azure Pricing API ആവശ്യമാകും)
    Write-Status "Cost estimation" "Info" "Use Azure Pricing Calculator for detailed estimates"
    Write-Status "Monitoring setup" "Info" "Set up Azure Cost Management alerts"
    
    # ബഡ്ജറ്റ് ഉണ്ടോ എന്ന് പരിശോധിക്കുക
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
    
    # സാധാരണ സുരക്ഷാ നടപടികൾ പരിശോധിക്കുക
    try {
        # Key Vault ക്രമീകരിച്ചിട്ടുണ്ടോ എന്ന് പരിശോധിക്കുക
        if (Select-String -Path "infra/*.bicep" -Pattern "Microsoft.KeyVault" -Quiet) {
            Write-Status "Key Vault usage" "Success" "Key Vault detected in templates"
        }
        else {
            Write-Status "Key Vault usage" "Warning" "Consider using Key Vault for secrets"
        }
        
        # മേനേജ്ഡ് ഐഡന്റിറ്റി ഉപയോഗമുണ്ടോ എന്ന് പരിശോധിക്കുക
        if (Select-String -Path "infra/*.bicep" -Pattern "managedIdentity|SystemAssigned" -Quiet) {
            Write-Status "Managed Identity" "Success" "Managed Identity detected"
        }
        else {
            Write-Status "Managed Identity" "Warning" "Consider using Managed Identity"
        }
        
        # HTTPS നിർബന്ധീകരണം പരിശോധിക്കുക
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

# പ്രീ-ഫ്ലൈറ്റ് പരിശോധന നടത്തുക
Invoke-PreflightCheck
```

### Bash Pre-flight Checker

```bash
#!/bin/bash
# Unix/Linux സിസ്റ്റങ്ങളിലെ ആദ്യപരിശോധനകൾക്കുള്ള Bash പതിപ്പ്

set -euo pipefail

# നിറം കോഡുകൾ
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
    
    # AZD പ്രമാണീകരണം പരിശോധിക്കുക
    if azd auth login --check-status >/dev/null 2>&1; then
        local principal_name=$(azd auth login --check-status --output json 2>/dev/null | jq -r '.principalName // "Unknown"')
        print_status "AZD authentication" "success" "User: $principal_name"
    else
        print_status "AZD authentication" "error" "Run 'azd auth login'"
        return 1
    fi
    
    # Azure CLI പ്രമാണീകരണം പരിശോധിക്കുക
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
        
        # അടിസ്ഥാന YAML സാധുത പരിശോധന
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
            
            # main.bicep ഉണ്ടെങ്കിൽ സാധുത പരിശോധിക്കുക
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
    
    # ലൊക്കേഷൻ സാധുവാണോ എന്ന് പരിശോധിക്കുക
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
    # കമാൻഡ്-ലൈൻ ആർഗുമെന്റുകൾ പാഴ്സ് ചെയ്യുക
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
    
    # ആവശ്യമായ പരാമീറ്ററുകളുടെ സാധുത പരിശോധിക്കുക
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
    
    # സംക്ഷേപം
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

## മാനുവൽ സാധുത ചെക്ക്ലിസ്റ്റ്

### വിന്യാസത്തിന് മുമ്പുള്ള ചെക്ക്ലിസ്റ്റ്

ഈ ചെക്ക്ലിസ്റ്റ് പ്രിന്റ് ചെയ്ത് വിന്യാസത്തിന് മുമ്പ് ഓരോ ഇനവും പരിശോധിക്കുക:

#### ✅ പരിസ്ഥിതി സജ്ജീകരണം
- [ ] AZD CLI ഇൻസ്റ്റാൾ ചെയ്തിട്ടുണ്ട്, ഒടുവിലത്തെ പതിപ്പിലേക്ക് അപ്‌ഡേറ്റ് ചെയ്തിട്ടുണ്ട്
- [ ] Azure CLI ഇൻസ്റ്റാൾ ചെയ്തിട്ടും ഓതന്റിക്കേഷൻ കഴിഞ്ഞിട്ടുണ്ട്
- [ ] ശരിയായ Azure subscription തെരഞ്ഞെടുത്തിട്ടുണ്ട്
- [ ] പരിസ്ഥിതി പേര് അസലാണ് уникальный naming conventions പാലിക്കുന്നു
- [ ] ലക്ഷ്യ റിസോഴ്‌സ് ഗ്രൂപ്പ് గుర్తിച്ചെടുത്തിട്ടുള്ളൂ അല്ലെങ്കിൽ സൃഷ്ടിക്കാവുന്നതാണ്

#### ✅ പ്രാമാണീകരണം & അനുമതികൾ
- [ ] വിജയകരമായി `azd auth login` ഉപയോഗിച്ച് ഓതന്റിക്കേറ്റ് ചെയ്തിട്ടുണ്ട്
- [ ] ലക്ഷ്യ subscription / resource group ൽ യൂസറിന് Contributor റോൾ ഉണ്ട്
- [ ] CI/CD-ക്കായി സർവീസ് പ്രിൻസിപ്പൽ കോൺഫിഗർ ചെയ്തിട്ടുണ്ടോ (പ്രযോജ്യമായ പക്ഷം)
- [ ] കാലഹരണപ്പെട്ട സർട്ടിഫിക്കറ്റുകൾ അല്ലെങ്കിൽ ക്രെഡൻഷ്യലുകൾ ഇല്ല

#### ✅ ടെംപ്ലേറ്റ് സാധുത
- [ ] `azure.yaml` നിലവിലുണ്ട്, സാധുവായ YAML ആണ്
- [ ] azure.yaml ൽ നിർവചിച്ച എല്ലാ സർവിസുകളുടെയും അനുബന്ധ സോഴ്‌സ് കോഡ് ഉണ്ട്
- [ ] `infra/` ഡയറക്ടറിയിലെ Bicep ടെംപ്ലേറ്റുകൾ സമ്പൂർണമായി ഉണ്ടായിരിക്കുന്നു
- [ ] `main.bicep` കോംപൈൽ ചെയ്യുമ്പോൾ പിശകുകൾ കാണുന്നില്ല (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 Infrastructure preview വിജയകരമായി നടത്തപ്പെടുന്നു (`azd provision --preview`)
- [ ] ആവശ്യമായ എല്ലാ പാരാമീറ്ററുകൾക്കും ഡീഫോള്റ് മൂല്യങ്ങൾ ഉള്ളത് അല്ലെങ്കിൽ നൽകപ്പെടും
- [ ] ടെംപ്ലേറ്റുകളിൽ ഹാർഡ്‌കോഡുചെയ്ത രഹസ്യങ്ങൾ ഇല്ല

#### ✅ റിസോഴ്‌സ് പ്ലാനിംഗ്
- [ ] ലക്ഷ്യ Azure പ്രദേശം തിരഞ്ഞെടുത്ത് സ്ഥിരീകരിച്ചിരിക്കുന്നു
- [ ] ആവശ്യമായ Azure സർവിസുകൾ ലക്ഷ്യ പ്രദേശത്ത് ലഭ്യമാണ്
- [ ] പ്ലാൻ ചെയ്ത റിസോഴ്‌സുകൾക്കായി മതിയായ ക്വോട്ടാസുകൾ ലഭ്യമാണ്
- [ ] റിസോഴ്‌സ് നാമമാറ്റ ടകംപ്ലിറ്റികൾ ഉണ്ടോ എന്ന് പരിശോധിച്ചു
- [ ] റിസോഴ്‌സുകൾ തമ്മിലുള്ള ആശ്രിതത്വങ്ങൾ മനസ്സിലാക്കിയിട്ടുണ്ട്

#### ✅ നെറ്റ്‌വർക് & സുരക്ഷ
- [ ] Azure എન્ડ്പോയിന്റുകളിലേക്ക് നെറ്റ്‌വർക്ക് കണക്ടിവിറ്റി പരിശോധിച്ചു
- [ ] ഫയർവാൾ / പ്രോക്സി സജ്ജീകരണങ്ങൾ ആവശ്യമായെങ്കിൽ ക്രമീകരിച്ചു
- [ ] രഹസ്യ നിർവഹണത്തിനായി Key Vault ക്രമീകരിച്ചിരിക്കുന്നു
- [ ] സാദ്ധ്യമെങ്കിൽ Managed Identities ഉപയോഗിക്കുന്നു
- [ ] വെബ് ആപ്ലിക്കേഷനുകൾക്കായി HTTPS ഏർപ്പെടുത്തൽ സജ്ജമാക്കിയിട്ടുണ്ട്

#### ✅ ചെലവ് മാനേജ്‌മെന്റ്
- [ ] Azure Pricing Calculator ഉപയോഗിച്ച് ചെലവ് അകലനം കണക്കാക്കിയിട്ടുണ്ട്
- [ ] ആവശ്യമായ പക്ഷം ബജറ്റ് അലേർട്ടുകൾ ക്രമീകരിച്ചിരിക്കുന്നു
- [ ] പരിസ്ഥിതി ტიპത്തിന് അനുയോജ്യമായ SKUs തിരഞ്ഞെടുക്കപ്പെട്ടിട്ടുണ്ട്
- [ ] പ്രൊഡക്ഷൻ വർക്ക്‌ലോഡുകൾക്കായി റിസർവഡ് കപ്പാസിറ്റി പരിഗണിച്ചതാണ്

#### ✅ അവലോകനവും നിരീക്ഷണവും
- [ ] ടെയ്മ്ലേറ്റുകളിൽ Application Insights ക്രമീകരിച്ചിരിക്കുന്നു
- [ ] Log Analytics workspace പദ്ധതി തയ്യാറാക്കിയിട്ടുണ്ട്
- [ ] നിർണായക മെട്രിക്കുകൾക്കായി അലേർട്ട് നയങ്ങൾ നിർവചിച്ചു
- [ ] ആപ്ലിക്കേഷനുകളിൽ ഹെല്ത് ചെക്ക് എൻഡ്‌പോയിൻറുകൾ നടപ്പാക്കിയിട്ടുണ്ട്

#### ✅ ബാക്കപ്പ് & പുനഃപ്രതസ്ഥാപനം
- [ ] ഡാറ്റ റിസോഴ്‌സുകൾക്കുള്ള ബാക്കപ്പ് രീതി നിർവചിച്ചിരിക്കുന്നു
- [ ] Recovery Time Objectives (RTO) രേഖപ്പെടുത്തിയിരിക്കുന്നു
- [ ] Recovery Point Objectives (RPO) രേഖപ്പെടുത്തിയിരിക്കുന്നു
- [ ] പ്രൊഡക്ഷനിനുള്ള ഡിസാസ്റ്റർ റിക്കവറി പ്ലാൻ ഉണ്ടാകണം

---

## പരിസ്ഥിതി സാധുത പരിശോധന

### ഡെവലപ്‌മെന്റ് പരിസ്ഥിതി സാധുത

```bash
#!/bin/bash
# ഡെവലപ്‌മെന്റ് പരിസ്ഥിതിക്ക് പ്രത്യേകമായ പരിശോധനകൾ

validate_dev_environment() {
    echo "=== Development Environment Validation ==="
    
    # ഡെവലപ്‌മെന്റ്-സൗഹൃദ ക്രമീകരണങ്ങൾ പരീക്ഷിക്കുക
    if grep -q "sku.*Free\|sku.*F1\|sku.*Basic" infra/*.bicep; then
        echo "✓ Development-appropriate SKUs detected"
    else
        echo "⚠ Consider using lower-cost SKUs for development"
    fi
    
    # ഓട്ടോ-ഷട്ട്ഡൗൺ ക്രമീകരണങ്ങൾ പരിശോധിക്കുക
    if grep -q "autoShutdown\|deallocate" infra/*.bicep; then
        echo "✓ Auto-shutdown configuration found"
    else
        echo "ℹ Consider adding auto-shutdown for cost savings"
    fi
    
    # ഡെവലപ്‌മെന്റ് ഡാറ്റാബേസ് ക്രമീകരണങ്ങൾ സ്ഥിരീകരിക്കുക
    if grep -q "Basic\|S0\|S1" infra/*.bicep; then
        echo "✓ Development database tiers configured"
    else
        echo "⚠ Consider using Basic/Standard tiers for development databases"
    fi
}
```

### പ്രൊഡക്ഷൻ പരിസ്ഥിതി സാധുത

```bash
#!/bin/bash
# ഉത്പാദന പരിസ്ഥിതിക്ക് പ്രത്യേക പരിശോധനകൾ

validate_prod_environment() {
    echo "=== Production Environment Validation ==="
    
    # ഉയർന്ന ലഭ്യതയുള്ള ക്രമീകരണങ്ങൾ പരിശോധിക്കുക
    if grep -q "zoneRedundant.*true\|Premium\|Standard_GRS" infra/*.bicep; then
        echo "✓ High availability configurations detected"
    else
        echo "⚠ Consider enabling high availability for production"
    fi
    
    # ബാക്കപ്പ് ക്രമീകരണങ്ങൾ പരിശോധിക്കുക
    if grep -q "backup\|retention\|pointInTimeRestore" infra/*.bicep; then
        echo "✓ Backup configurations found"
    else
        echo "⚠ Ensure backup strategies are implemented"
    fi
    
    # മോണിറ്ററിംഗ് ക്രമീകരണം സ്ഥിരീകരിക്കുക
    if grep -q "Microsoft.Insights\|Application_Type.*web" infra/*.bicep; then
        echo "✓ Monitoring and observability configured"
    else
        echo "⚠ Add comprehensive monitoring for production"
    fi
    
    # സുരക്ഷാ ക്രമീകരണങ്ങൾ പരിശോധിക്കുക
    if grep -q "Microsoft.KeyVault\|managedIdentity\|httpsOnly.*true" infra/*.bicep; then
        echo "✓ Security best practices implemented"
    else
        echo "⚠ Review security configurations for production"
    fi
}
```

---

## റിസോഴ്‌സ് സാധുത പരിശോധന

### ക്വോട്ടാ പരിശോധന സ്ക്രിപ്റ്റ്

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
    max_accounts = 250  # പൂർവ്വനിശ്ചിത Azure പരിധി
    
    usage_percent = (account_count / max_accounts) * 100
    status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
    
    print(f"{status} Storage Accounts: {account_count}/{max_accounts} ({usage_percent:.1f}%)")
    
    return usage_percent < 95

def check_network_limits(location: str) -> bool:
    """Check network-related limits"""
    print(f"\n=== Network Limits Check ({location}) ===")
    
    # വർച്വൽ നെറ്റ്‌വർക്കുകൾ പരിശോധിക്കുക
    vnets = run_command(['az', 'network', 'vnet', 'list'])
    if vnets is not None:
        vnet_count = len(vnets)
        print(f"✅ Virtual Networks: {vnet_count}/1000")
    
    # പബ്ലിക്ക് IP വിലാസങ്ങൾ പരിശോധിക്കുക
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
    
    # సంగ്രഹം
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

## സുരക്ഷ & പാലന പരിശോധനകൾ

### സുരക്ഷാ സാധുത സ്ക്രിപ്റ്റ്

```bash
#!/bin/bash
# AZD വിന്യാസങ്ങൾക്കുള്ള സുരക്ഷയും പാലന പരിശോധനയും

check_security_practices() {
    echo "=== Security Best Practices Check ==="
    
    local issues_found=0
    
    # Key Vault ഉപയോഗം പരിശോധിക്കുക
    if grep -r "Microsoft.KeyVault" infra/ >/dev/null 2>&1; then
        echo "✅ Key Vault detected in infrastructure"
    else
        echo "⚠️  Key Vault not found - consider using for secrets management"
        ((issues_found++))
    fi
    
    # managed identity ഉപയോഗം പരിശോധിക്കുക
    if grep -r "managedIdentity\|SystemAssigned\|UserAssigned" infra/ >/dev/null 2>&1; then
        echo "✅ Managed Identity configuration detected"
    else
        echo "⚠️  Managed Identity not found - consider using for service authentication"
        ((issues_found++))
    fi
    
    # HTTPS പ്രാബല്യപ്പെടുത്തൽ പരിശോധിക്കുക
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
    
    # പബ്ലിക് ആക്‌സസ് നിയന്ത്രണങ്ങൾ പരിശോധിക്കുക
    if grep -r "allowBlobPublicAccess.*false\|publicNetworkAccess.*Disabled" infra/ >/dev/null 2>&1; then
        echo "✅ Public access restrictions detected"
    else
        echo "⚠️  Public access restrictions not found - consider limiting public access"
        ((issues_found++))
    fi
    
    # നെറ്റ്‌വർക്ക് സുരക്ഷാ ഗ്രൂപ്പുകൾ പരിശോധിക്കുക
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
    
    # ബാക്കപ്പ് மற்றும் നിലനിർത്തൽ നയങ്ങൾ പരിശോധിക്കുക
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

## CI/CD-യുമായി ഇന്റഗ്രേഷൻ

### GitHub Actions ഇന്റഗ്രേഷൻ

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

### Azure DevOps ഇന്റഗ്രേഷൻ

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

## മികച്ച രീതികളുടെ സംഗ്രഹം

### ✅ മുന്‍-ഫ്ലൈറ്റ് പരിശോധന മികച്ച രീതികൾ

1. **ശ്രുതിമേടായി ഓട്ടോമേറ്റ് ചെയ്യുക**
   - പരിശോദ്ധനകൾ CI/CD പൈപ്പ്‌ലൈനുകളിൽ ഇന്റഗ്രേറ്റ് ചെയ്യുക
   - ആവർത്തനയോഗ്യമായ പരിശോധനകൾക്കായി സ്ക്രിപ്റ്റുകൾ ഉപയോഗിക്കുക
   - ഓഡിറ്റ് ട്രെയിലുകൾക്കായി ഫലങ്ങൾ സംരക്ഷിക്കുക

2. **പരിസ്ഥിതി-നിഷ്പക്ഷ പരിശോധന**
   - dev/staging/prod എന്നിവയ്ക്ക് വ്യത്യസ്ത പരിശോധനകൾ
   - ഓരോ പരിസ്ഥിതിക്കും അനുയോജ്യമായ സുരക്ഷാ ആവശ്യകതകൾ
   - നോൺ-പ്രൊഡക്ഷൻ പരിസ്ഥിതികൾക്കായി ചെലവ് ഓപ്റ്റിമൈസേഷൻ

3. **സംഗ്രഹപരമായ പരിമിതിവിവരണം**
   - പ്രാമാണീകരണം మరియు അനുമതികൾ
   - റിസോഴ്‌സ് ക്വോട്ടാസുകളും ലഭ്യതയും
   - ടെംപ്ലേറ്റ് സാധുതയും സിന്താക്സ് പരിശോധിക്കൽ
   - സുരക്ഷയും പാലന ആവശ്യകതകളും

4. **തെളിവുള്ള റിപ്പോർട്ടിംഗ്**
   - കളർ-കോഡ് ചെയ്ത സ്റ്റാറ്റസ് സൂചികകൾ
   - പരിഹാര നടപടികളോടെ വിശദമായ പിശക് സന്ദേശങ്ങൾ
   - ദ്രുതമായ വിലയിരുത്തലിനുള്ള സംഗ്രഹ റിപ്പോർട്ടുകൾ

5. **വേഗത്തിൽ പരാജയപ്പെടുക (Fail Fast)**
   - നിർണായക പരിശോധനകൾ പരാജയപ്പെട്ടാൽ വിന്യാസം നിർത്തുക
   - പരിഹാരത്തിനുള്ള സ്പഷ്ട മാർഗനിർദ്ദേശങ്ങൾ നൽകുക
   - പരിശോധനകൾ വീണ്ടും എളുപ്പത്തിൽ റൺ ചെയ്യാൻ സൗകര്യമാക്കുക

### പൊതു മുന്‍-ഫ്ലൈറ്റ് പിശകുകൾ

1. "വേഗം" വേണ്ടി പരിശോധന ഒഴിവാക്കുക
2. വിന്യാസത്തിനു മുമ്പ് അപര്യാപ്തമായ അനുമതികൾ പരിശോധിക്കൽ
3. വിന്യാസം പരാജയപ്പെടുന്നത് വരെ ക്വോട്ടാ പരിധികൾ അവഗണിക്കുക
4. CI/CD പൈപ്പ്‌ലൈനുകളിൽ ടെംപ്ലേറ്റുകൾ സ്ഥിരീകരിക്കാതെ പോവുക
5. പ്രൊഡക്ഷൻ പരിസ്ഥിതികൾക്ക് സുരക്ഷാ പരിശോധനകൾ മിസ്സാകുന്നത്
6. അസൗകര്യപ്രദമായ ചെലവ് അകലനം, ബജറ്റ് വിചിത്രതകൾക്ക് കാരണമാകാം

---

**പ്രോ ടിപ്പ്**: കൈകാര്യം ചെയ്യാനുള്ള വിന്യാസ ജോബിന് മുമ്പ് CI/CD പൈപ്പ്‌ലൈനിൽ വ്യത്യസ്ത ജോബായി മുന്‍-ഫ്ലൈറ്റ് പരിശോധനകൾ ഓടിക്കുക. ഇത്(issue) പ്രശ്നങ്ങൾ നേരത്തേ പിടികൂടാൻ സഹായിക്കുന്നു ಮತ್ತು ഡെവലപ്പർമാർക്ക് വേഗത്തിൽ ഫീഡ്‌ബാക്ക് നൽകുന്നു.

---

**Navigation**
- **Previous Lesson**: [SKU തിരഞ്ഞെടുപ്പ്](sku-selection.md)
- **Next Lesson**: [Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
അസ്വീകാരം:
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. നമുക്ക് കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുണ്ടെങ്കിലും, ഓട്ടോമേറ്റഡ് പരിഭാഷകളിൽ പിശകുകളും അപൂർണ്ണതകളും ഉണ്ടായേക്കാമെന്നത് ദയവായി ശ്രദ്ധിക്കുക. മൗലിക രേഖയുടെ അതിന്റെ സ്വഭാവഭാഷയിലുള്ള പതിപ്പാണ് പ്രാമാണിക സ്രോതസ്സായി കണക്കാക്കേണ്ടത്. നിർണായകമായ വിവരങ്ങൾക്ക് പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യപ്പെടുന്നു. ഈ പരിഭാഷ ഉപയോഗിച്ചതിനാൽ ഉണ്ടാകുന്ന ഏതെങ്കിലും തെറ്റിദ്ധാരണകൾക്കും തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കുമുള്ള ഉത്തരവാദിത്വം ഞങ്ങൾക്ക് ഉണ്ടായിരിക്കില്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
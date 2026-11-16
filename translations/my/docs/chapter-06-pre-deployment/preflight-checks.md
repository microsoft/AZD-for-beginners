# AZD တပ်ဆင်ခြင်းများအတွက် Pre-Flight စစ်ဆေးခြင်းများ

**အခန်းလမ်းညွှန်ခြင်း:**
- **📚 သင်တန်းမူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၆ - တပ်ဆင်ခြင်းမတိုင်မီ အတည်ပြုခြင်းနှင့် စီမံကိန်းရေးဆွဲခြင်း
- **⬅️ နောက်တစ်ခန်းနှင့် ယခင်အခန်း**: [SKU Selection](sku-selection.md)
- **➡️ နောက်တစ်ခန်း**: [အခန်း ၇: ပြဿနာဖြေရှင်းခြင်း](../chapter-07-troubleshooting/common-issues.md)
- **🔧 ဆက်စပ်**: [အခန်း ၄: တပ်ဆင်ခြင်းလမ်းညွှန်](../chapter-04-infrastructure/deployment-guide.md)

## နိဒါန်း

ဤပြည့်စုံသောလမ်းညွှန်သည် Azure Developer CLI တပ်ဆင်ခြင်းများ စတင်မတိုင်မှီ အောင်မြင်မှုရှိစေရန် အတည်ပြုစစ်ဆေးမှု script များနှင့် စနစ်များကို ပေးပို့သည်။ အတည်ပြုခြင်းအလိုအလျောက်စစ်ခြင်းများ၊ အရင်းအမြစ်ရရှိနိုင်မှုများ၊ အကန့်အသတ်များ၊ လုံခြုံရေးလိုက်နာမှုများနှင့် စွမ်းဆောင်ရည်လိုအပ်ချက်များစစ်ဆေး၍ တပ်ဆင်မှု မအောင်မြင်မှုများကာကွယ်ကာ တပ်ဆင်မှု အောင်မြင်မှုနှုန်းပိုမိုမြင့်တင်နိုင်ပါသည်။

## သင်ယူမည့်ရည်မှန်းချက်များ

ဤလမ်းညွှန်ကိုပြီးစီးပါက သင်သည်
- အလိုအလျောက် pre-deployment validation နည်းပညာများနှင့် script များကျွမ်းကျင်လိမ့်မည်
- အတည်ပြုမှု၊ ခွင့်ပြုချက်များနှင့် အကန့်အသတ်များအတွက် ကျယ်ပြန့်သောစစ်ဆေးမည့် မျှဝေပုံများကို နားလည်လိမ့်မည်
- အရင်းအမြစ်ရရှိနိုင်မှုနှင့် စွမ်းဆောင်ရည်အတည်ပြုခြင်းစနစ်များကို အကောင်အထည်ဖော်နိုင်မည်
- အဖွဲ့အစည်း၏မူဝါဒများအတွက် လုံခြုံရေးနှင့်လိုက်နာမှုစစ်ဆေးမှုများပြင်ဆင်နိုင်မည်
- ကုန်ကျစရိတ်ခန့်မှန်းခြေစနစ်နှင့် ဘတ်ဂျက်အတည်ပြုစနစ်များ ဒီဇိုင်းဆွဲနိုင်မည်
- CI/CD လှိုက်လှဲစနစ်များအတွက် စိတ်ကြိုက် pre-flight စစ်ဆေးမှုအလိုအလျောက်လုပ်ခြင်းဖန်တီးနိုင်မည်

## သင်ယူပြီးရလဒ်များ

ပြီးစီးသွားပါက သင်သည်
- ပြည့်စုံသော pre-flight validation script များဖန်တီး၍ အကောင်အထည်ဖော်နိုင်မည်
- ကွဲပြားသောတပ်ဆင်မှုအခြေအနေများအတွက် အလိုအလျောက်စစ်ဆေးမှု workflow များ ဒီဇိုင်းဆွဲနိုင်မည်
- ပတ်ဝန်းကျင်အလိုက် validation စနစ်များနှင့် မူဝါဒများကို တည်ဆောက်နိုင်မည်
- တပ်ဆင်ရန် အသင့်ဖြစ်မှုအတွက် ကြိုတင်စောင့်ကြည့်မှုနှင့် အသိပေးရေး စနစ်များပြင်ဆင်နိုင်မည်
- တပ်ဆင်ရန်မတိုင်မှီ ပြဿနာများကို ဖြေရှင်းနိုင်ပြီး အမှားပြန်လည်တည်ဆောက်မှုများဆောင်ရွက်နိုင်မည်
- pre-flight စစ်ဆေးမှုများကို DevOps လှိုက်လှဲစနစ်များနှင့် အလိုအလျောက်လုပ်ခြင်း workflow များတွင် ပေါင်းစပ်အသုံးပြုနိုင်မည်

## အကြောင်းအရာများ ဇယား

- [အနှစ်ချုပ်](#overview)
- [အလိုအလျောက် Pre-flight Script](#automated-pre-flight-script)
- [လက်ဖြင့် အတည်ပြုစာရင်း](#manual-validation-checklist)
- [ပတ်ဝန်းကျင် အတည်ပြုခြင်း](#environment-validation)
- [အရင်းအမြစ် အတည်ပြုခြင်း](#resource-validation)
- [လုံခြုံရေးနှင့်လိုက်နာမှု စစ်ဆေးမှုများ](#security--compliance-checks)
- [စွမ်းဆောင်ရည်နှင့် စွမ်းရည်စီမံကိန်းရေးဆွဲခြင်း](capacity-planning.md)
- [အများဆုံး ဖြစ်ပေါ်တတ်သော ပြဿနာများ ဖြေရှင်းခြင်း](../chapter-07-troubleshooting/common-issues.md)

---

## အနှစ်ချုပ်

Pre-flight စစ်ဆေးမှုများသည် တပ်ဆင်မှုမတိုင်မှီ အရေးပါတဲ့ အတည်ပြုခြင်းများဖြစ်ပြီး၊ ၎င်းတို့ဖြင့် အောက်ပါအချက်များအား စစ်ဆေးသည်-

- **အရင်းအမြစ် ရရှိနိုင်မှု** နှင့် အကန့်အသတ် များကို တည်နေရာသတ်မှတ်ထားသော ဒေသများတွင် စစ်ဆေးခြင်း
- **အတည်ပြုမှုနှင့် ခွင့်ပြုချက်များ** များ မှန်ကန်စွာ ပြင်ဆင်ထားခြင်း
- **ပုံစံ၏ တရားဝင်မှု** နှင့် ပါရမီတာ မှန်ကန်မှု
- **ကွန်ယက်ချိတ်ဆက်မှု** နှင့် ကြားဖြတ်ချက်များ
- **အဖွဲ့အစည်း၏ မူဝါဒများနှင့် လုံခြုံမှုလိုက်နာမှု**
- **ကုန်ကျစရိတ် ခန့်မှန်းချက်** တွင် ဘတ်ဂျက်ပိုင်း ဆောင်ရွက်မှု

### Pre-flight စစ်ဆေးရန် အချိန်များ

- **ပထမဆုံး တပ်ဆင်မှု မတိုင်မှီ** နေရာအသစ်တွင်
- **ပုံစံအပြောင်းအလဲများလေးများဖြစ်ပြီးနောက်**
- **ကုန်ပစ္စည်းထုတ်လုပ်မှု တပ်ဆင်မှု မတိုင်မှီ**
- **Azure ဒေသများပြောင်းလဲသောအခါ**
- **CI/CD လှိုက်လှဲစနစ်များ၏ အစိတ်အပိုင်းအဖြစ်**

---

## အလိုအလျောက် Pre-flight Script

> **နယ်ပယ်နှင့်လိုအပ်ချက်များ:** ၎င်းတို့မှာ သင့်ရဲ့ပရောဂျက်အတွက် စတင်သုံးစွဲရန် script များဖြစ်ပြီး၊ အခန်းတွင် ပေးထားသော ဒေသခံဖိုင်များ မဟုတ်ပါ။ PowerShell ဗားရှင်းသည် PowerShell **7.3+** (ဒေသခံအမိန့်မှားများ ပျံ့နှံ့မှု) နှင့် `powershell-yaml` module ကို `ConvertFrom-Yaml` အတွက် တိုက်ရိုက်လိုအပ်သည်။ Bash ဗားရှင်းတွင် Bash, `jq`၊ Python 3.10+ နှင့် PyYAML လိုအပ်သည်။ နှစ်ခုလုံးတွင် Azure CLI, azd နှင့် လုပ်ဆောင်နိုင်သော Bicep ပရောဂျက် လိုအပ်သည်။ ၎င်းတို့မှာ အတည်ပြုမှု၊ စွမ်းဆောင်ရည် သို့မဟုတ် လိုက်နာမှု အတည်ပြုမရှိသည့် ရောဂါရှာဖွေရေး စစ်ဆေးမှုများ ဖြစ်သည်။ `azd provision --preview` အရှေ့တွင် ပုံစံ hook များအား စစ်ဆေးပြီးဖြစ်ရန်လိုအပ်သည်။ hook များသည် ပရောဂျက်အမိန့် မည်မျှမရှိအောင် လည်ပတ်နိုင်သည်။

### PowerShell Pre-flight စစ်ဆေးသူ

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

### Bash Pre-flight စစ်ဆေးသူ

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

## လက်ဖြင့် အတည်ပြု စစ်ဆေး စာရင်း

### တပ်ဆင်မှုမတိုင်မီ စစ်ဆေးစာရင်း

ဤစာရင်းကို ပုံနှိပ်၍ တပ်ဆင်မတိုင်မီ ပစ္စည်းအားလုံးကို အတည်ပြုပါ။

#### ✅ ပတ်ဝန်းကျင် တပ်ဆင်ခြင်း
- [ ] AZD CLI တပ်ဆင်ပြီးနောက်ဆုံးဗားရှင်းသို့ အပ်ဒိတ်လုပ်ထားသည်
- [ ] Azure CLI တပ်ဆင်ပြီး အတည်ပြုမှု ပြုလုပ်ထားသည်
- [ ] Azure subscription မှန်ကန်စွာ ရွေးချယ်ထားသည်
- [ ] ပတ်ဝန်းကျင်အမည် ထူးခြားပြီး အမည်ေပးပုံစံနှင့် ကိုက်ညီသည်
- [ ] အဓိကသုံးရန် resource group ကို သတ်မှတ်ထားသည် သို့မဟုတ် ဖန်တီးနိုင်သည်

#### ✅ အတည်ပြုမှု နှင့် ခွင့်ပြုချက်များ
- [ ] `azd auth login` ဖြင့် အောင်မြင်စွာ အတည်ပြုထားသည်
- [ ] အသုံးပြုသူမှာ target subscription/resource group တွင် Contributor အခန်းကဏ္ဍ ရှိသည်
- [ ] ပုံစံများတွင် role assignments ဖန်တီးပါက တပ်ဆင်သူ နည်းလမ်းသည် scoped role-assignment ခွင့်ပြုချက်များရှိရန် (Contributor သာ တတ်ရောက်ခြင်း မဟုတ်)
- [ ] CI/CD အတွက် service principal ပြင်ဆင်ထားပါက (သင့်လျော်လျှင်)
- [ ] သက်တမ်းကုန်ဆုံးသည့် သက်သေ ခဲ့ဖြတ်လက်မှတ်များ မရှိပါ

#### ✅ ပုံစံ အတည်ပြုခြင်း
- [ ] `azure.yaml` က ရှိပြီး YAML တရားဝင်ပါ
- [ ] azure.yaml တွင် တင်သတ်မှတ်ထားသည့် ဝန်ဆောင်မှုအားလုံးသည် ကိုက်ညီသောအရင်းအမြစ်ကုဒ်ရှိသည်
- [ ] `infra/` ဆိုင်ရာ Bicep ပုံစံများ ရှိသည်
- [ ] `main.bicep` မှားယွင်းခြင်းမရှိစွာ ရိုက်ဆိုနိုင်ပါသည် (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 အခြေခံအဆောက်အအုံသုံးပြသမှုအောင်မြင်ပါသည် (`azd provision --preview`)
- [ ] လိုအပ်သည့်ပါရမီတာများအားလုံးတွင် ပုံသေတန်ဖိုးများ ရှိသည် သို့မဟုတ် ထောက်ပံ့မည်
- [ ] ပုံစံများတွင် လျှို့ဝှကျချက်များ ကို ခိုင်လုံစွာ မထားရှိပါ

#### ✅ အရင်းအမြစ် စီမံကိန်းရေးဆွဲခြင်း
- [ ] ရွေးချယ်ထားသော Azure ဒေသ စစ်ဆေးပြီး ပြင်ဆင်ပေးထားသည်
- [ ] ပစ်မှတ်ဒေသရှိ Azure ဝန်ဆောင်မှုများ ရရှိနိုင်သည်
- [ ] စီစဉ်ထားသောအရင်းအမြစ်များအတွက် ကြတင်းများ ပြည့်စုံသည်
- [ ] အရင်းအမြစ်အမည် ပဋိပက္ခများစစ်ဆေးပြီးဖြစ်သည်
- [ ] အရင်းအမြစ်များအကြား မူလီဆက်စပ်မှုများ နားလည်ထားသည်

#### ✅ ကွန်ယက် နှင့် လုံခြုံရေး
- [ ] Azure endpoint များသို့ ကွန်ယက်ချိတ်ဆက်မှု စစ်ဆေးပြီးပါပြီ
- [ ] လိုအပ်ပါက firewall/proxy ပြင်ဆင်ထားသည်
- [ ] လျှို့ဝှက်ချက်များ စီမံရန် Key Vault ပြင်ဆင်ထားသည်
- [ ] သက်ဆိုင်ရာနေရာများတွင် managed identities အသုံးပြုထားသည်
- [ ] ဝက်ဘ်အက်ပလိကေးရှင်းများအတွက် HTTPS ကန့်သတ်ချက် ဖွင့်ထားသည်

#### ✅ ကုန်ကျစရိတ် စီမံခန့်ခွဲမှု
- [ ] Azure Pricing Calculator ဖြင့် ကုန်ကျစရိတ်ခန့်မှန်းချက်များ တွက်ချက်ထားသည်
- [ ] ဘတ်ဂျက် အချက်ပေးများ လိုအပ်ပါက ပြင်ဆင်ထားသည်
- [ ] ပတ်ဝန်းကျင်အမျိုးအစားနှင့် ကိုက်ညီသည့် SKU များ ရွေးချယ်ထားသည်
- [ ] ထုတ်လုပ်မှု အလုပ်များအတွက် သိုလှောင်ထားသော စွမ်းဆောင်ရည် စဉ်းစားထားသည်

#### ✅ စောင့်ကြည့်မှု နှင့် မြင်သာမှု
- [ ] Application Insights ကို ပုံစံတွင် ပြင်ဆင်ထားသည်
- [ ] Log Analytics workspace ကို စီစဉ်ထားသည်
- [ ] အရေးပေါ်မှတ်မိပုံများအတွက် အချက်ပေးစည်းမျဉ်းများ သတ်မှတ်ထားသည်
- [ ] ကျန်းမာရေးစစ်ဆေးမှု endpoint များ အက်ပလိကေးရှင်းများ၌ ထည့်သွင်းထားသည်

#### ✅ สำรองနှင့် ပြန်လာနိုင်မှု
- [ ] ဒေတာအရင်းအမြစ်များအတွက် Backup မျိုးစုံ ဖော်ပြထားသည်
- [ ] ပြန်လည်ရရှိနိုင်ချိန် ရည်မှန်းချက် (RTO) စာရွက်စာတမ်း ရှိသည်
- [ ] ပြန်လည်ရရှိမှု ချက်စစ်ချက် (RPO) စာရွက်စာတမ်း ရှိသည်
- [ ] ထုတ်လုပ်မှုအတွက် မတော်တဆ ဖြစ်ရပ်ကောင်းများပြန်လည်ကောင်းမွန်ရေး စီမံချက် ရှိသည်

---

## ပတ်ဝန်းကျင် အတည်ပြုခြင်း

အောက်ပါ `grep` စစ်ဆးမှုများသည် သတိပေး နမူနာများသာ ဖြစ်သည်။ တစ်စကားလုံးတူသည် တာဝန်ကျင်းပသည့် အရင်းအမြစ်ထိပ်တန်းတွင် feature သတ်မှတ်မှုကို ပြသခြင်း မဟုတ်ပါ၊ မရှိမှုသည် ထုတ်ပေးမှု (- module/defaults) ရှိနေနိုင်သည်။ ထုတ်လုပ်မှုလိုက်နာမှုတွင် gate များအဖြစ် အသုံးမပြုရ။

### ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင် အတည်ပြုခြင်း

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

### ထုတ်လုပ်မှု ပတ်ဝန်းကျင် အတည်ပြုခြင်း

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

## အရင်းအမြစ်အတည်ပြုခြင်း

### အကန့်အသတ် အတည်ပြု Script

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

## လုံခြုံရေးနှင့် လိုက်နာမှု စစ်ဆေးမှုများ

### လုံခြုံရေး အတည်ပြု Script

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

## CI/CD နှင့် ပေါင်းစပ်မှု

### GitHub Actions ပေါင်းစပ်ခြင်း

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

ဤ workflow အတွက် federated credentials များ ပြင်ဆင်ပြီး ရွေးချယ်ထားသော azd ပတ်ဝန်းကျင်ကို script များကို run မတိုင်မှီ ဖန်တီး/ပြန်လည် တည်ဆောက်ပါ။ ဤနမူနာများသည် console ထုတ်လွှင့်မှုများကိုသာ ရိုက်ထုတ်သည်၊ `preflight-results.json` သို့မဟုတ် JUnit ဖိုင် မထုတ်ပေးပါ။

### Azure DevOps ပေါင်းစပ်ခြင်း

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

pipeline သည် မိမိ၏ azd ပတ်ဝန်းကျင်ကို ပြန်လည်တည်ဆောက်/ဖန်တီးပြီး အတန်းသင်ခန်းစာတွင် ဖော်ပြထားသော script များကို သိမ်းဆည်းထားရန် လိုအပ်သည်။ federated service connection ကို ပြင်ဆင်ပြီး pipeline အတွက် လိုအပ်သည့် token ခွင့်ပြုချက်များ ပေးလိုက်ပါ။ ဦးဆုံး `AzureCLI@2` အလုပ်တစ်ခု၏ Azure CLI လော့ဂ်အင်ဖြင့် နောက်ထပ် မွမ်းမံ Bash အလုပ်ကို အတည်ပြုခြင်းမဖြစ်ပါ။

---

## အကောင်းဆုံး လမ်းညွှန်ချက်များ အနှစ်ချုပ်

### ✅ Pre-flight စစ်ဆေးမှု အကောင်းဆုံးလေ့လာမှုများ

1. **ဖြစ်နိုင်သမျှ အလိုအလျောက်လုပ်ရန်**
   - စစ်ဆေးမှုများကို CI/CD လှိုက်လှဲစနစ်များတွင် ပေါင်းစပ်ထားသည်
   - ထပ်မံစစ်ဆေးနိုင်သည့် စစ်ဆေးမှုများအတွက် script များကို အသုံးပြုပါ
   - စစ်ဆေးမှု ရလဒ်များကို audit trail အတွက် သိမ်းဆည်းထားပါ

2. **ပတ်ဝန်းကျင်အလိုက် အတည်ပြုခြင်း**
   - ဖွံ့ဖြိုးရေး/စမ်းသပ်/ထုတ်လုပ် သတ်မှတ်ချက် အလိုက် ကွဲပြားသည့် စစ်ဆေးမှုများ
   - ပတ်ဝန်းကျင်အလိုက် သင့်တော်သည့် လုံခြုံရေးလိုအပ်ချက်များ
   - မထုတ်လုပ်သည့် ပတ်ဝန်းကျင်များအတွက် ကုန်ကျစရိတ် ပိုမိုချွေတာမှု

3. **ကျယ်ပြန့်သော ဖော်မတ်ဖုံးလွှမ်းမှု**
   - အတည်ပြုမှုနှင့် ခွင့်ပြုချက်များ
   - အရင်းအမြစ် အကန့်အသတ်များနှင့် ရရှိနိုင်မှု
   - ပုံစံအတည်ပြုခြင်းနှင့် သတ်မှတ်ချက်
   - လုံခြုံရေးနှင့်လိုက်နာမှု တောင်းဆိုချက်များ

4. **ရှင်းလင်းသော အစီရင်ခံချက်များ**
   - အရောင်ကွဲပြားသော အခြေအနေပြသမှုများ
   - ပြုပြင်နိုင်ရေးနည်းလမ်းများပါသော စစ်တမ်းအမှားဆန်းစစ်ချက်များ
   - အမြန်ဆုံးအကဲဖြတ်နိုင်ရန် အစီရင်ခံချက်များ

5. **အမြန်ပျက်စီးမှု**
   - အရေးကြီးသော စစ်ဆေးမှု မအောင်မြင်ပါက တပ်ဆင်မှုကို ရပ်ဆိုင်း
   - ဖြေရှင်းချက်များအတွက် ပွတ်ပြတ်ရှင်းလင်းသော လမ်းညွှန်ချက်များပေး
   - စစ်ဆးမှုများ ပြန်လည် ချိန်ဆ အလုပ်လုပ်နိုင်စေရန် လုပ်ငန်းများကူညီ

### ပုံမှန်ဖြစ်ပေါ်တတ်သော Pre-flight အမှားများ

1. **"လျင်မြန်စွာ" တပ်ဆင်မှုများအတွက် အတည်ပြုမှု အလွတ်ယူခြင်း**
2. **တပ်ဆင်မှုမတိုင်ခင် ခွင့်ပြုချက်များ မလုံလောက်ခြင်း**
3. **အကန့်အသတ် ကန့်သတ်ချက်များကို ပြဿနာဖြစ်ထွန်းမှသာ လုပ်ဆောင်ခြင်း**
4. **CI/CD လှိုက်လှဲစနစ်များ၌ ပုံစံများ မအတည်ပြုခြင်း**
5. **ထုတ်လုပ်မှု ပတ်ဝန်းကျင်များအတွက် လုံခြုံရေး အတည်ပြုမှု လွတ်ထားခြင်း**
6. **ကုန်ကျစရိတ် ခန့်မှန်းမှု မလုံလောက်ခြင်းက ဘတ်ဂျက် အဖြစ်မှမ်းမံမှုများ ဖြစ်ပေါ်စေခြင်း**

---

**အကြံပြုချက် အထူးပြု**: တကယ့်တပ်ဆင်မှုအလုပ်မတိုင်မီ သင့် CI/CD လှိုက်လှဲစနစ်တွင် pre-flight စစ်ဆေးမှုများကို အခြားအလုပ်တစ်ခုအဖြစ် ပြုလုပ်ပါ။ ၎င်းဖြင့် ပြဿနာများကို စောပြီး သိရှိနိုင်ကာ ဖွံ့ဖြိုးသူများထံ အမြန်တုံ့ပြန်မှု ရရှိစေပါသည်။

---

**လမ်းညွှန်ခြင်း**
- **ယခင်သင်ခန်းစာ**: [SKU Selection](sku-selection.md)
- **နောက်သင်ခန်းစာ**: [Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# AZD တပ်ဆင်ခြင်းများအတွက် ကြိုစစ်ဆေးခြင်းများ

**အခန်းလမ်းညွှန်:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD အခြေခံလေ့လာသူများအတွက်](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း ၆ - တင်သွင်းမီ စစ်ဆေးခြင်းနှင့် စီမံချက်
- **⬅️ မရှေ့က**: [SKU Selection](sku-selection.md)
- **➡️ နောက်ထပ် အခန်း**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/common-issues.md)
- **🔧 ဆက်စပ်**: [Chapter 4: Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

## မိတ်ဆက်

ဤ ထောက်လှမ်းလမ်းညွှန်သည် Azure Developer CLI ထောက်ခံမှုများကို စတင်တင်သွင်းခြင်းမပြုမီ အောင်မြင်စေရန် အလိုအလျောက်စစ်ဆေးမှုများနှင့် အဆင့်ဆင့် လုပ်ထုံးလုပ်နည်းများကို ပံ့ပိုးပေးပါသည်။ အတည်ပြုမှု၊ ရင်းမြစ် ရရှိနိုင်မှု၊ ကောင်တာ၊ လုံခြုံရေးလိုက်နာမှုနှင့် လုပ်ဆောင်ရည်လိုအပ်ချက်များအတွက် စစ်ဆေးမှုများကို အလိုအလျောက်ဆောင်ရွက်ရန် သင်ယူလေ့လာပါ၊ ဤသည်က တင်သွင်းမှု အဆင့်ဆင့် မအောင်မြင်မှုများကို ကာကွယ်ပေးပြီး တင်သွင်းမှုအောင်မြင်မှုနှုန်းကို တိုးတက်စေပါလိမ့်မည်။

## လေ့လာရမည့် ရည်မှန်းချက်များ

ဤ လမ်းညွှန်ကို ပြီးမြောက်ပါက သင်သည်:
- အလိုအလျောက် ကြိုစစ်ဆေးမှု နည်းလမ်းများနှင့် script များကို ကျွမ်းကျင်စွာ အသုံးချနိုင်မည်
- အတည်ပြုမှု၊ ခွင့်ပြုချက်များနှင့် ကောင်တာများအတွက် ကျယ်ပြန့်စွာ စစ်ဆေးမှု များကို နားလည်မည်
- ရင်းမြစ် ရရှိနိုင်မှုနှင့် စွမ်းရည် စစ်ဆေးမှု လုပ်ထုံးလုပ်နည်းများကို အကောင်အထည်ဖော်နိုင်မည်
- အဖွဲ့အစည်း နိုင်ငံတော်မူဝါဒများအရ လုံခြုံရေးနှင့် လိုက်နာမှု စစ်ဆေးမှုများကို ဖွဲ့စည်းနိုင်မည်
- ကုန်ကျစရိတ် ခန့်မှန်းမှုနှင့် ဘတ်ဂျက် စစ်ဆေးမှု လုပ်ငန်းစဉ်များကို ဖန်တီးနိုင်မည်
- CI/CD pipeline များအတွက် ကိုယ်ပိုင် ကြိုစစ် စက်တင်ကို ဖန်တီးနိုင်မည်

## လေ့လာပြီးရမည့် ရလဒ်များ

ပြီးဆုံးမှုအပြီးတွင် သင်သည်:
- ကျယ်ပြန့်သော ကြိုစစ် စာရင်းစစ် script များကို ဖန်တီး၍ အကောင်အထည်ဖော်နိုင်မည်
- ကွဲပြားသော တင်သွင်းမှု အခြေအနေများအတွက် အလိုအလျောက်စစ်ဆေးမှု လုပ်ငန်းစဉ်များ ဒီဇိုင်းရေးဆွဲနိုင်မည်
- ပတ်ဝန်းကျင်အလိုက် သီးခြား စစ်ဆေးမှု နည်းလမ်းများနှင့် မူဝါဒများကို အကောင်အထည်ဖော်နိုင်မည်
- တင်သွင်းရန် အဆင်ပြေမှုအတွက် လျင်မြန်စွာ ကြိုတင်စောင့်ကြည့်ခြင်းနှင့် အချက်ပေးမှုများကို ဖွဲ့စည်းနိုင်မည်
- တင်သွင်းမီ ပြဿနာများကို တင်ပြရန်နှင့် ပြုပြင်ဆောင်ရွက်ရန် နည်းလမ်းများကို ဖြေရှင်းနိုင်မည်
- ကြိုစစ်ဆေးမှုများကို DevOps pipeline များနှင့် အလိုအလျောက်လုပ်ငန်းစဉ်များထဲ ထည့်သွင်းနိုင်မည်

## အကြောင်းအရာများ

- [အနှစ်ချုပ်](../../../../docs/chapter-06-pre-deployment)
- [အလိုအလျောက် ကြိုစစ် စာရင်း Script](../../../../docs/chapter-06-pre-deployment)
- [လက်ဖြင့် စစ်ဆေးရန် စာရင်း](../../../../docs/chapter-06-pre-deployment)
- [ပတ်ဝန်းကျင် စစ်ဆေးခြင်း](../../../../docs/chapter-06-pre-deployment)
- [ရင်းမြစ် စစ်ဆေးခြင်း](../../../../docs/chapter-06-pre-deployment)
- [လုံခြုံရေးနှင့် လိုက်နာမှု စစ်ဆေးမှုများ](../../../../docs/chapter-06-pre-deployment)
- [လုပ်ဆောင်ရည်နှင့် စွမ်းရည် စီမံချက်](../../../../docs/chapter-06-pre-deployment)
- [ပေါ်လစီသော ပြဿနာများ ဖြေရှင်းနည်း](../../../../docs/chapter-06-pre-deployment)

---

## အနှစ်ချုပ်

ကြိုစစ်ဆေးမှုများသည် တင်သွင်းမပြုမီ အောက်ပါများကို အတည်ပြုရန် လိုအပ်သော စစ်ဆေးမှုများဖြစ်သည်။

- **ပြည်တွင်းရင်းမြစ် ရရှိနိုင်မှု** နှင့် ရည်မှန်းထားသည့် ဒေသရှိ quota များ
- **အတည်ပြုမှုနှင့် ခွင့်ပြုချက်များ** မှန်ကန်စွာ ဖွဲ့စည်းထားမှု
- **တမ်းပလိတ် တရားဝင်မှု** နှင့် parameter များ၏ မှန်ကန်မှု
- **ကွန်ယက် ချိတ်ဆက်မှု** နှင့် မှီငြမ်းမှုများ
- **အဖွဲ့အစည်း မူဝါဒအရ လုံခြုံရေးလိုက်နာမှု**
- **ဘတ်ဂျက် အတွင်း ကုန်ကျစရိတ် ခန့်မှန်းမှု**

### ဘယ်အချိန်တွင် ကြိုစစ်ဆေးမှုများ ပြုလုပ်သင့်သနည်း

- **ပထမဆုံး တင်သွင်းမှု မပြုမီ** ပတ်ဝန်းကျင် အသစ်သို့
- **တမ်းပလိတ် အရေးကြီးပြောင်းလဲမှုများ ပြုလုပ်ပြီးနောက်**
- **ထုတ်လုပ်ရေး တင်သွင်းမှု မပြုမီ**
- **Azure ဒေသများ ပြောင်းလဲသောအခါ**
- **CI/CD pipeline များ၏ အစိတ်အပိုင်းအဖြစ်**

---

## အလိုအလျောက် ကြိုစစ် စာရင်း Script

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

# ထွက်အတွက် အရောင် သတ်မှတ်ခြင်း
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
    
    # AZD တပ်ဆင်မှုကို စစ်ဆေးပါ
    try {
        $azdVersion = azd version --output json | ConvertFrom-Json
        Write-Status "AZD CLI installed" "Success" "Version: $($azdVersion.azd.version)"
    }
    catch {
        Write-Status "AZD CLI not found" "Error" "Install from https://aka.ms/azd-install"
        return $false
    }
    
    # Azure CLI တပ်ဆင်မှုကို စစ်ဆေးပါ
    try {
        $azVersion = az version --output json | ConvertFrom-Json
        Write-Status "Azure CLI installed" "Success" "Version: $($azVersion.'azure-cli')"
    }
    catch {
        Write-Status "Azure CLI not found" "Error" "Install from https://aka.ms/azcli"
        return $false
    }
    
    # PowerShell ဗားရှင်းကို စစ်ဆေးပါ
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
        # AZD အတည်ပြုခြင်းကို စစ်ဆေးပါ
        $azdAuth = azd auth login --check-status --output json 2>$null | ConvertFrom-Json
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
        }
        else {
            Write-Status "AZD authentication" "Error" "Run 'azd auth login'"
            return $false
        }
        
        # Azure CLI အတည်ပြုခြင်းကို စစ်ဆေးပါ
        $azAccount = az account show --output json | ConvertFrom-Json
        Write-Status "Azure CLI authentication" "Success" "Subscription: $($azAccount.name)"
        
        # Subscription ဝင်ရောက်ခွင့်ကို အတည်ပြုပါ
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
        # လက်ရှိ အသုံးပြုသူ၏ အခန်းကဏ္ဍ ခန့်အပ်ချက်များကို ရယူပါ
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
        
        # resource group ဖန်တီးခြင်းကို စမ်းသပ်ပါ (သတ်မှတ်ထားပါက)
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # resource group ဖန်တီးနိုင်စွမ်းကို စမ်းသပ်ပါ
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
        # compute ကွိုတာများကို စစ်ဆေးပါ
        $computeUsage = az vm list-usage --location $Location --output json | ConvertFrom-Json
        
        # သတ်မှတ်ထားသော ကွိုတာများကို စစ်ဆေးပါ
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
        
        # App Service ကန့်သတ်ချက်များကို စစ်ဆေးပါ
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
        
        # storage account ကန့်သတ်ချက်များကို စစ်ဆေးပါ
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
        return $true # မတားဆီးသော
    }
}

function Test-NetworkConnectivity {
    Write-Host "`n${Blue}=== Network Connectivity Check ===${Reset}"
    
    # Azure endpoints များကို စမ်းသပ်ပါ
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
    
    # DNS ဖြေရှင်းမှုကို စမ်းသပ်ပါ
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
    
    # azure.yaml ရှိမရှိကို စစ်ဆေးပါ
    if (Test-Path "azure.yaml") {
        Write-Status "azure.yaml found" "Success"
        
        # azure.yaml ကို ခွဲထုတ်ပါ
        try {
            $azureYaml = Get-Content "azure.yaml" -Raw | ConvertFrom-Yaml
            Write-Status "azure.yaml parsing" "Success"
            
            # ဝန်ဆောင်မှုများကို အတည်ပြုပါ
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
    
    # infrastructure ဖိုင်များ ရှိမရှိ စစ်ဆေးပါ
    if (Test-Path "infra") {
        $bicepFiles = Get-ChildItem -Path "infra" -Filter "*.bicep" -Recurse
        if ($bicepFiles.Count -gt 0) {
            Write-Status "Infrastructure templates" "Success" "$($bicepFiles.Count) Bicep files found"
            
            # main.bicep ရှိပါက အတည်ပြုပါ
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
    
    # 🧪 အသစ်: infrastructure ကြိုမြင်မည့် စမ်းသပ်ချက် (လုံခြုံသော dry-run)
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
        # location မှန်ကန်သည်ကို စစ်ဆေးပါ
        $locations = az account list-locations --output json | ConvertFrom-Json
        $validLocation = $locations | Where-Object { $_.name -eq $Location -or $_.displayName -eq $Location }
        
        if ($validLocation) {
            Write-Status "Azure region" "Success" "Location '$Location' is valid"
        }
        else {
            Write-Status "Azure region" "Error" "Location '$Location' is not valid"
            return $false
        }
        
        # ဒေသအတွင်း ဝန်ဆောင်မှု ရရှိနိုင်မှုကို စစ်ဆေးပါ
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
    
    # အခြေခံ ကုန်ကျစရိတ် ခန့်မှန်းချက် (တိကျရန် Azure Pricing API လိုအပ်သည်)
    Write-Status "Cost estimation" "Info" "Use Azure Pricing Calculator for detailed estimates"
    Write-Status "Monitoring setup" "Info" "Set up Azure Cost Management alerts"
    
    # ဘတ်ဂျက် ရှိမရှိ စစ်ဆေးပါ
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
    
    # ပုံမှန်လုံခြုံရေး ကျင့်ဝတ်များ ရှိမရှိ စစ်ဆေးပါ
    try {
        # Key Vault ကို သတ်မှတ်ထားမထားကို စစ်ဆေးပါ
        if (Select-String -Path "infra/*.bicep" -Pattern "Microsoft.KeyVault" -Quiet) {
            Write-Status "Key Vault usage" "Success" "Key Vault detected in templates"
        }
        else {
            Write-Status "Key Vault usage" "Warning" "Consider using Key Vault for secrets"
        }
        
        # managed identity အသုံးပြုမှု ရှိမရှိ စစ်ဆေးပါ
        if (Select-String -Path "infra/*.bicep" -Pattern "managedIdentity|SystemAssigned" -Quiet) {
            Write-Status "Managed Identity" "Success" "Managed Identity detected"
        }
        else {
            Write-Status "Managed Identity" "Warning" "Consider using Managed Identity"
        }
        
        # HTTPS အတင်းအကျပ် ရှိမရှိ စစ်ဆေးပါ
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

# အဓိက လုပ်ဆောင်ချက်
function Invoke-PreflightCheck {
    Write-Host "${Green}AZD Pre-flight Check${Reset}" -ForegroundColor Green
    Write-Host "Environment: $EnvironmentName"
    Write-Host "Location: $Location"
    if ($ResourceGroup) { Write-Host "Resource Group: $ResourceGroup" }
    Write-Host "Time: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    Write-Host ""
    
    $allPassed = $true
    $results = @{}
    
    # စစ်ဆေးမှုအားလုံးကို လုပ်ဆောင်ပါ
    $results["Prerequisites"] = Test-Prerequisites
    $results["Authentication"] = Test-Authentication
    $results["Permissions"] = Test-Permissions
    $results["QuotasAndLimits"] = Test-QuotasAndLimits
    $results["NetworkConnectivity"] = Test-NetworkConnectivity
    $results["TemplateValidation"] = Test-TemplateValidation
    $results["RegionalAvailability"] = Test-RegionalAvailability
    $results["CostEstimation"] = Test-CostEstimation
    $results["SecurityCompliance"] = Test-SecurityCompliance
    
    # အနှစ်ချုပ်
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

# pre-flight စစ်ဆေးမှုကို လုပ်ပါ
Invoke-PreflightCheck
```

### Bash Pre-flight Checker

```bash
#!/bin/bash
# Unix/Linux စနစ်များအတွက် pre-flight စစ်ဆေးမှုများ၏ Bash ဗားရှင်း

set -euo pipefail

# အရောင်ကုဒ်များ
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # အရောင်မရှိ

# ကမ္ဘာလုံးဆိုင်ရာ ပြောင်းလဲနိုင်သည့် အချက်များ
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
    
    # AZD တပ်ဆင်မှု စစ်ဆေးခြင်း
    if command -v azd >/dev/null 2>&1; then
        local azd_version=$(azd version --output json | jq -r '.azd.version')
        print_status "AZD CLI installed" "success" "Version: $azd_version"
    else
        print_status "AZD CLI not found" "error" "Install from https://aka.ms/azd-install"
        return 1
    fi
    
    # Azure CLI တပ်ဆင်မှု စစ်ဆေးခြင်း
    if command -v az >/dev/null 2>&1; then
        local az_version=$(az version --output json | jq -r '."azure-cli"')
        print_status "Azure CLI installed" "success" "Version: $az_version"
    else
        print_status "Azure CLI not found" "error" "Install from https://aka.ms/azcli"
        return 1
    fi
    
    # jq တပ်ဆင်မှု စစ်ဆေးခြင်း
    if command -v jq >/dev/null 2>&1; then
        print_status "jq installed" "success"
    else
        print_status "jq not found" "warning" "Install jq for better JSON parsing"
    fi
    
    return 0
}

check_authentication() {
    echo -e "\n${BLUE}=== Authentication Check ===${NC}"
    
    # AZD အတည်ပြုခြင်း စစ်ဆေးခြင်း
    if azd auth login --check-status >/dev/null 2>&1; then
        local principal_name=$(azd auth login --check-status --output json 2>/dev/null | jq -r '.principalName // "Unknown"')
        print_status "AZD authentication" "success" "User: $principal_name"
    else
        print_status "AZD authentication" "error" "Run 'azd auth login'"
        return 1
    fi
    
    # Azure CLI အတည်ပြုခြင်း စစ်ဆေးခြင်း
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
    
    # azure.yaml ဖိုင်ကို စစ်ဆေးခြင်း
    if [[ -f "azure.yaml" ]]; then
        print_status "azure.yaml found" "success"
        
        # အခြေခံ YAML အတည်ပြုခြင်း
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
    
    # infrastructure ဖိုင်များ စစ်ဆေးခြင်း
    if [[ -d "infra" ]]; then
        local bicep_count=$(find infra -name "*.bicep" | wc -l)
        if [[ $bicep_count -gt 0 ]]; then
            print_status "Infrastructure templates" "success" "$bicep_count Bicep files found"
            
            # main.bicep ရှိပါက အတည်ပြုခြင်း
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
    
    # တည်နေရာ သတ်မှတ်ချက် မှန်ကန်သည်ဟုတ်ကို စစ်ဆေးခြင်း
    if az account list-locations --query "[?name=='$LOCATION' || displayName=='$LOCATION']" --output tsv | grep -q .; then
        print_status "Azure region" "success" "Location '$LOCATION' is valid"
    else
        print_status "Azure region" "error" "Location '$LOCATION' is not valid"
        return 1
    fi
    
    # ဝန်ဆောင်မှု ရရှိနိုင်မှု စစ်ဆေးခြင်း
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
    # command line အာဂျူမင့်များကို ခွဲထုတ်ခြင်း
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
    
    # လိုအပ်သော ပါရာမီတာများ အတည်ပြုခြင်း
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
    
    # စစ်ဆေးမှုများကို ပြုလုပ်ခြင်း
    local all_passed=true
    
    check_prerequisites || all_passed=false
    check_authentication || all_passed=false
    check_template_validation || all_passed=false
    check_regional_availability || all_passed=false
    
    # အနှစ်ချုပ်
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

# main function ကို လည်ပတ်စေခြင်း
main "$@"
```

---

## လက်ဖြင့် စစ်ဆေးရန် စာရင်း

### တင်သွင်းမတိုင်မီ စစ်ဆေးရန် စာရင်း

ဤ စာရင်းကို ပုံနှိပ်၍ တင်သွင်းမလုပ်ခင် အချက်အလက်တိုင်းကို စစ်ဆေးပါ။

#### ✅ ပတ်ဝန်းကျင် စီစဉ်ခြင်း
- [ ] AZD CLI ထည့်သွင်းပြီး နောက်ဆုံးဗားရှင်းထိ အပ်ဒိတ်လုပ်ထား
- [ ] Azure CLI ထည့်သွင်းပြီး အကောင့်ဖြင့် အထောက်အထား ဝင်ထား
- [ ] မှန်ကန်သော Azure subscription ကို ရွေးချယ်ထား
- [ ] ပတ်ဝန်းကျင်အမည် တစ်ခုတည်းဖြစ်ပြီး နာမည်ပုံစံကို လိုက်နာထား
- [ ] ပစ်မှတ် resource group ကို သတ်မှတ်ထား သို့မဟုတ် ဖန်တီးနိုင်

#### ✅ အတည်ပြုမှု & ခွင့်ပြုချက်များ
- [ ] `azd auth login` ဖြင့် အောင်မြင်စွာ အတည်ပြုထား
- [ ] အသုံးပြုသူသည် ပစ်မှတ် subscription/resource group အပေါ်တွင် Contributor အခန်းကဏ္ဍ ရှိသည်
- [ ] CI/CD အတွက် service principal ကို စီစဉ်ထား (လိုအပ်ပါက)
- [ ] သက်တမ်းကုန်သွားသော certificate သို့မဟုတ် credential မရှိ

#### ✅ တမ်းပလိတ် စစ်ဆေးမှု
- [ ] `azure.yaml` ရှိပြီး YAML အဖြစ် မှန်ကန်သည်
- [ ] azure.yaml တွင် သတ်မှတ်ထားသည့် service အားလုံးတွင် သက်ဆိုင်ရာ source code ရှိသည်
- [ ] `infra/` ဒိုင်ရက်ထရီအတွင်း Bicep templates များ ရှိသည်
- [ ] `main.bicep` ကို အမှား မဖြစ်စေဘဲ compile လုပ်နိုင်သည် (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 Infrastructure preview ကို အောင်မြင်စွာ လည်ပတ်နိုင်သည် (`azd provision --preview`)
- [ ] လိုအပ်သည့် parameter အားလုံးတွင် default တန်ဖိုး ရှိသော်လည်း မဟုတ်ရင်ပင် ပေးပို့မည်ဖြစ်သည်
- [ ] template များတွင် hardcoded secrets မရှိ

#### ✅ ရင်းမြစ် စီမံချက်
- [ ] ပစ်မှတ် Azure region ကို ရွေးချယ်၍ စစ်ဆေးထား
- [ ] လိုအပ်သည့် Azure services များကို ပစ်မှတ် ဒေသတွင် ရရှိနိုင်မှုစစ်ဆေးထား
- [ ] စီစဉ်ထားသည့် ရင်းမြစ်များအတွက် quota များ လုံလောက်စွာ ရှိသည်
- [ ] resource နာမည် ပဋိပက္ခများ စစ်ဆေးထား
- [ ] resource များအကြား မူဝါဒ/အခြေခံပေါ်တည်မှုများ နားလည်ထား

#### ✅ ကွန်ယက် & လုံခြုံရေး
- [ ] Azure endpoints သို့ ကွန်ယက် ချိတ်ဆက်မှု စစ်ဆေးထား
- [ ] လိုအပ်ပါက firewall/proxy ဆက်တင်များ စီစဉ်ထား
- [ ] secrets စီမံရန် Key Vault ကို ဖွဲ့စည်းထား
- [ ] အသုံးပြုနိုင်သမျှ Managed identities အသုံးပြုထား
- [ ] ဝဘ်လျှောက်လွှာများအတွက် HTTPS ကို တိုက်တွန်း_ENABLEထား

#### ✅ ကုန်ကျစရိတ် စီမံခန့်ခွဲမှု
- [ ] Azure Pricing Calculator သုံးပြီး ကုန်ကျစရိတ် ခန့်မှန်းချက် တွက်ချက်ထား
- [ ] လိုအပ်ပါက ဘတ်ဂျက် အချက်ပေးခြင်းများ ကို သတ်မှတ်ထား
- [ ] ပတ်ဝန်းကျင် အမျိုးအစားအလိုက် သင့်လျော်သော SKUs ရွေးချယ်ထား
- [ ] ထုတ်လုပ်ရေး အလုပ်လုပ်များအတွက် reserved capacity ကို စဉ်းစားထား

#### ✅ မော်နီတာနှင့် ကြည့်ရှုနိုင်မှု
- [ ] Application Insights ကို template များတွင် ဖွဲ့စည်းထား
- [ ] Log Analytics workspace ကို စီစဉ်ထား
- [ ] အရေးကြီး အတိုင်းအတာများအတွက် alert rule များ သတ်မှတ်ထား
- [ ] အက်ပ်လ်ကေးရှင်းများတွင် health check endpoints ထည့်သွင်းထား

#### ✅ မျက်နှာချင်းဆိုင် backup & recovery
- [ ] ဒေတာ ရင်းမြစ်များအတွက် backup မဟာဗျူဟာ သတ်မှတ်ထား
- [ ] Recovery time objectives (RTO) တွေကို စာတမ်းပြုစုထား
- [ ] Recovery point objectives (RPO) တွေကို စာတမ်းပြုစုထား
- [ ] ထုတ်လုပ်ရေးအတွက် မဟာဘက်ရောင်း ပြန်လည်ထိန်းသိမ်းမှု စီမံချက် ရှိ

---

## ပတ်ဝန်းကျင် စစ်ဆေးခြင်း

### ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင် စစ်ဆေးခြင်း

```bash
#!/bin/bash
# ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင် သီးသန့် စစ်ဆေးချက်များ

validate_dev_environment() {
    echo "=== Development Environment Validation ==="
    
    # ဖွံ့ဖြိုးရေးအတွက် သင့်တော်သော ဆက်တင်များကို စစ်ဆေးပါ
    if grep -q "sku.*Free\|sku.*F1\|sku.*Basic" infra/*.bicep; then
        echo "✓ Development-appropriate SKUs detected"
    else
        echo "⚠ Consider using lower-cost SKUs for development"
    fi
    
    # အလိုအလျောက် ပိတ်သိမ်းမှု ဆက်တင်များကို စစ်ဆေးပါ
    if grep -q "autoShutdown\|deallocate" infra/*.bicep; then
        echo "✓ Auto-shutdown configuration found"
    else
        echo "ℹ Consider adding auto-shutdown for cost savings"
    fi
    
    # ဖွံ့ဖြိုးရေး ဒေတာဘေ့စ် ဆက်တင်များ၏ တိကျမှန်ကန်မှုကို စစ်ဆေးပါ
    if grep -q "Basic\|S0\|S1" infra/*.bicep; then
        echo "✓ Development database tiers configured"
    else
        echo "⚠ Consider using Basic/Standard tiers for development databases"
    fi
}
```

### ထုတ်လုပ်ရေး ပတ်ဝန်းကျင် စစ်ဆေးခြင်း

```bash
#!/bin/bash
# ထုတ်လုပ်ရေးပတ်ဝန်းကျင် အထူး စစ်ဆေးချက်များ

validate_prod_environment() {
    echo "=== Production Environment Validation ==="
    
    # မြင့်မားသော ရရှိနိုင်မှု (High Availability) ဖွဲ့စည်းမှုများကို စစ်ဆေးပါ
    if grep -q "zoneRedundant.*true\|Premium\|Standard_GRS" infra/*.bicep; then
        echo "✓ High availability configurations detected"
    else
        echo "⚠ Consider enabling high availability for production"
    fi
    
    # မိတ္တူ (backup) ဖွဲ့စည်းမှုများကို စစ်ဆေးပါ
    if grep -q "backup\|retention\|pointInTimeRestore" infra/*.bicep; then
        echo "✓ Backup configurations found"
    else
        echo "⚠ Ensure backup strategies are implemented"
    fi
    
    # စောင့်ကြည့်ရေး စနစ် တပ်ဆင်မှုကို အတည်ပြုပါ
    if grep -q "Microsoft.Insights\|Application_Type.*web" infra/*.bicep; then
        echo "✓ Monitoring and observability configured"
    else
        echo "⚠ Add comprehensive monitoring for production"
    fi
    
    # လုံခြုံရေး ဖွဲ့စည်းမှုများကို စစ်ဆေးပါ
    if grep -q "Microsoft.KeyVault\|managedIdentity\|httpsOnly.*true" infra/*.bicep; then
        echo "✓ Security best practices implemented"
    else
        echo "⚠ Review security configurations for production"
    fi
}
```

---

## ရင်းမြစ် စစ်ဆေးခြင်း

### Quota စစ်ဆေးရေး Script

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
    
    # subscription အတွင်းရှိ storage account များကို ရယူပါ
    accounts = run_command(['az', 'storage', 'account', 'list'])
    
    if accounts is None:
        print("❌ Could not retrieve storage account information")
        return False
    
    account_count = len(accounts)
    max_accounts = 250  # Azure ၏ ပုံမှန် အကန့်အသတ်
    
    usage_percent = (account_count / max_accounts) * 100
    status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
    
    print(f"{status} Storage Accounts: {account_count}/{max_accounts} ({usage_percent:.1f}%)")
    
    return usage_percent < 95

def check_network_limits(location: str) -> bool:
    """Check network-related limits"""
    print(f"\n=== Network Limits Check ({location}) ===")
    
    # Virtual network များကို စစ်ဆေးပါ
    vnets = run_command(['az', 'network', 'vnet', 'list'])
    if vnets is not None:
        vnet_count = len(vnets)
        print(f"✅ Virtual Networks: {vnet_count}/1000")
    
    # Public IP လိပ်စာများကို စစ်ဆေးပါ
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
    
    # စစ်ဆေးခြင်းများကို ဆောင်ရွက်ပါ
    all_passed &= check_compute_quotas(location)
    all_passed &= check_storage_limits(location)
    all_passed &= check_network_limits(location)
    
    # အကျဉ်းချုပ်
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

## လုံခြုံရေးနှင့် လိုက်နာမှု စစ်ဆေးမှုများ

### လုံခြုံရေး စစ်ဆေးရေး Script

```bash
#!/bin/bash
# AZD တပ်ဆင်မှုများအတွက် လုံခြုံရေးနှင့် လိုက်နာမှု စစ်ဆေးခြင်း

check_security_practices() {
    echo "=== Security Best Practices Check ==="
    
    local issues_found=0
    
    # Key Vault အသုံးပြုမှုကို စစ်ဆေးပါ
    if grep -r "Microsoft.KeyVault" infra/ >/dev/null 2>&1; then
        echo "✅ Key Vault detected in infrastructure"
    else
        echo "⚠️  Key Vault not found - consider using for secrets management"
        ((issues_found++))
    fi
    
    # Managed Identity အသုံးပြုမှုကို စစ်ဆေးပါ
    if grep -r "managedIdentity\|SystemAssigned\|UserAssigned" infra/ >/dev/null 2>&1; then
        echo "✅ Managed Identity configuration detected"
    else
        echo "⚠️  Managed Identity not found - consider using for service authentication"
        ((issues_found++))
    fi
    
    # HTTPS အကောင်အထည်ဖော်ထားမှုကို စစ်ဆေးပါ
    if grep -r "httpsOnly.*true\|requireHttps.*true" infra/ >/dev/null 2>&1; then
        echo "✅ HTTPS enforcement detected"
    else
        echo "⚠️  HTTPS enforcement not found - ensure secure connections"
        ((issues_found++))
    fi
    
    # အနည်းဆုံး TLS ဗားရှင်းကို စစ်ဆေးပါ
    if grep -r "minimumTlsVersion.*'TLS1_2'" infra/ >/dev/null 2>&1; then
        echo "✅ Minimum TLS 1.2 configuration detected"
    else
        echo "⚠️  Minimum TLS version not specified - consider requiring TLS 1.2+"
        ((issues_found++))
    fi
    
    # အများပြည်သူ ဝင်ရောက်မှု ကန့်သတ်ချက်များကို စစ်ဆေးပါ
    if grep -r "allowBlobPublicAccess.*false\|publicNetworkAccess.*Disabled" infra/ >/dev/null 2>&1; then
        echo "✅ Public access restrictions detected"
    else
        echo "⚠️  Public access restrictions not found - consider limiting public access"
        ((issues_found++))
    fi
    
    # Network Security Groups များကို စစ်ဆေးပါ
    if grep -r "Microsoft.Network/networkSecurityGroups" infra/ >/dev/null 2>&1; then
        echo "✅ Network Security Groups detected"
    else
        echo "ℹ️  Network Security Groups not found - may be acceptable depending on architecture"
    fi
    
    return $issues_found
}

check_compliance_requirements() {
    echo -e "\n=== Compliance Requirements Check ==="
    
    # ဒေတာအတွက် Encryption အသုံးပြုထားမှုကို စစ်ဆေးပါ
    if grep -r "encryption\|encryptionAtRest\|transparentDataEncryption" infra/ >/dev/null 2>&1; then
        echo "✅ Encryption configurations detected"
    else
        echo "⚠️  Encryption configurations not found - ensure data is encrypted"
    fi
    
    # Audit logging (စာရင်းစစ်မှတ်တမ်း) ကို စစ်ဆေးပါ
    if grep -r "Microsoft.Insights.*auditingSettings\|diagnosticSettings" infra/ >/dev/null 2>&1; then
        echo "✅ Audit logging configurations detected"
    else
        echo "⚠️  Audit logging not found - consider enabling for compliance"
    fi
    
    # Backup နှင့် သိမ်းဆည်းမူဝါဒများကို စစ်ဆေးပါ
    if grep -r "backup.*Policy\|retentionPolicy\|retention.*Days" infra/ >/dev/null 2>&1; then
        echo "✅ Backup and retention policies detected"
    else
        echo "⚠️  Backup/retention policies not found - required for data governance"
    fi
}

# အဓိက အလုပ်ဆောင်မှု
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

## CI/CD နှင့် ပေါင်းစည်းခြင်း

### GitHub Actions ပေါင်းစည်းမှု

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

### Azure DevOps ပေါင်းစည်းမှု

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

## အကောင်းဆုံး လုပ်နည်းများ အနှစ်ချုပ်

### ✅ ကြိုစစ် စစ်ဆေးမှုအတွက် အကောင်းဆုံး လုပ်နည်းများ

1. **ဖြစ်နိုင်သမျှ အလိုအလျော့ အလိုအလျောက် ပြုလုပ်ခြင်း**
   - CI/CD pipelines ထဲသို့ စစ်ဆေးမှုများ ထည့်သွင်းပါ
   - ပြန်လည်ထပ်တူလိုက်ရသော စစ်ဆေးမှုများအတွက် script များ အသုံးပြုပါ
   - စစ်ဆေးရလဒ်များကို audit trail များအတွက် သိမ်းဆည်းထားပါ

2. **ပတ်ဝန်းကျင် အလိုက် သီးခြား စစ်ဆေးမှု**
   - dev/staging/prod အတွက် စစ်ဆေးမှုများကို သီးခြားထားပါ
   - ပတ်ဝန်းကျင် တစ်ခုချင်းစီအတွက် သင့်တော်သည့် လုံခြုံရေး လိုအပ်ချက်များ သတ်မှတ်ပါ
   - ထုတ်လုပ်ရေးမဟုတ်သော ပတ်ဝန်းကျင်များအတွက် ကုန်ကျစရိတ် အ optimization ပြုလုပ်ပါ

3. **ကျယ်ပြန့်စုံလင်သော ဖုံးလွှမ်းမှု**
   - အတည်ပြုမှုနှင့် ခွင့်ပြုချက်များကို စစ်ဆေးပါ
   - ရင်းမြစ် quota များနှင့် ရရှိနိုင်မှုကို စစ်ဆေးပါ
   - template စစ်ဆေးမှုနှင့် စပ်စာတမ်း စာတမ်း syntax ကို လေ့လာပါ
   - လုံခြုံရေးနှင့် လိုက်နာရေး လိုအပ်ချက်များကို အကောင်အထည်ဖော်ပါ

4. **ရှင်းလင်းသော အစီရင်ခံချက်**
   - အခြေအနေများကို အရောင်ကုဒ်ဖြင့် ပြသပါ
   - ပြင်ဆင်နည်းလမ်းများပါရှိသည့် အသေးစိတ် အမှားစာတိုများ ဖော်ပြပါ
   - လျင်မြန်စွာ အကဲဖြတ်ရန် အနှစ်ချုပ်အစီရင်ခံစာများ ထုတ်ပေးပါ

5. **မအောင်မြင်မှုကို လျင်မြန်စွာ ရပ်တန့်ရန် (Fail Fast)**
   - အရေးကြီးသော စစ်ဆေးမှုများ မအောင်မြင်ပါက တင်သွင်းမှုကို ရပ်တန့်ပါ
   - ဖြေရှင်းရန် သတ်မှတ်ချက်များ ပေးပါ
   - စစ်ဆေးမှုများကို ထပ်မံ လည်ပတ်ရန် လွယ်ကူစေရန် အဆင်ပြေစေရန်

### ကြိုစစ်ဆေးရာတွင် ဖြစ်တတ်သော အမှားများ

1. "လျင်မြန်စွာ" တင်သွင်းရန်အတွက် စစ်ဆေးမှုကို ကျော်လွန်ခြင်း
2. တင်သွင်းမတိုင်မီ ခွင့်ပြုချက်များ မလုံလောက်စွာ စစ်ဆေးခြင်း
3. တင်သွင်းမှု မအောင်မြင်သည့်အထိ quota ကန့်သတ်ချက်များကို မစစ်ဆေးခြင်း
4. CI/CD pipeline များတွင် template များကို စစ်ဆေးချင်ရန် မရှိခြင်း
5. ထုတ်လုပ်ရေး ပတ်ဝန်းကျင်များအတွက် လုံခြုံရေး စစ်ဆေးမှု မရှိခြင်း
6. မျှော်လင့်ထားသည့် ဘတ်ဂျက်နှင့် မကိုက်ညီသော ကုန်ကျစရိတ် ကန့်သတ်မှု မရှိခြင်း

---

**အကြံပြုချက် (Pro Tip)**: တကယ့် တင်သွင်းခြင်း အလုပ်ကို စတင်မလုပ်ခင် CI/CD pipeline တွင် ကြိုစစ်စစ်ဆေးမှုကို ခွဲထားသော အလုပ်ရုံး (separate job) အဖြစ် လည်ပတ်စေပါ။ ဤနည်းလမ်းဖြင့် ပြဿနာများကို အစောပိုင်း တွေ့ရှိနိုင်ပြီး ဖွံ့ဖြိုးရေးသူများကို အမြန်ပြန်လည်တုံ့ပြန်မှု ပေးနိုင်သည်။

---

**လမ်းညွှန်**
- **ယခင် သင်ခန်းစာ**: [SKU Selection](sku-selection.md)
- **နောက်တစ်ခု သင်ခန်းစာ**: [Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
တာဝန်မယူကြောင်း အကြောင်းကြားချက်:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှုဖြစ်သည့် Co-op Translator (https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်စေရန် ကြိုးပမ်းနေသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ အာဏာရှိသော အရင်းအမြစ်အဖြစ် ယူဆသင့်သည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူသားပရော်ဖက်ရှင်နယ်များမှ ပြုလုပ်သည့် ဘာသာပြန်ခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသည့် နားမလည်ခြင်းများ သို့မဟုတ် မှားယွင်းဖော်ပြချက်များအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
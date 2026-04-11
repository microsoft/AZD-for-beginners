# AZD ဖြင့် တပ်ဆင်မှုများအတွက် ကြိုတင်စစ်ဆေးချက်များ

**အခန်းလမ်းညွှန်:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD အခြေခံများ](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း 6 - တပ်ဆင်ခေတ်မတိုင်မီ အတည်ပြုခြင်းနှင့် စီမံချက်
- **⬅️ ယခင်**: [SKU ရွေးချယ်မှု](sku-selection.md)
- **➡️ နောက်တစ်ခန်း**: [အခန်း 7: ပြဿနာဖြေရှင်းခြင်း](../chapter-07-troubleshooting/common-issues.md)
- **🔧 ဆက်စပ်**: [အခန်း 4: တပ်ဆင်ခြင်း လမ်းညွှန်](../chapter-04-infrastructure/deployment-guide.md)

## မိတ်ဆက်

ဤလမ်းညွှန်တမ်းအုပ်စုသည် Azure Developer CLI ဖြင့် တပ်ဆင်မှုများ စတင်မလုပ်ခင် အောင်မြင်စွာ တပ်ဆင်နိုင်ရေး အတွက် ကြိုတင်စစ်ဆေးမှု စာရင်းပေးသူ script များနှင့် လုပ်ထုံးလုပ်နည်းများကို ပေးအပ်သည်။ authentication, resource ရရှိနိုင်မှု, quota များ, လုံခြုံရေး စည်းကမ်းလိုက်နာမှုများနှင့် တာဝန်ဆောင်နိုင်မှုလိုအပ်ချက်များအတွက် အလိုအလျောက်စစ်ဆေးမှုများကို အသုံးပြုခြင်းဖြင့် တပ်ဆင်မှု မအောင်မြင်ခြင်းများကို ကာကွယ်ပြီး တပ်ဆင်မှု အောင်မြင်မှုနှုန်းကို တိုးမြှင့်နိုင်သည်။

## သင်ယူရန် ရည်မှန်းချက်များ

ဤလမ်းညွှန်ကို ပြီးစီးပါက သင်သည်:
- ကြိုတင်တပ်ဆင်စစ်ဆေးမှု နည်းနည်းပညာများနှင့် script များကို ကျွမ်းကျင်စွာအသုံးပြုနိုင်ရန်
- authentication, ခွင့်ပြုချက်များနှင့် quota များအတွက် စုံလင်စွာ စစ်ဆေးမှု မဟာဗျူဟာများကို နားလည်ရန်
- resource ရရှိနိုင်မှုနှင့် စွမ်းဆောင်ရည် စစ်ဆေးပုံစံများကို ဆောင်ရွက်ရန်
- အဖွဲ့အစည်းအပိုင်းဆိုင်ရာ စည်းကမ်းများအတွက် လုံခြုံရေးနှင့် လိုက်နာမှု စစ်ဆေးမှုများ ကို ဖွင့်ဆောင်ရန်
- ကုန်ကျစရိတ် ခန့်မှန်းခြေ နှင့် ဘတ်ဂျက် စစ်ဆေးမှု လုပ်ငန်းစဉ်များကို ဒီဇိုင်းဆွဲရန်
- CI/CD pipeline များအတွက် အထူးပြု ချည်းမစစ်ဆေးမှုများကို ဖန်တီးနိုင်ရန်

## သင်ယူပြီးရလဒ်များ

ပြီးစီးချိန်တွင် သင်သည်:
- စုံလင်သော ကြိုတင်စစ်ဆေးမှု script များကို ဖန်တီးခြင်းနှင့် အကောင်အထည်ဖော်ခြင်း
- အမျိုးမျိုးသော တပ်ဆင်မှု အခြေအနေများအတွက် အလိုအလျောက် စစ်ဆေးမှု workflow များကို ဒီဇိုင်းဆွဲခြင်း
- ပတ်ဝန်းကျင် အလိုက် သက်ဆိုင်သည့် စစ်ဆေးမှုများနှင့် မူဝါဒများကို အကောင်အထည်ဖော်ခြင်း
- တပ်ဆင်မှု အသင့်ဖြစ်မှုအတွက် ကြိုတင်စောင့်ကြည့်ခြင်းနှင့် အသိပေးမှုများကို ဖွင့်ဆောင်ထားခြင်း
- တပ်ဆင်မှုမပြုမီ ဖြစ်ပေါ်နိုင်သောပြဿနာများကို အနီးကပ် ရှာဖွေပြီး ဆောင်ရွက်ချက်ချခြင်း
- DevOps pipeline များနှင့် အလိုအလျောက်လုပ်ငန်းစဉ်များထဲသို့ ကြိုတင်စစ်ဆေးမှုများကို ပေါင်းစည်းထည့်သွင်းခြင်း

## အတွင်းပါ အကြောင်းအရာ စာမျက်နှာများ

- [Overview](#overview)
- [Automated Pre-flight Script](#automated-pre-flight-script)
- [Manual Validation Checklist](#codeblock1)
- [Environment Validation](#✅-backup-recovery)
- [Resource Validation](#production-environment-validation)
- [Security & Compliance Checks](#security--compliance-checks)
- [Performance & Capacity Planning](#performance--capacity-planning)
- [Troubleshooting Common Issues](#troubleshooting-common-issues)

---

## Overview

ကြိုတင်စစ်ဆေးချက်များသည် တပ်ဆင်မှုမစတင်သည်မီ လုပ်ဆောင်သင့်သော အရေးပါသော စစ်ဆေးမှုများဖြစ်ပြီး အောက်ပါအချက်များကို အာမခံရန် ရည်ရွယ်သည်။

- **Target region များတွင်** resource ရရှိနိုင်မှုနှင့် quota များ
- **Authentication နှင့် ခွင့်ပြုချက်များ** မှန်ကန်စွာ ပြန်လည်သတ်မှတ်ထားသည်။
- **Template မှန်ကန်မှု** နှင့် parameter များ၏ ဖုန်ချပ်မှု
- **ကွန်ယက်ချိတ်ဆက်မှု** နှင့် မူတည်ချက်များ
- **အဖွဲ့အစည်း၏ လုံခြုံရေး စည်းမျဥ်းများနှင့် လိုက်နာမှု**
- **ဘတ်ဂျက်အတွင်း** ကုန်ကျစရိတ် ခန့်မှန်းချက်

### ဘယ်အချိန်တွင် ကြိုတင်စစ်ဆေးမှုများကို ပြုလုပ်မည်နည်း

- **အဓိက အရင်းအမြစ်အသစ်တစ်ခုထဲ သို့ ပထမဆုံးတပ်ဆင်မည်မဆို မတိုင်မီ**
- **Template အပြောင်းအလဲ အဓိကဖြစ်ခဲ့ပါက**
- **ထုတ်လုပ်မှု တပ်ဆင်မှုများမပြုမီ**
- **Azure region များကို အစားထိုးပြောင်းလဲချိန်**
- **CI/CD pipeline များ၏ အစိတ်အပိုင်းအဖြစ်**

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

# အထွက်များကို အရောင်ဖြင့် ကွဲပြားပြသခြင်း
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
    
    # AZD ထည့်သွင်းမှု စစ်ဆေးခြင်း
    try {
        $azdVersion = azd version --output json | ConvertFrom-Json
        Write-Status "AZD CLI installed" "Success" "Version: $($azdVersion.azd.version)"
    }
    catch {
        Write-Status "AZD CLI not found" "Error" "Install from https://aka.ms/azd-install"
        return $false
    }
    
    # Azure CLI ထည့်သွင်းမှု စစ်ဆေးခြင်း
    try {
        $azVersion = az version --output json | ConvertFrom-Json
        Write-Status "Azure CLI installed" "Success" "Version: $($azVersion.'azure-cli')"
    }
    catch {
        Write-Status "Azure CLI not found" "Error" "Install from https://aka.ms/azcli"
        return $false
    }
    
    # PowerShell ဗားရှင်း စစ်ဆေးခြင်း
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
        # AZD အတည်ပြုမှု စစ်ဆေးခြင်း
        $azdAuth = azd auth login --check-status --output json 2>$null | ConvertFrom-Json
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
        }
        else {
            Write-Status "AZD authentication" "Error" "Run 'azd auth login'"
            return $false
        }
        
        # Azure CLI အတည်ပြုမှု စစ်ဆေးခြင်း
        $azAccount = az account show --output json | ConvertFrom-Json
        Write-Status "Azure CLI authentication" "Success" "Subscription: $($azAccount.name)"
        
        # Subscription ဝင်ရောက်ခွင့် စစ်ဆေးခြင်း
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
        # လက်ရှိ အသုံးပြုသူ၏ အခန်းကဏ္ဍ သတ်မှတ်ချက်များ ရယူခြင်း
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
        
        # resource group ဖန်တီးမှု စမ်းသပ်ခြင်း (ဖော်ပြထားပါက)
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # resource group ဖန်တီးနိုင်မှု စမ်းသပ်ခြင်း
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
        # Compute ကွိုတာများ စစ်ဆေးခြင်း
        $computeUsage = az vm list-usage --location $Location --output json | ConvertFrom-Json
        
        # တိကျသော ကွိုတာများ စစ်ဆေးခြင်း
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
        
        # App Service အကန့်အသတ်များ စစ်ဆေးခြင်း
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
        
        # Storage account အကန့်အသတ်များ စစ်ဆေးခြင်း
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
    
    # Azure endpoints စမ်းသပ်ခြင်း
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
    
    # DNS ဖြေရှင်းမှု စမ်းသပ်ခြင်း
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
    
    # azure.yaml ရှိမရှိ စစ်ဆေးခြင်း
    if (Test-Path "azure.yaml") {
        Write-Status "azure.yaml found" "Success"
        
        # azure.yaml ကို ခွဲခြမ်းစိတ်ဖြာခြင်း
        try {
            $azureYaml = Get-Content "azure.yaml" -Raw | ConvertFrom-Yaml
            Write-Status "azure.yaml parsing" "Success"
            
            # ဝန်ဆောင်မှုများ အတည်ပြုခြင်း
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
    
    # အောက်ခံအဆောက်အအုံ ဖိုင်များ ရှိမရှိ စစ်ဆေးခြင်း
    if (Test-Path "infra") {
        $bicepFiles = Get-ChildItem -Path "infra" -Filter "*.bicep" -Recurse
        if ($bicepFiles.Count -gt 0) {
            Write-Status "Infrastructure templates" "Success" "$($bicepFiles.Count) Bicep files found"
            
            # main.bicep ရှိလျှင် အတည်ပြုခြင်း
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
    
    # 🧪 အသစ်: အောက်ခံအဆောက်အအုံ ကြိုကြည့် (လုံခြုံသော dry-run) စမ်းသပ်ခြင်း
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
        # တည်နေရာ တရားဝင်ဖြစ်/မဖြစ် စစ်ဆေးခြင်း
        $locations = az account list-locations --output json | ConvertFrom-Json
        $validLocation = $locations | Where-Object { $_.name -eq $Location -or $_.displayName -eq $Location }
        
        if ($validLocation) {
            Write-Status "Azure region" "Success" "Location '$Location' is valid"
        }
        else {
            Write-Status "Azure region" "Error" "Location '$Location' is not valid"
            return $false
        }
        
        # ဒေသအတွင်း ဝန်ဆောင်မှု ရရှိနိုင်မှု စစ်ဆေးခြင်း
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
    
    # မူလ ကုန်ကျစရိတ် ခန့်မှန်းချက် (တိကျရန် Azure Pricing API လိုအပ်ပါသည်)
    Write-Status "Cost estimation" "Info" "Use Azure Pricing Calculator for detailed estimates"
    Write-Status "Monitoring setup" "Info" "Set up Azure Cost Management alerts"
    
    # ဘတ်ဂျက် ရှိမရှိ စစ်ဆေးခြင်း
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
    
    # ပုံမှန် လုံခြုံရေး လေ့ကျင့်မှုများ ရှိမရှိ စစ်ဆေးခြင်း
    try {
        # Key Vault ဖွဲ့စည်းထားမှု စစ်ဆေးခြင်း
        if (Select-String -Path "infra/*.bicep" -Pattern "Microsoft.KeyVault" -Quiet) {
            Write-Status "Key Vault usage" "Success" "Key Vault detected in templates"
        }
        else {
            Write-Status "Key Vault usage" "Warning" "Consider using Key Vault for secrets"
        }
        
        # Managed identity အသုံးပြုမှု စစ်ဆေးခြင်း
        if (Select-String -Path "infra/*.bicep" -Pattern "managedIdentity|SystemAssigned" -Quiet) {
            Write-Status "Managed Identity" "Success" "Managed Identity detected"
        }
        else {
            Write-Status "Managed Identity" "Warning" "Consider using Managed Identity"
        }
        
        # HTTPS အတင်းအကျပ် သတ်မှတ်ထားမှု စစ်ဆေးခြင်း
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
    
    # စစ်ဆေးချက်များအားလုံး လုပ်ဆောင်ခြင်း
    $results["Prerequisites"] = Test-Prerequisites
    $results["Authentication"] = Test-Authentication
    $results["Permissions"] = Test-Permissions
    $results["QuotasAndLimits"] = Test-QuotasAndLimits
    $results["NetworkConnectivity"] = Test-NetworkConnectivity
    $results["TemplateValidation"] = Test-TemplateValidation
    $results["RegionalAvailability"] = Test-RegionalAvailability
    $results["CostEstimation"] = Test-CostEstimation
    $results["SecurityCompliance"] = Test-SecurityCompliance
    
    # အကျဉ်းချုံး
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

# မတင်မီ စစ်ဆေးမှု လုပ်ဆောင်ခြင်း
Invoke-PreflightCheck
```

### Bash Pre-flight Checker

```bash
#!/bin/bash
# Unix/Linux စနစ်များအတွက် ကြိုစစ်ဆေးရေးများအတွက် Bash ဗားရှင်း

set -euo pipefail

# အရောင်ကုဒ်များ
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # အရောင်မရှိ

# ကမ္ဘာလုံးဆိုင်ရာ သတ်မှတ်ထားသော တန်ဖိုးများ
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
    
    # AZD ထည့်သွင်းမှုကို စစ်ဆေးပါ
    if command -v azd >/dev/null 2>&1; then
        local azd_version=$(azd version --output json | jq -r '.azd.version')
        print_status "AZD CLI installed" "success" "Version: $azd_version"
    else
        print_status "AZD CLI not found" "error" "Install from https://aka.ms/azd-install"
        return 1
    fi
    
    # Azure CLI ထည့်သွင်းမှုကို စစ်ဆေးပါ
    if command -v az >/dev/null 2>&1; then
        local az_version=$(az version --output json | jq -r '."azure-cli"')
        print_status "Azure CLI installed" "success" "Version: $az_version"
    else
        print_status "Azure CLI not found" "error" "Install from https://aka.ms/azcli"
        return 1
    fi
    
    # jq ထည့်သွင်းမှုကို စစ်ဆေးပါ
    if command -v jq >/dev/null 2>&1; then
        print_status "jq installed" "success"
    else
        print_status "jq not found" "warning" "Install jq for better JSON parsing"
    fi
    
    return 0
}

check_authentication() {
    echo -e "\n${BLUE}=== Authentication Check ===${NC}"
    
    # AZD အတည်ပြုခွင့်ကို စစ်ဆေးပါ
    if azd auth login --check-status >/dev/null 2>&1; then
        local principal_name=$(azd auth login --check-status --output json 2>/dev/null | jq -r '.principalName // "Unknown"')
        print_status "AZD authentication" "success" "User: $principal_name"
    else
        print_status "AZD authentication" "error" "Run 'azd auth login'"
        return 1
    fi
    
    # Azure CLI အတည်ပြုခွင့်ကို စစ်ဆေးပါ
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
    
    # azure.yaml ကို စစ်ဆေးပါ
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
    
    # အဆောက်အအုံဆိုင်ရာ ဖိုင်များကို စစ်ဆေးပါ
    if [[ -d "infra" ]]; then
        local bicep_count=$(find infra -name "*.bicep" | wc -l)
        if [[ $bicep_count -gt 0 ]]; then
            print_status "Infrastructure templates" "success" "$bicep_count Bicep files found"
            
            # main.bicep ရှိပါက အတည်ပြုပါ
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
    
    # တည်နေရာ တရားဝင် ဖြစ်/မဖြစ် စစ်ဆေးပါ
    if az account list-locations --query "[?name=='$LOCATION' || displayName=='$LOCATION']" --output tsv | grep -q .; then
        print_status "Azure region" "success" "Location '$LOCATION' is valid"
    else
        print_status "Azure region" "error" "Location '$LOCATION' is not valid"
        return 1
    fi
    
    # ဝန်ဆောင်မှု ရရှိနိုင်မှုကို စစ်ဆေးပါ
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
    # ကွန်မန်းဒ်လိုင်း အချက်အလက်များကို ခွဲထုတ်ပါ
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
    
    # လိုအပ်သော ပါရာမီတာများကို အတည်ပြုပါ
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
    
    # စစ်ဆေးမှုများကို လုပ်ဆောင်ပါ
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

# main ဖန်ရှင်ကို ဆောင်ရွက်ပါ
main "$@"
```

---

## Manual Validation Checklist

### Pre-Deployment Checklist

ဤစစ်ဆေးစာရင်းကို ထုတ်ပေးကာ တပ်ဆင်မပြုမီ အချက်တစ်ခုချင်းစီကို အတည်ပြုပါ။

#### ✅ Environment Setup
- [ ] AZD CLI ထည့်သွင်းထားပြီး အနောက်ဆုံးဗားရှင်းသို့ အပ်ဒိတ်လုပ်ထားသည်
- [ ] Azure CLI ထည့်သွင်းပြီး အတည်ပြု (authenticated) လုပ်ထားသည်
- [ ] မှန်ကန်သော Azure subscription ကို ရွေးထားသည်
- [ ] ပတ်ဝန်းကျင်အမည်သည် ထူးခြားပြီး အမည်ပုံစံကို လိုက်နာထားသည်
- [ ] လစ်လပ်နေသော target resource group သို့မဟုတ် ဖန်တီးနိုင်သော resource group ကို သတ်မှတ်ထားသည်

#### ✅ Authentication & Permissions
- [ ] `azd auth login` ဖြင့် အောင်မြင်စွာ အထောက်အထားယူထားသည်
- [ ] အသုံးပြုသူတွင် target subscription/resource group ပေါ်တွင် Contributor အခွင့်အရေး ရှိသည်
- [ ] CI/CD အတွက် service principal ပြင်ဆင်ထားသည် (အသင့်တော်လျှင်)
- [ ] သက်တမ်းကုန်ပြီးသော ဆလက်တီဖိတ်များ သို့မဟုတ် အတည်ပြုချက်များ မရှိပါ

#### ✅ Template Validation
- [ ] `azure.yaml` ရှိပြီး မှန်ကန်သည့် YAML ဖြစ်သည်
- [ ] azure.yaml တွင် သတ်မှတ်ထားသည့် ဝန်ဆောင်မှုများအားလုံးတွင် ကိုက်ညီသော source code ရှိသည်
- [ ] `infra/` ဖိုလ်ဒါရှိ Bicep template များရှိသည်
- [ ] `main.bicep` သည် အမှားမရှိဘဲ ကုဒ်သုံးဆောင်မှု ဖြင့် ကွန်ပိုင်းဖြစ်သည် (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 Infrastructure preview သည် အောင်မြင်စွာ လည်ပတ်ပါသည် (`azd provision --preview`)
- [ ] လိုအပ်သော parameter များအားလုံးတွင် default အတန်ဖိုးများ ရှိနေပါသည် သို့မဟုတ် ပေးအပ်မည်ဖြစ်သည်
- [ ] Template များတွင် အငွေ့မပေါက်ထားသော secret များ မရှိပါ

#### ✅ Resource Planning
- [ ] Target Azure region ကို ရွေးချယ်ပြီး အတည်ပြုထားသည်
- [ ] လိုအပ်သည့် Azure service များသည် target region တွင် ရရှိနိုင်သည်
- [ ] စီစဉ်ထားသည့် resource များအတွက် လုံလောက်သော quota ရှိသည်
- [ ] resource အမည်တူ ညစ်ညမ်းမှုများကို စစ်ဆေးထားသည်
- [ ] resource များအကြား မူတည်မှုများကို နားလည်ထားသည်

#### ✅ Network & Security
- [ ] Azure endpoint များသို့ ကွန်ယက်ချိတ်ဆက်မှုကို အတည်ပြုထားသည်
- [ ] လိုအပ်ပါက firewall/proxy ပြင်ဆင်ထားသည်
- [ ] လျှို့ဝှက်ချက်များ စီမံရန် Key Vault ကို ပြင်ဆင်ထားသည်
- [ ] မဖြစ်မနေ managed identities ကို အသုံးပြုထားပါ
- [ ] ဝဘ်အက်ပလီကေးရှင်းများအတွက် HTTPS အတင်းပွား ဖျေါ်ဆောင်ထားသည်

#### ✅ Cost Management
- [ ] Azure Pricing Calculator အသုံးပြု၍ ကုန်ကျစရိတ် ခန့်မှန်းချက် ထုတ်ပြန်ထားသည်
- [ ] လိုအပ်လျှင် ဘတ်ဂျက် အသိပေးချက်များ ကို ဖွင့်ထားသည်
- [ ] ပတ်ဝန်းကျင်အမျိုးအစားအလိုက် သင့်တော်သော SKU များကို ရွေးချယ်ထားသည်
- [ ] ထုတ်လုပ်မှု အလုပ်တင်များအတွက် အတည်ပြုထားသော capacity ကို စဉ်းစားထားသည်

#### ✅ Monitoring & Observability
- [ ] Application Insights ကို template များတွင် ပြင်ဆင်ထားသည်
- [ ] Log Analytics workspace ကို စီစဉ်ထားသည်
- [ ] အရေးကြီး metric များအတွက် alert rule များကို သတ်မှတ်ထားသည်
- [ ] အက်ပလီကေးရှင်းများတွင် health check endpoint များကို ထည့်သွင်းထားသည်

#### ✅ Backup & Recovery
- [ ] ဒေတာ resource များအတွက် backup မဟာဗျူဟာ သတ်မှတ်ထားသည်
- [ ] Recovery time objective (RTO) များကို စာရင်းပြုစုထားသည်
- [ ] Recovery point objective (RPO) များကို စာရင်းပြုစုထားသည်
- [ ] ထုတ်လုပ်မှုအတွက် disaster recovery အစီအစဉ် ရှိသည်

---

## Environment Validation

### Development Environment Validation

```bash
#!/bin/bash
# ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင် အထူး စစ်ဆေးချက်များ

validate_dev_environment() {
    echo "=== Development Environment Validation ==="
    
    # ဖွံ့ဖြိုးရေးနှင့် ကိုက်ညီသည့် ဆက်တင်များကို စစ်ဆေးပါ
    if grep -q "sku.*Free\|sku.*F1\|sku.*Basic" infra/*.bicep; then
        echo "✓ Development-appropriate SKUs detected"
    else
        echo "⚠ Consider using lower-cost SKUs for development"
    fi
    
    # အလိုအလျောက် ပိတ်သိမ်းခြင်း ဆက်တင်များကို စစ်ဆေးပါ
    if grep -q "autoShutdown\|deallocate" infra/*.bicep; then
        echo "✓ Auto-shutdown configuration found"
    else
        echo "ℹ Consider adding auto-shutdown for cost savings"
    fi
    
    # ဖွံ့ဖြိုးရေး ဒေတာဘေ့စ် ဆက်တင်များကို အတည်ပြုပါ
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
# ထုတ်လုပ်ရေး ပတ်ဝန်းကျင်အတွက် အတည်ပြု စစ်ဆေးမှုများ

validate_prod_environment() {
    echo "=== Production Environment Validation ==="
    
    # မြင့်မားသော ရရှိနိုင်မှု (High Availability) ဖွဲ့စည်းပုံများကို စစ်ဆေးပါ
    if grep -q "zoneRedundant.*true\|Premium\|Standard_GRS" infra/*.bicep; then
        echo "✓ High availability configurations detected"
    else
        echo "⚠ Consider enabling high availability for production"
    fi
    
    # Backup ဖွဲ့စည်းပုံများကို စစ်ဆေးပါ
    if grep -q "backup\|retention\|pointInTimeRestore" infra/*.bicep; then
        echo "✓ Backup configurations found"
    else
        echo "⚠ Ensure backup strategies are implemented"
    fi
    
    # စောင့်ကြည့်ရေး ဖွဲ့စည်းပုံကို အတည်ပြုပါ
    if grep -q "Microsoft.Insights\|Application_Type.*web" infra/*.bicep; then
        echo "✓ Monitoring and observability configured"
    else
        echo "⚠ Add comprehensive monitoring for production"
    fi
    
    # လုံခြုံရေး ဖွဲ့စည်းပုံများကို စစ်ဆေးပါ
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
    
    # subscription အတွင်းရှိ storage အကောင့်များကို ရယူပါ
    accounts = run_command(['az', 'storage', 'account', 'list'])
    
    if accounts is None:
        print("❌ Could not retrieve storage account information")
        return False
    
    account_count = len(accounts)
    max_accounts = 250  # Azure ရဲ့ ပုံမှန် အကန့်အသတ်
    
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
    
    # စစ်ဆေးမှုများကို လုပ်ဆောင်ပါ
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

## Security & Compliance Checks

### Security Validation Script

```bash
#!/bin/bash
# AZD ဖြန့်ချိမှုများအတွက် လုံခြုံရေးနှင့် ကိုက်ညီမှု အတည်ပြုခြင်း

check_security_practices() {
    echo "=== Security Best Practices Check ==="
    
    local issues_found=0
    
    # Key Vault အသုံးပြုမှု စစ်ဆေးခြင်း
    if grep -r "Microsoft.KeyVault" infra/ >/dev/null 2>&1; then
        echo "✅ Key Vault detected in infrastructure"
    else
        echo "⚠️  Key Vault not found - consider using for secrets management"
        ((issues_found++))
    fi
    
    # Managed Identity အသုံးပြုမှု စစ်ဆေးခြင်း
    if grep -r "managedIdentity\|SystemAssigned\|UserAssigned" infra/ >/dev/null 2>&1; then
        echo "✅ Managed Identity configuration detected"
    else
        echo "⚠️  Managed Identity not found - consider using for service authentication"
        ((issues_found++))
    fi
    
    # HTTPS အတင်းအကျပ် အကောင်အထည်ဖော်မှု စစ်ဆေးခြင်း
    if grep -r "httpsOnly.*true\|requireHttps.*true" infra/ >/dev/null 2>&1; then
        echo "✅ HTTPS enforcement detected"
    else
        echo "⚠️  HTTPS enforcement not found - ensure secure connections"
        ((issues_found++))
    fi
    
    # အနည်းဆုံး TLS ဗားရှင်း စစ်ဆေးခြင်း
    if grep -r "minimumTlsVersion.*'TLS1_2'" infra/ >/dev/null 2>&1; then
        echo "✅ Minimum TLS 1.2 configuration detected"
    else
        echo "⚠️  Minimum TLS version not specified - consider requiring TLS 1.2+"
        ((issues_found++))
    fi
    
    # ပြည်သူ့ဆိုင်ရာ အသုံးပြုမှု ကန့်သတ်ချက်များ စစ်ဆေးခြင်း
    if grep -r "allowBlobPublicAccess.*false\|publicNetworkAccess.*Disabled" infra/ >/dev/null 2>&1; then
        echo "✅ Public access restrictions detected"
    else
        echo "⚠️  Public access restrictions not found - consider limiting public access"
        ((issues_found++))
    fi
    
    # Network Security Group များ စစ်ဆေးခြင်း
    if grep -r "Microsoft.Network/networkSecurityGroups" infra/ >/dev/null 2>&1; then
        echo "✅ Network Security Groups detected"
    else
        echo "ℹ️  Network Security Groups not found - may be acceptable depending on architecture"
    fi
    
    return $issues_found
}

check_compliance_requirements() {
    echo -e "\n=== Compliance Requirements Check ==="
    
    # ဒေတာ ကွယ်ဝှက်ခြင်း (Encryption) ရှိ/မရှိ စစ်ဆေးခြင်း
    if grep -r "encryption\|encryptionAtRest\|transparentDataEncryption" infra/ >/dev/null 2>&1; then
        echo "✅ Encryption configurations detected"
    else
        echo "⚠️  Encryption configurations not found - ensure data is encrypted"
    fi
    
    # အော်ဒီတ် မှတ်တမ်းတင်မှု စစ်ဆေးခြင်း
    if grep -r "Microsoft.Insights.*auditingSettings\|diagnosticSettings" infra/ >/dev/null 2>&1; then
        echo "✅ Audit logging configurations detected"
    else
        echo "⚠️  Audit logging not found - consider enabling for compliance"
    fi
    
    # Backup နှင့် သိမ်းဆည်းမှု မူဝါဒများ စစ်ဆေးခြင်း
    if grep -r "backup.*Policy\|retentionPolicy\|retention.*Days" infra/ >/dev/null 2>&1; then
        echo "✅ Backup and retention policies detected"
    else
        echo "⚠️  Backup/retention policies not found - required for data governance"
    fi
}

# အဓိက အကောင်အထည်ဖော်ခြင်း
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

## Best Practices Summary

### ✅ Pre-flight Check Best Practices

1. **အလိုအလျောက်လုပ်ဆောင်ခြင်း (Automate Where Possible)**
   - စစ်ဆေးမှုများကို CI/CD pipeline များထဲသို့ ပေါင်းစည်းပါ
   - အချက်အလက်များအတွက် ဆိုင်ရာ script များကို အသုံးပြုပါ
   - စစ်ဆေးရလဒ်များကို audit trail အတွက် သိမ်းဆည်းပါ

2. **ပတ်ဝန်းကျင် အပေါ် မူတည်၍ စစ်ဆေးမှုများ သတ်မှတ်ခြင်း**
   - dev/staging/prod အတွက် ကွဲပြားသော စစ်ဆေးချက်များ
   - ပတ်ဝန်းကျင်တိုင်းအတွက် သင့်တော်သော လုံခြုံရေး လိုအပ်ချက်များ
   - မထုတ်လုပ်ပတ်ဝန်းကျင်များအတွက် ကုန်ကျစရိတ် သက်သာစေမှု

3. **စုံလင်သော အကာအကွယ်**
   - Authentication နှင့် ခွင့်ပြုချက်များ
   - Resource quota များနှင့် ရရှိနိုင်မှု
   - Template အတည်ပြုခြင်းနှင့် စာလုံးသဏ္ဌာန်
   - လုံခြုံရေးနှင့် လိုက်နာမှု လိုအပ်ချက်များ

4. **ရှင်းလင်းသော အစီရင်ခံချက်**
   - အရောင်အလိုက် အခြေအနေ ပြဆင်ချက်များ
   - ပြတ်ပြတ်သားသား အမှားအကြောင်းကြားချက်များနှင့် ပြင်ဆင်ခြင်း အဆင့်များ
   - အမြန် သုံးသပ်နိုင်ရန် အကျဉ်းချုပ်အစီရင်ခံစာများ

5. **Fail Fast**
   - အရေးကြီးစစ်ဆေးချက်များ မဖြတ်နိုင်ပါက တပ်ဆင်မှု ရပ်တန့်ပါ
   - ဖြေရှင်းမှုအတွက် ရှင်းလင်းသော လမ်းညွှန်ချက်များ ပေးပါ
   - စစ်ဆေးမှုများကို ထပ်မံ ရေးဆွဲပြီး လွယ်ကူစွာ ထပ်မံ ပြေးနိုင်စေရန် အဆင်ပြေစေပါ

### Common Pre-flight Pitfalls

1. "လျင်မြန်စွာ" တပ်ဆင်ရန် အတွက် စစ်ဆေးမှုကို ကျော်လွှားခြင်း
2. တပ်ဆင်မှုမပြုမီ ခွင့်ပြုချက်များ လုံလောက်မီ ရှာဖွေခြင်း မပြုခြင်း
3. တပ်ဆင်မှု မအောင်မြင်သည်အထိ quota ကန့်သတ်ချက်များကို မသတိပြုခြင်း
4. CI/CD pipeline များတွင် template များကို မအတည်ပြုခြင်း
5. ထုတ်လုပ်မှု ပတ်ဝန်းကျင်များအတွက် လုံခြုံရေး စစ်ဆေးမှု မပြုခြင်း
6. ဘတ်ဂျက် မျှော်လင့်ချက် မပြည့်မီဖြစ်ခြင်းကြောင့် အလားအလာ များဖြစ်ပေါ်ခြင်း

---

**Pro Tip**: ကြိုတင်စစ်ဆေးမှုများကို သင့် CI/CD pipeline ထဲတွင် တပ်ဆင်မှု အလုပ်တစ်ခုမစတင်မီ သီးခြား အလုပ်အဖြစ် ပြေးစေပါ။ ၎င်းအတိုင်း ပြဿနာများကို မကြာခဏ ဖမ်းပစ်နိုင်ပြီး ဖွံ့ဖြိုးရေးकर्ताहरूအား အမြန်တုံ့ပြန်ချက် ပေးသည်။

---

**Navigation**
- **Previous Lesson**: [SKU Selection](sku-selection.md)
- **Next Lesson**: [Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**သတိပေးချက်**:
ဤစာရွက်ကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အား အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ တိကျမှုအတွက် ကြိုးစားထားသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် တိကျမှုလျော့နည်းချက်များ ပါဝင်နိုင်သို့ဖြစ်နိုင်ကြောင်း သတိပြုရန်လိုအပ်ပါသည်။ မူရင်းစာတမ်းကို ၎င်း၏ မူလဘာသာဖြင့် အာဏာပိုင် အရင်းအမြစ်အဖြစ် သတ်မှတ် စဉ်းစားသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူကြီးမင်းသည် ပရော်ဖက်ရှင်နယ် လူဘာသာပြန်ကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်လာသော နားမလည်မှုများ သို့မဟုတ် မှားယွင်းဖော်ပြချက်များအတွက် ကျွန်ုပ်တို့ တာဝန်မခံမိပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# AZD ডিপ্লয়মেন্টের জন্য প্রি-ফ্লাইট চেকস

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD ফর বিগিনারস](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ৬ - প্রি-ডিপ্লয়মেন্ট ভ্যালিডেশন ও পরিকল্পনা
- **⬅️ পূর্ববর্তী**: [SKU নির্বাচন](sku-selection.md)
- **➡️ পরবর্তী অধ্যায়**: [অধ্যায় ৭: ট্রাবলশুটিং](../chapter-07-troubleshooting/common-issues.md)
- **🔧 সম্পর্কিত**: [অধ্যায় ৪: ডিপ্লয়মেন্ট গাইড](../chapter-04-infrastructure/deployment-guide.md)

## পরিচিতি

এই বিস্তৃত গাইডটি প্রি-ডিপ্লয়মেন্ট ভ্যালিডেশন স্ক্রিপ্ট এবং প্রক্রিয়াসমূহ প্রদান করে যা Azured Developer CLI ডিপ্লয়মেন্ট শুরু হওয়ার আগে সফলতা নিশ্চিত করে। প্রমাণীকরণ, রিসোর্স প্রাপ্যতা, কোটা, নিরাপত্তা সম্মতি এবং পারফরম্যান্সের জন্য স্বয়ংক্রিয় চেকগুলি কীভাবে কার্যকর করবেন শিখুন, যাতে ডিপ্লয়মেন্ট ব্যর্থতা আটকানো যায় এবং ডিপ্লয়মেন্ট সফলতার হার উন্নত হয়।

## শেখার লক্ষ্য

এই গাইড সম্পন্ন করার মাধ্যমে আপনি:
- স্বয়ংক্রিয় প্রি-ডিপ্লয়মেন্ট ভ্যালিডেশন পদ্ধতি ও স্ক্রিপ্টে দক্ষ হবেন
- প্রমাণীকরণ, অনুমতি, এবং কোটা সম্পর্কিত বিস্তৃত চেকিং স্ট্র্যাটেজি বুঝতে পারবেন
- রিসোর্স প্রাপ্যতা এবং সক্ষমতা যাচাই প্রক্রিয়া বাস্তবায়ন করতে পারবেন
- নিরাপত্তা এবং নীতিমালা অনুসরণ করে চেক কনফিগার করতে পারবেন
- খরচ অনুমান এবং বাজেট যাচাইয়ের ওয়ার্কফ্লো ডিজাইন করতে পারবেন
- CI/CD পাইপলাইনগুলির জন্য কাস্টম প্রি-ফ্লাইট চেক অটোমেশন তৈরি করতে পারবেন

## শেখার ফলাফল

সম্পূর্ণ করার পর, আপনি সক্ষম হবেন:
- ব্যাপক প্রি-ফ্লাইট ভ্যালিডেশন স্ক্রিপ্ট তৈরি ও কার্যকর করতে
- বিভিন্ন ডিপ্লয়মেন্ট পরিস্থিতির জন্য স্বয়ংক্রিয় চেকিং ওয়ার্কফ্লো ডিজাইন করতে
- পরিবেশ-নির্দিষ্ট যাচাই প্রক্রিয়া এবং নীতি বাস্তবায়ন করতে
- ডিপ্লয়মেন্ট প্রস্তুতির জন্য প্রোঅ্যাকটিভ মনিটরিং এবং সতর্কতা কনফিগার করতে
- প্রি-ডিপ্লয়মেন্ট ইস্যুগুলি ট্রাবলশুট ও সমাধান করতে
- প্রি-ফ্লাইট চেকগুলি DevOps পাইপলাইন এবং অটোমেশন ওয়ার্কফ্লোতে ইন্টিগ্রেট করতে

## বিষয়বস্তু সূচি

- [ওভারভিউ](#ওভারভিউ)
- [স্বয়ংক্রিয় প্রি-ফ্লাইট স্ক্রিপ্ট](#স্বয়ংক্রিয়-প্রি-ফ্লাইট-স্ক্রিপ্ট)
- [ম্যানুয়াল ভ্যালিডেশন চেকলিস্ট](#codeblock1)
- [পরিবেশ ভ্যালিডেশন](#✅-ব্যাকআপ-ও-পুনরুদ্ধার)
- [রিসোর্স ভ্যালিডেশন](#প্রোডাকশন-পরিবেশ-ভ্যালিডেশন)
- [নিরাপত্তা ও সম্মতি চেক](#security--compliance-checks)
- [পারফরম্যান্স ও সক্ষমতা পরিকল্পনা](#performance--capacity-planning)
- [সাধারণ সমস্যার ট্রাবলশুটিং](#troubleshooting-common-issues)

---

## ওভারভিউ

প্রি-ফ্লাইট চেকগুলি হচ্ছে ডিপ্লয়মেন্ট শুরু করার আগে করা অপরিহার্য যাচাই, যা নিশ্চিত করে:

- **লক্ষ্য অঞ্চলে** রিসোর্স প্রাপ্যতা ও কোটা
- **প্রমাণীকরণ ও অনুমতি** সঠিকভাবে কনফিগার করা আছে
- **টেমপ্লেটের বৈধতা** এবং প্যারামিটার সঠিকতা
- **নেটওয়ার্ক সংযোগ** এবং নির্ভরশীলতা
- **নিরাপত্তা নীতিমালা** অনুসরণ
- **বাজেটের মধ্যে খরচ অনুমান**

### কখন প্রি-ফ্লাইট চেক চালাবেন

- **নতুন পরিবেশে প্রথম ডিপ্লয়মেন্টের আগে**
- **গুরুত্বপূর্ণ টেমপ্লেট পরিবর্তনের পরে**
- **প্রোডাকশন ডিপ্লয়মেন্টের আগে**
- **Azure অঞ্চল পরিবর্তনের সময়**
- **CI/CD পাইপলাইনে অংশ হিসেবে**

---

## স্বয়ংক্রিয় প্রি-ফ্লাইট স্ক্রিপ্ট

### পাওয়ারশেল প্রি-ফ্লাইট চেকার

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

# আউটপুটের জন্য রঙ কোডিং
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
    
    # AZD ইনস্টলেশন পরীক্ষা করুন
    try {
        $azdVersion = azd version --output json | ConvertFrom-Json
        Write-Status "AZD CLI installed" "Success" "Version: $($azdVersion.azd.version)"
    }
    catch {
        Write-Status "AZD CLI not found" "Error" "Install from https://aka.ms/azd-install"
        return $false
    }
    
    # Azure CLI ইনস্টলেশন পরীক্ষা করুন
    try {
        $azVersion = az version --output json | ConvertFrom-Json
        Write-Status "Azure CLI installed" "Success" "Version: $($azVersion.'azure-cli')"
    }
    catch {
        Write-Status "Azure CLI not found" "Error" "Install from https://aka.ms/azcli"
        return $false
    }
    
    # PowerShell সংস্করণ পরীক্ষা করুন
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
        # AZD প্রমাণীকরণ পরীক্ষা করুন
        $azdAuth = azd auth login --check-status --output json 2>$null | ConvertFrom-Json
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
        }
        else {
            Write-Status "AZD authentication" "Error" "Run 'azd auth login'"
            return $false
        }
        
        # Azure CLI প্রমাণীকরণ পরীক্ষা করুন
        $azAccount = az account show --output json | ConvertFrom-Json
        Write-Status "Azure CLI authentication" "Success" "Subscription: $($azAccount.name)"
        
        # সাবস্ক্রিপশন অ্যাক্সেস যাচাই করুন
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
        # বর্তমান ব্যবহারকারীর রোল অ্যাসাইনমেন্টগুলি পান
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
        
        # রিসোর্স গ্রুপ তৈরি পরীক্ষা করুন (যদি নির্দিষ্ট থাকে)
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # রিসোর্স গ্রুপ তৈরি করার সক্ষমতা পরীক্ষা করুন
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
        # কম্পিউট কোটাস পরীক্ষা করুন
        $computeUsage = az vm list-usage --location $Location --output json | ConvertFrom-Json
        
        # নির্দিষ্ট কোটাস পরীক্ষা করুন
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
        
        # অ্যাপ সার্ভিস সীমাবদ্ধতা পরীক্ষা করুন
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
        
        # স্টোরেজ অ্যাকাউন্ট সীমাবদ্ধতা পরীক্ষা করুন
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
        return $true # অবাঞ্ছিত অবস্থা নয়
    }
}

function Test-NetworkConnectivity {
    Write-Host "`n${Blue}=== Network Connectivity Check ===${Reset}"
    
    # Azure এন্ডপয়েন্ট পরীক্ষা করুন
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
    
    # DNS রেজল্যুশন পরীক্ষা করুন
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
    
    # দেখুন azure.yaml আছে কি না
    if (Test-Path "azure.yaml") {
        Write-Status "azure.yaml found" "Success"
        
        # azure.yaml পার্স করুন
        try {
            $azureYaml = Get-Content "azure.yaml" -Raw | ConvertFrom-Yaml
            Write-Status "azure.yaml parsing" "Success"
            
            # সেবাসমূহ যাচাই করুন
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
    
    # অবকাঠামো ফাইলগুলি পরীক্ষা করুন
    if (Test-Path "infra") {
        $bicepFiles = Get-ChildItem -Path "infra" -Filter "*.bicep" -Recurse
        if ($bicepFiles.Count -gt 0) {
            Write-Status "Infrastructure templates" "Success" "$($bicepFiles.Count) Bicep files found"
            
            # প্রধান main.bicep যাচাই করুন যদি থাকে
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
    
    # 🧪 নতুন: অবকাঠামো পূর্বরূপ পরীক্ষা করুন (নিরাপদ শুকনো-চালনা)
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
        # দেখুন অবস্থানটি বৈধ কিনা
        $locations = az account list-locations --output json | ConvertFrom-Json
        $validLocation = $locations | Where-Object { $_.name -eq $Location -or $_.displayName -eq $Location }
        
        if ($validLocation) {
            Write-Status "Azure region" "Success" "Location '$Location' is valid"
        }
        else {
            Write-Status "Azure region" "Error" "Location '$Location' is not valid"
            return $false
        }
        
        # অঞ্চলে পরিষেবা উপলব্ধতা পরীক্ষা করুন
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
    
    # মৌলিক খরচের অনুমান (সঠিক অনুমানের জন্য Azure মূল্য নির্ধারণ API দরকার)
    Write-Status "Cost estimation" "Info" "Use Azure Pricing Calculator for detailed estimates"
    Write-Status "Monitoring setup" "Info" "Set up Azure Cost Management alerts"
    
    # বাজেট আছে কি না পরীক্ষা করুন
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
    
    # সাধারণ নিরাপত্তা অনুশীলন পরীক্ষা করুন
    try {
        # Key Vault কনফিগার করা হয়েছে কিনা পরীক্ষা করুন
        if (Select-String -Path "infra/*.bicep" -Pattern "Microsoft.KeyVault" -Quiet) {
            Write-Status "Key Vault usage" "Success" "Key Vault detected in templates"
        }
        else {
            Write-Status "Key Vault usage" "Warning" "Consider using Key Vault for secrets"
        }
        
        # ব্যবস্থাপিত পরিচয় ব্যবহারের জন্য পরীক্ষা করুন
        if (Select-String -Path "infra/*.bicep" -Pattern "managedIdentity|SystemAssigned" -Quiet) {
            Write-Status "Managed Identity" "Success" "Managed Identity detected"
        }
        else {
            Write-Status "Managed Identity" "Warning" "Consider using Managed Identity"
        }
        
        # HTTPS প্রয়োগ যাচাই করুন
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

# প্রধান কার্যনিষ্ঠা
function Invoke-PreflightCheck {
    Write-Host "${Green}AZD Pre-flight Check${Reset}" -ForegroundColor Green
    Write-Host "Environment: $EnvironmentName"
    Write-Host "Location: $Location"
    if ($ResourceGroup) { Write-Host "Resource Group: $ResourceGroup" }
    Write-Host "Time: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    Write-Host ""
    
    $allPassed = $true
    $results = @{}
    
    # সব পরীক্ষা চালান
    $results["Prerequisites"] = Test-Prerequisites
    $results["Authentication"] = Test-Authentication
    $results["Permissions"] = Test-Permissions
    $results["QuotasAndLimits"] = Test-QuotasAndLimits
    $results["NetworkConnectivity"] = Test-NetworkConnectivity
    $results["TemplateValidation"] = Test-TemplateValidation
    $results["RegionalAvailability"] = Test-RegionalAvailability
    $results["CostEstimation"] = Test-CostEstimation
    $results["SecurityCompliance"] = Test-SecurityCompliance
    
    # সারসংক্ষেপ
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

# প্রি-ফ্লাইট চেক চালান
Invoke-PreflightCheck
```

### ব্যাশ প্রি-ফ্লাইট চেকার

```bash
#!/bin/bash
# ইউনিক্স/লিনাক্স সিস্টেমের জন্য প্রি-ফ্লাইট চেকের ব্যাশ সংস্করণ

set -euo pipefail

# রঙ কোড
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # কোন রঙ নেই

# গ্লোবাল ভেরিয়েবলগুলি
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
    
    # AZD ইনস্টলেশন পরীক্ষা করুন
    if command -v azd >/dev/null 2>&1; then
        local azd_version=$(azd version --output json | jq -r '.azd.version')
        print_status "AZD CLI installed" "success" "Version: $azd_version"
    else
        print_status "AZD CLI not found" "error" "Install from https://aka.ms/azd-install"
        return 1
    fi
    
    # Azure CLI ইনস্টলেশন পরীক্ষা করুন
    if command -v az >/dev/null 2>&1; then
        local az_version=$(az version --output json | jq -r '."azure-cli"')
        print_status "Azure CLI installed" "success" "Version: $az_version"
    else
        print_status "Azure CLI not found" "error" "Install from https://aka.ms/azcli"
        return 1
    fi
    
    # jq ইনস্টলেশন পরীক্ষা করুন
    if command -v jq >/dev/null 2>&1; then
        print_status "jq installed" "success"
    else
        print_status "jq not found" "warning" "Install jq for better JSON parsing"
    fi
    
    return 0
}

check_authentication() {
    echo -e "\n${BLUE}=== Authentication Check ===${NC}"
    
    # AZD প্রমাণীকরণ পরীক্ষা করুন
    if azd auth login --check-status >/dev/null 2>&1; then
        local principal_name=$(azd auth login --check-status --output json 2>/dev/null | jq -r '.principalName // "Unknown"')
        print_status "AZD authentication" "success" "User: $principal_name"
    else
        print_status "AZD authentication" "error" "Run 'azd auth login'"
        return 1
    fi
    
    # Azure CLI প্রমাণীকরণ পরীক্ষা করুন
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
    
    # azure.yaml পরীক্ষা করুন
    if [[ -f "azure.yaml" ]]; then
        print_status "azure.yaml found" "success"
        
        # বেসিক YAML বৈধতা
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
    
    # অবকাঠামো ফাইল পরীক্ষা করুন
    if [[ -d "infra" ]]; then
        local bicep_count=$(find infra -name "*.bicep" | wc -l)
        if [[ $bicep_count -gt 0 ]]; then
            print_status "Infrastructure templates" "success" "$bicep_count Bicep files found"
            
            # থাকলে main.bicep বৈধতা যাচাই করুন
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
    
    # অবস্থান বৈধ কিনা পরীক্ষা করুন
    if az account list-locations --query "[?name=='$LOCATION' || displayName=='$LOCATION']" --output tsv | grep -q .; then
        print_status "Azure region" "success" "Location '$LOCATION' is valid"
    else
        print_status "Azure region" "error" "Location '$LOCATION' is not valid"
        return 1
    fi
    
    # সার্ভিসের প্রাপ্যতা পরীক্ষা করুন
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
    # কমান্ড লাইন আর্গুমেন্ট পার্স করুন
    while [[ $# -gt 0 ]]; চালান
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
    
    # প্রয়োজনীয় প্যারামিটার বৈধতা যাচাই করুন
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
    
    # চেক চালান
    local all_passed=true
    
    check_prerequisites || all_passed=false
    check_authentication || all_passed=false
    check_template_validation || all_passed=false
    check_regional_availability || all_passed=false
    
    # সারাংশ
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

# মেইন ফাংশন চালান
main "$@"
```

---

## ম্যানুয়াল ভ্যালিডেশন চেকলিস্ট

### প্রি-ডিপ্লয়মেন্ট চেকলিস্ট

এই চেকলিস্ট প্রিন্ট করুন এবং ডিপ্লয়মেন্টের আগে প্রতিটি আইটেম যাচাই করুন:

#### ✅ পরিবেশ সেটআপ
- [ ] AZD CLI ইন্সটল এবং সর্বশেষ সংস্করণে আপডেট করা হয়েছে
- [ ] Azure CLI ইন্সটল এবং প্রমাণীকৃত
- [ ] সঠিক Azure সাবস্ক্রিপশন নির্বাচন করা হয়েছে
- [ ] পরিবেশের নাম ইউনিক এবং নামকরণের নিয়ম অনুসরণ করে
- [ ] লক্ষ্য রিসোর্স গ্রুপ চিহ্নিত অথবা তৈরি করা যাবে

#### ✅ প্রমাণীকরণ ও অনুমতি
- [ ] `azd auth login` দিয়ে সফলভাবে প্রমাণীকরণ হয়েছে
- [ ] ব্যবহারকারীর টার্গেট সাবস্ক্রিপশন/রিসোর্স গ্রুপে Contributor ভূমিকা আছে
- [ ] CI/CD এর জন্য সার্ভিস প্রিন্সিপাল কনফিগার করা আছে (যদি প্রযোজ্য)
- [ ] মেয়াদোত্তীর্ণ কোনও সার্টিফিকেট বা ক্রেডেনশিয়াল নেই

#### ✅ টেমপ্লেট ভ্যালিডেশন
- [ ] `azure.yaml` ফাইল আছে এবং বৈধ YAML
- [ ] azure.yaml এ নির্ধারিত সব সার্ভিসের সোর্স কোড আছে
- [ ] `infra/` ডিরেক্টরিতে Bicep টেমপ্লেট উপস্থিত
- [ ] `main.bicep` কোন ত্রুটি ছাড়া কম্পাইল হয় (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 অবকাঠামো প্রিভিউ সফলভাবে রান হয় (`azd provision --preview`)
- [ ] প্রয়োজনীয় সব প্যারামিটারের ডিফল্ট মান আছে বা সরবরাহ করা হবে
- [ ] টেমপ্লেটে কোনো হার্ডকোড করা সিক্রেট নেই

#### ✅ রিসোর্স পরিকল্পনা
- [ ] লক্ষ্য Azure অঞ্চল নির্বাচন এবং যাচাই করা হয়েছে
- [ ] লক্ষ্য অঞ্চলে প্রয়োজনীয় Azure সার্ভিসগুলি উপলব্ধ
- [ ] পরিকল্পিত রিসোর্সের জন্য পর্যাপ্ত কোটা আছে
- [ ] রিসোর্স নামকরণের দ্বন্দ্ব পরীক্ষা করা হয়েছে
- [ ] রিসোর্সসমূহের মধ্যে নির্ভরশীলতা বোঝা হয়েছে

#### ✅ নেটওয়ার্ক ও নিরাপত্তা
- [ ] Azure এন্ডপয়েন্টের সঙ্গে নেটওয়ার্ক সংযোগ পরীক্ষা করা হয়েছে
- [ ] ফায়ারওয়াল/প্রক্সি সেটিংস প্রয়োজনে কনফিগার করা হয়েছে
- [ ] সিক্রেট ম্যানেজমেন্টের জন্য Key Vault ব্যবহার করা হয়েছে
- [ ] যেখানে সম্ভব ম্যানেজড আইডেন্টিটিস ব্যবহার করা হয়েছে
- [ ] ওয়েব অ্যাপ্লিকেশনগুলোর জন্য HTTPS প্রয়োগ চালু আছে

#### ✅ খরচ ব্যবস্থাপনা
- [ ] Azure প্রাইসিং ক্যালকুলেটর ব্যবহার করে খরচ অনুমান করা হয়েছে
- [ ] প্রয়োজন হলে বাজেট সতর্কতা কনফিগার করা হয়েছে
- [ ] পরিবেশের ধরন অনুযায়ী উপযুক্ত SKU নির্বাচন করা হয়েছে
- [ ] প্রোডাকশন ওয়ার্কলোডের জন্য রিজার্ভড ক্যাপাসিটি বিবেচনা করা হয়েছে

#### ✅ মনিটরিং ও পর্যবেক্ষণ
- [ ] টেমপ্লেটে অ্যাপ্লিকেশন ইনসাইটস কনফিগার করা হয়েছে
- [ ] লগ অ্যানালিটিকস ওয়ার্কস্পেস পরিকল্পিত
- [ ] গুরুত্বপূর্ণ মেট্রিকের জন্য সতর্কতা নিয়ম নির্ধারণ করা হয়েছে
- [ ] অ্যাপ্লিকেশনগুলোতে হেলথ চেক এন্ডপুন্ট প্রয়োগ করা হয়েছে

#### ✅ ব্যাকআপ ও পুনরুদ্ধার
- [ ] ডাটা রিসোর্সের জন্য ব্যাকআপ কৌশল নির্ধারণ করা হয়েছে
- [ ] রিকভারি টাইম অবজেক্টিভ (RTO) ডকুমেন্ট করা হয়েছে
- [ ] রিকভারি পয়েন্ট অবজেক্টিভ (RPO) ডকুমেন্ট করা হয়েছে
- [ ] প্রোডাকশনের জন্য ডিজাস্টার রিকভারি পরিকল্পনা থাকছে

---

## পরিবেশ ভ্যালিডেশন

### ডেভেলপমেন্ট পরিবেশ ভ্যালিডেশন

```bash
#!/bin/bash
# উন্নয়ন পরিবেশ বিশেষ যাচাইকরণ

validate_dev_environment() {
    echo "=== Development Environment Validation ==="
    
    # উন্নয়ন সফল কনফিগারেশন গুলি পরীক্ষা করুন
    if grep -q "sku.*Free\|sku.*F1\|sku.*Basic" infra/*.bicep; then
        echo "✓ Development-appropriate SKUs detected"
    else
        echo "⚠ Consider using lower-cost SKUs for development"
    fi
    
    # অটো-শাটডাউন কনফিগারেশন গুলি পরীক্ষা করুন
    if grep -q "autoShutdown\|deallocate" infra/*.bicep; then
        echo "✓ Auto-shutdown configuration found"
    else
        echo "ℹ Consider adding auto-shutdown for cost savings"
    fi
    
    # উন্নয়ন ডাটাবেস কনফিগারেশন যাচাই করুন
    if grep -q "Basic\|S0\|S1" infra/*.bicep; then
        echo "✓ Development database tiers configured"
    else
        echo "⚠ Consider using Basic/Standard tiers for development databases"
    fi
}
```

### প্রোডাকশন পরিবেশ ভ্যালিডেশন

```bash
#!/bin/bash
# প্রোডাকশন পরিবেশ নির্দিষ্ট যাচাই-বাছাই

validate_prod_environment() {
    echo "=== Production Environment Validation ==="
    
    # উচ্চ প্রাপ্যতা কনফিগারেশন পরীক্ষা করুন
    if grep -q "zoneRedundant.*true\|Premium\|Standard_GRS" infra/*.bicep; then
        echo "✓ High availability configurations detected"
    else
        echo "⚠ Consider enabling high availability for production"
    fi
    
    # ব্যাকআপ কনফিগারেশন পরীক্ষা করুন
    if grep -q "backup\|retention\|pointInTimeRestore" infra/*.bicep; then
        echo "✓ Backup configurations found"
    else
        echo "⚠ Ensure backup strategies are implemented"
    fi
    
    # মনিটরিং সেটআপ যাচাই করুন
    if grep -q "Microsoft.Insights\|Application_Type.*web" infra/*.bicep; then
        echo "✓ Monitoring and observability configured"
    else
        echo "⚠ Add comprehensive monitoring for production"
    fi
    
    # সুরক্ষা কনফিগারেশন পরীক্ষা করুন
    if grep -q "Microsoft.KeyVault\|managedIdentity\|httpsOnly.*true" infra/*.bicep; then
        echo "✓ Security best practices implemented"
    else
        echo "⚠ Review security configurations for production"
    fi
}
```

---

## রিসোর্স ভ্যালিডেশন

### কোটা ভ্যালিডেশন স্ক্রিপ্ট

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
    
    # সাবস্ক্রিপশনে স্টোরেজ অ্যাকাউন্টগুলি পান
    accounts = run_command(['az', 'storage', 'account', 'list'])
    
    if accounts is None:
        print("❌ Could not retrieve storage account information")
        return False
    
    account_count = len(accounts)
    max_accounts = 250  # ডিফল্ট আজুর সীমা
    
    usage_percent = (account_count / max_accounts) * 100
    status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
    
    print(f"{status} Storage Accounts: {account_count}/{max_accounts} ({usage_percent:.1f}%)")
    
    return usage_percent < 95

def check_network_limits(location: str) -> bool:
    """Check network-related limits"""
    print(f"\n=== Network Limits Check ({location}) ===")
    
    # ভার্চুয়াল নেটওয়ার্কগুলি পরীক্ষা করুন
    vnets = run_command(['az', 'network', 'vnet', 'list'])
    if vnets is not None:
        vnet_count = len(vnets)
        print(f"✅ Virtual Networks: {vnet_count}/1000")
    
    # পাবলিক আইপি ঠিকানাগুলি পরীক্ষা করুন
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
    
    # চেকগুলি চালান
    all_passed &= check_compute_quotas(location)
    all_passed &= check_storage_limits(location)
    all_passed &= check_network_limits(location)
    
    # সারাংশ
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

## নিরাপত্তা ও সম্মতি চেক

### নিরাপত্তা ভ্যালিডেশন স্ক্রিপ্ট

```bash
#!/bin/bash
# AZD ডিপ্লয়মেন্টগুলির জন্য নিরাপত্তা এবং সম্মতি যাচাই

check_security_practices() {
    echo "=== Security Best Practices Check ==="
    
    local issues_found=0
    
    # কী ভল্ট ব্যবহারের জন্য পরীক্ষা করুন
    if grep -r "Microsoft.KeyVault" infra/ >/dev/null 2>&1; then
        echo "✅ Key Vault detected in infrastructure"
    else
        echo "⚠️  Key Vault not found - consider using for secrets management"
        ((issues_found++))
    fi
    
    # পরিচালিত পরিচয় ব্যবহারের জন্য পরীক্ষা করুন
    if grep -r "managedIdentity\|SystemAssigned\|UserAssigned" infra/ >/dev/null 2>&1; then
        echo "✅ Managed Identity configuration detected"
    else
        echo "⚠️  Managed Identity not found - consider using for service authentication"
        ((issues_found++))
    fi
    
    # HTTPS প্রয়োগের জন্য পরীক্ষা করুন
    if grep -r "httpsOnly.*true\|requireHttps.*true" infra/ >/dev/null 2>&1; then
        echo "✅ HTTPS enforcement detected"
    else
        echo "⚠️  HTTPS enforcement not found - ensure secure connections"
        ((issues_found++))
    fi
    
    # ন্যূনতম TLS সংস্করণের জন্য পরীক্ষা করুন
    if grep -r "minimumTlsVersion.*'TLS1_2'" infra/ >/dev/null 2>&1; then
        echo "✅ Minimum TLS 1.2 configuration detected"
    else
        echo "⚠️  Minimum TLS version not specified - consider requiring TLS 1.2+"
        ((issues_found++))
    fi
    
    # পাবলিক অ্যাক্সেস নিষেধাজ্ঞার জন্য পরীক্ষা করুন
    if grep -r "allowBlobPublicAccess.*false\|publicNetworkAccess.*Disabled" infra/ >/dev/null 2>&1; then
        echo "✅ Public access restrictions detected"
    else
        echo "⚠️  Public access restrictions not found - consider limiting public access"
        ((issues_found++))
    fi
    
    # নেটওয়ার্ক নিরাপত্তা গ্রুপের জন্য পরীক্ষা করুন
    if grep -r "Microsoft.Network/networkSecurityGroups" infra/ >/dev/null 2>&1; then
        echo "✅ Network Security Groups detected"
    else
        echo "ℹ️  Network Security Groups not found - may be acceptable depending on architecture"
    fi
    
    return $issues_found
}

check_compliance_requirements() {
    echo -e "\n=== Compliance Requirements Check ==="
    
    # ডেটা এনক্রিপশনের জন্য পরীক্ষা করুন
    if grep -r "encryption\|encryptionAtRest\|transparentDataEncryption" infra/ >/dev/null 2>&1; then
        echo "✅ Encryption configurations detected"
    else
        echo "⚠️  Encryption configurations not found - ensure data is encrypted"
    fi
    
    # অডিট লগিংয়ের জন্য পরীক্ষা করুন
    if grep -r "Microsoft.Insights.*auditingSettings\|diagnosticSettings" infra/ >/dev/null 2>&1; then
        echo "✅ Audit logging configurations detected"
    else
        echo "⚠️  Audit logging not found - consider enabling for compliance"
    fi
    
    # ব্যাকআপ এবং রিটেনশন নীতির জন্য পরীক্ষা করুন
    if grep -r "backup.*Policy\|retentionPolicy\|retention.*Days" infra/ >/dev/null 2>&1; then
        echo "✅ Backup and retention policies detected"
    else
        echo "⚠️  Backup/retention policies not found - required for data governance"
    fi
}

# প্রধান সম্পাদনা
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

## CI/CD এর সাথে ইন্টিগ্রেশন

### GitHub Actions ইন্টিগ্রেশন

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

### Azure DevOps ইন্টিগ্রেশন

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

## সেরা অনুশীলনের সংক্ষিপ্তসার

### ✅ প্রি-ফ্লাইট চেকের সেরা অনুশীলন

1. **যেখানে সম্ভব অটোমেট করুন**
   - চেকগুলোকে CI/CD পাইপলাইনে সংযুক্ত করুন
   - পুনরাবৃত্তিমূলক যাচাইয়ের জন্য স্ক্রিপ্ট ব্যবহার করুন
   - অডিট ট্রেইলের জন্য ফলাফল সংরক্ষণ করুন

2. **পরিবেশ-নির্দিষ্ট যাচাই**
   - ডেভ/স্টেজিং/প্রোড জন্য ভিন্ন চেক
   - প্রতিটি পরিবেশের জন্য উপযুক্ত নিরাপত্তা প্রয়োজনীয়তা
   - অপ্রোডাকশন পরিবেশের জন্য খরচ অপ্টিমাইজেশন

3. **সম্পূর্ণ কভারেজ**
   - প্রমাণীকরণ ও অনুমতি
   - রিসোর্স কোটা ও প্রাপ্যতা
   - টেমপ্লেট ভ্যালিডেশন ও সিনট্যাক্স
   - নিরাপত্তা ও সম্মতি প্রয়োজনীয়তা

4. **স্পষ্ট রিপোর্টিং**
   - রঙিন স্ট্যাটাস নির্দেশক
   - বিস্তারিত ত্রুটি বার্তা ও সমাধান ধাপ
   - দ্রুত মূল্যায়নের জন্য সংক্ষিপ্ত রিপোর্ট

5. **দ্রুত ব্যর্থতা**
   - গুরুতর চেক ব্যর্থ হলে ডিপ্লয়মেন্ট বন্ধ করুন
   - সমাধানের জন্য স্পষ্ট নির্দেশনা দিন
   - সহজেই চেক পুনরায় চালানোর সুযোগ দিন

### সাধারণ প্রি-ফ্লাইট সমস্যা

1. "দ্রুত" ডিপ্লয়মেন্টের জন্য যাচাই এড়ানো
2. ডিপ্লয়মেন্টের আগে অনুমতির যথেষ্ট যাচাই না করা
3. কোটা সীমা অগ্রাহ্য করা যতক্ষণ না ডিপ্লয়মেন্ট ব্যর্থ হয়
4. CI/CD পাইপলাইনে টেমপ্লেট যাচাই বাদ দেওয়া
5. প্রোডাকশন পরিবেশে নিরাপত্তা যাচাই করতে ভুল হওয়া
6. অপর্যাপ্ত খরচ অনুমান যা বাজেটে অবাক করে

---

**পেশাদার টিপ:** প্রকৃত ডিপ্লয়মেন্ট কাজের আগে আপনার CI/CD পাইপলাইনে প্রি-ফ্লাইট চেক আলাদা একটি জব হিসেবে চালান। এটি আপনাকে তাড়াতাড়ি সমস্যা ধরতে ও ডেভেলপারদের দ্রুত প্রতিক্রিয়া দিতে সাহায্য করবে।

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [SKU নির্বাচন](sku-selection.md)
- **পরবর্তী পাঠ**: [চিট শিট](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকারোক্তি**:  
এই নথিটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা সঠিকতার জন্য চেষ্টা করি, তবে অনুগ্রহ করে জেনে রাখুন যে স্বয়ংক্রিয় অনুবাদে ভুল বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার মাতৃভাষায়ই কর্তৃত্বস্বরূপ বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদের পরামর্শ দেওয়া হয়। এই অনুবাদের ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
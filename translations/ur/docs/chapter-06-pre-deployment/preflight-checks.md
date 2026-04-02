# AZD کی تعیناتیوں کے لیے پری-فلائٹ چیکس

**باب کی نیوی گیشن:**
- **📚 کورس ہوم**: [ابتدائیوں کے لیے AZD](../../README.md)
- **📖 موجودہ باب**: باب 6 - پیشگی تعیناتی کی تصدیق اور منصوبہ بندی
- **⬅️ پچھلا**: [SKU انتخاب](sku-selection.md)
- **➡️ اگلا باب**: [باب 7: مسائل کا حل](../chapter-07-troubleshooting/common-issues.md)
- **🔧 متعلقہ**: [باب 4: تعیناتی کا رہنما](../chapter-04-infrastructure/deployment-guide.md)

## تعارف

یہ جامع رہنما تعیناتی شروع ہونے سے پہلے Azure Developer CLI تعیناتیوں کی کامیابی کو یقینی بنانے کے لیے پیشگی تصدیقی اسکرپٹس اور طریقہ کار فراہم کرتی ہے۔ خودکار چیکوں کو نافذ کرنا سیکھیں جیسے کہ توثیق، وسائل کی دستیابی، کوٹہ، سیکیورٹی کی تعمیل، اور کارکردگی کی ضروریات تاکہ تعیناتیاں ناکام نہ ہوں اور تعیناتی کی کامیابی کی شرح بہتر ہو۔

## تعلیمی اہداف

اس رہنما کو مکمل کر کے آپ:
- خودکار پیشگی تعیناتی تصدیقی تکنیک اور اسکرپٹس پر مہارت حاصل کریں گے
- توثیق، اجازتوں، اور کوٹہ کے لیے جامع چیکنگ حکمت عملی سمجھیں گے
- وسائل کی دستیابی اور صلاحیت کی تصدیقی طریقہ کار نافذ کریں گے
- تنظیمی پالیسیوں کے مطابق سیکیورٹی اور تعمیل چیک ترتیب دیں گے
- لاگت کے تخمینے اور بجٹ کی جانچ کے عمل ڈیزائن کریں گے
- CI/CD پائپ لائنز کے لیے اپنی مرضی کے پری-فلائٹ چیک خودکار بنائیں گے

## تعلیمی نتیجے

مکمل کرنے کے بعد، آپ قابل ہوں گے:
- جامع پری-فلائٹ تصدیقی اسکرپٹس بنائیں اور چلائیں
- مختلف تعیناتی کے منظرناموں کے لیے خودکار چیکنگ ورک فلو ڈیزائن کریں
- ماحول کے مطابق تصدیقی طریقہ کار اور پالیسیاں نافذ کریں
- تعیناتی کی تیاری کے لیے پروایکٹیو مانیٹرنگ اور الارٹنگ کنفیگر کریں
- پیشگی تعیناتی کے مسائل کو حل کریں اور اصلاحی اقدامات کریں
- پری-فلائٹ چیکس کو ڈیئووپس پائپ لائنز اور خودکار ورک فلو میں ضم کریں

## فہرست مواد

- [جائزہ](#جائزہ)
- [خودکار پری-فلائٹ اسکرپٹ](#خودکار-پری-فلائٹ-اسکرپٹ)
- [دستی تصدیقی چیک لسٹ](#codeblock1)
- [ماحولیاتی تصدیق](#✅-بیک-اپ-اور-بحالی)
- [وسائل کی تصدیق](#پروڈکشن-ماحول-کی-تصدیق)
- [سیکیورٹی اور تعمیل کے چیک](#security--compliance-checks)
- [کارکردگی اور صلاحیت کی منصوبہ بندی](#performance--capacity-planning)
- [عام مسائل کا حل](#troubleshooting-common-issues)

---

## جائزہ

پری-فلائٹ چیکس وہ ضروری تصدیقیں ہیں جو تعیناتی سے پہلے کی جاتی ہیں تاکہ یقینی بنایا جا سکے:

- **ہدف علاقہ جات میں وسائل کی دستیابی** اور کوٹہ
- **توثیق اور اجازتیں** درست طریقے سے ترتیب دی گئی ہوں
- **سانچہ کی درستگی** اور پیرا میٹرز کا صحیح ہونا
- **نیٹ ورک کنیکٹیویٹی** اور انحصار
- **تنظیمی پالیسیوں کے مطابق سیکیورٹی کی تعمیل**
- **لاگت کا تخمینہ** بجٹ کی حدود کے اندر

### پری-فلائٹ چیکس کب چلائیں

- **نئے ماحول میں پہلی بار تعیناتی سے پہلے**
- **اہم سانچہ تبدیلیوں کے بعد**
- **پروڈکشن کی تعیناتیاں شروع کرنے سے پہلے**
- **Azure کے خطے بدلتے وقت**
- **CI/CD پائپ لائنز کا حصہ کے طور پر**

---

## خودکار پری-فلائٹ اسکرپٹ

### PowerShell پری-فلائٹ چیکر

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

# آؤٹ پٹ کے لیے رنگ کوڈنگ
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
    
    # AZD کی تنصیب چیک کریں
    try {
        $azdVersion = azd version --output json | ConvertFrom-Json
        Write-Status "AZD CLI installed" "Success" "Version: $($azdVersion.azd.version)"
    }
    catch {
        Write-Status "AZD CLI not found" "Error" "Install from https://aka.ms/azd-install"
        return $false
    }
    
    # Azure CLI کی تنصیب چیک کریں
    try {
        $azVersion = az version --output json | ConvertFrom-Json
        Write-Status "Azure CLI installed" "Success" "Version: $($azVersion.'azure-cli')"
    }
    catch {
        Write-Status "Azure CLI not found" "Error" "Install from https://aka.ms/azcli"
        return $false
    }
    
    # PowerShell کا ورژن چیک کریں
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
        # AZD کی توثیق چیک کریں
        $azdAuth = azd auth login --check-status --output json 2>$null | ConvertFrom-Json
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
        }
        else {
            Write-Status "AZD authentication" "Error" "Run 'azd auth login'"
            return $false
        }
        
        # Azure CLI کی توثیق چیک کریں
        $azAccount = az account show --output json | ConvertFrom-Json
        Write-Status "Azure CLI authentication" "Success" "Subscription: $($azAccount.name)"
        
        # سبسکرپشن تک رسائی کی تصدیق کریں
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
        # موجودہ صارف کے کردار کی تفویضات حاصل کریں
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
        
        # ریسورس گروپ بنانے کا تجربہ کریں (اگر مخصوص ہو)
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # ریسورس گروپ بنانے کی صلاحیت کا تجربہ کریں
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
        # کمپیوٹ کوٹہ چیک کریں
        $computeUsage = az vm list-usage --location $Location --output json | ConvertFrom-Json
        
        # مخصوص کوٹہ چیک کریں
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
        
        # ایپ سروس کی حدود چیک کریں
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
        
        # اسٹوریج اکاؤنٹ کی حدود چیک کریں
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
        return $true # غیر بلاکنگ
    }
}

function Test-NetworkConnectivity {
    Write-Host "`n${Blue}=== Network Connectivity Check ===${Reset}"
    
    # Azure کے اینڈ پوائنٹس کا تجربہ کریں
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
    
    # DNS ریزولوشن کا تجربہ کریں
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
    
    # چیک کریں کہ azure.yaml موجود ہے یا نہیں
    if (Test-Path "azure.yaml") {
        Write-Status "azure.yaml found" "Success"
        
        # azure.yaml کو پارس کریں
        try {
            $azureYaml = Get-Content "azure.yaml" -Raw | ConvertFrom-Yaml
            Write-Status "azure.yaml parsing" "Success"
            
            # سروسز کی تصدیق کریں
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
    
    # انفراسٹرکچر فائلز کے لیے چیک کریں
    if (Test-Path "infra") {
        $bicepFiles = Get-ChildItem -Path "infra" -Filter "*.bicep" -Recurse
        if ($bicepFiles.Count -gt 0) {
            Write-Status "Infrastructure templates" "Success" "$($bicepFiles.Count) Bicep files found"
            
            # اگر main.bicep موجود ہو تو اس کی تصدیق کریں
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
    
    # 🧪 نیا: انفراسٹرکچر پریویو کا تجربہ کریں (محفوظ خشک رن)
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
        # چیک کریں کہ مقام درست ہے یا نہیں
        $locations = az account list-locations --output json | ConvertFrom-Json
        $validLocation = $locations | Where-Object { $_.name -eq $Location -or $_.displayName -eq $Location }
        
        if ($validLocation) {
            Write-Status "Azure region" "Success" "Location '$Location' is valid"
        }
        else {
            Write-Status "Azure region" "Error" "Location '$Location' is not valid"
            return $false
        }
        
        # خطے میں سروس کی دستیابی چیک کریں
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
    
    # بنیادی لاگت کا تخمینہ (صحیح اندازے کے لیے Azure پریسنگ API کی ضرورت ہوگی)
    Write-Status "Cost estimation" "Info" "Use Azure Pricing Calculator for detailed estimates"
    Write-Status "Monitoring setup" "Info" "Set up Azure Cost Management alerts"
    
    # چیک کریں کہ بجٹ موجود ہے یا نہیں
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
    
    # عام حفاظتی طریقوں کے لیے چیک کریں
    try {
        # چیک کریں کہ Key Vault کنفیگر ہے یا نہیں
        if (Select-String -Path "infra/*.bicep" -Pattern "Microsoft.KeyVault" -Quiet) {
            Write-Status "Key Vault usage" "Success" "Key Vault detected in templates"
        }
        else {
            Write-Status "Key Vault usage" "Warning" "Consider using Key Vault for secrets"
        }
        
        # منیج شدہ شناخت کے استعمال کے لیے چیک کریں
        if (Select-String -Path "infra/*.bicep" -Pattern "managedIdentity|SystemAssigned" -Quiet) {
            Write-Status "Managed Identity" "Success" "Managed Identity detected"
        }
        else {
            Write-Status "Managed Identity" "Warning" "Consider using Managed Identity"
        }
        
        # HTTPS نفاذ کے لیے چیک کریں
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

# مرکزی نفاذ
function Invoke-PreflightCheck {
    Write-Host "${Green}AZD Pre-flight Check${Reset}" -ForegroundColor Green
    Write-Host "Environment: $EnvironmentName"
    Write-Host "Location: $Location"
    if ($ResourceGroup) { Write-Host "Resource Group: $ResourceGroup" }
    Write-Host "Time: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    Write-Host ""
    
    $allPassed = $true
    $results = @{}
    
    # تمام چیک چلائیں
    $results["Prerequisites"] = Test-Prerequisites
    $results["Authentication"] = Test-Authentication
    $results["Permissions"] = Test-Permissions
    $results["QuotasAndLimits"] = Test-QuotasAndLimits
    $results["NetworkConnectivity"] = Test-NetworkConnectivity
    $results["TemplateValidation"] = Test-TemplateValidation
    $results["RegionalAvailability"] = Test-RegionalAvailability
    $results["CostEstimation"] = Test-CostEstimation
    $results["SecurityCompliance"] = Test-SecurityCompliance
    
    # خلاصہ
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

# پری فلائٹ چیک چلائیں
Invoke-PreflightCheck
```

### Bash پری-فلائٹ چیکر

```bash
#!/bin/bash
# Unix/Linux سسٹمز کے لیے پری فلائٹ چیکس کا باش ورژن

set -euo pipefail

# رنگ کوڈز
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # کوئی رنگ نہیں

# عالمی متغیرات
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
    
    # AZD کی تنصیب چیک کریں
    if command -v azd >/dev/null 2>&1; then
        local azd_version=$(azd version --output json | jq -r '.azd.version')
        print_status "AZD CLI installed" "success" "Version: $azd_version"
    else
        print_status "AZD CLI not found" "error" "Install from https://aka.ms/azd-install"
        return 1
    fi
    
    # Azure CLI کی تنصیب چیک کریں
    if command -v az >/dev/null 2>&1; then
        local az_version=$(az version --output json | jq -r '."azure-cli"')
        print_status "Azure CLI installed" "success" "Version: $az_version"
    else
        print_status "Azure CLI not found" "error" "Install from https://aka.ms/azcli"
        return 1
    fi
    
    # jq کی تنصیب چیک کریں
    if command -v jq >/dev/null 2>&1; then
        print_status "jq installed" "success"
    else
        print_status "jq not found" "warning" "Install jq for better JSON parsing"
    fi
    
    return 0
}

check_authentication() {
    echo -e "\n${BLUE}=== Authentication Check ===${NC}"
    
    # AZD کی توثیق چیک کریں
    if azd auth login --check-status >/dev/null 2>&1; then
        local principal_name=$(azd auth login --check-status --output json 2>/dev/null | jq -r '.principalName // "Unknown"')
        print_status "AZD authentication" "success" "User: $principal_name"
    else
        print_status "AZD authentication" "error" "Run 'azd auth login'"
        return 1
    fi
    
    # Azure CLI کی توثیق چیک کریں
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
    
    # azure.yaml چیک کریں
    if [[ -f "azure.yaml" ]]; then
        print_status "azure.yaml found" "success"
        
        # بنیادی YAML کی تصدیق
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
    
    # انفراسٹرکچر فائلز چیک کریں
    if [[ -d "infra" ]]; then
        local bicep_count=$(find infra -name "*.bicep" | wc -l)
        if [[ $bicep_count -gt 0 ]]; then
            print_status "Infrastructure templates" "success" "$bicep_count Bicep files found"
            
            # اگر موجود ہو تو main.bicep کی تصدیق کریں
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
    
    # چیک کریں کہ مقام درست ہے
    if az account list-locations --query "[?name=='$LOCATION' || displayName=='$LOCATION']" --output tsv | grep -q .; then
        print_status "Azure region" "success" "Location '$LOCATION' is valid"
    else
        print_status "Azure region" "error" "Location '$LOCATION' is not valid"
        return 1
    fi
    
    # سروس کی دستیابی چیک کریں
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
    # کمانڈ لائن دلائل پارس کریں
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
    
    # مطلوبہ پیرا میٹرز کی تصدیق کریں
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
    
    # چیکس چلائیں
    local all_passed=true
    
    check_prerequisites || all_passed=false
    check_authentication || all_passed=false
    check_template_validation || all_passed=false
    check_regional_availability || all_passed=false
    
    # خلاصہ
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

# مرکزی فنکشن چلائیں
main "$@"
```

---

## دستی تصدیقی چیک لسٹ

### پیشگی تعیناتی چیک لسٹ

اس چیک لسٹ کو پرنٹ کریں اور ہر آئٹم تعیناتی سے پہلے چیک کریں:

#### ✅ ماحول کی ترتیب
- [ ] AZD CLI انسٹال اور تازہ ترین ورژن پر اپ ڈیٹ کیا گیا ہو
- [ ] Azure CLI انسٹال اور تصدیق شدہ ہو
- [ ] درست Azure سبسکرپشن منتخب کیا گیا ہو
- [ ] ماحول کا نام منفرد ہو اور نام کے قواعد کی پیروی کرے
- [ ] ہدف ریسورس گروپ شناخت کیا گیا یا بنایا جا سکتا ہو

#### ✅ توثیق اور اجازتیں
- [ ] `azd auth login` کے ذریعے کامیابی سے توثیق ہو چکی ہو
- [ ] صارف کے پاس ہدف سبسکرپشن/ریسورس گروپ پر کنٹری بیوٹر کا کردار ہو
- [ ] CI/CD کے لیے سروس پرنسپل ترتیب دیا گیا ہو (اگر قابل اطلاق ہو)
- [ ] کوئی میعاد ختم شدہ سرٹیفکیٹ یا اسناد نہ ہوں

#### ✅ سانچہ کی تصدیق
- [ ] `azure.yaml` فائل موجود اور درست YAML ہو
- [ ] azure.yaml میں تمام خدمات کے لیے متعلقہ سورس کوڈ موجود ہو
- [ ] `infra/` ڈائریکٹری میں Bicep سانچے موجود ہوں
- [ ] `main.bicep` بغیر کسی غلطی کے کمپائل ہوتا ہو (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 انفراسٹرکچر پریویو کامیابی سے چلتا ہو (`azd provision --preview`)
- [ ] تمام ضروری پیرا میٹرز کے ڈیفالٹ ویلیوز ہوں یا فراہم کیے جائیں گے
- [ ] سانچوں میں کوئی ہارڈ کوڈڈ سیکرٹس نہ ہوں

#### ✅ وسائل کی منصوبہ بندی
- [ ] ہدف Azure علاقہ منتخب اور تصدیق شدہ ہو
- [ ] ہدف علاقے میں مطلوبہ Azure خدمات دستیاب ہوں
- [ ] منصوبہ بند وسائل کے لیے کافی کوٹے دستیاب ہوں
- [ ] وسائل کے ناموں کے تصادم کی جانچ کی گئی ہو
- [ ] وسائل کے مابین انحصار کو سمجھ لیا گیا ہو

#### ✅ نیٹ ورک اور سیکیورٹی
- [ ] Azure اینڈپوائنٹس کے ساتھ نیٹ ورک کنیکٹیویٹی کی تصدیق کی گئی ہو
- [ ] فائر وال/پراکسی کی ترتیبات کنفیگر کی گئی ہوں اگر ضرورت ہو
- [ ] سیکرٹس مینجمنٹ کے لیے کی والٹ ترتیب دی گئی ہو
- [ ] جہاں ممکن ہو مینیجد شناختیں استعمال کی گئی ہوں
- [ ] ویب ایپلیکیشنز کے لیے HTTPS کا نفاذ فعال ہو

#### ✅ لاگت کا انتظام
- [ ] Azure پرائسنگ کیلکولیٹر سے لاگت کا تخمینہ لگایا گیا ہو
- [ ] بجٹ کی اطلاعات کنفیگر کی گئی ہوں اگر ضرورت ہو
- [ ] ماحول کی قسم کے لیے مناسب SKUs منتخب کیے گئے ہوں
- [ ] پروڈکشن ورکلوڈز کے لیے ریزروڈ صلاحیت کا خیال رکھا گیا ہو

#### ✅ مانیٹرنگ اور مشاہدہ
- [ ] ایپلیکیشن انسائٹس سانچوں میں شامل ہو
- [ ] لاگ اینالٹکس ورک اسپیس منصوبہ بند ہو
- [ ] اہم میٹرکس کے لیے الارم رولز متعین کیے گئے ہوں
- [ ] ایپلیکیشنز میں صحت کی جانچ کے اینڈپوائنٹس نافذ کیے گئے ہوں

#### ✅ بیک اپ اور بحالی
- [ ] ڈیٹا وسائل کے لیے بیک اپ حکمت عملی متعین ہو
- [ ] ریکوری ٹائم آبجیکٹیوز (RTO) دستاویزی ہوں
- [ ] ریکوری پوائنٹ آبجیکٹیوز (RPO) دستاویزی ہوں
- [ ] پروڈکشن کے لیے ڈیزاسٹر ریکوری پلان موجود ہو

---

## ماحولیاتی تصدیق

### ڈویلپمنٹ ماحول کی تصدیق

```bash
#!/bin/bash
# ترقیاتی ماحول کے مخصوص تصدیقات

validate_dev_environment() {
    echo "=== Development Environment Validation ==="
    
    # ترقی کے موافق ترتیب کی جانچ کریں
    if grep -q "sku.*Free\|sku.*F1\|sku.*Basic" infra/*.bicep; then
        echo "✓ Development-appropriate SKUs detected"
    else
        echo "⚠ Consider using lower-cost SKUs for development"
    fi
    
    # خودکار بندش کی ترتیب کی جانچ کریں
    if grep -q "autoShutdown\|deallocate" infra/*.bicep; then
        echo "✓ Auto-shutdown configuration found"
    else
        echo "ℹ Consider adding auto-shutdown for cost savings"
    fi
    
    # ترقیاتی ڈیٹا بیس کی ترتیبات کی توثیق کریں
    if grep -q "Basic\|S0\|S1" infra/*.bicep; then
        echo "✓ Development database tiers configured"
    else
        echo "⚠ Consider using Basic/Standard tiers for development databases"
    fi
}
```

### پروڈکشن ماحول کی تصدیق

```bash
#!/bin/bash
# پیداواری ماحول کی مخصوص تصدیقات

validate_prod_environment() {
    echo "=== Production Environment Validation ==="
    
    # اعلی دستیابی کی ترتیب کی جانچ کریں
    if grep -q "zoneRedundant.*true\|Premium\|Standard_GRS" infra/*.bicep; then
        echo "✓ High availability configurations detected"
    else
        echo "⚠ Consider enabling high availability for production"
    fi
    
    # بیک اپ کی ترتیب کی جانچ کریں
    if grep -q "backup\|retention\|pointInTimeRestore" infra/*.bicep; then
        echo "✓ Backup configurations found"
    else
        echo "⚠ Ensure backup strategies are implemented"
    fi
    
    # مانیٹرنگ سیٹ اپ کی توثیق کریں
    if grep -q "Microsoft.Insights\|Application_Type.*web" infra/*.bicep; then
        echo "✓ Monitoring and observability configured"
    else
        echo "⚠ Add comprehensive monitoring for production"
    fi
    
    # سیکورٹی کی ترتیب کی جانچ کریں
    if grep -q "Microsoft.KeyVault\|managedIdentity\|httpsOnly.*true" infra/*.bicep; then
        echo "✓ Security best practices implemented"
    else
        echo "⚠ Review security configurations for production"
    fi
}
```

---

## وسائل کی تصدیق

### کوٹا تصدیقی اسکرپٹ

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
    
    # سبسکرپشن میں سٹوریج اکاؤنٹس حاصل کریں
    accounts = run_command(['az', 'storage', 'account', 'list'])
    
    if accounts is None:
        print("❌ Could not retrieve storage account information")
        return False
    
    account_count = len(accounts)
    max_accounts = 250  # ڈیفالٹ ایزور حد
    
    usage_percent = (account_count / max_accounts) * 100
    status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
    
    print(f"{status} Storage Accounts: {account_count}/{max_accounts} ({usage_percent:.1f}%)")
    
    return usage_percent < 95

def check_network_limits(location: str) -> bool:
    """Check network-related limits"""
    print(f"\n=== Network Limits Check ({location}) ===")
    
    # ورچوئل نیٹ ورکس چیک کریں
    vnets = run_command(['az', 'network', 'vnet', 'list'])
    if vnets is not None:
        vnet_count = len(vnets)
        print(f"✅ Virtual Networks: {vnet_count}/1000")
    
    # پبلک آئی پی ایڈریسز چیک کریں
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
    
    # چیکس چلائیں
    all_passed &= check_compute_quotas(location)
    all_passed &= check_storage_limits(location)
    all_passed &= check_network_limits(location)
    
    # خلاصہ
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

## سیکیورٹی اور تعمیل کے چیک

### سیکیورٹی تصدیقی اسکرپٹ

```bash
#!/bin/bash
# AZD تعیناتی کے لیے سیکورٹی اور تعمیل کی توثیق

check_security_practices() {
    echo "=== Security Best Practices Check ==="
    
    local issues_found=0
    
    # کلید والیٹ استعمال کی جانچ کریں
    if grep -r "Microsoft.KeyVault" infra/ >/dev/null 2>&1; then
        echo "✅ Key Vault detected in infrastructure"
    else
        echo "⚠️  Key Vault not found - consider using for secrets management"
        ((issues_found++))
    fi
    
    # مینیجڈ شناخت کے استعمال کی جانچ کریں
    if grep -r "managedIdentity\|SystemAssigned\|UserAssigned" infra/ >/dev/null 2>&1; then
        echo "✅ Managed Identity configuration detected"
    else
        echo "⚠️  Managed Identity not found - consider using for service authentication"
        ((issues_found++))
    fi
    
    # HTTPS نفاذ کی جانچ کریں
    if grep -r "httpsOnly.*true\|requireHttps.*true" infra/ >/dev/null 2>&1; then
        echo "✅ HTTPS enforcement detected"
    else
        echo "⚠️  HTTPS enforcement not found - ensure secure connections"
        ((issues_found++))
    fi
    
    # کم سے کم TLS ورژن کی جانچ کریں
    if grep -r "minimumTlsVersion.*'TLS1_2'" infra/ >/dev/null 2>&1; then
        echo "✅ Minimum TLS 1.2 configuration detected"
    else
        echo "⚠️  Minimum TLS version not specified - consider requiring TLS 1.2+"
        ((issues_found++))
    fi
    
    # عوامی رسائی کی پابندیوں کی جانچ کریں
    if grep -r "allowBlobPublicAccess.*false\|publicNetworkAccess.*Disabled" infra/ >/dev/null 2>&1; then
        echo "✅ Public access restrictions detected"
    else
        echo "⚠️  Public access restrictions not found - consider limiting public access"
        ((issues_found++))
    fi
    
    # نیٹ ورک سیکیورٹی گروپس کی جانچ کریں
    if grep -r "Microsoft.Network/networkSecurityGroups" infra/ >/dev/null 2>&1; then
        echo "✅ Network Security Groups detected"
    else
        echo "ℹ️  Network Security Groups not found - may be acceptable depending on architecture"
    fi
    
    return $issues_found
}

check_compliance_requirements() {
    echo -e "\n=== Compliance Requirements Check ==="
    
    # ڈیٹا انکرپشن کی جانچ کریں
    if grep -r "encryption\|encryptionAtRest\|transparentDataEncryption" infra/ >/dev/null 2>&1; then
        echo "✅ Encryption configurations detected"
    else
        echo "⚠️  Encryption configurations not found - ensure data is encrypted"
    fi
    
    # آڈٹ لاگنگ کی جانچ کریں
    if grep -r "Microsoft.Insights.*auditingSettings\|diagnosticSettings" infra/ >/dev/null 2>&1; then
        echo "✅ Audit logging configurations detected"
    else
        echo "⚠️  Audit logging not found - consider enabling for compliance"
    fi
    
    # بیک اپ اور برقرار رکھنے کی پالیسیاں چیک کریں
    if grep -r "backup.*Policy\|retentionPolicy\|retention.*Days" infra/ >/dev/null 2>&1; then
        echo "✅ Backup and retention policies detected"
    else
        echo "⚠️  Backup/retention policies not found - required for data governance"
    fi
}

# مرکزی نفاذ
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

## CI/CD کے ساتھ انضمام

### GitHub Actions انضمام

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

### Azure DevOps انضمام

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

## بہترین عملی خلاصہ

### ✅ پری-فلائٹ چیک کی بہترین عملی مثالیں

1. **جہاں ممکن ہو خودکار بنائیں**
   - چیکس کو CI/CD پائپ لائنز میں شامل کریں
   - دہرائے جانے والے تصدیقات کے لیے اسکرپٹس استعمال کریں
   - آڈٹ ٹریلز کے لیے نتائج محفوظ کریں

2. **ماحول کے مطابق تصدیق**
   - دیو/اسٹیجنگ/پروڈ کے لیے مختلف چیکس
   - ہر ماحول کے لیے مناسب سیکیورٹی ضروریات
   - غیر پروڈکشن ماحول کے لیے لاگت کی بچت

3. **جامع کوریج**
   - توثیق اور اجازتیں
   - وسائل کے کوٹے اور دستیابی
   - سانچے کی درستگی اور نحو
   - سیکیورٹی اور تعمیل کی ضروریات

4. **واضح رپورٹنگ**
   - رنگ کوڈ والے حالت کے اشارے
   - تفصیلی غلطی کے پیغامات اور اصلاحی اقدامات
   - فوری جائزے کے لیے خلاصہ رپورٹس

5. **جلدی ناکامی**
   - اگر اہم چیکس ناکام ہوں تو تعیناتی روک دیں
   - مسئلے کے حل کے لیے واضح رہنمائی فراہم کریں
   - چیکس کو آسانی سے دوبارہ چلانے کی سہولت دیں

### عام پری-فلائٹ مشکلات

1. "تیز" تعیناتیوں کے لیے تصدیق کو نظر انداز کرنا
2. تعیناتی سے پہلے ناکافی اجازتوں کی جانچ
3. تعیناتی ناکام ہونے تک کوٹہ کی حدوں کو نظر انداز کرنا
4. CI/CD پائپ لائنز میں سانچوں کا عدم تصدیق
5. پروڈکشن ماحول کے لیے سیکیورٹی کی جانچ نہ کرنا
6. لاگت کا غیر مناسب تخمینہ جو بجٹ میں ناگہانی پیدا کرے

---

**پروفیشنل ٹپ**: پری-فلائٹ چیکس کو اپنے CI/CD پائپ لائن میں اصل تعیناتی کے کام سے پہلے ایک منفرد کام کے طور پر چلائیں۔ یہ آپ کو مسائل جلد پکڑنے اور ڈویلپرز کو تیزی سے فیڈ بیک دینے کی اجازت دیتا ہے۔

---

**نیوی گیشن**
- **پچھلا سبق**: [SKU انتخاب](sku-selection.md)
- **اگلا سبق**: [چیٹ شیٹ](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈسکلیمر**:  
اس دستاویز کا ترجمہ AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے کیا گیا ہے۔ اگرچہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار تراجم میں غلطیاں یا عدم صحت ہو سکتی ہے۔ اصل دستاویز اپنی مقامی زبان میں معتبر ذریعہ سمجھی جانی چاہیے۔ اہم معلومات کے لیے پیشہ ور انسانی ترجمے کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریحات کے لیے ہم ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
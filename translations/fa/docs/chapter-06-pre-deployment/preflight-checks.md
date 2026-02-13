# بررسی‌های پیش‌پرواز برای استقرارهای AZD

**ناوبری فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل 6 - اعتبارسنجی پیش از استقرار و برنامه‌ریزی
- **⬅️ قبلی**: [SKU Selection](sku-selection.md)
- **➡️ فصل بعدی**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/common-issues.md)
- **🔧 مرتبط**: [Chapter 4: Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

## مقدمه

این راهنمای جامع اسکریپت‌ها و روندهای اعتبارسنجی پیش از استقرار را فراهم می‌کند تا از موفقیت‌آمیز بودن استقرارهای Azure Developer CLI پیش از آغاز آن‌ها اطمینان حاصل شود. بیاموزید چگونه بررسی‌های خودکار برای احراز هویت، در دسترس بودن منابع، سهمیه‌ها، تطابق امنیتی و الزامات عملکردی را پیاده‌سازی کنید تا از شکست استقرار جلوگیری کرده و نرخ موفقیت استقرار را بهینه نمایید.

## اهداف یادگیری

با تکمیل این راهنما، شما خواهید توانست:
- تسلط بر تکنیک‌ها و اسکریپت‌های اعتبارسنجی خودکار پیش از استقرار
- درک استراتژی‌های جامع بررسی برای احراز هویت، مجوزها و سهمیه‌ها
- پیاده‌سازی روندهای اعتبارسنجی در دسترس بودن و ظرفیت منابع
- پیکربندی بررسی‌های امنیتی و انطباق با سیاست‌های سازمانی
- طراحی گردش‌کارهای برآورد هزینه و اعتبارسنجی بودجه
- ایجاد خودکارسازی چک‌های پیش‌پرواز سفارشی برای CI/CD

## دستاوردهای یادگیری

پس از تکمیل، شما قادر خواهید بود:
- ایجاد و اجرای اسکریپت‌های جامع اعتبارسنجی پیش‌پرواز
- طراحی گردش‌کارهای بررسی خودکار برای سناریوهای مختلف استقرار
- پیاده‌سازی روندها و سیاست‌های اعتبارسنجی مخصوص محیط
- پیکربندی نظارت پیشگیرانه و هشداردهی برای آمادگی استقرار
- رفع مشکلات پیش از استقرار و اجرای اقدامات اصلاحی
- یکپارچه‌سازی چک‌های پیش‌پرواز در خطوط لوله DevOps و گردش‌کارهای اتوماسیون

## فهرست مطالب

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

بررسی‌های پیش‌پرواز اعتبارسنجی‌های ضروری هستند که قبل از استقرار برای اطمینان از موارد زیر انجام می‌شوند:

- **دسترسی به منابع** و سهمیه‌ها در مناطق هدف
- **احراز هویت و مجوزها** به‌درستی پیکربندی شده‌اند
- **صحت قالب‌ها** و درستی پارامترها
- **اتصال شبکه** و وابستگی‌ها
- **تطابق امنیتی** با سیاست‌های سازمانی
- **برآورد هزینه** در چارچوب محدودیت‌های بودجه

### چه زمانی باید بررسی‌های پیش‌پرواز را اجرا کرد

- **قبل از اولین استقرار** در یک محیط جدید
- **پس از تغییرات قابل توجه در قالب‌ها**
- **قبل از استقرار در محیط تولید**
- **هنگام تغییر مناطق Azure**
- **به‌عنوان بخشی از خطوط لوله CI/CD**

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

# رنگ‌بندی خروجی
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
    
    # بررسی نصب AZD
    try {
        $azdVersion = azd version --output json | ConvertFrom-Json
        Write-Status "AZD CLI installed" "Success" "Version: $($azdVersion.azd.version)"
    }
    catch {
        Write-Status "AZD CLI not found" "Error" "Install from https://aka.ms/azd-install"
        return $false
    }
    
    # بررسی نصب Azure CLI
    try {
        $azVersion = az version --output json | ConvertFrom-Json
        Write-Status "Azure CLI installed" "Success" "Version: $($azVersion.'azure-cli')"
    }
    catch {
        Write-Status "Azure CLI not found" "Error" "Install from https://aka.ms/azcli"
        return $false
    }
    
    # بررسی نسخه PowerShell
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
        # بررسی احراز هویت AZD
        $azdAuth = azd auth login --check-status --output json 2>$null | ConvertFrom-Json
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
        }
        else {
            Write-Status "AZD authentication" "Error" "Run 'azd auth login'"
            return $false
        }
        
        # بررسی احراز هویت Azure CLI
        $azAccount = az account show --output json | ConvertFrom-Json
        Write-Status "Azure CLI authentication" "Success" "Subscription: $($azAccount.name)"
        
        # اعتبارسنجی دسترسی به اشتراک
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
        # دریافت انتساب‌های نقش کاربر فعلی
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
        
        # آزمایش ایجاد گروه منابع (در صورت مشخص بودن)
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # آزمایش توانایی ایجاد گروه منابع
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
        # بررسی سهمیه‌های محاسباتی
        $computeUsage = az vm list-usage --location $Location --output json | ConvertFrom-Json
        
        # بررسی سهمیه‌های مشخص
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
        
        # بررسی محدودیت‌های App Service
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
        
        # بررسی محدودیت‌های حساب ذخیره‌سازی
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
        return $true # غیرمسدودکننده
    }
}

function Test-NetworkConnectivity {
    Write-Host "`n${Blue}=== Network Connectivity Check ===${Reset}"
    
    # آزمایش نقاط انتهایی Azure
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
    
    # آزمایش رزولوشن DNS
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
    
    # بررسی وجود فایل azure.yaml
    if (Test-Path "azure.yaml") {
        Write-Status "azure.yaml found" "Success"
        
        # تحلیل فایل azure.yaml
        try {
            $azureYaml = Get-Content "azure.yaml" -Raw | ConvertFrom-Yaml
            Write-Status "azure.yaml parsing" "Success"
            
            # اعتبارسنجی سرویس‌ها
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
    
    # بررسی وجود فایل‌های زیرساخت
    if (Test-Path "infra") {
        $bicepFiles = Get-ChildItem -Path "infra" -Filter "*.bicep" -Recurse
        if ($bicepFiles.Count -gt 0) {
            Write-Status "Infrastructure templates" "Success" "$($bicepFiles.Count) Bicep files found"
            
            # اعتبارسنجی main.bicep در صورت وجود
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
    
    # 🧪 جدید: آزمایش پیش‌نمایش زیرساخت (اجرای خشک ایمن)
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
        # بررسی معتبر بودن منطقه
        $locations = az account list-locations --output json | ConvertFrom-Json
        $validLocation = $locations | Where-Object { $_.name -eq $Location -or $_.displayName -eq $Location }
        
        if ($validLocation) {
            Write-Status "Azure region" "Success" "Location '$Location' is valid"
        }
        else {
            Write-Status "Azure region" "Error" "Location '$Location' is not valid"
            return $false
        }
        
        # بررسی در دسترس بودن سرویس در منطقه
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
    
    # برآورد ابتدایی هزینه (برای برآورد دقیق نیاز به Azure Pricing API است)
    Write-Status "Cost estimation" "Info" "Use Azure Pricing Calculator for detailed estimates"
    Write-Status "Monitoring setup" "Info" "Set up Azure Cost Management alerts"
    
    # بررسی وجود بودجه
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
    
    # بررسی رعایت شیوه‌های امنیتی رایج
    try {
        # بررسی پیکربندی Key Vault
        if (Select-String -Path "infra/*.bicep" -Pattern "Microsoft.KeyVault" -Quiet) {
            Write-Status "Key Vault usage" "Success" "Key Vault detected in templates"
        }
        else {
            Write-Status "Key Vault usage" "Warning" "Consider using Key Vault for secrets"
        }
        
        # بررسی استفاده از هویت مدیریت‌شده
        if (Select-String -Path "infra/*.bicep" -Pattern "managedIdentity|SystemAssigned" -Quiet) {
            Write-Status "Managed Identity" "Success" "Managed Identity detected"
        }
        else {
            Write-Status "Managed Identity" "Warning" "Consider using Managed Identity"
        }
        
        # بررسی الزام HTTPS
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

# اجرای اصلی
function Invoke-PreflightCheck {
    Write-Host "${Green}AZD Pre-flight Check${Reset}" -ForegroundColor Green
    Write-Host "Environment: $EnvironmentName"
    Write-Host "Location: $Location"
    if ($ResourceGroup) { Write-Host "Resource Group: $ResourceGroup" }
    Write-Host "Time: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    Write-Host ""
    
    $allPassed = $true
    $results = @{}
    
    # اجرای همه بررسی‌ها
    $results["Prerequisites"] = Test-Prerequisites
    $results["Authentication"] = Test-Authentication
    $results["Permissions"] = Test-Permissions
    $results["QuotasAndLimits"] = Test-QuotasAndLimits
    $results["NetworkConnectivity"] = Test-NetworkConnectivity
    $results["TemplateValidation"] = Test-TemplateValidation
    $results["RegionalAvailability"] = Test-RegionalAvailability
    $results["CostEstimation"] = Test-CostEstimation
    $results["SecurityCompliance"] = Test-SecurityCompliance
    
    # خلاصه
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

# اجرای بررسی پیش‌پروازی
Invoke-PreflightCheck
```

### Bash Pre-flight Checker

```bash
#!/bin/bash
# نسخهٔ Bash از بررسی‌های پیش‌پرواز برای سیستم‌های یونیکس/لینوکس

set -euo pipefail

# کدهای رنگ
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # بدون رنگ

# متغیرهای سراسری
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
    
    # بررسی نصب AZD
    if command -v azd >/dev/null 2>&1; then
        local azd_version=$(azd version --output json | jq -r '.azd.version')
        print_status "AZD CLI installed" "success" "Version: $azd_version"
    else
        print_status "AZD CLI not found" "error" "Install from https://aka.ms/azd-install"
        return 1
    fi
    
    # بررسی نصب Azure CLI
    if command -v az >/dev/null 2>&1; then
        local az_version=$(az version --output json | jq -r '."azure-cli"')
        print_status "Azure CLI installed" "success" "Version: $az_version"
    else
        print_status "Azure CLI not found" "error" "Install from https://aka.ms/azcli"
        return 1
    fi
    
    # بررسی نصب jq
    if command -v jq >/dev/null 2>&1; then
        print_status "jq installed" "success"
    else
        print_status "jq not found" "warning" "Install jq for better JSON parsing"
    fi
    
    return 0
}

check_authentication() {
    echo -e "\n${BLUE}=== Authentication Check ===${NC}"
    
    # بررسی احراز هویت AZD
    if azd auth login --check-status >/dev/null 2>&1; then
        local principal_name=$(azd auth login --check-status --output json 2>/dev/null | jq -r '.principalName // "Unknown"')
        print_status "AZD authentication" "success" "User: $principal_name"
    else
        print_status "AZD authentication" "error" "Run 'azd auth login'"
        return 1
    fi
    
    # بررسی احراز هویت Azure CLI
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
    
    # بررسی فایل azure.yaml
    if [[ -f "azure.yaml" ]]; then
        print_status "azure.yaml found" "success"
        
        # اعتبارسنجی پایه‌ای YAML
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
    
    # بررسی فایل‌های زیرساخت
    if [[ -d "infra" ]]; then
        local bicep_count=$(find infra -name "*.bicep" | wc -l)
        if [[ $bicep_count -gt 0 ]]; then
            print_status "Infrastructure templates" "success" "$bicep_count Bicep files found"
            
            # در صورت وجود، اعتبارسنجی main.bicep
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
    
    # بررسی معتبر بودن منطقه
    if az account list-locations --query "[?name=='$LOCATION' || displayName=='$LOCATION']" --output tsv | grep -q .; then
        print_status "Azure region" "success" "Location '$LOCATION' is valid"
    else
        print_status "Azure region" "error" "Location '$LOCATION' is not valid"
        return 1
    fi
    
    # بررسی در دسترس بودن سرویس
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
    # تجزیهٔ آرگومان‌های خط فرمان
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
    
    # اعتبارسنجی پارامترهای مورد نیاز
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
    
    # اجرای بررسی‌ها
    local all_passed=true
    
    check_prerequisites || all_passed=false
    check_authentication || all_passed=false
    check_template_validation || all_passed=false
    check_regional_availability || all_passed=false
    
    # خلاصه
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

# اجرای تابع اصلی
main "$@"
```

---

## Manual Validation Checklist

### Pre-Deployment Checklist

این چک‌لیست را چاپ کنید و پیش از استقرار هر مورد را بررسی کنید:

#### ✅ تنظیم محیط
- [ ] AZD CLI نصب و به‌روز شده به آخرین نسخه
- [ ] Azure CLI نصب و احراز هویت انجام شده است
- [ ] اشتراک Azure صحیح انتخاب شده است
- [ ] نام محیط یکتا است و از قراردادهای نام‌گذاری پیروی می‌کند
- [ ] گروه منابع هدف مشخص یا قابل ایجاد است

#### ✅ احراز هویت و مجوزها
- [ ] با موفقیت با `azd auth login` احراز هویت شده‌اید
- [ ] کاربر نقش Contributor در اشتراک/گروه منابع هدف را دارد
- [ ] یک service principal برای CI/CD پیکربندی شده است (در صورت نیاز)
- [ ] هیچ گواهی‌نامه یا مدارک منقضی وجود ندارد

#### ✅ اعتبارسنجی قالب‌ها
- [ ] `azure.yaml` وجود دارد و YAML معتبری است
- [ ] همه سرویس‌های تعریف‌شده در azure.yaml دارای کد منبع متناظر هستند
- [ ] قالب‌های Bicep در دایرکتوری `infra/` موجود هستند
- [ ] `main.bicep` بدون خطا کامپایل می‌شود (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 پیش‌نمایش زیرساخت با موفقیت اجرا می‌شود (`azd provision --preview`)
- [ ] تمام پارامترهای مورد نیاز دارای مقادیر پیش‌فرض هستند یا ارائه خواهند شد
- [ ] هیچ راز یا اطلاعات محرمانه‌ای به‌صورت هاردکد در قالب‌ها وجود ندارد

#### ✅ برنامه‌ریزی منابع
- [ ] منطقه Azure هدف انتخاب و تایید شده است
- [ ] سرویس‌های مورد نیاز Azure در منطقه هدف در دسترس هستند
- [ ] سهمیه‌های کافی برای منابع برنامه‌ریزی‌شده موجود است
- [ ] تداخلات نام منابع بررسی شده‌اند
- [ ] وابستگی بین منابع درک شده است

#### ✅ شبکه و امنیت
- [ ] اتصال شبکه به نقاط انتهایی Azure تایید شده است
- [ ] تنظیمات فایروال/پراکسی در صورت نیاز پیکربندی شده‌اند
- [ ] Key Vault برای مدیریت اسرار پیکربندی شده است
- [ ] از managed identities در صورت امکان استفاده شده است
- [ ] اجرای HTTPS برای برنامه‌های وب فعال شده است

#### ✅ مدیریت هزینه
- [ ] برآوردهای هزینه با استفاده از Azure Pricing Calculator محاسبه شده‌اند
- [ ] هشدارهای بودجه در صورت نیاز پیکربندی شده‌اند
- [ ] SKUهای مناسب برای نوع محیط انتخاب شده‌اند
- [ ] ظرفیت رزرو شده برای بارهای کاری تولید در نظر گرفته شده است

#### ✅ نظارت و مشاهده‌پذیری
- [ ] Application Insights در قالب‌ها پیکربندی شده است
- [ ] Log Analytics workspace برنامه‌ریزی شده است
- [ ] قوانین هشدار برای معیارهای حیاتی تعریف شده‌اند
- [ ] نقاط انتهایی بررسی سلامت در برنامه‌ها پیاده‌سازی شده‌اند

#### ✅ پشتیبان‌گیری و بازیابی
- [ ] استراتژی پشتیبان‌گیری برای منابع داده تعریف شده است
- [ ] اهداف زمان بازیابی (RTO) مستندسازی شده‌اند
- [ ] اهداف نقطه بازیابی (RPO) مستندسازی شده‌اند
- [ ] برنامه بازیابی از فاجعه برای محیط تولید در محل وجود دارد

---

## Environment Validation

### اعتبارسنجی محیط توسعه

```bash
#!/bin/bash
# اعتبارسنجی‌های مخصوص محیط توسعه

validate_dev_environment() {
    echo "=== Development Environment Validation ==="
    
    # بررسی پیکربندی‌های مناسب توسعه
    if grep -q "sku.*Free\|sku.*F1\|sku.*Basic" infra/*.bicep; then
        echo "✓ Development-appropriate SKUs detected"
    else
        echo "⚠ Consider using lower-cost SKUs for development"
    fi
    
    # بررسی تنظیمات خاموشی خودکار
    if grep -q "autoShutdown\|deallocate" infra/*.bicep; then
        echo "✓ Auto-shutdown configuration found"
    else
        echo "ℹ Consider adding auto-shutdown for cost savings"
    fi
    
    # اعتبارسنجی پیکربندی‌های پایگاه‌داده محیط توسعه
    if grep -q "Basic\|S0\|S1" infra/*.bicep; then
        echo "✓ Development database tiers configured"
    else
        echo "⚠ Consider using Basic/Standard tiers for development databases"
    fi
}
```

### اعتبارسنجی محیط تولید

```bash
#!/bin/bash
# اعتبارسنجی‌های مربوط به محیط تولید

validate_prod_environment() {
    echo "=== Production Environment Validation ==="
    
    # بررسی پیکربندی‌های مربوط به دسترس‌پذیری بالا
    if grep -q "zoneRedundant.*true\|Premium\|Standard_GRS" infra/*.bicep; then
        echo "✓ High availability configurations detected"
    else
        echo "⚠ Consider enabling high availability for production"
    fi
    
    # بررسی پیکربندی‌های پشتیبان‌گیری
    if grep -q "backup\|retention\|pointInTimeRestore" infra/*.bicep; then
        echo "✓ Backup configurations found"
    else
        echo "⚠ Ensure backup strategies are implemented"
    fi
    
    # اعتبارسنجی تنظیمات مانیتورینگ
    if grep -q "Microsoft.Insights\|Application_Type.*web" infra/*.bicep; then
        echo "✓ Monitoring and observability configured"
    else
        echo "⚠ Add comprehensive monitoring for production"
    fi
    
    # بررسی پیکربندی‌های امنیتی
    if grep -q "Microsoft.KeyVault\|managedIdentity\|httpsOnly.*true" infra/*.bicep; then
        echo "✓ Security best practices implemented"
    else
        echo "⚠ Review security configurations for production"
    fi
}
```

---

## Resource Validation

### اسکریپت اعتبارسنجی سهمیه

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
    
    # دریافت حساب‌های ذخیره‌سازی در اشتراک
    accounts = run_command(['az', 'storage', 'account', 'list'])
    
    if accounts is None:
        print("❌ Could not retrieve storage account information")
        return False
    
    account_count = len(accounts)
    max_accounts = 250  # محدودیت پیش‌فرض Azure
    
    usage_percent = (account_count / max_accounts) * 100
    status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
    
    print(f"{status} Storage Accounts: {account_count}/{max_accounts} ({usage_percent:.1f}%)")
    
    return usage_percent < 95

def check_network_limits(location: str) -> bool:
    """Check network-related limits"""
    print(f"\n=== Network Limits Check ({location}) ===")
    
    # بررسی شبکه‌های مجازی
    vnets = run_command(['az', 'network', 'vnet', 'list'])
    if vnets is not None:
        vnet_count = len(vnets)
        print(f"✅ Virtual Networks: {vnet_count}/1000")
    
    # بررسی آدرس‌های IP عمومی
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
    
    # اجرای بررسی‌ها
    all_passed &= check_compute_quotas(location)
    all_passed &= check_storage_limits(location)
    all_passed &= check_network_limits(location)
    
    # خلاصه
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

### اسکریپت اعتبارسنجی امنیت

```bash
#!/bin/bash
# اعتبارسنجی امنیت و انطباق برای استقرارهای AZD

check_security_practices() {
    echo "=== Security Best Practices Check ==="
    
    local issues_found=0
    
    # بررسی استفاده از Key Vault
    if grep -r "Microsoft.KeyVault" infra/ >/dev/null 2>&1; then
        echo "✅ Key Vault detected in infrastructure"
    else
        echo "⚠️  Key Vault not found - consider using for secrets management"
        ((issues_found++))
    fi
    
    # بررسی استفاده از هویت مدیریت‌شده
    if grep -r "managedIdentity\|SystemAssigned\|UserAssigned" infra/ >/dev/null 2>&1; then
        echo "✅ Managed Identity configuration detected"
    else
        echo "⚠️  Managed Identity not found - consider using for service authentication"
        ((issues_found++))
    fi
    
    # بررسی الزام استفاده از HTTPS
    if grep -r "httpsOnly.*true\|requireHttps.*true" infra/ >/dev/null 2>&1; then
        echo "✅ HTTPS enforcement detected"
    else
        echo "⚠️  HTTPS enforcement not found - ensure secure connections"
        ((issues_found++))
    fi
    
    # بررسی حداقل نسخهٔ TLS
    if grep -r "minimumTlsVersion.*'TLS1_2'" infra/ >/dev/null 2>&1; then
        echo "✅ Minimum TLS 1.2 configuration detected"
    else
        echo "⚠️  Minimum TLS version not specified - consider requiring TLS 1.2+"
        ((issues_found++))
    fi
    
    # بررسی محدودیت‌های دسترسی عمومی
    if grep -r "allowBlobPublicAccess.*false\|publicNetworkAccess.*Disabled" infra/ >/dev/null 2>&1; then
        echo "✅ Public access restrictions detected"
    else
        echo "⚠️  Public access restrictions not found - consider limiting public access"
        ((issues_found++))
    fi
    
    # بررسی وجود گروه‌های امنیتی شبکه
    if grep -r "Microsoft.Network/networkSecurityGroups" infra/ >/dev/null 2>&1; then
        echo "✅ Network Security Groups detected"
    else
        echo "ℹ️  Network Security Groups not found - may be acceptable depending on architecture"
    fi
    
    return $issues_found
}

check_compliance_requirements() {
    echo -e "\n=== Compliance Requirements Check ==="
    
    # بررسی رمزنگاری داده‌ها
    if grep -r "encryption\|encryptionAtRest\|transparentDataEncryption" infra/ >/dev/null 2>&1; then
        echo "✅ Encryption configurations detected"
    else
        echo "⚠️  Encryption configurations not found - ensure data is encrypted"
    fi
    
    # بررسی ثبت لاگ‌های حسابرسی
    if grep -r "Microsoft.Insights.*auditingSettings\|diagnosticSettings" infra/ >/dev/null 2>&1; then
        echo "✅ Audit logging configurations detected"
    else
        echo "⚠️  Audit logging not found - consider enabling for compliance"
    fi
    
    # بررسی سیاست‌های پشتیبان‌گیری و نگهداری
    if grep -r "backup.*Policy\|retentionPolicy\|retention.*Days" infra/ >/dev/null 2>&1; then
        echo "✅ Backup and retention policies detected"
    else
        echo "⚠️  Backup/retention policies not found - required for data governance"
    fi
}

# اجرای اصلی
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

### ادغام با GitHub Actions

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

### ادغام با Azure DevOps

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

## خلاصه بهترین شیوه‌ها

### ✅ بهترین شیوه‌های بررسی پیش‌پرواز

1. **خودکارسازی در جایی که ممکن است**
   - چک‌ها را در خطوط لوله CI/CD یکپارچه کنید
   - از اسکریپت‌ها برای اعتبارسنجی‌های تکرارشونده استفاده کنید
   - نتایج را برای ردگیری‌های حسابرسی ذخیره کنید

2. **اعتبارسنجی مخصوص محیط**
   - چک‌های متفاوت برای dev/staging/prod
   - الزامات امنیتی مناسب برای هر محیط
   - بهینه‌سازی هزینه برای محیط‌های غیرتولیدی

3. **پوشش جامع**
   - احراز هویت و مجوزها
   - سهمیه‌ها و در دسترس بودن منابع
   - اعتبارسنجی قالب‌ها و نحو
   - نیازمندی‌های امنیتی و انطباق

4. **گزارش‌دهی شفاف**
   - نشانگرهای وضعیت با کد رنگی
   - پیام‌های خطای مفصل همراه با گام‌های رفع
   - گزارش‌های خلاصه برای ارزیابی سریع

5. **Fail Fast**
   - در صورت شکست چک‌های حیاتی، فرآیند استقرار متوقف شود
   - راهنمایی واضح برای حل مشکل ارائه شود
   - اجرای مجدد چک‌ها آسان باشد

### مشکلات رایج پیش‌پرواز

1. **رد کردن اعتبارسنجی** برای استقرارهای "سریع"
2. **بررسی ناکافی مجوزها** پیش از استقرار
3. **نادیده گرفتن محدودیت‌های سهمیه** تا زمان شکست استقرار
4. **اعتبارسنجی نکردن قالب‌ها** در خطوط لوله CI/CD
5. **نبود بررسی امنیتی** برای محیط‌های تولید
6. **برآورد ناکافی هزینه** که منجر به شگفتی در بودجه می‌شود

---

**نکته حرفه‌ای**: بررسی‌های پیش‌پرواز را به‌عنوان یک شغل جداگانه در خط لوله CI/CD خود اجرا کنید قبل از شغل استقرار واقعی. این به شما اجازه می‌دهد مسائل را زودتر شناسایی کنید و بازخورد سریع‌تری به توسعه‌دهندگان ارائه دهید.

---

**ناوبری**
- **درس قبلی**: [SKU Selection](sku-selection.md)
- **درس بعدی**: [راهنمای مختصر](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
سلب مسئولیت:
این سند با استفاده از سرویس ترجمهٔ هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. هرچند ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطا یا نادرستی باشند. سند اصلی به زبان مبدأ باید به‌عنوان مرجع معتبر در نظر گرفته شود. برای اطلاعات حساس و حیاتی، ترجمهٔ حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا تفسیر نادرستی که از استفاده از این ترجمه ناشی شود، مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
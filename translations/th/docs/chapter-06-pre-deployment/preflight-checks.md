# การตรวจสอบก่อนบินสำหรับการติดตั้ง AZD

**เมนูบทเรียน:**
- **📚 หน้าแรกคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 6 - การตรวจสอบและวางแผนก่อนติดตั้ง
- **⬅️ ก่อนหน้า**: [การเลือก SKU](sku-selection.md)
- **➡️ บทถัดไป**: [บทที่ 7: การแก้ไขปัญหา](../chapter-07-troubleshooting/common-issues.md)
- **🔧 ที่เกี่ยวข้อง**: [บทที่ 4: คู่มือการติดตั้ง](../chapter-04-infrastructure/deployment-guide.md)

## บทนำ

คู่มือที่ครอบคลุมนี้ให้สคริปต์และขั้นตอนการตรวจสอบก่อนการติดตั้งเพื่อให้แน่ใจว่าการติดตั้ง Azure Developer CLI เป็นไปอย่างสำเร็จก่อนเริ่ม Learn how to implement automated checks for authentication, resource availability, quotas, security compliance, and performance requirements เพื่อป้องกันความล้มเหลวในการติดตั้งและเพิ่มอัตราความสำเร็จของการติดตั้ง

## เป้าหมายการเรียนรู้

โดยทำตามคู่มือนี้ คุณจะได้:
- เชี่ยวชาญเทคนิคและสคริปต์การตรวจสอบอัตโนมัติก่อนติดตั้ง
- เข้าใจกลยุทธ์การตรวจสอบครอบคลุมการรับรองความถูกต้อง สิทธิ์ และโควต้า
- นำขั้นตอนการตรวจสอบความพร้อมใช้งานและความจุของทรัพยากรไปใช้
- ตั้งค่าการตรวจสอบความปลอดภัยและความสอดคล้องกับนโยบายองค์กร
- ออกแบบการประมาณค่าใช้จ่ายและการตรวจสอบงบประมาณ
- สร้างระบบตรวจสอบก่อนบินแบบอัตโนมัติสำหรับสายงาน CI/CD

## ผลลัพธ์การเรียนรู้

เมื่อสำเร็จ คุณจะสามารถ:
- สร้างและใช้งานสคริปต์ตรวจสอบก่อนบินที่ครอบคลุม
- ออกแบบเวิร์คโฟลว์ตรวจสอบอัตโนมัติสำหรับสถานการณ์การติดตั้งต่างๆ
- นำขั้นตอนและนโยบายการตรวจสอบเฉพาะสภาพแวดล้อมไปใช้
- ตั้งค่าการตรวจสอบและแจ้งเตือนล่วงหน้าสำหรับความพร้อมติดตั้ง
- แก้ไขปัญหาก่อนติดตั้งและดำเนินการแก้ไขที่เหมาะสม
- ผสานการตรวจสอบก่อนบินเข้ากับสายงาน DevOps และเวิร์คโฟลว์อัตโนมัติ

## สารบัญ

- [ภาพรวม](#ภาพรวม)
- [สคริปต์ตรวจสอบก่อนบินอัตโนมัติ](#สคริปต์ตรวจสอบก่อนบินอัตโนมัติ)
- [รายการตรวจสอบด้วยตนเอง](#codeblock1)
- [การตรวจสอบสภาพแวดล้อม](#✅-การสำรองข้อมูลและการกู้คืน)
- [การตรวจสอบทรัพยากร](#การตรวจสอบสภาพแวดล้อม-production)
- [การตรวจสอบความปลอดภัยและความสอดคล้อง](#security--compliance-checks)
- [การวางแผนประสิทธิภาพและความจุ](#performance--capacity-planning)
- [การแก้ปัญหาปัญหาทั่วไป](#troubleshooting-common-issues)

---

## ภาพรวม

การตรวจสอบก่อนบินเป็นการตรวจสอบที่จำเป็นซึ่งดำเนินการก่อนการติดตั้งเพื่อให้แน่ใจว่า:

- **ความพร้อมใช้งานของทรัพยากร** และโควต้าในภูมิภาคเป้าหมาย
- **การรับรองตัวตนและสิทธิ์** ถูกตั้งค่าอย่างถูกต้อง
- **ความถูกต้องของเทมเพลต** และพารามิเตอร์
- **การเชื่อมต่อเครือข่าย** และการพึ่งพา
- **ความสอดคล้องด้านความปลอดภัย** กับนโยบายองค์กร
- **การประมาณค่าใช้จ่าย** อยู่ในข้อจำกัดงบประมาณ

### เมื่อใดควรเรียกใช้การตรวจสอบก่อนบิน

- **ก่อนติดตั้งครั้งแรก** ในสภาพแวดล้อมใหม่
- **หลังมีการเปลี่ยนแปลงเทมเพลตครั้งสำคัญ**
- **ก่อนติดตั้งในสภาพแวดล้อมจริง (production)**
- **เมื่อเปลี่ยนภูมิภาค Azure**
- **เป็นส่วนหนึ่งของสายงาน CI/CD**

---

## สคริปต์ตรวจสอบก่อนบินอัตโนมัติ

### เครื่องมือตรวจสอบก่อนบินบน PowerShell

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

# การใส่สีสำหรับผลลัพธ์
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
    
    # ตรวจสอบการติดตั้ง AZD
    try {
        $azdVersion = azd version --output json | ConvertFrom-Json
        Write-Status "AZD CLI installed" "Success" "Version: $($azdVersion.azd.version)"
    }
    catch {
        Write-Status "AZD CLI not found" "Error" "Install from https://aka.ms/azd-install"
        return $false
    }
    
    # ตรวจสอบการติดตั้ง Azure CLI
    try {
        $azVersion = az version --output json | ConvertFrom-Json
        Write-Status "Azure CLI installed" "Success" "Version: $($azVersion.'azure-cli')"
    }
    catch {
        Write-Status "Azure CLI not found" "Error" "Install from https://aka.ms/azcli"
        return $false
    }
    
    # ตรวจสอบเวอร์ชัน PowerShell
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
        # ตรวจสอบการยืนยันตัวตน AZD
        $azdAuth = azd auth login --check-status --output json 2>$null | ConvertFrom-Json
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
        }
        else {
            Write-Status "AZD authentication" "Error" "Run 'azd auth login'"
            return $false
        }
        
        # ตรวจสอบการยืนยันตัวตน Azure CLI
        $azAccount = az account show --output json | ConvertFrom-Json
        Write-Status "Azure CLI authentication" "Success" "Subscription: $($azAccount.name)"
        
        # ตรวจสอบการเข้าถึงสมัครสมาชิก
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
        # รับการมอบหมายบทบาทของผู้ใช้ปัจจุบัน
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
        
        # ทดสอบการสร้างกลุ่มทรัพยากร (ถ้ามีการระบุ)
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # ทดสอบความสามารถในการสร้างกลุ่มทรัพยากร
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
        # ตรวจสอบโควตาคอมพิวต์
        $computeUsage = az vm list-usage --location $Location --output json | ConvertFrom-Json
        
        # ตรวจสอบโควตาเฉพาะ
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
        
        # ตรวจสอบขีดจำกัดบริการแอป
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
        
        # ตรวจสอบขีดจำกัดบัญชีเก็บข้อมูล
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
        return $true # ไม่บล็อก
    }
}

function Test-NetworkConnectivity {
    Write-Host "`n${Blue}=== Network Connectivity Check ===${Reset}"
    
    # ทดสอบจุดเชื่อมต่อ Azure
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
    
    # ทดสอบการแก้ไข DNS
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
    
    # ตรวจสอบว่า azure.yaml มีอยู่หรือไม่
    if (Test-Path "azure.yaml") {
        Write-Status "azure.yaml found" "Success"
        
        # วิเคราะห์ azure.yaml
        try {
            $azureYaml = Get-Content "azure.yaml" -Raw | ConvertFrom-Yaml
            Write-Status "azure.yaml parsing" "Success"
            
            # ตรวจสอบบริการ
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
    
    # ตรวจสอบไฟล์โครงสร้างพื้นฐาน
    if (Test-Path "infra") {
        $bicepFiles = Get-ChildItem -Path "infra" -Filter "*.bicep" -Recurse
        if ($bicepFiles.Count -gt 0) {
            Write-Status "Infrastructure templates" "Success" "$($bicepFiles.Count) Bicep files found"
            
            # ตรวจสอบ main.bicep ถ้ามีอยู่
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
    
    # 🧪 ใหม่: ทดสอบการแสดงตัวอย่างโครงสร้างพื้นฐาน (ลองรันแบบปลอดภัย)
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
        # ตรวจสอบว่าตำแหน่งถูกต้องหรือไม่
        $locations = az account list-locations --output json | ConvertFrom-Json
        $validLocation = $locations | Where-Object { $_.name -eq $Location -or $_.displayName -eq $Location }
        
        if ($validLocation) {
            Write-Status "Azure region" "Success" "Location '$Location' is valid"
        }
        else {
            Write-Status "Azure region" "Error" "Location '$Location' is not valid"
            return $false
        }
        
        # ตรวจสอบการมีบริการในภูมิภาค
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
    
    # การประมาณค่าใช้จ่ายพื้นฐาน (จะต้องใช้ Azure Pricing API สำหรับการประมาณที่แม่นยำ)
    Write-Status "Cost estimation" "Info" "Use Azure Pricing Calculator for detailed estimates"
    Write-Status "Monitoring setup" "Info" "Set up Azure Cost Management alerts"
    
    # ตรวจสอบว่ามีงบประมาณหรือไม่
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
    
    # ตรวจสอบแนวปฏิบัติด้านความปลอดภัยทั่วไป
    try {
        # ตรวจสอบว่าตั้งค่า Key Vault หรือไม่
        if (Select-String -Path "infra/*.bicep" -Pattern "Microsoft.KeyVault" -Quiet) {
            Write-Status "Key Vault usage" "Success" "Key Vault detected in templates"
        }
        else {
            Write-Status "Key Vault usage" "Warning" "Consider using Key Vault for secrets"
        }
        
        # ตรวจสอบการใช้ตัวตนที่จัดการ
        if (Select-String -Path "infra/*.bicep" -Pattern "managedIdentity|SystemAssigned" -Quiet) {
            Write-Status "Managed Identity" "Success" "Managed Identity detected"
        }
        else {
            Write-Status "Managed Identity" "Warning" "Consider using Managed Identity"
        }
        
        # ตรวจสอบการบังคับใช้ HTTPS
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

# การดำเนินการหลัก
function Invoke-PreflightCheck {
    Write-Host "${Green}AZD Pre-flight Check${Reset}" -ForegroundColor Green
    Write-Host "Environment: $EnvironmentName"
    Write-Host "Location: $Location"
    if ($ResourceGroup) { Write-Host "Resource Group: $ResourceGroup" }
    Write-Host "Time: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    Write-Host ""
    
    $allPassed = $true
    $results = @{}
    
    # รันการตรวจสอบทั้งหมด
    $results["Prerequisites"] = Test-Prerequisites
    $results["Authentication"] = Test-Authentication
    $results["Permissions"] = Test-Permissions
    $results["QuotasAndLimits"] = Test-QuotasAndLimits
    $results["NetworkConnectivity"] = Test-NetworkConnectivity
    $results["TemplateValidation"] = Test-TemplateValidation
    $results["RegionalAvailability"] = Test-RegionalAvailability
    $results["CostEstimation"] = Test-CostEstimation
    $results["SecurityCompliance"] = Test-SecurityCompliance
    
    # สรุปผล
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

# รันการตรวจสอบก่อนบิน
Invoke-PreflightCheck
```

### เครื่องมือตรวจสอบก่อนบินบน Bash

```bash
#!/bin/bash
# เวอร์ชัน Bash ของการตรวจสอบก่อนบินสำหรับระบบ Unix/Linux

set -euo pipefail

# รหัสสี
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # ไม่มีสี

# ตัวแปรทั่วโลก
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
    
    # ตรวจสอบการติดตั้ง AZD
    if command -v azd >/dev/null 2>&1; then
        local azd_version=$(azd version --output json | jq -r '.azd.version')
        print_status "AZD CLI installed" "success" "Version: $azd_version"
    else
        print_status "AZD CLI not found" "error" "Install from https://aka.ms/azd-install"
        return 1
    fi
    
    # ตรวจสอบการติดตั้ง Azure CLI
    if command -v az >/dev/null 2>&1; then
        local az_version=$(az version --output json | jq -r '."azure-cli"')
        print_status "Azure CLI installed" "success" "Version: $az_version"
    else
        print_status "Azure CLI not found" "error" "Install from https://aka.ms/azcli"
        return 1
    fi
    
    # ตรวจสอบการติดตั้ง jq
    if command -v jq >/dev/null 2>&1; then
        print_status "jq installed" "success"
    else
        print_status "jq not found" "warning" "Install jq for better JSON parsing"
    fi
    
    return 0
}

check_authentication() {
    echo -e "\n${BLUE}=== Authentication Check ===${NC}"
    
    # ตรวจสอบการยืนยันตัวตนของ AZD
    if azd auth login --check-status >/dev/null 2>&1; then
        local principal_name=$(azd auth login --check-status --output json 2>/dev/null | jq -r '.principalName // "Unknown"')
        print_status "AZD authentication" "success" "User: $principal_name"
    else
        print_status "AZD authentication" "error" "Run 'azd auth login'"
        return 1
    fi
    
    # ตรวจสอบการยืนยันตัวตนของ Azure CLI
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
    
    # ตรวจสอบ azure.yaml
    if [[ -f "azure.yaml" ]]; then
        print_status "azure.yaml found" "success"
        
        # การตรวจสอบความถูกต้องพื้นฐานของ YAML
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
    
    # ตรวจสอบไฟล์โครงสร้างพื้นฐาน
    if [[ -d "infra" ]]; then
        local bicep_count=$(find infra -name "*.bicep" | wc -l)
        if [[ $bicep_count -gt 0 ]]; then
            print_status "Infrastructure templates" "success" "$bicep_count Bicep files found"
            
            # ตรวจสอบความถูกต้องของ main.bicep หากมี
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
    
    # ตรวจสอบว่าตำแหน่งถูกต้องหรือไม่
    if az account list-locations --query "[?name=='$LOCATION' || displayName=='$LOCATION']" --output tsv | grep -q .; then
        print_status "Azure region" "success" "Location '$LOCATION' is valid"
    else
        print_status "Azure region" "error" "Location '$LOCATION' is not valid"
        return 1
    fi
    
    # ตรวจสอบความพร้อมใช้งานของบริการ
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
    # วิเคราะห์อาร์กิวเมนต์บรรทัดคำสั่ง
    while [[ $# -gt 0 ]]; ทำ
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
    
    # ตรวจสอบความถูกต้องของพารามิเตอร์ที่จำเป็น
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
    
    # รันการตรวจสอบ
    local all_passed=true
    
    check_prerequisites || all_passed=false
    check_authentication || all_passed=false
    check_template_validation || all_passed=false
    check_regional_availability || all_passed=false
    
    # สรุป
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

# รันฟังก์ชันหลัก
main "$@"
```

---

## รายการตรวจสอบด้วยตนเอง

### รายการตรวจสอบก่อนติดตั้ง

พิมพ์รายการนี้ออกและตรวจสอบแต่ละข้อก่อนติดตั้ง:

#### ✅ การตั้งค่าสภาพแวดล้อม
- [ ] ติดตั้ง AZD CLI และอัปเดตเป็นเวอร์ชันล่าสุด
- [ ] ติดตั้ง Azure CLI และเข้าสู่ระบบเรียบร้อยแล้ว
- [ ] เลือก subscription Azure ที่ถูกต้อง
- [ ] ชื่อสภาพแวดล้อมไม่ซ้ำและเป็นไปตามมาตรฐานการตั้งชื่อ
- [ ] ระบุหรือสามารถสร้าง resource group เป้าหมายได้

#### ✅ การรับรองตัวตนและสิทธิ์
- [ ] เข้าสู่ระบบสำเร็จด้วย `azd auth login`
- [ ] ผู้ใช้มีบทบาท Contributor บน subscription/resource group เป้าหมาย
- [ ] ตั้งค่า service principal สำหรับ CI/CD (ถ้ามี)
- [ ] ไม่มีใบรับรองหรือข้อมูลรับรองหมดอายุ

#### ✅ การตรวจสอบเทมเพลต
- [ ] ไฟล์ `azure.yaml` มีอยู่และเป็น YAML ที่ถูกต้อง
- [ ] บริการทั้งหมดใน azure.yaml มีซอร์สโค้ดที่สอดคล้อง
- [ ] เทมเพลต Bicep ในไดเรกทอรี `infra/` มีพร้อมใช้งาน
- [ ] ไฟล์ `main.bicep` คอมไพล์ไม่มีข้อผิดพลาด (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 แบบจำลองโครงสร้างพื้นฐาน preview รันสำเร็จ (`azd provision --preview`)
- [ ] พารามิเตอร์ที่จำเป็นทั้งหมดมีค่าเริ่มต้นหรือจะถูกกำหนด
- [ ] ไม่มีข้อมูลลับที่ฝังอยู่ในเทมเพลต

#### ✅ การวางแผนทรัพยากร
- [ ] เลือกและตรวจสอบภูมิภาค Azure เป้าหมายแล้ว
- [ ] บริการ Azure ที่ต้องการพร้อมใช้งานในภูมิภาคนั้น
- [ ] มีโควต้าที่เพียงพอสำหรับทรัพยากรที่วางแผน
- [ ] ตรวจสอบความขัดแย้งของชื่อทรัพยากร
- [ ] เข้าใจความสัมพันธ์การพึ่งพาระหว่างทรัพยากร

#### ✅ เครือข่ายและความปลอดภัย
- [ ] ตรวจสอบการเชื่อมต่อเครือข่ายไปยังจุดเชื่อมต่อ Azure
- [ ] ตั้งค่ากำแพงไฟร์วอลล์/พร็อกซีถ้าจำเป็น
- [ ] ตั้งค่า Key Vault สำหรับการจัดการความลับ
- [ ] ใช้ managed identities เท่าที่ทำได้
- [ ] เปิดใช้งาน HTTPS สำหรับเว็บแอปพลิเคชัน

#### ✅ การจัดการค่าใช้จ่าย
- [ ] ประมาณค่าใช้จ่ายโดยใช้ Azure Pricing Calculator
- [ ] ตั้งค่าการแจ้งเตืองบประมาณถ้าจำเป็น
- [ ] เลือก SKU ที่เหมาะสมกับประเภทสภาพแวดล้อม
- [ ] พิจารณาความจุสำรองสำหรับงานใน production

#### ✅ การตรวจสอบและความสามารถสังเกต
- [ ] ตั้งค่า Application Insights ในเทมเพลต
- [ ] วางแผนพื้นที่ Log Analytics
- [ ] กำหนดกฎแจ้งเตือนสำหรับเมตริกที่สำคัญ
- [ ] มี endpoint ตรวจสุขภาพในแอปพลิเคชัน

#### ✅ การสำรองข้อมูลและการกู้คืน
- [ ] กำหนดกลยุทธ์การสำรองข้อมูลสำหรับทรัพยากรข้อมูล
- [ ] ระบุ Recovery Time Objectives (RTO)
- [ ] ระบุ Recovery Point Objectives (RPO)
- [ ] มีแผน disaster recovery สำหรับ production

---

## การตรวจสอบสภาพแวดล้อม

### การตรวจสอบสภาพแวดล้อมการพัฒนา

```bash
#!/bin/bash
# การตรวจสอบเฉพาะสำหรับสภาพแวดล้อมการพัฒนา

validate_dev_environment() {
    echo "=== Development Environment Validation ==="
    
    # ตรวจสอบการตั้งค่าที่เหมาะสำหรับการพัฒนา
    if grep -q "sku.*Free\|sku.*F1\|sku.*Basic" infra/*.bicep; then
        echo "✓ Development-appropriate SKUs detected"
    else
        echo "⚠ Consider using lower-cost SKUs for development"
    fi
    
    # ตรวจสอบการตั้งค่าการปิดเครื่องอัตโนมัติ
    if grep -q "autoShutdown\|deallocate" infra/*.bicep; then
        echo "✓ Auto-shutdown configuration found"
    else
        echo "ℹ Consider adding auto-shutdown for cost savings"
    fi
    
    # ตรวจสอบความถูกต้องของการตั้งค่าฐานข้อมูลสำหรับการพัฒนา
    if grep -q "Basic\|S0\|S1" infra/*.bicep; then
        echo "✓ Development database tiers configured"
    else
        echo "⚠ Consider using Basic/Standard tiers for development databases"
    fi
}
```

### การตรวจสอบสภาพแวดล้อม production

```bash
#!/bin/bash
# การตรวจสอบเฉพาะสภาพแวดล้อมการผลิต

validate_prod_environment() {
    echo "=== Production Environment Validation ==="
    
    # ตรวจสอบการตั้งค่าความพร้อมใช้งานสูง
    if grep -q "zoneRedundant.*true\|Premium\|Standard_GRS" infra/*.bicep; then
        echo "✓ High availability configurations detected"
    else
        echo "⚠ Consider enabling high availability for production"
    fi
    
    # ตรวจสอบการตั้งค่าการสำรองข้อมูล
    if grep -q "backup\|retention\|pointInTimeRestore" infra/*.bicep; then
        echo "✓ Backup configurations found"
    else
        echo "⚠ Ensure backup strategies are implemented"
    fi
    
    # ตรวจสอบการตั้งค่าการเฝ้าติดตาม
    if grep -q "Microsoft.Insights\|Application_Type.*web" infra/*.bicep; then
        echo "✓ Monitoring and observability configured"
    else
        echo "⚠ Add comprehensive monitoring for production"
    fi
    
    # ตรวจสอบการตั้งค่าความปลอดภัย
    if grep -q "Microsoft.KeyVault\|managedIdentity\|httpsOnly.*true" infra/*.bicep; then
        echo "✓ Security best practices implemented"
    else
        echo "⚠ Review security configurations for production"
    fi
}
```

---

## การตรวจสอบทรัพยากร

### สคริปต์ตรวจสอบโควต้า

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
    
    # ดึงบัญชีเก็บข้อมูลในสมัครสมาชิก
    accounts = run_command(['az', 'storage', 'account', 'list'])
    
    if accounts is None:
        print("❌ Could not retrieve storage account information")
        return False
    
    account_count = len(accounts)
    max_accounts = 250  # ขีดจำกัด Azure เริ่มต้น
    
    usage_percent = (account_count / max_accounts) * 100
    status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
    
    print(f"{status} Storage Accounts: {account_count}/{max_accounts} ({usage_percent:.1f}%)")
    
    return usage_percent < 95

def check_network_limits(location: str) -> bool:
    """Check network-related limits"""
    print(f"\n=== Network Limits Check ({location}) ===")
    
    # ตรวจสอบเครือข่ายเสมือน
    vnets = run_command(['az', 'network', 'vnet', 'list'])
    if vnets is not None:
        vnet_count = len(vnets)
        print(f"✅ Virtual Networks: {vnet_count}/1000")
    
    # ตรวจสอบที่อยู่ IP สาธารณะ
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
    
    # รันการตรวจสอบ
    all_passed &= check_compute_quotas(location)
    all_passed &= check_storage_limits(location)
    all_passed &= check_network_limits(location)
    
    # สรุปผล
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

## การตรวจสอบความปลอดภัยและความสอดคล้อง

### สคริปต์ตรวจสอบความปลอดภัย

```bash
#!/bin/bash
# การตรวจสอบความปลอดภัยและการปฏิบัติตามสำหรับการปรับใช้ AZD

check_security_practices() {
    echo "=== Security Best Practices Check ==="
    
    local issues_found=0
    
    # ตรวจสอบการใช้งาน Key Vault
    if grep -r "Microsoft.KeyVault" infra/ >/dev/null 2>&1; then
        echo "✅ Key Vault detected in infrastructure"
    else
        echo "⚠️  Key Vault not found - consider using for secrets management"
        ((issues_found++))
    fi
    
    # ตรวจสอบการใช้งาน managed identity
    if grep -r "managedIdentity\|SystemAssigned\|UserAssigned" infra/ >/dev/null 2>&1; then
        echo "✅ Managed Identity configuration detected"
    else
        echo "⚠️  Managed Identity not found - consider using for service authentication"
        ((issues_found++))
    fi
    
    # ตรวจสอบการบังคับใช้ HTTPS
    if grep -r "httpsOnly.*true\|requireHttps.*true" infra/ >/dev/null 2>&1; then
        echo "✅ HTTPS enforcement detected"
    else
        echo "⚠️  HTTPS enforcement not found - ensure secure connections"
        ((issues_found++))
    fi
    
    # ตรวจสอบเวอร์ชัน TLS ขั้นต่ำ
    if grep -r "minimumTlsVersion.*'TLS1_2'" infra/ >/dev/null 2>&1; then
        echo "✅ Minimum TLS 1.2 configuration detected"
    else
        echo "⚠️  Minimum TLS version not specified - consider requiring TLS 1.2+"
        ((issues_found++))
    fi
    
    # ตรวจสอบข้อจำกัดการเข้าถึงสาธารณะ
    if grep -r "allowBlobPublicAccess.*false\|publicNetworkAccess.*Disabled" infra/ >/dev/null 2>&1; then
        echo "✅ Public access restrictions detected"
    else
        echo "⚠️  Public access restrictions not found - consider limiting public access"
        ((issues_found++))
    fi
    
    # ตรวจสอบกลุ่มความปลอดภัยเครือข่าย
    if grep -r "Microsoft.Network/networkSecurityGroups" infra/ >/dev/null 2>&1; then
        echo "✅ Network Security Groups detected"
    else
        echo "ℹ️  Network Security Groups not found - may be acceptable depending on architecture"
    fi
    
    return $issues_found
}

check_compliance_requirements() {
    echo -e "\n=== Compliance Requirements Check ==="
    
    # ตรวจสอบการเข้ารหัสข้อมูล
    if grep -r "encryption\|encryptionAtRest\|transparentDataEncryption" infra/ >/dev/null 2>&1; then
        echo "✅ Encryption configurations detected"
    else
        echo "⚠️  Encryption configurations not found - ensure data is encrypted"
    fi
    
    # ตรวจสอบการบันทึกการตรวจสอบ
    if grep -r "Microsoft.Insights.*auditingSettings\|diagnosticSettings" infra/ >/dev/null 2>&1; then
        echo "✅ Audit logging configurations detected"
    else
        echo "⚠️  Audit logging not found - consider enabling for compliance"
    fi
    
    # ตรวจสอบนโยบายการสำรองข้อมูลและการเก็บรักษา
    if grep -r "backup.*Policy\|retentionPolicy\|retention.*Days" infra/ >/dev/null 2>&1; then
        echo "✅ Backup and retention policies detected"
    else
        echo "⚠️  Backup/retention policies not found - required for data governance"
    fi
}

# การดำเนินการหลัก
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

## การผสานรวมกับ CI/CD

### การผสานรวมกับ GitHub Actions

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

### การผสานรวมกับ Azure DevOps

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

## สรุปแนวทางปฏิบัติที่ดีที่สุด

### ✅ แนวทางปฏิบัติที่ดีที่สุดสำหรับการตรวจสอบก่อนบิน

1. **ทำให้อัตโนมัติโดยที่เป็นไปได้**
   - ผสานการตรวจสอบเข้าในสายงาน CI/CD
   - ใช้สคริปต์สำหรับการตรวจสอบซ้ำได้
   - เก็บผลลัพธ์เพื่อการตรวจสอบย้อนหลัง

2. **การตรวจสอบเฉพาะสภาพแวดล้อม**
   - การตรวจสอบแตกต่างกันสำหรับ dev/staging/prod
   - ข้อกำหนดความปลอดภัยที่เหมาะสมสำหรับแต่ละสภาพแวดล้อม
   - การเพิ่มประสิทธิภาพค่าใช้จ่ายสำหรับสภาพแวดล้อมที่ไม่ใช่ production

3. **ครอบคลุมอย่างครบถ้วน**
   - การรับรองตัวตนและสิทธิ์
   - โควต้าและความพร้อมใช้งานของทรัพยากร
   - การตรวจสอบและไวยากรณ์เทมเพลต
   - ข้อกำหนดความปลอดภัยและความสอดคล้อง

4. **รายงานที่ชัดเจน**
   - ใช้สีแสดงสถานะ
   - ข้อความแสดงข้อผิดพลาดที่มีรายละเอียดพร้อมวิธีแก้ไข
   - รายงานสรุปเพื่อประเมินอย่างรวดเร็ว

5. **ล้มเหลวอย่างรวดเร็ว**
   - หยุดการติดตั้งหากตรวจสอบที่สำคัญล้มเหลว
   - ให้คำแนะนำชัดเจนในการแก้ไข
   - อำนวยความสะดวกในการรันตรวจสอบซ้ำง่าย

### กับดักทั่วไปของการตรวจสอบก่อนบิน

1. **ข้ามการตรวจสอบ** เพื่อการติดตั้งที่ "รวดเร็ว"
2. **ตรวจสอบสิทธิ์ไม่เพียงพอ** ก่อนติดตั้ง
3. **ไม่สนใจข้อจำกัดโควต้า** จนกว่าการติดตั้งจะล้มเหลว
4. **ไม่ตรวจสอบเทมเพลต** ในสายงาน CI/CD
5. **ขาดการตรวจสอบความปลอดภัย** สำหรับสภาพแวดล้อม production
6. **การประมาณค่าใช้จ่ายไม่เพียงพอ** นำไปสู่การเกินงบประมาณโดยไม่คาดคิด

---

**เคล็ดลับมือโปร**: เรียกใช้การตรวจสอบก่อนบินเป็นงานแยกในสายงาน CI/CD ของคุณก่อนงานติดตั้งจริง เพื่อจับปัญหาได้ตั้งแต่เนิ่นๆ และให้ข้อมูลย้อนกลับที่รวดเร็วแก่ผู้พัฒนา

---

**เมนูนำทาง**
- **บทเรียนก่อนหน้า**: [การเลือก SKU](sku-selection.md)
- **บทเรียนถัดไป**: [ใบสรุปสูตรลัด](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารฉบับนี้ได้รับการแปลโดยใช้บริการแปลภาษาด้วย AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้เราจะพยายามให้มีความถูกต้อง โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความคลาดเคลื่อน เอกสารต้นฉบับในภาษาต้นฉบับควรถูกพิจารณาเป็นแหล่งข้อมูลที่น่าเชื่อถือ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมืออาชีพที่เป็นมนุษย์ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
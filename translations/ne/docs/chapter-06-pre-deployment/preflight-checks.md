# AZD परिनियोजनहरूको लागि प्रि-फ्लाइट जाँचहरू

**अध्याय नेभिगेसन:**
- **📚 पाठ्यक्रम गृह**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: Chapter 6 - Pre-Deployment Validation & Planning
- **⬅️ अघिल्लो**: [SKU चयन](sku-selection.md)
- **➡️ अर्को अध्याय**: [अध्याय 7: समस्या समाधान](../chapter-07-troubleshooting/common-issues.md)
- **🔧 सम्बन्धित**: [अध्याय 4: परिनियोजन मार्गदर्शिका](../chapter-04-infrastructure/deployment-guide.md)

## परिचय

यो विस्तृत मार्गदर्शिकाले प्रि-डिप्लोयमेन्ट (पूर्व-परिनियोजन) मान्यकरण स्क्रिप्टहरू र प्रक्रियाहरू प्रदान गर्छ ताकि Azure Developer CLI मार्फत परिनियोजन सुरु हुनु अघि सफल परिनियोजन सुनिश्चित गर्न सकियोस्। प्रमाणिकरण, स्रोत उपलब्धता, कोटा, सुरक्षा अनुपालन, र प्रदर्शन आवश्यकताहरूका लागि स्वचालित जाँचहरू कार्यान्वयन गर्ने तरिका सिक्नुहोस् जसले परिनियोजन असफलताहरू रोक्न र सफलताको दर अनुकूलित गर्न मद्दत गर्छ।

## सिकाइ लक्ष्यहरू

यस मार्गदर्शिका पूरा गरेपछि, तपाईंले:
- स्वचालित प्रि-डिप्लोयमेन्ट मान्यकरण प्रविधिहरू र स्क्रिप्टहरूमा दक्षता हासिल गर्नुहोस्
- प्रमाणिकरण, अधिकारहरू, र कोटाहरूका लागि समग्र जाँच रणनीतिहरू बुझ्नुहोस्
- स्रोत उपलब्धता र क्षमता मान्यकरण प्रक्रियाहरू कार्यान्वयन गर्नुहोस्
- संगठनात्मक नीतिहरूका लागि सुरक्षा र अनुपालन जाँचहरू कन्फिगर गर्नुहोस्
- लागत अनुमान र बजेट मान्यकरण वर्कफ्लोहरू डिजाइन गर्नुहोस्
- CI/CD पाइपलाइनहरूको लागि कस्टम प्रि-फ्लाइट चेक अटोमेसन बनाउनुहोस्

## सिकाइ नतिजाहरू

समाप्ति पछि, तपाईं सक्षम हुनुहुनेछ:
- समग्र प्रि-फ्लाइट मान्यकरण स्क्रिप्टहरू सिर्जना र सञ्चालन गर्न
- विभिन्न परिनियोजन परिदृश्यहरूका लागि स्वचालित जाँच वर्कफ्लो डिजाइन गर्न
- वातावरण-विशेष मान्यकरण प्रक्रियाहरू र नीतिहरू कार्यान्वयन गर्न
- परिनियोजन तयारीका लागि प्राक्टिभ निगरानी र अलर्टिङ कन्फिगर गर्न
- प्रि-डिप्लोयमेन्ट समस्याहरू ट्रबलशुट गर्न र सुधारात्मक कदमहरू लागू गर्न
- प्रि-फ्लाइट चेकहरू DevOps पाइपलाइन र अटोमेसन वर्कफ्लोहरूमा एकीकृत गर्न

## सामग्री तालिका

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

प्री-फ्लाइट जाँचहरू परिनियोजन गर्नु अघि गरिने आवश्यक मान्यकरणहरू हुन् जसले सुनिश्चित गर्छन्:

- **Resource availability** र लक्षित क्षेत्रहरूमा कोटा
- **Authentication and permissions** सही तरिकाले कन्फिगर गरिएको छ
- **Template validity** र प्यारामिटरहरूको शुद्धता
- **Network connectivity** र निर्भरताहरू
- **Security compliance** संगठनात्मक नीतिहरूसँग मिल्दोजुल्दो
- **Cost estimation** बजेट सीमाहरू भित्र

### प्रि-फ्लाइट जाँचहरू कहिले चलाउने

- **नयाँ वातावरणमा पहिलो परिनियोजन अघि**
- **महत्त्वपूर्ण टेम्पलेट परिवर्तनहरू पछि**
- **उत्पादन परिनियोजन अघि**
- **Azure क्षेत्र परिवर्तन गर्दा**
- **CI/CD पाइपलाइनहरूको भागको रूपमा**

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

# आउटपुटको लागि रंग कोडिङ
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
    
    # AZD स्थापना जाँच गर्नुहोस्
    try {
        $azdVersion = azd version --output json | ConvertFrom-Json
        Write-Status "AZD CLI installed" "Success" "Version: $($azdVersion.azd.version)"
    }
    catch {
        Write-Status "AZD CLI not found" "Error" "Install from https://aka.ms/azd-install"
        return $false
    }
    
    # Azure CLI स्थापना जाँच गर्नुहोस्
    try {
        $azVersion = az version --output json | ConvertFrom-Json
        Write-Status "Azure CLI installed" "Success" "Version: $($azVersion.'azure-cli')"
    }
    catch {
        Write-Status "Azure CLI not found" "Error" "Install from https://aka.ms/azcli"
        return $false
    }
    
    # PowerShell संस्करण जाँच्नुहोस्
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
        # AZD प्रमाणीकरण जाँच्नुहोस्
        $azdAuth = azd auth login --check-status --output json 2>$null | ConvertFrom-Json
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
        }
        else {
            Write-Status "AZD authentication" "Error" "Run 'azd auth login'"
            return $false
        }
        
        # Azure CLI प्रमाणीकरण जाँच्नुहोस्
        $azAccount = az account show --output json | ConvertFrom-Json
        Write-Status "Azure CLI authentication" "Success" "Subscription: $($azAccount.name)"
        
        # सब्सक्रिप्शन पहुँच मान्य गर्नुहोस्
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
        # हालको प्रयोगकर्ताका भूमिका असाइनमेन्टहरू प्राप्त गर्नुहोस्
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
        
        # रिसोर्स समूह सिर्जना परीक्षण गर्नुहोस् (यदि निर्दिष्ट गरिएको छ)
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # रिसोर्स समूह सिर्जना गर्ने क्षमता परीक्षण गर्नुहोस्
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
        # कम्प्युट कोटा जाँच्नुहोस्
        $computeUsage = az vm list-usage --location $Location --output json | ConvertFrom-Json
        
        # विशिष्ट कोटा जाँच्नुहोस्
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
        
        # App Service सीमाहरू जाँच्नुहोस्
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
        
        # स्टोरेज अकाउन्ट सीमाहरू जाँच्नुहोस्
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
        return $true # अवरोध नगर्ने
    }
}

function Test-NetworkConnectivity {
    Write-Host "`n${Blue}=== Network Connectivity Check ===${Reset}"
    
    # Azure एन्डपोइन्टहरू परीक्षण गर्नुहोस्
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
    
    # DNS समाधान परीक्षण गर्नुहोस्
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
    
    # azure.yaml अवस्थित छ कि छैन जाँच्नुहोस्
    if (Test-Path "azure.yaml") {
        Write-Status "azure.yaml found" "Success"
        
        # azure.yaml पार्स गर्नुहोस्
        try {
            $azureYaml = Get-Content "azure.yaml" -Raw | ConvertFrom-Yaml
            Write-Status "azure.yaml parsing" "Success"
            
            # सेवाहरू मान्य गर्नुहोस्
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
    
    # पूर्वाधार फाइलहरूको जाँच गर्नुहोस्
    if (Test-Path "infra") {
        $bicepFiles = Get-ChildItem -Path "infra" -Filter "*.bicep" -Recurse
        if ($bicepFiles.Count -gt 0) {
            Write-Status "Infrastructure templates" "Success" "$($bicepFiles.Count) Bicep files found"
            
            # main.bicep अवस्थित भएमा मान्य गर्नुहोस्
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
    
    # 🧪 नयाँ: पूर्वाधार पूर्वावलोकन परीक्षण गर्नुहोस् (सुरक्षित ड्राइ-रन)
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
        # स्थान मान्य छ कि छैन जाँच्नुहोस्
        $locations = az account list-locations --output json | ConvertFrom-Json
        $validLocation = $locations | Where-Object { $_.name -eq $Location -or $_.displayName -eq $Location }
        
        if ($validLocation) {
            Write-Status "Azure region" "Success" "Location '$Location' is valid"
        }
        else {
            Write-Status "Azure region" "Error" "Location '$Location' is not valid"
            return $false
        }
        
        # क्षेत्रमा सेवाको उपलब्धता जाँच्नुहोस्
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
    
    # साधारण लागत अनुमान (ठीक अनुमानका लागि Azure Pricing API आवश्यक पर्छ)
    Write-Status "Cost estimation" "Info" "Use Azure Pricing Calculator for detailed estimates"
    Write-Status "Monitoring setup" "Info" "Set up Azure Cost Management alerts"
    
    # बजेट अवस्थित छ कि छैन जाँच्नुहोस्
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
    
    # सामान्य सुरक्षा अभ्यासहरूको लागि जाँच गर्नुहोस्
    try {
        # Key Vault कन्फिगर गरिएको छ कि छैन जाँच्नुहोस्
        if (Select-String -Path "infra/*.bicep" -Pattern "Microsoft.KeyVault" -Quiet) {
            Write-Status "Key Vault usage" "Success" "Key Vault detected in templates"
        }
        else {
            Write-Status "Key Vault usage" "Warning" "Consider using Key Vault for secrets"
        }
        
        # प्रबन्धित आइडेन्टिटीको प्रयोग जाँच्नुहोस्
        if (Select-String -Path "infra/*.bicep" -Pattern "managedIdentity|SystemAssigned" -Quiet) {
            Write-Status "Managed Identity" "Success" "Managed Identity detected"
        }
        else {
            Write-Status "Managed Identity" "Warning" "Consider using Managed Identity"
        }
        
        # HTTPS लागू गरिएको छ कि छैन जाँच्नुहोस्
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

# मुख्य कार्यान्वयन
function Invoke-PreflightCheck {
    Write-Host "${Green}AZD Pre-flight Check${Reset}" -ForegroundColor Green
    Write-Host "Environment: $EnvironmentName"
    Write-Host "Location: $Location"
    if ($ResourceGroup) { Write-Host "Resource Group: $ResourceGroup" }
    Write-Host "Time: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    Write-Host ""
    
    $allPassed = $true
    $results = @{}
    
    # सबै जाँचहरू चलाउनुहोस्
    $results["Prerequisites"] = Test-Prerequisites
    $results["Authentication"] = Test-Authentication
    $results["Permissions"] = Test-Permissions
    $results["QuotasAndLimits"] = Test-QuotasAndLimits
    $results["NetworkConnectivity"] = Test-NetworkConnectivity
    $results["TemplateValidation"] = Test-TemplateValidation
    $results["RegionalAvailability"] = Test-RegionalAvailability
    $results["CostEstimation"] = Test-CostEstimation
    $results["SecurityCompliance"] = Test-SecurityCompliance
    
    # सारांश
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

# प्री-फ्लाइट जाँच चलाउनुहोस्
Invoke-PreflightCheck
```

### Bash Pre-flight Checker

```bash
#!/bin/bash
# Unix/Linux प्रणालीहरूको लागि प्रि-फ्लाइट जाँचहरूको Bash संस्करण

set -euo pipefail

# रङ कोडहरू
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # रङ छैन

# ग्लोबल भेरिएबलहरू
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
    
    # AZD स्थापना जाँच गर्नुहोस्
    if command -v azd >/dev/null 2>&1; then
        local azd_version=$(azd version --output json | jq -r '.azd.version')
        print_status "AZD CLI installed" "success" "Version: $azd_version"
    else
        print_status "AZD CLI not found" "error" "Install from https://aka.ms/azd-install"
        return 1
    fi
    
    # Azure CLI स्थापना जाँच गर्नुहोस्
    if command -v az >/dev/null 2>&1; then
        local az_version=$(az version --output json | jq -r '."azure-cli"')
        print_status "Azure CLI installed" "success" "Version: $az_version"
    else
        print_status "Azure CLI not found" "error" "Install from https://aka.ms/azcli"
        return 1
    fi
    
    # jq स्थापना जाँच गर्नुहोस्
    if command -v jq >/dev/null 2>&1; then
        print_status "jq installed" "success"
    else
        print_status "jq not found" "warning" "Install jq for better JSON parsing"
    fi
    
    return 0
}

check_authentication() {
    echo -e "\n${BLUE}=== Authentication Check ===${NC}"
    
    # AZD प्रमाणीकरण जाँच गर्नुहोस्
    if azd auth login --check-status >/dev/null 2>&1; then
        local principal_name=$(azd auth login --check-status --output json 2>/dev/null | jq -r '.principalName // "Unknown"')
        print_status "AZD authentication" "success" "User: $principal_name"
    else
        print_status "AZD authentication" "error" "Run 'azd auth login'"
        return 1
    fi
    
    # Azure CLI प्रमाणीकरण जाँच गर्नुहोस्
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
    
    # azure.yaml जाँच गर्नुहोस्
    if [[ -f "azure.yaml" ]]; then
        print_status "azure.yaml found" "success"
        
        # आधारभूत YAML मान्यकरण
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
    
    # पूर्वाधार फाइलहरू जाँच गर्नुहोस्
    if [[ -d "infra" ]]; then
        local bicep_count=$(find infra -name "*.bicep" | wc -l)
        if [[ $bicep_count -gt 0 ]]; then
            print_status "Infrastructure templates" "success" "$bicep_count Bicep files found"
            
            # यदि अस्तित्वमा छ भने main.bicep मान्य गर्नुहोस्
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
    
    # स्थान मान्य छ कि छैन जाँच्नुहोस्
    if az account list-locations --query "[?name=='$LOCATION' || displayName=='$LOCATION']" --output tsv | grep -q .; then
        print_status "Azure region" "success" "Location '$LOCATION' is valid"
    else
        print_status "Azure region" "error" "Location '$LOCATION' is not valid"
        return 1
    fi
    
    # सेवा उपलब्धता जाँच्नुहोस्
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
    # कमाण्ड लाइन तर्कहरू पार्स गर्नुहोस्
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
    
    # आवश्यक प्यारामिटरहरू मान्य गर्नुहोस्
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
    
    # जाँचहरू चलाउनुहोस्
    local all_passed=true
    
    check_prerequisites || all_passed=false
    check_authentication || all_passed=false
    check_template_validation || all_passed=false
    check_regional_availability || all_passed=false
    
    # सारांश
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

# मुख्य फङ्क्शन चलाउनुहोस्
main "$@"
```

---

## Manual Validation Checklist

### Pre-Deployment Checklist

यो चेकलिस्ट प्रिन्ट गरेर परिनियोजन अघि प्रत्येक वस्तु प्रमाणित गर्नुहोस्:

#### ✅ Environment Setup
- [ ] AZD CLI इन्स्टल गरिएको र नवीनतम संस्करणमा अपडेट गरिएको छ
- [ ] Azure CLI इन्स्टल गरिएको र प्रमाणिकरण गरिएको छ
- [ ] सहि Azure subscription चयन गरिएको छ
- [ ] वातावरणको नाम अनन्य छ र नामकरण मान्यताहरू पालना गर्दछ
- [ ] लक्षित resource group पहिचान गरिएको छ वा सिर्जना गर्न सकिन्छ

#### ✅ Authentication & Permissions
- [ ] सफलतापूर्वक प्रमाणिकरण गरिएको छ `azd auth login`
- [ ] प्रयोगकर्तासँग लक्ष्य subscription/resource group मा Contributor भूमिका छ
- [ ] CI/CD का लागि service principal कन्फिगर गरिएको छ (यदि लागू हुन्छ)
- [ ] कुनै म्यादिएको प्रमाणपत्र वा क्रेडेन्शियलहरू छैनन्

#### ✅ Template Validation
- [ ] `azure.yaml` अवस्थित छ र मान्य YAML छ
- [ ] azure.yaml मा परिभाषित सबै सेवाहरूको लागि सम्बन्धित स्रोत कोड छ
- [ ] `infra/` निर्देशिकामा Bicep टेम्पलेटहरू उपस्थित छन्
- [ ] `main.bicep` त्रुटिविना कम्पाइल हुन्छ (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 Infrastructure preview सफलतापूर्वक चल्छ (`azd provision --preview`)
- [ ] आवश्यक सबै प्यारामिटरहरूको डिफल्ट मान छ वा प्रदान गरिनेछ
- [ ] टेम्पलेटहरूमा हार्डकोड गरिएको गोप्य कुरा छैन

#### ✅ Resource Planning
- [ ] लक्षित Azure क्षेत्र चयन र मान्य गरिएको छ
- [ ] लक्षित क्षेत्रमा आवश्यक Azure सेवाहरू उपलब्ध छन्
- [ ] योजनाबद्ध स्रोतहरूको लागि पर्याप्त कोटा उपलब्ध छ
- [ ] स्रोत नामकरण द्वन्द्वहरू जाँचिएको छ
- [ ] स्रोतहरू बीचको निर्भरताहरू बुझिएको छ

#### ✅ Network & Security
- [ ] Azure endpoint हरूमा नेटवर्क कनेक्टिविटी प्रमाणित गरिएको छ
- [ ] आवश्यक परेमा फायरवाल/प्रोक्सी सेटिङहरू कन्फिगर गरिएको छ
- [ ] गोप्य व्यवस्थापनका लागि Key Vault कन्फिगर गरिएको छ
- [ ] जहाँ सम्भव छ Managed identities प्रयोग गरिएको छ
- [ ] वेब अनुप्रयोगहरूका लागि HTTPS लागू गरिएको छ

#### ✅ Cost Management
- [ ] Azure Pricing Calculator प्रयोग गरी लागत अनुमान गणना गरिएको छ
- [ ] आवश्यक परेमा बजेट अलर्टहरू कन्फिगर गरिएको छ
- [ ] वातावरण प्रकारका लागि उपयुक्त SKU हरू चयन गरिएको छ
- [ ] उत्पादन वर्कलोडहरूको लागि Reserved capacity विचार गरिएको छ

#### ✅ Monitoring & Observability
- [ ] Application Insights टेम्पलेटहरूमा कन्फिगर गरिएको छ
- [ ] Log Analytics workspace योजना बनाइएको छ
- [ ] महत्वपूर्ण मेट्रिक्सका लागि अलर्ट नियमहरू परिभाषित गरिएका छन्
- [ ] अनुप्रयोगहरूमा हेल्थ चेक endpoints लागू गरिएका छन्

#### ✅ Backup & Recovery
- [ ] डेटा स्रोतहरूको लागि ब्याकअप रणनीति परिभाषित गरिएको छ
- [ ] Recovery time objectives (RTO) दस्तावेज गरिएको छ
- [ ] Recovery point objectives (RPO) दस्तावेज गरिएको छ
- [ ] उत्पादनका लागि डिजास्टर रिकभरी योजना रहेको छ

---

## Environment Validation

### Development Environment Validation

```bash
#!/bin/bash
# विकास वातावरणसँग सम्बन्धित विशेष मान्यकरणहरू

validate_dev_environment() {
    echo "=== Development Environment Validation ==="
    
    # विकासमैत्री कन्फिगरेसनहरूको लागि जाँच
    if grep -q "sku.*Free\|sku.*F1\|sku.*Basic" infra/*.bicep; then
        echo "✓ Development-appropriate SKUs detected"
    else
        echo "⚠ Consider using lower-cost SKUs for development"
    fi
    
    # स्वचालित बन्द कन्फिगरेसनहरूको लागि जाँच
    if grep -q "autoShutdown\|deallocate" infra/*.bicep; then
        echo "✓ Auto-shutdown configuration found"
    else
        echo "ℹ Consider adding auto-shutdown for cost savings"
    fi
    
    # विकास डेटाबेस कन्फिगरेसनहरूको मान्यकरण
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
# उत्पादन वातावरणका विशिष्ट जाँचहरू

validate_prod_environment() {
    echo "=== Production Environment Validation ==="
    
    # उच्च उपलब्धता कन्फिगरेसनहरूको जाँच गर्नुहोस्
    if grep -q "zoneRedundant.*true\|Premium\|Standard_GRS" infra/*.bicep; then
        echo "✓ High availability configurations detected"
    else
        echo "⚠ Consider enabling high availability for production"
    fi
    
    # ब्याकअप कन्फिगरेसनहरूको जाँच गर्नुहोस्
    if grep -q "backup\|retention\|pointInTimeRestore" infra/*.bicep; then
        echo "✓ Backup configurations found"
    else
        echo "⚠ Ensure backup strategies are implemented"
    fi
    
    # अनुगमन सेटअप मान्य गर्नुहोस्
    if grep -q "Microsoft.Insights\|Application_Type.*web" infra/*.bicep; then
        echo "✓ Monitoring and observability configured"
    else
        echo "⚠ Add comprehensive monitoring for production"
    fi
    
    # सुरक्षा कन्फिगरेसनहरूको जाँच गर्नुहोस्
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
    
    # सब्स्क्रिप्शनमा स्टोरेज खाताहरू प्राप्त गर्नुहोस्
    accounts = run_command(['az', 'storage', 'account', 'list'])
    
    if accounts is None:
        print("❌ Could not retrieve storage account information")
        return False
    
    account_count = len(accounts)
    max_accounts = 250  # पूर्वनिर्धारित Azure सीमा
    
    usage_percent = (account_count / max_accounts) * 100
    status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
    
    print(f"{status} Storage Accounts: {account_count}/{max_accounts} ({usage_percent:.1f}%)")
    
    return usage_percent < 95

def check_network_limits(location: str) -> bool:
    """Check network-related limits"""
    print(f"\n=== Network Limits Check ({location}) ===")
    
    # आभासी नेटवर्कहरू जाँच गर्नुहोस्
    vnets = run_command(['az', 'network', 'vnet', 'list'])
    if vnets is not None:
        vnet_count = len(vnets)
        print(f"✅ Virtual Networks: {vnet_count}/1000")
    
    # सार्वजनिक IP ठेगानाहरू जाँच गर्नुहोस्
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
    
    # जाँचहरू चलाउनुहोस्
    all_passed &= check_compute_quotas(location)
    all_passed &= check_storage_limits(location)
    all_passed &= check_network_limits(location)
    
    # सारांश
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
# AZD परिनियोजनहरूको लागि सुरक्षा र अनुरूपता प्रमाणीकरण

check_security_practices() {
    echo "=== Security Best Practices Check ==="
    
    local issues_found=0
    
    # Key Vault प्रयोगको जाँच
    if grep -r "Microsoft.KeyVault" infra/ >/dev/null 2>&1; then
        echo "✅ Key Vault detected in infrastructure"
    else
        echo "⚠️  Key Vault not found - consider using for secrets management"
        ((issues_found++))
    fi
    
    # Managed Identity प्रयोगको जाँच
    if grep -r "managedIdentity\|SystemAssigned\|UserAssigned" infra/ >/dev/null 2>&1; then
        echo "✅ Managed Identity configuration detected"
    else
        echo "⚠️  Managed Identity not found - consider using for service authentication"
        ((issues_found++))
    fi
    
    # HTTPS अनिवार्यताको जाँच
    if grep -r "httpsOnly.*true\|requireHttps.*true" infra/ >/dev/null 2>&1; then
        echo "✅ HTTPS enforcement detected"
    else
        echo "⚠️  HTTPS enforcement not found - ensure secure connections"
        ((issues_found++))
    fi
    
    # न्यूनतम TLS संस्करणको जाँच
    if grep -r "minimumTlsVersion.*'TLS1_2'" infra/ >/dev/null 2>&1; then
        echo "✅ Minimum TLS 1.2 configuration detected"
    else
        echo "⚠️  Minimum TLS version not specified - consider requiring TLS 1.2+"
        ((issues_found++))
    fi
    
    # सार्वजनिक पहुँच प्रतिबन्धहरूको जाँच
    if grep -r "allowBlobPublicAccess.*false\|publicNetworkAccess.*Disabled" infra/ >/dev/null 2>&1; then
        echo "✅ Public access restrictions detected"
    else
        echo "⚠️  Public access restrictions not found - consider limiting public access"
        ((issues_found++))
    fi
    
    # नेटवर्क सुरक्षा समूहहरूको जाँच
    if grep -r "Microsoft.Network/networkSecurityGroups" infra/ >/dev/null 2>&1; then
        echo "✅ Network Security Groups detected"
    else
        echo "ℹ️  Network Security Groups not found - may be acceptable depending on architecture"
    fi
    
    return $issues_found
}

check_compliance_requirements() {
    echo -e "\n=== Compliance Requirements Check ==="
    
    # डेटा इन्क्रिप्सनको जाँच
    if grep -r "encryption\|encryptionAtRest\|transparentDataEncryption" infra/ >/dev/null 2>&1; then
        echo "✅ Encryption configurations detected"
    else
        echo "⚠️  Encryption configurations not found - ensure data is encrypted"
    fi
    
    # अडिट लगिङको जाँच
    if grep -r "Microsoft.Insights.*auditingSettings\|diagnosticSettings" infra/ >/dev/null 2>&1; then
        echo "✅ Audit logging configurations detected"
    else
        echo "⚠️  Audit logging not found - consider enabling for compliance"
    fi
    
    # ब्याकअप र प्रतिधारण नीतिहरूको जाँच
    if grep -r "backup.*Policy\|retentionPolicy\|retention.*Days" infra/ >/dev/null 2>&1; then
        echo "✅ Backup and retention policies detected"
    else
        echo "⚠️  Backup/retention policies not found - required for data governance"
    fi
}

# मुख्य कार्यान्वयन
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

1. **जहाँ सम्भव स्वचालित गर्नुहोस्**
   - जाँचहरू CI/CD पाइपलाइनमा एकीकृत गर्नुहोस्
   - दोहोरिने मान्यकरणका लागि स्क्रिप्टहरू प्रयोग गर्नुहोस्
   - अडिट ट्रेलहरूका लागि परिणामहरू स्टोर गर्नुहोस्

2. **पर्यावरण-विशेष मान्यकरण**
   - dev/staging/prod का लागि फरक जाँचहरू
   - वातावरण अनुसार उपयुक्त सुरक्षा आवश्यकताहरू
   - गैर-उत्पादन वातावरणहरूको लागि लागत अनुकूलन

3. **समग्र कवरेज**
   - प्रमाणिकरण र अधिकारहरू
   - स्रोत कोटा र उपलब्धता
   - टेम्पलेट मान्यकरण र सिन्ट्याक्स
   - सुरक्षा र अनुपालन आवश्यकताहरू

4. **स्पष्ट प्रतिवेदन**
   - रङ्ग-कोड गरिएका स्थिति संकेतकहरू
   - समाधानका कदमहरूसँग विस्तृत त्रुटि सन्देशहरू
   - द्रुत मूल्याङ्कनका लागि सारांश प्रतिवेदनहरू

5. **असफल हुँदा तुरुन्त रोक्नुहोस्**
   - महत्त्वपूर्ण जाँचहरू असफल भएमा परिनियोजन रोक्नुहोस्
   - समाधानका लागि स्पष्ट मार्गदर्शन दिनुहोस्
   - जाँचहरू सजिलै पुनः चलाउन सक्षम बनाउनुहोस्

### सामान्य प्रि-फ्लाइट त्रुटिहरू

1. "छिटो" परिनियोजनका लागि मान्यकरण स्किप गर्नु
2. परिनियोजन अघि अपर्याप्त अधिकार जाँच
3. कोटा सीमाहरूलाई परिनियोजन असफल हुन नदुईसम्म बेवास्ता गर्नु
4. CI/CD पाइपलाइनहरूमा टेम्पलेटहरू मान्य नगर्नु
5. उत्पादन वातावरणका लागि सुरक्षा मान्यकरण छुटाउनु
6. अपर्याप्त लागत अनुमान जसले बजेट आश्चर्य ल्याउँछ

---

**प्रो टिप**: वास्तविक परिनियोजन जॉब अघि तपाईंको CI/CD पाइपलाइनमा प्रि-फ्लाइट जाँचहरू अलग जॉबको रूपमा चलाउनुहोस्। यसले समस्याहरू छिटो कैच गर्न मद्दत गर्छ र विकासकर्ताहरूप्रति छिटो प्रतिक्रिया प्रदान गर्छ।

---

**नेभिगेसन**
- **अघिल्लो पाठ**: [SKU चयन](sku-selection.md)
- **अर्को पाठ**: [Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुनसक्छ। मूल भाषामा रहेको दस्तावेजलाई अधिकारिक स्रोत मानिनु पर्छ। संवेदनशील वा महत्वपूर्ण जानकारीका लागि पेशेवर मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा गलत व्याख्याका लागि हामी उत्तरदायी रहनेछैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
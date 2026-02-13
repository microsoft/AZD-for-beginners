# AZD तैनाती के लिए प्री-फ़्लाइट चेक

**अध्याय नेविगेशन:**
- **📚 Course Home**: [AZD शुरुआती के लिए](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 6 - पूर्व-तैनाती सत्यापन और योजना
- **⬅️ पिछला**: [SKU चयन](sku-selection.md)
- **➡️ अगला अध्याय**: [अध्याय 7: समस्या निवारण](../chapter-07-troubleshooting/common-issues.md)
- **🔧 संबंधित**: [अध्याय 4: तैनाती मार्गदर्शिका](../chapter-04-infrastructure/deployment-guide.md)

## परिचय

यह व्यापक गाइड प्री-डिप्लॉयमेंट सत्यापन स्क्रिप्ट्स और प्रक्रियाएँ प्रदान करती है ताकि Azure Developer CLI की तैनाती शुरू होने से पहले सफल हों। प्रमाणीकरण, संसाधन उपलब्धता, कोटा, सुरक्षा अनुपालन, और प्रदर्शन आवश्यकताओं के लिए स्वचालित जांचें लागू करना सीखें ताकि तैनाती विफलताओं को रोका जा सके और तैनाती सफलता दरों को अनुकूलित किया जा सके।

## सीखने के लक्ष्य

By completing this guide, you will:
- प्री-डिप्लॉयमेंट स्वचालित सत्यापन तकनीकों और स्क्रिप्ट्स में महारत हासिल करें
- प्रमाणीकरण, अनुमतियों और कोटा के लिए व्यापक जाँच रणनीतियों को समझें
- संसाधन उपलब्धता और क्षमता सत्यापन प्रक्रियाओं को लागू करें
- संगठनात्मक नीतियों के लिए सुरक्षा और अनुपालन जांचों को कॉन्फ़िगर करें
- लागत अनुमान और बजट सत्यापन वर्कफ़्लो डिज़ाइन करें
- CI/CD पाइपलाइनों के लिए कस्टम प्री-फ़्लाइट चेक ऑटोमेशन बनाएं

## सीखने के परिणाम

Upon completion, you will be able to:
- व्यापक प्री-फ़्लाइट सत्यापन स्क्रिप्ट्स बनाना और चलाना
- विभिन्न तैनाती परिदृश्यों के लिए स्वचालित जाँच वर्कफ़्लो डिज़ाइन करना
- पर्यावरण-विशिष्ट सत्यापन प्रक्रियाओं और नीतियों को लागू करना
- तैनाती तत्परता के लिए सक्रिय मॉनिटरिंग और अलर्टिंग कॉन्फ़िगर करना
- प्री-डिप्लॉयमेंट समस्याओं का निवारण करना और सुधारात्मक कार्रवाइयां लागू करना
- प्री-फ़्लाइट चेक्स को DevOps पाइपलाइनों और ऑटोमेशन वर्कफ़्लो में एकीकृत करना

## सामग्री तालिका

- [अवलोकन](../../../../docs/chapter-06-pre-deployment)
- [स्वचालित प्री-फ़्लाइट स्क्रिप्ट](../../../../docs/chapter-06-pre-deployment)
- [मैन्युअल सत्यापन चेकलिस्ट](../../../../docs/chapter-06-pre-deployment)
- [पर्यावरण सत्यापन](../../../../docs/chapter-06-pre-deployment)
- [संसाधन सत्यापन](../../../../docs/chapter-06-pre-deployment)
- [सुरक्षा और अनुपालन जांचें](../../../../docs/chapter-06-pre-deployment)
- [प्रदर्शन और क्षमता योजना](../../../../docs/chapter-06-pre-deployment)
- [सामान्य समस्याओं का निवारण](../../../../docs/chapter-06-pre-deployment)

---

## अवलोकन

प्री-फ़्लाइट चेक्स तैनाती से पहले किए जाने वाले आवश्यक सत्यापनों हैं जो सुनिश्चित करते हैं:

- **संसाधन उपलब्धता** और लक्षित क्षेत्रों में कोटा
- **प्रमाणिकरण और अनुमतियाँ** सही ढंग से कॉन्फ़िगर हैं
- **टेम्पलेट वैधता** और पैरामीटर की सत्यता
- **नेटवर्क कनेक्टिविटी** और निर्भरताएँ
- **सुरक्षा अनुपालन** संगठनात्मक नीतियों के अनुसार
- **लागत अनुमान** बजट सीमाओं के भीतर

### प्री-फ़्लाइट चेक कब चलाएँ

- **पहली तैनाती से पहले** किसी नए वातावरण में
- **महत्वपूर्ण टेम्प्लेट परिवर्तनों के बाद**
- **उत्पादन तैनातियों से पहले**
- **Azure क्षेत्रों को बदलने पर**
- **CI/CD पाइपलाइनों का हिस्सा होने पर**

---

## स्वचालित प्री-फ़्लाइट स्क्रिप्ट

### PowerShell प्री-फ़्लाइट चेकर

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

# आउटपुट के लिए रंग-कोडिंग
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
    
    # AZD स्थापना की जाँच
    try {
        $azdVersion = azd version --output json | ConvertFrom-Json
        Write-Status "AZD CLI installed" "Success" "Version: $($azdVersion.azd.version)"
    }
    catch {
        Write-Status "AZD CLI not found" "Error" "Install from https://aka.ms/azd-install"
        return $false
    }
    
    # Azure CLI स्थापना की जाँच
    try {
        $azVersion = az version --output json | ConvertFrom-Json
        Write-Status "Azure CLI installed" "Success" "Version: $($azVersion.'azure-cli')"
    }
    catch {
        Write-Status "Azure CLI not found" "Error" "Install from https://aka.ms/azcli"
        return $false
    }
    
    # PowerShell संस्करण की जाँच
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
        # AZD प्रमाणीकरण की जाँच
        $azdAuth = azd auth login --check-status --output json 2>$null | ConvertFrom-Json
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
        }
        else {
            Write-Status "AZD authentication" "Error" "Run 'azd auth login'"
            return $false
        }
        
        # Azure CLI प्रमाणीकरण की जाँच
        $azAccount = az account show --output json | ConvertFrom-Json
        Write-Status "Azure CLI authentication" "Success" "Subscription: $($azAccount.name)"
        
        # सब्सक्रिप्शन पहुँच सत्यापित करें
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
        # वर्तमान उपयोगकर्ता के रोल-असाइनमेंट प्राप्त करें
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
        
        # संसाधन समूह निर्माण का परीक्षण (यदि निर्दिष्ट हो)
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # संसाधन समूह बनाने की क्षमता का परीक्षण
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
        # कंप्यूट कोटा की जाँच
        $computeUsage = az vm list-usage --location $Location --output json | ConvertFrom-Json
        
        # विशिष्ट कोटा की जाँच
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
        
        # App Service सीमाओं की जाँच
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
        
        # स्टोरेज अकाउंट सीमाओं की जाँच
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
        return $true # नॉन-ब्लॉकिंग
    }
}

function Test-NetworkConnectivity {
    Write-Host "`n${Blue}=== Network Connectivity Check ===${Reset}"
    
    # Azure एंडपॉइंट्स का परीक्षण
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
    
    # DNS रिज़ॉल्यूशन का परीक्षण
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
    
    # जाँचें कि azure.yaml मौजूद है
    if (Test-Path "azure.yaml") {
        Write-Status "azure.yaml found" "Success"
        
        # azure.yaml पार्स करें
        try {
            $azureYaml = Get-Content "azure.yaml" -Raw | ConvertFrom-Yaml
            Write-Status "azure.yaml parsing" "Success"
            
            # सेवाओं को मान्य करें
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
    
    # इन्फ्रास्ट्रक्चर फ़ाइलों की जाँच
    if (Test-Path "infra") {
        $bicepFiles = Get-ChildItem -Path "infra" -Filter "*.bicep" -Recurse
        if ($bicepFiles.Count -gt 0) {
            Write-Status "Infrastructure templates" "Success" "$($bicepFiles.Count) Bicep files found"
            
            # यदि मौजूद हो तो main.bicep को मान्य करें
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
    
    # 🧪 नया: इन्फ्रास्ट्रक्चर पूर्वावलोकन का परीक्षण (सुरक्षित ड्राई-रन)
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
        # जाँचें कि स्थान मान्य है या नहीं
        $locations = az account list-locations --output json | ConvertFrom-Json
        $validLocation = $locations | Where-Object { $_.name -eq $Location -or $_.displayName -eq $Location }
        
        if ($validLocation) {
            Write-Status "Azure region" "Success" "Location '$Location' is valid"
        }
        else {
            Write-Status "Azure region" "Error" "Location '$Location' is not valid"
            return $false
        }
        
        # क्षेत्र में सेवा उपलब्धता की जाँच
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
    
    # बुनियादी लागत का अनुमान (सटीक अनुमान के लिए Azure प्राइसिंग API की आवश्यकता होगी)
    Write-Status "Cost estimation" "Info" "Use Azure Pricing Calculator for detailed estimates"
    Write-Status "Monitoring setup" "Info" "Set up Azure Cost Management alerts"
    
    # जाँचें कि बजट मौजूद है या नहीं
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
    
    # सामान्य सुरक्षा प्रथाओं की जाँच
    try {
        # जाँचें कि Key Vault कॉन्फ़िगर है या नहीं
        if (Select-String -Path "infra/*.bicep" -Pattern "Microsoft.KeyVault" -Quiet) {
            Write-Status "Key Vault usage" "Success" "Key Vault detected in templates"
        }
        else {
            Write-Status "Key Vault usage" "Warning" "Consider using Key Vault for secrets"
        }
        
        # मैनेज्ड आइडेंटिटी के उपयोग की जाँच
        if (Select-String -Path "infra/*.bicep" -Pattern "managedIdentity|SystemAssigned" -Quiet) {
            Write-Status "Managed Identity" "Success" "Managed Identity detected"
        }
        else {
            Write-Status "Managed Identity" "Warning" "Consider using Managed Identity"
        }
        
        # HTTPS लागू होने की जाँच
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

# मुख्य निष्पादन
function Invoke-PreflightCheck {
    Write-Host "${Green}AZD Pre-flight Check${Reset}" -ForegroundColor Green
    Write-Host "Environment: $EnvironmentName"
    Write-Host "Location: $Location"
    if ($ResourceGroup) { Write-Host "Resource Group: $ResourceGroup" }
    Write-Host "Time: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    Write-Host ""
    
    $allPassed = $true
    $results = @{}
    
    # सभी जाँच चलाएँ
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

# प्री-फ्लाइट चेक चलाएँ
Invoke-PreflightCheck
```

### Bash प्री-फ़्लाइट चेकर

```bash
#!/bin/bash
# Unix/Linux सिस्टम के लिए प्री-फ़्लाइट जांचों का Bash संस्करण

set -euo pipefail

# रंग कोड
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # कोई रंग नहीं

# ग्लोबल वेरिएबल्स
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
    
    # AZD इंस्टॉलेशन की जाँच
    if command -v azd >/dev/null 2>&1; then
        local azd_version=$(azd version --output json | jq -r '.azd.version')
        print_status "AZD CLI installed" "success" "Version: $azd_version"
    else
        print_status "AZD CLI not found" "error" "Install from https://aka.ms/azd-install"
        return 1
    fi
    
    # Azure CLI इंस्टॉलेशन की जाँच
    if command -v az >/dev/null 2>&1; then
        local az_version=$(az version --output json | jq -r '."azure-cli"')
        print_status "Azure CLI installed" "success" "Version: $az_version"
    else
        print_status "Azure CLI not found" "error" "Install from https://aka.ms/azcli"
        return 1
    fi
    
    # jq इंस्टॉलेशन की जाँच
    if command -v jq >/dev/null 2>&1; then
        print_status "jq installed" "success"
    else
        print_status "jq not found" "warning" "Install jq for better JSON parsing"
    fi
    
    return 0
}

check_authentication() {
    echo -e "\n${BLUE}=== Authentication Check ===${NC}"
    
    # AZD प्रमाणीकरण की जाँच
    if azd auth login --check-status >/dev/null 2>&1; then
        local principal_name=$(azd auth login --check-status --output json 2>/dev/null | jq -r '.principalName // "Unknown"')
        print_status "AZD authentication" "success" "User: $principal_name"
    else
        print_status "AZD authentication" "error" "Run 'azd auth login'"
        return 1
    fi
    
    # Azure CLI प्रमाणीकरण की जाँच
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
    
    # azure.yaml की जाँच
    if [[ -f "azure.yaml" ]]; then
        print_status "azure.yaml found" "success"
        
        # बुनियादी YAML सत्यापन
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
    
    # इन्फ्रास्ट्रक्चर फ़ाइलों की जाँच
    if [[ -d "infra" ]]; then
        local bicep_count=$(find infra -name "*.bicep" | wc -l)
        if [[ $bicep_count -gt 0 ]]; then
            print_status "Infrastructure templates" "success" "$bicep_count Bicep files found"
            
            # यदि मौजूद हो तो main.bicep को मान्य करें
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
    
    # जांचें कि स्थान मान्य है या नहीं
    if az account list-locations --query "[?name=='$LOCATION' || displayName=='$LOCATION']" --output tsv | grep -q .; then
        print_status "Azure region" "success" "Location '$LOCATION' is valid"
    else
        print_status "Azure region" "error" "Location '$LOCATION' is not valid"
        return 1
    fi
    
    # सेवा की उपलब्धता की जाँच
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
    # कमांड लाइन तर्कों को पार्स करें
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
    
    # आवश्यक पैरामीटरों को सत्यापित करें
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
    
    # जाँच चलाएँ
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

# मुख्य फ़ंक्शन चलाएँ
main "$@"
```

---

## मैन्युअल सत्यापन चेकलिस्ट

### पूर्व-तैनाती चेकलिस्ट

Print this checklist and verify each item before deployment:

#### ✅ वातावरण सेटअप
- [ ] AZD CLI इंस्टॉल और नवीनतम संस्करण में अपडेट किया गया हो
- [ ] Azure CLI इंस्टॉल और प्रमाणीकृत किया गया हो
- [ ] सही Azure सब्सक्रिप्शन चुना गया हो
- [ ] वातावरण का नाम अद्वितीय हो और नामकरण नियमों का पालन करता हो
- [ ] लक्षित रिसोर्स ग्रुप पहचाना गया हो या बनाया जा सके

#### ✅ प्रमाणिकरण और अनुमतियाँ
- [ ] `azd auth login` के साथ सफलतापूर्वक प्रमाणीकृत
- [ ] उपयोगकर्ता के पास लक्षित सब्सक्रिप्शन/रिसोर्स ग्रुप पर Contributor भूमिका हो
- [ ] CI/CD के लिए सर्विस प्रिंसिपल कॉन्फ़िगर किया गया हो (यदि लागू हो)
- [ ] कोई एक्सपायर हुए सर्टिफिकेट या क्रेडेंशियल नहीं हों

#### ✅ टेम्पलेट सत्यापन
- [ ] `azure.yaml` मौजूद है और मान्य YAML है
- [ ] azure.yaml में परिभाषित सभी सेवाओं के पास संबंधित स्रोत कोड मौजूद हों
- [ ] `infra/` डायरेक्टरी में Bicep टेम्पलेट मौजूद हों
- [ ] `main.bicep` बिना त्रुटियों के संकलित होता है (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 Infrastructure preview सफलतापूर्वक चलता है (`azd provision --preview`)
- [ ] सभी आवश्यक पैरामीटरों के पास डिफ़ॉल्ट मान हों या प्रदान किए जाएंगे
- [ ] टेम्पलेट्स में कोई हार्डकोडेड सीक्रेट्स न हों

#### ✅ संसाधन योजना
- [ ] लक्षित Azure क्षेत्र चुना गया और मान्य किया गया हो
- [ ] लक्षित क्षेत्र में आवश्यक Azure सेवाएँ उपलब्ध हों
- [ ] नियोजित संसाधनों के लिए पर्याप्त कोटा उपलब्ध हो
- [ ] संसाधन नामकरण संघर्षों की जाँच की गई हो
- [ ] संसाधनों के बीच निर्भरताएँ समझी गई हों

#### ✅ नेटवर्क और सुरक्षा
- [ ] Azure एंडपॉइंट्स के साथ नेटवर्क कनेक्टिविटी सत्यापित की गई हो
- [ ] फ़ायरवॉल/प्रॉक्सी सेटिंग्स आवश्यक होने पर कॉन्फ़िगर की गई हों
- [ ] सीक्रेट्स प्रबंधन के लिए Key Vault कॉन्फ़िगर किया गया हो
- [ ] जहां संभव हो, Managed Identities का उपयोग किया गया हो
- [ ] वेब एप्लिकेशनों के लिए HTTPS प्रवर्तन सक्षम हो

#### ✅ लागत प्रबंधन
- [ ] Azure Pricing Calculator का उपयोग करके लागत अनुमान गणना किए गए हों
- [ ] यदि आवश्यक हो तो बजट अलर्ट कॉन्फ़िगर किए गए हों
- [ ] वातावरण के प्रकार के लिए उपयुक्त SKU चुने गए हों
- [ ] उत्पादन वर्कलोड के लिए रिज़र्व्ड क्षमता पर विचार किया गया हो

#### ✅ मॉनिटरिंग और अवलोकनीयता
- [ ] टेम्पलेट्स में Application Insights कॉन्फ़िगर किया गया हो
- [ ] Log Analytics कार्यक्षेत्र की योजना बनाई गई हो
- [ ] महत्वपूर्ण मेट्रिक्स के लिए अलर्ट नियम परिभाषित किए गए हों
- [ ] एप्लिकेशनों में हेल्थ चेक एंडपॉइंट्स को लागू किया गया हो

#### ✅ बैकअप और रिकवरी
- [ ] डेटा संसाधनों के लिए बैकअप रणनीति परिभाषित की गई हो
- [ ] Recovery time objectives (RTO) दस्तावेजीकृत किए गए हों
- [ ] Recovery point objectives (RPO) दस्तावेजीकृत किए गए हों
- [ ] उत्पादन के लिए डिजास्टर रिकवरी योजना मौजूद हो

---

## पर्यावरण सत्यापन

### विकास परिवेश सत्यापन

```bash
#!/bin/bash
# विकास परिवेश के विशिष्ट सत्यापन

validate_dev_environment() {
    echo "=== Development Environment Validation ==="
    
    # विकास-अनुकूल कॉन्फ़िगरेशन की जाँच करें
    if grep -q "sku.*Free\|sku.*F1\|sku.*Basic" infra/*.bicep; then
        echo "✓ Development-appropriate SKUs detected"
    else
        echo "⚠ Consider using lower-cost SKUs for development"
    fi
    
    # स्वचालित शटडाउन कॉन्फ़िगरेशन की जाँच करें
    if grep -q "autoShutdown\|deallocate" infra/*.bicep; then
        echo "✓ Auto-shutdown configuration found"
    else
        echo "ℹ Consider adding auto-shutdown for cost savings"
    fi
    
    # विकास डेटाबेस कॉन्फ़िगरेशन का सत्यापन करें
    if grep -q "Basic\|S0\|S1" infra/*.bicep; then
        echo "✓ Development database tiers configured"
    else
        echo "⚠ Consider using Basic/Standard tiers for development databases"
    fi
}
```

### उत्पादन परिवेश सत्यापन

```bash
#!/bin/bash
# उत्पादन वातावरण के विशिष्ट सत्यापन

validate_prod_environment() {
    echo "=== Production Environment Validation ==="
    
    # उच्च उपलब्धता विन्यासों की जाँच करें
    if grep -q "zoneRedundant.*true\|Premium\|Standard_GRS" infra/*.bicep; then
        echo "✓ High availability configurations detected"
    else
        echo "⚠ Consider enabling high availability for production"
    fi
    
    # बैकअप विन्यासों की जाँच करें
    if grep -q "backup\|retention\|pointInTimeRestore" infra/*.bicep; then
        echo "✓ Backup configurations found"
    else
        echo "⚠ Ensure backup strategies are implemented"
    fi
    
    # निगरानी सेटअप को सत्यापित करें
    if grep -q "Microsoft.Insights\|Application_Type.*web" infra/*.bicep; then
        echo "✓ Monitoring and observability configured"
    else
        echo "⚠ Add comprehensive monitoring for production"
    fi
    
    # सुरक्षा विन्यासों की जाँच करें
    if grep -q "Microsoft.KeyVault\|managedIdentity\|httpsOnly.*true" infra/*.bicep; then
        echo "✓ Security best practices implemented"
    else
        echo "⚠ Review security configurations for production"
    fi
}
```

---

## संसाधन सत्यापन

### कोटा सत्यापन स्क्रिप्ट

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
    
    # सदस्यता में स्टोरेज खाते प्राप्त करें
    accounts = run_command(['az', 'storage', 'account', 'list'])
    
    if accounts is None:
        print("❌ Could not retrieve storage account information")
        return False
    
    account_count = len(accounts)
    max_accounts = 250  # डिफ़ॉल्ट Azure सीमा
    
    usage_percent = (account_count / max_accounts) * 100
    status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
    
    print(f"{status} Storage Accounts: {account_count}/{max_accounts} ({usage_percent:.1f}%)")
    
    return usage_percent < 95

def check_network_limits(location: str) -> bool:
    """Check network-related limits"""
    print(f"\n=== Network Limits Check ({location}) ===")
    
    # वर्चुअल नेटवर्क्स की जाँच करें
    vnets = run_command(['az', 'network', 'vnet', 'list'])
    if vnets is not None:
        vnet_count = len(vnets)
        print(f"✅ Virtual Networks: {vnet_count}/1000")
    
    # सार्वजनिक IP पतों की जाँच करें
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
    
    # जाँच चलाएँ
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

## सुरक्षा और अनुपालन जांचें

### सुरक्षा सत्यापन स्क्रिप्ट

```bash
#!/bin/bash
# AZD तैनाती के लिए सुरक्षा और अनुपालन का सत्यापन

check_security_practices() {
    echo "=== Security Best Practices Check ==="
    
    local issues_found=0
    
    # Key Vault के उपयोग की जाँच
    if grep -r "Microsoft.KeyVault" infra/ >/dev/null 2>&1; then
        echo "✅ Key Vault detected in infrastructure"
    else
        echo "⚠️  Key Vault not found - consider using for secrets management"
        ((issues_found++))
    fi
    
    # Managed Identity के उपयोग की जाँच
    if grep -r "managedIdentity\|SystemAssigned\|UserAssigned" infra/ >/dev/null 2>&1; then
        echo "✅ Managed Identity configuration detected"
    else
        echo "⚠️  Managed Identity not found - consider using for service authentication"
        ((issues_found++))
    fi
    
    # HTTPS प्रवर्तन की जाँच
    if grep -r "httpsOnly.*true\|requireHttps.*true" infra/ >/dev/null 2>&1; then
        echo "✅ HTTPS enforcement detected"
    else
        echo "⚠️  HTTPS enforcement not found - ensure secure connections"
        ((issues_found++))
    fi
    
    # न्यूनतम TLS संस्करण की जाँच
    if grep -r "minimumTlsVersion.*'TLS1_2'" infra/ >/dev/null 2>&1; then
        echo "✅ Minimum TLS 1.2 configuration detected"
    else
        echo "⚠️  Minimum TLS version not specified - consider requiring TLS 1.2+"
        ((issues_found++))
    fi
    
    # सार्वजनिक पहुँच प्रतिबंधों की जाँच
    if grep -r "allowBlobPublicAccess.*false\|publicNetworkAccess.*Disabled" infra/ >/dev/null 2>&1; then
        echo "✅ Public access restrictions detected"
    else
        echo "⚠️  Public access restrictions not found - consider limiting public access"
        ((issues_found++))
    fi
    
    # नेटवर्क सुरक्षा समूहों की जाँच
    if grep -r "Microsoft.Network/networkSecurityGroups" infra/ >/dev/null 2>&1; then
        echo "✅ Network Security Groups detected"
    else
        echo "ℹ️  Network Security Groups not found - may be acceptable depending on architecture"
    fi
    
    return $issues_found
}

check_compliance_requirements() {
    echo -e "\n=== Compliance Requirements Check ==="
    
    # डेटा एन्क्रिप्शन की जाँच
    if grep -r "encryption\|encryptionAtRest\|transparentDataEncryption" infra/ >/dev/null 2>&1; then
        echo "✅ Encryption configurations detected"
    else
        echo "⚠️  Encryption configurations not found - ensure data is encrypted"
    fi
    
    # ऑडिट लॉगिंग की जाँच
    if grep -r "Microsoft.Insights.*auditingSettings\|diagnosticSettings" infra/ >/dev/null 2>&1; then
        echo "✅ Audit logging configurations detected"
    else
        echo "⚠️  Audit logging not found - consider enabling for compliance"
    fi
    
    # बैकअप और रिटेंशन नीतियों की जाँच
    if grep -r "backup.*Policy\|retentionPolicy\|retention.*Days" infra/ >/dev/null 2>&1; then
        echo "✅ Backup and retention policies detected"
    else
        echo "⚠️  Backup/retention policies not found - required for data governance"
    fi
}

# मुख्य निष्पादन
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

## CI/CD के साथ एकीकरण

### GitHub Actions एकीकरण

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

### Azure DevOps एकीकरण

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

## सर्वश्रेष्ठ प्रथाओं का सारांश

### ✅ प्री-फ़्लाइट चेक सर्वश्रेष्ठ प्रथाएँ

1. **जहां संभव हो स्वचालित करें**
   - CI/CD पाइपलाइनों में चेक्स एकीकृत करें
   - दोहराने योग्य सत्यापनों के लिए स्क्रिप्ट का उपयोग करें
   - ऑडिट ट्रेल्स के लिए परिणाम सहेजें

2. **पर्यावरण-विशिष्ट सत्यापन**
   - dev/staging/prod के लिए अलग-अलग चेक्स
   - प्रत्येक वातावरण के अनुसार उपयुक्त सुरक्षा आवश्यकताएँ
   - गैर-उत्पादन वातावरणों के लिए लागत अनुकूलन

3. **व्यापक कवरेज**
   - प्रमाणिकरण और अनुमतियाँ
   - संसाधन कोटा और उपलब्धता
   - टेम्पलेट सत्यापन और सिंटैक्स
   - सुरक्षा और अनुपालन आवश्यकताएँ

4. **स्पष्ट रिपोर्टिंग**
   - रंग-कोडित स्थिति संकेतक
   - सुधारात्मक कदमों के साथ विस्तृत त्रुटि संदेश
   - त्वरित मूल्यांकन के लिए सारांश रिपोर्ट्स

5. **Fail Fast**
   - यदि महत्वपूर्ण चेक विफल हो तो तैनाती रोकें
   - समाधान के लिए स्पष्ट मार्गदर्शन प्रदान करें
   - चेक्स को आसानी से पुनः चलाने की सुविधा दें

### सामान्य प्री-फ़्लाइट समस्याएँ

1. "quick" तैनाती के लिए **सत्यापन छोड़ना**
2. तैनाती से पहले **अपर्याप्त अनुमतियों** की जाँच
3. तैनाती विफल होने तक **कोटा सीमाओं की अनदेखी करना**
4. CI/CD पाइपलाइनों में **टेम्पलेट्स का सत्यापन न करना**
5. उत्पादन वातावरणों के लिए **सुरक्षा सत्यापन का अभाव**
6. **अपर्याप्त लागत अनुमान** के कारण बजट आश्चर्य

---

**प्रो टिप**: वास्तविक तैनाती जॉब से पहले अपने CI/CD पाइपलाइन में प्री-फ़्लाइट चेक्स को एक अलग जॉब के रूप में चलाएँ। यह आपको मुद्दों को जल्दी पकड़ने की अनुमति देता है और डेवलपर्स को तेज़ प्रतिक्रिया प्रदान करता है।

---

**नेविगेशन**
- **पिछला पाठ**: [SKU चयन](sku-selection.md)
- **अगला पाठ**: [चीट शीट](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यह दस्तावेज़ एआई अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। हालाँकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही अधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की सलाह दी जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
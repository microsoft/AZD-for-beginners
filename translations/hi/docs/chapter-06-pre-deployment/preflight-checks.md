# AZD डिप्लॉयमेंट के लिए प्री-फ्लाइट चेक्स

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 6 - प्री-डिप्लॉयमेंट सत्यापन एवं योजना
- **⬅️ पिछला**: [SKU चयन](sku-selection.md)
- **➡️ अगला अध्याय**: [अध्याय 7: समस्या निवारण](../chapter-07-troubleshooting/common-issues.md)
- **🔧 संबंधित**: [अध्याय 4: डिप्लॉयमेंट गाइड](../chapter-04-infrastructure/deployment-guide.md)

## परिचय

यह व्यापक गाइड प्री-डिप्लॉयमेंट सत्यापन स्क्रिप्ट और प्रक्रियाएं प्रदान करता है ताकि Azure Developer CLI डिप्लॉयमेंट शुरू होने से पहले सफलता सुनिश्चित की जा सके। प्रमाणीकरण, संसाधन उपलब्धता, कोटा, सुरक्षा अनुपालन, और प्रदर्शन आवश्यकताओं के लिए स्वचालित जांच लागू करना सीखें ताकि डिप्लॉयमेंट विफलताओं को रोका जा सके और डिप्लॉयमेंट सफलता दर को अनुकूलित किया जा सके।

## सीखने के उद्देश्य

इस गाइड को पूरा करके, आप:
- स्वचालित प्री-डिप्लॉयमेंट सत्यापन तकनीकों और स्क्रिप्ट में महारत हासिल करेंगे
- प्रमाणीकरण, अनुमतियों, और कोटा के लिए व्यापक जांच रणनीतियाँ समझेंगे
- संसाधन उपलब्धता और क्षमता सत्यापन प्रक्रियाएँ लागू करेंगे
- संगठनात्मक नीतियों के लिए सुरक्षा और अनुपालन जांच कॉन्फ़िगर करेंगे
- लागत अनुमानों और बजट सत्यापन वर्कफ़्लो डिज़ाइन करेंगे
- CI/CD पाइपलाइनों के लिए कस्टम प्री-फ्लाइट जांच स्वचालन बनाएंगे

## सीखने के परिणाम

पूरा करने पर, आप सक्षम होंगे:
- व्यापक प्री-फ्लाइट सत्यापन स्क्रिप्ट बनाना और चलाना
- विभिन्न डिप्लॉयमेंट परिदृश्यों के लिए स्वचालित जांच वर्कफ़्लो डिज़ाइन करना
- पर्यावरण-विशिष्ट सत्यापन प्रक्रियाएँ और नीतियाँ लागू करना
- डिप्लॉयमेंट तैयारी के लिए सक्रिय निगरानी और अलर्टिंग कॉन्फ़िगर करना
- प्री-डिप्लॉयमेंट मुद्दों का समाधान करना और सुधारात्मक कार्रवाई लागू करना
- प्री-फ्लाइट जांचों को DevOps पाइपलाइनों और स्वचालन वर्कफ़्लो में एकीकृत करना

## सामग्री तालिका

- [अवलोकन](#अवलोकन)
- [स्वचालित प्री-फ्लाइट स्क्रिप्ट](#स्वचालित-प्री-फ्लाइट-स्क्रिप्ट)
- [मैनुअल सत्यापन चेकलिस्ट](#codeblock1)
- [पर्यावरण सत्यापन](#✅-बैकअप-और-पुनर्प्राप्ति)
- [संसाधन सत्यापन](#उत्पादन-पर्यावरण-सत्यापन)
- [सुरक्षा और अनुपालन जांच](#security--compliance-checks)
- [प्रदर्शन और क्षमता योजना](#performance--capacity-planning)
- [सामान्य समस्याओं का निवारण](#troubleshooting-common-issues)

---

## अवलोकन

प्री-फ्लाइट चेक्स आवश्यक सत्यापन हैं जो डिप्लॉयमेंट से पहले किए जाते हैं ताकि सुनिश्चित किया जा सके:

- **लक्षित क्षेत्रों में संसाधन उपलब्धता** और कोटा
- **प्रमाणीकरण और अनुमतियाँ** सही ढंग से कॉन्फ़िगर हैं
- **टेम्पलेट वैधता** और पैरामीटर की शुद्धता
- **नेटवर्क कनेक्टिविटी** और निर्भरताएँ
- **संगठनात्मक नीतियों के साथ सुरक्षा अनुपालन**
- **बजट सीमाओं के भीतर लागत अनुमान**

### प्री-फ्लाइट चेक कब चलाएं

- **नई पर्यावरण में पहली डिप्लॉयमेंट से पहले**
- **महत्वपूर्ण टेम्पलेट परिवर्तनों के बाद**
- **उत्पादन डिप्लॉयमेंट से पहले**
- **जब Azure क्षेत्र बदलें**
- **CI/CD पाइपलाइनों के हिस्से के रूप में**

---

## स्वचालित प्री-फ्लाइट स्क्रिप्ट

### PowerShell प्री-फ्लाइट चेकर

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

# आउटपुट के लिए रंग कोडिंग
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
    
    # AZD स्थापना जांचें
    try {
        $azdVersion = azd version --output json | ConvertFrom-Json
        Write-Status "AZD CLI installed" "Success" "Version: $($azdVersion.azd.version)"
    }
    catch {
        Write-Status "AZD CLI not found" "Error" "Install from https://aka.ms/azd-install"
        return $false
    }
    
    # Azure CLI स्थापना जांचें
    try {
        $azVersion = az version --output json | ConvertFrom-Json
        Write-Status "Azure CLI installed" "Success" "Version: $($azVersion.'azure-cli')"
    }
    catch {
        Write-Status "Azure CLI not found" "Error" "Install from https://aka.ms/azcli"
        return $false
    }
    
    # PowerShell संस्करण जांचें
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
        # AZD प्रमाणीकरण जांचें
        $azdAuth = azd auth login --check-status --output json 2>$null | ConvertFrom-Json
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
        }
        else {
            Write-Status "AZD authentication" "Error" "Run 'azd auth login'"
            return $false
        }
        
        # Azure CLI प्रमाणीकरण जांचें
        $azAccount = az account show --output json | ConvertFrom-Json
        Write-Status "Azure CLI authentication" "Success" "Subscription: $($azAccount.name)"
        
        # सदस्यता पहुँच वैध करें
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
        # वर्तमान उपयोगकर्ता की भूमिका असाइनमेंट प्राप्त करें
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
        
        # संसाधन समूह निर्माण का परीक्षण करें (यदि निर्दिष्ट हो)
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # संसाधन समूह बनाने की क्षमता का परीक्षण करें
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
        # कंप्यूट कोटा जांचें
        $computeUsage = az vm list-usage --location $Location --output json | ConvertFrom-Json
        
        # विशिष्ट कोटा जांचें
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
        
        # ऐप सेवा सीमाएँ जांचें
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
        
        # स्टोरेज अकाउंट सीमाएँ जांचें
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
        return $true # गैर-अवरुद्ध
    }
}

function Test-NetworkConnectivity {
    Write-Host "`n${Blue}=== Network Connectivity Check ===${Reset}"
    
    # Azure एन्डपॉइंट्स का परीक्षण करें
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
    
    # DNS समाधान का परीक्षण करें
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
    
    # जांचें कि azure.yaml मौजूद है या नहीं
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
    
    # बुनियादी ढांचा फाइलों की जांच करें
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
    
    # 🧪 नया: बुनियादी ढाँचे का पूर्वावलोकन परीक्षण (सुरक्षित ड्राय-रन)
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
        # जांचें कि स्थान वैध है या नहीं
        $locations = az account list-locations --output json | ConvertFrom-Json
        $validLocation = $locations | Where-Object { $_.name -eq $Location -or $_.displayName -eq $Location }
        
        if ($validLocation) {
            Write-Status "Azure region" "Success" "Location '$Location' is valid"
        }
        else {
            Write-Status "Azure region" "Error" "Location '$Location' is not valid"
            return $false
        }
        
        # क्षेत्र में सेवा उपलब्धता जांचें
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
    
    # बुनियादी लागत अनुमान (सटीक अनुमान के लिए Azure प्राइसिंग API की आवश्यकता होगी)
    Write-Status "Cost estimation" "Info" "Use Azure Pricing Calculator for detailed estimates"
    Write-Status "Monitoring setup" "Info" "Set up Azure Cost Management alerts"
    
    # जांचें कि बजट मौजूद है या नहीं
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
    
    # सामान्य सुरक्षा प्रथाओं की जांच करें
    try {
        # जांचें कि Key Vault कॉन्फ़िगर किया गया है या नहीं
        if (Select-String -Path "infra/*.bicep" -Pattern "Microsoft.KeyVault" -Quiet) {
            Write-Status "Key Vault usage" "Success" "Key Vault detected in templates"
        }
        else {
            Write-Status "Key Vault usage" "Warning" "Consider using Key Vault for secrets"
        }
        
        # प्रबंधित पहचान उपयोग की जांच करें
        if (Select-String -Path "infra/*.bicep" -Pattern "managedIdentity|SystemAssigned" -Quiet) {
            Write-Status "Managed Identity" "Success" "Managed Identity detected"
        }
        else {
            Write-Status "Managed Identity" "Warning" "Consider using Managed Identity"
        }
        
        # HTTPS प्रवर्तन की जांच करें
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
    
    # सभी जांच चलाएं
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

# प्री-फ़्लाइट जांच चलाएं
Invoke-PreflightCheck
```

### Bash प्री-फ्लाइट चेकर

```bash
#!/bin/bash
# Unix/Linux सिस्टमों के लिए प्री-फ्लाइट चेक्स का Bash संस्करण

set -euo pipefail

# रंग कोड
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # कोई रंग नहीं

# वैश्विक चर
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
    
    # AZD स्थापना जांचें
    if command -v azd >/dev/null 2>&1; then
        local azd_version=$(azd version --output json | jq -r '.azd.version')
        print_status "AZD CLI installed" "success" "Version: $azd_version"
    else
        print_status "AZD CLI not found" "error" "Install from https://aka.ms/azd-install"
        return 1
    fi
    
    # Azure CLI स्थापना जांचें
    if command -v az >/dev/null 2>&1; then
        local az_version=$(az version --output json | jq -r '."azure-cli"')
        print_status "Azure CLI installed" "success" "Version: $az_version"
    else
        print_status "Azure CLI not found" "error" "Install from https://aka.ms/azcli"
        return 1
    fi
    
    # jq स्थापना जांचें
    if command -v jq >/dev/null 2>&1; then
        print_status "jq installed" "success"
    else
        print_status "jq not found" "warning" "Install jq for better JSON parsing"
    fi
    
    return 0
}

check_authentication() {
    echo -e "\n${BLUE}=== Authentication Check ===${NC}"
    
    # AZD प्रमाणीकरण जांचें
    if azd auth login --check-status >/dev/null 2>&1; then
        local principal_name=$(azd auth login --check-status --output json 2>/dev/null | jq -r '.principalName // "Unknown"')
        print_status "AZD authentication" "success" "User: $principal_name"
    else
        print_status "AZD authentication" "error" "Run 'azd auth login'"
        return 1
    fi
    
    # Azure CLI प्रमाणीकरण जांचें
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
    
    # azure.yaml जांचें
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
    
    # बुनियादी ढांचे की फाइलों की जांच करें
    if [[ -d "infra" ]]; then
        local bicep_count=$(find infra -name "*.bicep" | wc -l)
        if [[ $bicep_count -gt 0 ]]; then
            print_status "Infrastructure templates" "success" "$bicep_count Bicep files found"
            
            # यदि मौजूद हो तो main.bicep मान्य करें
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
    
    # सेवा उपलब्धता जांचें
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
    # कमांड लाइन तर्क पार्स करें
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
    
    # आवश्यक पैरामीटरों को मान्य करें
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
    
    # चेक चलाएं
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

# मुख्य फ़ंक्शन चलाएं
main "$@"
```

---

## मैनुअल सत्यापन चेकलिस्ट

### प्री-डिप्लॉयमेंट चेकलिस्ट

इस चेकलिस्ट को प्रिंट करें और प्रत्येक आइटम को डिप्लॉयमेंट से पहले सत्यापित करें:

#### ✅ पर्यावरण सेटअप
- [ ] AZD CLI स्थापित और नवीनतम संस्करण में अपडेट किया गया
- [ ] Azure CLI स्थापित और प्रमाणित
- [ ] सही Azure सब्सक्रिप्शन चयनित
- [ ] पर्यावरण नाम अद्वितीय है और नामकरण नियमों का पालन करता है
- [ ] लक्ष्य संसाधन समूह पहचाना गया या बनाया जा सकता है

#### ✅ प्रमाणीकरण और अनुमतियाँ
- [ ] `azd auth login` के साथ सफलतापूर्वक प्रमाणित
- [ ] उपयोगकर्ता के पास लक्ष्य सब्सक्रिप्शन/संसाधन समूह पर Contributor भूमिका है
- [ ] CI/CD के लिए सेवा प्रिंसिपल कॉन्फ़िगर किया गया (यदि लागू हो)
- [ ] कोई समाप्त हो चुके प्रमाणपत्र या क्रेडेंशियल्स नहीं

#### ✅ टेम्पलेट सत्यापन
- [ ] `azure.yaml` मौजूद है और मान्य YAML है
- [ ] azure.yaml में परिभाषित सभी सेवाओं के लिए संबंधित स्रोत कोड मौजूद है
- [ ] `infra/` निर्देशिका में बीसेप टेम्पलेट्स मौजूद हैं
- [ ] `main.bicep` त्रुटि मुक्त संकलित होता है (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 इन्फ्रास्ट्रक्चर पूर्वावलोकन सफलतापूर्वक चलता है (`azd provision --preview`)
- [ ] सभी आवश्यक पैरामीटर के डिफ़ॉल्ट मान हैं या प्रदान किए जाएंगे
- [ ] टेम्पलेट्स में कोई हार्डकोडेड सीक्रेट्स नहीं

#### ✅ संसाधन योजना
- [ ] लक्ष्य Azure क्षेत्र चयनित और सत्यापित
- [ ] लक्षित क्षेत्र में आवश्यक Azure सेवाएँ उपलब्ध
- [ ] नियोजित संसाधनों के लिए पर्याप्त कोटा उपलब्ध
- [ ] संसाधन नामकरण टकराव जाँचा गया
- [ ] संसाधनों के बीच निर्भरता समझी गई

#### ✅ नेटवर्क और सुरक्षा
- [ ] Azure एंडपॉइंट्स से नेटवर्क कनेक्टिविटी सत्यापित
- [ ] यदि आवश्यक हो तो फ़ायरवॉल/प्रॉक्सी सेटिंग्स कॉन्फ़िगर की गई हैं
- [ ] सीक्रेट्स प्रबंधन के लिए Key Vault कॉन्फ़िगर किया गया
- [ ] जत्था पहचान (Managed identities) जहां संभव हो उपयोग की गई हैं
- [ ] वेब एप्लिकेशन के लिए HTTPS प्रवर्तन सक्षम

#### ✅ लागत प्रबंधन
- [ ] Azure प्राइसिंग कैलकुलेटर से लागत अनुमान कैलकुलेट किए गए
- [ ] बजट अलर्ट्स कॉन्फ़िगर किए गए यदि आवश्यक हो
- [ ] पर्यावरण के प्रकार के लिए उपयुक्त SKU चयनित
- [ ] उत्पादन वर्कलोड्स के लिए आरक्षित क्षमता पर विचार किया गया

#### ✅ निगरानी एवं प्रेक्षणीयता
- [ ] टेम्पलेट्स में Application Insights कॉन्फ़िगर किया गया
- [ ] Log Analytics वर्कस्पेस योजना बनाई गई
- [ ] महत्वपूर्ण मेट्रिक्स के लिए अलर्ट नियम परिभाषित किए गए
- [ ] एप्लिकेशन में हेल्थ चेक एंडपॉइंट लागू किए गए

#### ✅ बैकअप और पुनर्प्राप्ति
- [ ] डेटा संसाधनों के लिए बैकअप रणनीति परिभाषित
- [ ] रिकवरी टाइम ऑब्जेक्टिव (RTO) डॉक्युमेंट किया गया
- [ ] रिकवरी पॉइंट ऑब्जेक्टिव (RPO) डॉक्युमेंट किया गया
- [ ] उत्पादन के लिए आपदा पुनर्प्राप्ति योजना मौजूद

---

## पर्यावरण सत्यापन

### विकास पर्यावरण सत्यापन

```bash
#!/bin/bash
# विकास पर्यावरण विशिष्ट सत्यापन

validate_dev_environment() {
    echo "=== Development Environment Validation ==="
    
    # विकास के अनुकूल विन्यासों की जाँच करें
    if grep -q "sku.*Free\|sku.*F1\|sku.*Basic" infra/*.bicep; then
        echo "✓ Development-appropriate SKUs detected"
    else
        echo "⚠ Consider using lower-cost SKUs for development"
    fi
    
    # स्वतः बंद करने के विन्यासों की जाँच करें
    if grep -q "autoShutdown\|deallocate" infra/*.bicep; then
        echo "✓ Auto-shutdown configuration found"
    else
        echo "ℹ Consider adding auto-shutdown for cost savings"
    fi
    
    # विकास डेटाबेस विन्यासों को सत्यापित करें
    if grep -q "Basic\|S0\|S1" infra/*.bicep; then
        echo "✓ Development database tiers configured"
    else
        echo "⚠ Consider using Basic/Standard tiers for development databases"
    fi
}
```

### उत्पादन पर्यावरण सत्यापन

```bash
#!/bin/bash
# उत्पादन वातावरण विशिष्ट सत्यापन

validate_prod_environment() {
    echo "=== Production Environment Validation ==="
    
    # उच्च उपलब्धता विन्यास के लिए जांचें
    if grep -q "zoneRedundant.*true\|Premium\|Standard_GRS" infra/*.bicep; then
        echo "✓ High availability configurations detected"
    else
        echo "⚠ Consider enabling high availability for production"
    fi
    
    # बैकअप विन्यास के लिए जांचें
    if grep -q "backup\|retention\|pointInTimeRestore" infra/*.bicep; then
        echo "✓ Backup configurations found"
    else
        echo "⚠ Ensure backup strategies are implemented"
    fi
    
    # निगरानी सेटअप सत्यापित करें
    if grep -q "Microsoft.Insights\|Application_Type.*web" infra/*.bicep; then
        echo "✓ Monitoring and observability configured"
    else
        echo "⚠ Add comprehensive monitoring for production"
    fi
    
    # सुरक्षा विन्यास के लिए जांचें
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
    
    # सदस्यता में संग्रहण खाते प्राप्त करें
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
    
    # वर्चुअल नेटवर्क जांचें
    vnets = run_command(['az', 'network', 'vnet', 'list'])
    if vnets is not None:
        vnet_count = len(vnets)
        print(f"✅ Virtual Networks: {vnet_count}/1000")
    
    # सार्वजनिक आईपी पतों की जांच करें
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
    
    # जांच चलाएं
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

## सुरक्षा और अनुपालन जांच

### सुरक्षा सत्यापन स्क्रिप्ट

```bash
#!/bin/bash
# AZD तैनातियों के लिए सुरक्षा और अनुपालन सत्यापन

check_security_practices() {
    echo "=== Security Best Practices Check ==="
    
    local issues_found=0
    
    # की वॉल्ट उपयोग की जांच करें
    if grep -r "Microsoft.KeyVault" infra/ >/dev/null 2>&1; then
        echo "✅ Key Vault detected in infrastructure"
    else
        echo "⚠️  Key Vault not found - consider using for secrets management"
        ((issues_found++))
    fi
    
    # प्रबंधित पहचान उपयोग की जांच करें
    if grep -r "managedIdentity\|SystemAssigned\|UserAssigned" infra/ >/dev/null 2>&1; then
        echo "✅ Managed Identity configuration detected"
    else
        echo "⚠️  Managed Identity not found - consider using for service authentication"
        ((issues_found++))
    fi
    
    # HTTPS प्रवर्तन की जांच करें
    if grep -r "httpsOnly.*true\|requireHttps.*true" infra/ >/dev/null 2>&1; then
        echo "✅ HTTPS enforcement detected"
    else
        echo "⚠️  HTTPS enforcement not found - ensure secure connections"
        ((issues_found++))
    fi
    
    # न्यूनतम TLS संस्करण की जांच करें
    if grep -r "minimumTlsVersion.*'TLS1_2'" infra/ >/dev/null 2>&1; then
        echo "✅ Minimum TLS 1.2 configuration detected"
    else
        echo "⚠️  Minimum TLS version not specified - consider requiring TLS 1.2+"
        ((issues_found++))
    fi
    
    # सार्वजनिक पहुँच प्रतिबंधों की जांच करें
    if grep -r "allowBlobPublicAccess.*false\|publicNetworkAccess.*Disabled" infra/ >/dev/null 2>&1; then
        echo "✅ Public access restrictions detected"
    else
        echo "⚠️  Public access restrictions not found - consider limiting public access"
        ((issues_found++))
    fi
    
    # नेटवर्क सुरक्षा समूहों की जांच करें
    if grep -r "Microsoft.Network/networkSecurityGroups" infra/ >/dev/null 2>&1; then
        echo "✅ Network Security Groups detected"
    else
        echo "ℹ️  Network Security Groups not found - may be acceptable depending on architecture"
    fi
    
    return $issues_found
}

check_compliance_requirements() {
    echo -e "\n=== Compliance Requirements Check ==="
    
    # डेटा एन्क्रिप्शन की जांच करें
    if grep -r "encryption\|encryptionAtRest\|transparentDataEncryption" infra/ >/dev/null 2>&1; then
        echo "✅ Encryption configurations detected"
    else
        echo "⚠️  Encryption configurations not found - ensure data is encrypted"
    fi
    
    # ऑडिट लॉगिंग की जांच करें
    if grep -r "Microsoft.Insights.*auditingSettings\|diagnosticSettings" infra/ >/dev/null 2>&1; then
        echo "✅ Audit logging configurations detected"
    else
        echo "⚠️  Audit logging not found - consider enabling for compliance"
    fi
    
    # बैकअप और प्रतिधारण नीतियों की जांच करें
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

## सर्वोत्तम प्रथाओं का सारांश

### ✅ प्री-फ्लाइट जांच सर्वोत्तम प्रथाएँ

1. **जहाँ संभव हो स्वचालित करें**
   - CI/CD पाइपलाइनों में जांचों को एकीकृत करें
   - दोहराने योग्य सत्यापन के लिए स्क्रिप्ट का उपयोग करें
   - ऑडिट ट्रेल्स के लिए परिणाम संग्रहीत करें

2. **पर्यावरण-विशिष्ट सत्यापन**
   - dev/staging/prod के लिए अलग जांचें
   - प्रत्येक पर्यावरण के लिए उपयुक्त सुरक्षा आवश्यकताएँ
   - गैर-उत्पादन पर्यावरणों के लिए लागत अनुकूलन

3. **व्यापक कवरेज**
   - प्रमाणीकरण और अनुमतियाँ
   - संसाधन कोटा और उपलब्धता
   - टेम्पलेट सत्यापन और सिंटैक्स
   - सुरक्षा और अनुपालन आवश्यकताएँ

4. **स्पष्ट रिपोर्टिंग**
   - रंग-कोडित स्थिति संकेतक
   - सुधारात्मक कदमों के साथ विस्तृत त्रुटि संदेश
   - त्वरित मूल्यांकन के लिए सारांश रिपोर्ट्स

5. **जल्दी विफल होना**
   - यदि महत्वपूर्ण जांच विफल हों तो डिप्लॉयमेंट रोकें
   - समाधान के लिए स्पष्ट मार्गदर्शन प्रदान करें
   - जांचों को पुनः चलाना आसान बनाएं

### सामान्य प्री-फ्लाइट गलतियाँ

1. "त्वरित" डिप्लॉयमेंट के लिए सत्यापन छोड़ देना
2. डिप्लॉयमेंट से पहले अपर्याप्त अनुमतियाँ जांचना
3. कोटा सीमाओं की अनदेखी करना जब तक डिप्लॉयमेंट विफल न हो
4. CI/CD पाइपलाइनों में टेम्पलेट्स का सत्यापन न करना
5. उत्पादन पर्यावरणों के लिए सुरक्षा सत्यापन का अभाव
6. बजट आश्चर्य के कारण अपर्याप्त लागत अनुमान

---

**प्रो टिप**: प्री-फ्लाइट जांच को आपके CI/CD पाइपलाइन में वास्तविक डिप्लॉयमेंट जॉब से पहले एक अलग जॉब के रूप में चलाएं। इससे आप जल्दी मुद्दे पकड़ सकते हैं और डेवलपर्स को तेज़ प्रतिक्रिया मिलती है।

---

**नेविगेशन**
- **पिछला पाठ**: [SKU चयन](sku-selection.md)
- **अगला पाठ**: [चीट शीट](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियाँ या असंगतियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में अधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
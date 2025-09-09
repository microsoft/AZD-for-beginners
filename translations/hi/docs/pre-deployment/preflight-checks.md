<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "16e76af4080a0103e2409f8d44098cc4",
  "translation_date": "2025-09-09T17:18:14+00:00",
  "source_file": "docs/pre-deployment/preflight-checks.md",
  "language_code": "hi"
}
-->
# प्री-फ्लाइट चेक्स - डिप्लॉयमेंट रेडीनेस वैलिडेशन

## परिचय

यह व्यापक गाइड प्री-डिप्लॉयमेंट वैलिडेशन स्क्रिप्ट्स और प्रक्रियाओं को प्रदान करता है ताकि Azure Developer CLI डिप्लॉयमेंट्स को शुरू करने से पहले सफल बनाया जा सके। ऑथेंटिकेशन, संसाधन उपलब्धता, कोटा, सुरक्षा अनुपालन, और प्रदर्शन आवश्यकताओं के लिए स्वचालित चेक्स को लागू करना सीखें ताकि डिप्लॉयमेंट विफलताओं को रोका जा सके और सफलता दर को अनुकूलित किया जा सके।

## सीखने के लक्ष्य

इस गाइड को पूरा करके, आप:
- स्वचालित प्री-डिप्लॉयमेंट वैलिडेशन तकनीकों और स्क्रिप्ट्स में महारत हासिल करेंगे
- ऑथेंटिकेशन, परमिशन और कोटा के लिए व्यापक चेकिंग रणनीतियों को समझेंगे
- संसाधन उपलब्धता और क्षमता वैलिडेशन प्रक्रियाओं को लागू करेंगे
- संगठनात्मक नीतियों के लिए सुरक्षा और अनुपालन चेक्स को कॉन्फ़िगर करेंगे
- लागत अनुमान और बजट वैलिडेशन वर्कफ़्लो डिज़ाइन करेंगे
- CI/CD पाइपलाइनों के लिए कस्टम प्री-फ्लाइट चेक ऑटोमेशन बनाएंगे

## सीखने के परिणाम

पूरा करने के बाद, आप सक्षम होंगे:
- व्यापक प्री-फ्लाइट वैलिडेशन स्क्रिप्ट्स बनाना और निष्पादित करना
- विभिन्न डिप्लॉयमेंट परिदृश्यों के लिए स्वचालित चेकिंग वर्कफ़्लो डिज़ाइन करना
- पर्यावरण-विशिष्ट वैलिडेशन प्रक्रियाओं और नीतियों को लागू करना
- डिप्लॉयमेंट रेडीनेस के लिए सक्रिय निगरानी और अलर्टिंग को कॉन्फ़िगर करना
- प्री-डिप्लॉयमेंट समस्याओं का समाधान करना और सुधारात्मक कार्रवाई करना
- प्री-फ्लाइट चेक्स को DevOps पाइपलाइनों और ऑटोमेशन वर्कफ़्लो में एकीकृत करना

## सामग्री तालिका

- [अवलोकन](../../../../docs/pre-deployment)
- [स्वचालित प्री-फ्लाइट स्क्रिप्ट](../../../../docs/pre-deployment)
- [मैनुअल वैलिडेशन चेकलिस्ट](../../../../docs/pre-deployment)
- [पर्यावरण वैलिडेशन](../../../../docs/pre-deployment)
- [संसाधन वैलिडेशन](../../../../docs/pre-deployment)
- [सुरक्षा और अनुपालन चेक्स](../../../../docs/pre-deployment)
- [प्रदर्शन और क्षमता योजना](../../../../docs/pre-deployment)
- [सामान्य समस्याओं का समाधान](../../../../docs/pre-deployment)

---

## अवलोकन

प्री-फ्लाइट चेक्स डिप्लॉयमेंट से पहले किए जाने वाले आवश्यक वैलिडेशन हैं ताकि सुनिश्चित किया जा सके:

- **संसाधन उपलब्धता** और लक्षित क्षेत्रों में कोटा
- **ऑथेंटिकेशन और परमिशन** सही तरीके से कॉन्फ़िगर किए गए हैं
- **टेम्पलेट वैधता** और पैरामीटर की शुद्धता
- **नेटवर्क कनेक्टिविटी** और निर्भरताएं
- **सुरक्षा अनुपालन** संगठनात्मक नीतियों के साथ
- **लागत अनुमान** बजट सीमाओं के भीतर

### प्री-फ्लाइट चेक्स कब चलाएं

- **पहली बार डिप्लॉयमेंट से पहले** नए पर्यावरण में
- **महत्वपूर्ण टेम्पलेट परिवर्तनों के बाद**
- **प्रोडक्शन डिप्लॉयमेंट्स से पहले**
- **Azure क्षेत्रों को बदलते समय**
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
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
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
        # Get current user's role assignments
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
        
        # Test resource group creation (if specified)
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # Test ability to create resource group
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
        # Check compute quotas
        $computeUsage = az vm list-usage --location $Location --output json | ConvertFrom-Json
        
        # Check specific quotas
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
        
        # Check App Service limits
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
        
        # Check storage account limits
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
            Write-Status "Connectivity to $endpoint" "Error" $_.Exception.Message
        }
    }
    
    # Test DNS resolution
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
    
    # Check if azure.yaml exists
    if (Test-Path "azure.yaml") {
        Write-Status "azure.yaml found" "Success"
        
        # Parse azure.yaml
        try {
            $azureYaml = Get-Content "azure.yaml" -Raw | ConvertFrom-Yaml
            Write-Status "azure.yaml parsing" "Success"
            
            # Validate services
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
    
    # Check for common security practices
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
        Write-Host "${Green}✓ Ready for deployment!${Reset}"
        exit 0
    }
    else {
        Write-Host "${Red}✗ Some pre-flight checks failed ($passedCount/$totalCount)${Reset}"
        Write-Host "${Red}✗ Please resolve issues before deployment${Reset}"
        exit 1
    }
}

# Run the pre-flight check
Invoke-PreflightCheck
```

### Bash प्री-फ्लाइट चेकर

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
        print_status "jq not found" "warning" "Install jq for better JSON parsing"
    fi
    
    return 0
}

check_authentication() {
    echo -e "\n${BLUE}=== Authentication Check ===${NC}"
    
    # Check AZD authentication
    if azd auth login --check-status >/dev/null 2>&1; then
        local principal_name=$(azd auth login --check-status --output json 2>/dev/null | jq -r '.principalName // "Unknown"')
        print_status "AZD authentication" "success" "User: $principal_name"
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
    check_authentication || all_passed=false
    check_template_validation || all_passed=false
    check_regional_availability || all_passed=false
    
    # Summary
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

# Run main function
main "$@"
```

---

## मैनुअल वैलिडेशन चेकलिस्ट

### प्री-डिप्लॉयमेंट चेकलिस्ट

इस चेकलिस्ट को प्रिंट करें और डिप्लॉयमेंट से पहले प्रत्येक आइटम को सत्यापित करें:

#### ✅ पर्यावरण सेटअप
- [ ] AZD CLI इंस्टॉल और नवीनतम संस्करण में अपडेट किया गया
- [ ] Azure CLI इंस्टॉल और ऑथेंटिकेटेड
- [ ] सही Azure सब्सक्रिप्शन चुना गया
- [ ] पर्यावरण का नाम अद्वितीय है और नामकरण मानकों का पालन करता है
- [ ] लक्षित संसाधन समूह पहचाना गया या बनाया जा सकता है

#### ✅ ऑथेंटिकेशन और परमिशन
- [ ] `azd auth login` के साथ सफलतापूर्वक ऑथेंटिकेट किया गया
- [ ] उपयोगकर्ता के पास लक्षित सब्सक्रिप्शन/संसाधन समूह पर Contributor भूमिका है
- [ ] CI/CD के लिए सर्विस प्रिंसिपल कॉन्फ़िगर किया गया (यदि लागू हो)
- [ ] कोई एक्सपायर्ड सर्टिफिकेट या क्रेडेंशियल नहीं हैं

#### ✅ टेम्पलेट वैलिडेशन
- [ ] `azure.yaml` मौजूद है और वैध YAML है
- [ ] azure.yaml में परिभाषित सभी सेवाओं के लिए स्रोत कोड मौजूद है
- [ ] `infra/` डायरेक्टरी में Bicep टेम्पलेट्स मौजूद हैं
- [ ] `main.bicep` बिना त्रुटियों के कंपाइल होता है (`az bicep build --file infra/main.bicep`)
- [ ] सभी आवश्यक पैरामीटर के पास डिफ़ॉल्ट मान हैं या प्रदान किए जाएंगे
- [ ] टेम्पलेट्स में कोई हार्डकोडेड सीक्रेट्स नहीं हैं

#### ✅ संसाधन योजना
- [ ] लक्षित Azure क्षेत्र चुना और सत्यापित किया गया
- [ ] लक्षित क्षेत्र में आवश्यक Azure सेवाएं उपलब्ध हैं
- [ ] योजनाबद्ध संसाधनों के लिए पर्याप्त कोटा उपलब्ध हैं
- [ ] संसाधन नामकरण संघर्षों की जांच की गई
- [ ] संसाधनों के बीच निर्भरताएं समझी गईं

#### ✅ नेटवर्क और सुरक्षा
- [ ] Azure एंडपॉइंट्स के लिए नेटवर्क कनेक्टिविटी सत्यापित की गई
- [ ] फ़ायरवॉल/प्रॉक्सी सेटिंग्स कॉन्फ़िगर की गई (यदि आवश्यक हो)
- [ ] सीक्रेट्स प्रबंधन के लिए Key Vault कॉन्फ़िगर किया गया
- [ ] जहां संभव हो, प्रबंधित पहचान का उपयोग किया गया
- [ ] वेब एप्लिकेशन के लिए HTTPS प्रवर्तन सक्षम किया गया

#### ✅ लागत प्रबंधन
- [ ] Azure Pricing Calculator का उपयोग करके लागत अनुमान की गणना की गई
- [ ] बजट अलर्ट्स कॉन्फ़िगर किए गए (यदि आवश्यक हो)
- [ ] पर्यावरण प्रकार के लिए उपयुक्त SKUs चुने गए
- [ ] प्रोडक्शन वर्कलोड्स के लिए आरक्षित क्षमता पर विचार किया गया

#### ✅ निगरानी और अवलोकन
- [ ] टेम्पलेट्स में Application Insights कॉन्फ़िगर किया गया
- [ ] Log Analytics कार्यक्षेत्र की योजना बनाई गई
- [ ] महत्वपूर्ण मेट्रिक्स के लिए अलर्ट नियम परिभाषित किए गए
- [ ] एप्लिकेशन में हेल्थ चेक एंडपॉइंट्स लागू किए गए

#### ✅ बैकअप और रिकवरी
- [ ] डेटा संसाधनों के लिए बैकअप रणनीति परिभाषित की गई
- [ ] रिकवरी समय उद्देश्य (RTO) दस्तावेज़ित किए गए
- [ ] रिकवरी पॉइंट उद्देश्य (RPO) दस्तावेज़ित किए गए
- [ ] प्रोडक्शन के लिए डिजास्टर रिकवरी योजना तैयार की गई

---

## पर्यावरण वैलिडेशन

### विकास पर्यावरण वैलिडेशन

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

### प्रोडक्शन पर्यावरण वैलिडेशन

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

## संसाधन वैलिडेशन

### कोटा वैलिडेशन स्क्रिप्ट

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
    
    # Get storage accounts in subscription
    accounts = run_command(['az', 'storage', 'account', 'list'])
    
    if accounts is None:
        print("❌ Could not retrieve storage account information")
        return False
    
    account_count = len(accounts)
    max_accounts = 250  # Default Azure limit
    
    usage_percent = (account_count / max_accounts) * 100
    status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
    
    print(f"{status} Storage Accounts: {account_count}/{max_accounts} ({usage_percent:.1f}%)")
    
    return usage_percent < 95

def check_network_limits(location: str) -> bool:
    """Check network-related limits"""
    print(f"\n=== Network Limits Check ({location}) ===")
    
    # Check virtual networks
    vnets = run_command(['az', 'network', 'vnet', 'list'])
    if vnets is not None:
        vnet_count = len(vnets)
        print(f"✅ Virtual Networks: {vnet_count}/1000")
    
    # Check public IP addresses
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
    
    # Run checks
    all_passed &= check_compute_quotas(location)
    all_passed &= check_storage_limits(location)
    all_passed &= check_network_limits(location)
    
    # Summary
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

## सुरक्षा और अनुपालन चेक्स

### सुरक्षा वैलिडेशन स्क्रिप्ट

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

### ✅ प्री-फ्लाइट चेक सर्वोत्तम प्रथाएं

1. **जहां संभव हो स्वचालित करें**
   - चेक्स को CI/CD पाइपलाइनों में एकीकृत करें
   - दोहराने योग्य वैलिडेशन के लिए स्क्रिप्ट्स का उपयोग करें
   - ऑडिट ट्रेल्स के लिए परिणाम संग्रहीत करें

2. **पर्यावरण-विशिष्ट वैलिडेशन**
   - विकास/स्टेजिंग/प्रोडक्शन के लिए अलग-अलग चेक्स
   - प्रत्येक पर्यावरण के लिए उपयुक्त सुरक्षा आवश्यकताएं
   - गैर-प्रोडक्शन पर्यावरण के लिए लागत अनुकूलन

3. **व्यापक कवरेज**
   - ऑथेंटिकेशन और परमिशन
   - संसाधन कोटा और उपलब्धता
   - टेम्पलेट वैलिडेशन और सिंटैक्स
   - सुरक्षा और अनुपालन आवश्यकताएं

4. **स्पष्ट रिपोर्टिंग**
   - रंग-कोडेड स्थिति संकेतक
   - सुधारात्मक कदमों के साथ विस्तृत त्रुटि संदेश
   - त्वरित मूल्यांकन के लिए सारांश रिपोर्ट

5. **तेजी से विफलता**
   - यदि महत्वपूर्ण चेक्स विफल होते हैं तो डिप्लॉयमेंट रोकें
   - समाधान के लिए स्पष्ट मार्गदर्शन प्रदान करें
   - चेक्स को फिर से चलाने में आसानी सक्षम करें

### सामान्य प्री-फ्लाइट गलतियां

1. **"जल्दी" डिप्लॉयमेंट्स के लिए वैलिडेशन को छोड़ना**
2. **डिप्लॉयमेंट से पहले अपर्याप्त परमिशन चेकिंग**
3. **कोटा सीमाओं को अनदेखा करना जब तक डिप्लॉयमेंट विफल न हो जाए**
4. **CI/CD पाइपलाइनों में टेम्पलेट्स को वैलिडेट न करना**
5. **प्रोडक्शन पर्यावरण के लिए सुरक्षा वैलिडेशन को छोड़ना**
6. **अपर्याप्त लागत अनुमान** जिससे बजट में आश्चर्य हो सकता है

---

**प्रो टिप**: प्री-फ्लाइट चेक्स को अपने CI/CD पाइपलाइन में एक अलग जॉब के रूप में चलाएं, वास्तविक डिप्लॉयमेंट जॉब से पहले। यह आपको समस्याओं को जल्दी पकड़ने और डेवलपर्स को तेज़ प्रतिक्रिया प्रदान करने की अनुमति देता है।

---

**नेविगेशन**
- **पिछला पाठ**: [SKU चयन](sku-selection.md)
- **अगला पाठ**: [चीट शीट](../../resources/cheat-sheet.md)

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता सुनिश्चित करने का प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
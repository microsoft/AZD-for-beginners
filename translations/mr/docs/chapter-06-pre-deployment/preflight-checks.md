# AZD तैनातींसाठी प्री-फ्लाइट तपासण्या

**अध्याय नेव्हिगेशन:**
- **📚 Course Home**: [AZD नवशिक्यांसाठी](../../README.md)
- **📖 Current Chapter**: प्रकरण 6 - प्री-तैनाती वैधता आणि नियोजन
- **⬅️ मागील**: [SKU निवड](sku-selection.md)
- **➡️ पुढील प्रकरण**: [प्रकरण 7: समस्या निराकरण](../chapter-07-troubleshooting/common-issues.md)
- **🔧 संबंधित**: [प्रकरण 4: तैनाती मार्गदर्शक](../chapter-04-infrastructure/deployment-guide.md)

## परिचय

हा सर्वसमावेशक मार्गदर्शक तैनाती सुरू होण्यापूर्वी यशस्वी Azure Developer CLI तैनाती सुनिश्चित करण्यासाठी प्री-तैनाती वैधता स्क्रिप्ट आणि प्रक्रिया प्रदान करतो. प्रमाणीकरण, संसाधन उपलब्धता, कोटे, सुरक्षा अनुपालन आणि कार्यक्षमता आवश्यकता यांसाठी स्वयंचलित तपासणी कशी राबवायची हे शिका ज्यामुळे तैनाती अयशस्वी होण्यापासून टाळता येईल आणि तैनाती यशस्वी होण्याच्या दरात सुधारणा करता येईल.

## शिकण्याची उद्दिष्टे

या मार्गदर्शकाचे पूर्णकरण करून आपण:
- स्वयंचलित प्री-तैनाती वैधता तंत्रे आणि स्क्रिप्ट्समध्ये प्रावीण्य मिळवाल
- प्रमाणीकरण, परवानग्या आणि कोटांसाठी व्यापक तपासणी रणनीती समजावून घेवाल
- संसाधन उपलब्धता आणि क्षमता वैधता प्रक्रिया राबवाल
- संस्थात्मक धोरणांसाठी सुरक्षा आणि अनुपालन तपासण्या संरचीत कराल
- खर्च अंदाज आणि बजेट तपासणी कार्यप्रवाह डिझाइन कराल
- CI/CD पाइपलाइन्ससाठी कस्टम प्री-फ्लाइट तपासणी स्वयंचलन तयार कराल

## शिकण्याचे परिणाम

पूर्ण केल्यानंतर, आपण सक्षम असाल:
- सर्वसमावेशक प्री-फ्लाइट वैधता स्क्रिप्ट तयार करण्यास आणि चालविण्यास
- विविध तैनाती परिस्थितीसाठी स्वयंचलित तपासणी कार्यप्रवाह डिझाइन करण्यास
- पर्यावरण-विशिष्ट सत्यापन प्रक्रिया आणि धोरणे अंमलात आणण्यास
- तैनाती सादरीकरणासाठी प्रगत देखरेख आणि अलर्टिंग संरचीत करण्यास
- प्री-तैनाती समस्या निवारण आणि सुधारात्मक उपाय अंमलात आणण्यास
- प्री-फ्लाइट तपासण्या DevOps पाइपलाइन्स आणि स्वयंचलन कार्यप्रवाहांमध्ये एकत्र करण्यास

## अनुक्रमणिका

- [आढावा](#आढावा)
- [ऑटोमेटेड प्री-फ्लाइट स्क्रिप्ट](#ऑटोमेटेड-प्री-फ्लाइट-स्क्रिप्ट)
- [मॅन्युअल सत्यापन चेकलिस्ट](#codeblock1)
- [पर्यावरण सत्यापन](#✅-बॅकअॅप-व-पुनर्प्राप्ती)
- [संसाधन सत्यापन](#उत्पादन-वातावरण-सत्यापन)
- [सुरक्षा आणि अनुपालन तपासण्या](#security--compliance-checks)
- [कार्यक्षमता आणि क्षमता नियोजन](#performance--capacity-planning)
- [सामान्य समस्या निवारण](#troubleshooting-common-issues)

---

## आढावा

प्री-फ्लाइट तपासण्या तैनाती करण्यापूर्वी केल्या जाणाऱ्या आवश्यक सत्यापनांपैकी आहेत जे सुनिश्चित करतात:

- **संसाधन उपलब्धता** आणि लक्ष्य प्रदेशांमधील कोटे
- **प्रमाणीकरण आणि परवानग्या** योग्य प्रकारे कॉन्फिगर झालेल्या आहेत
- **टेम्पलेट वैधता** आणि पॅरामीटरांची अचूकता
- **नेटवर्क कनेक्टिव्हिटी** आणि अवलंबनीयता
- **सुरक्षा अनुपालन** संस्थात्मक धोरणांनुसार
- **खर्च अंदाज** बजेट मर्यादेत आहेत

### प्री-फ्लाइट तपासण्या कधी चालवाव्यात

- **पहिल्या तैनातीपूर्वी** नवीन वातावरणासाठी
- **महत्त्वपूर्ण टेम्पलेट बदलांनंतर**
- **उत्पादन तैनातींपूर्वी**
- **Azure प्रदेश बदलताना**
- **CI/CD पाइपलाइन्सचा भाग म्हणून**

---

## ऑटोमेटेड प्री-फ्लाइट स्क्रिप्ट

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

# आउटपुटसाठी रंग-कोडिंग
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
    
    # AZD स्थापना तपासा
    try {
        $azdVersion = azd version --output json | ConvertFrom-Json
        Write-Status "AZD CLI installed" "Success" "Version: $($azdVersion.azd.version)"
    }
    catch {
        Write-Status "AZD CLI not found" "Error" "Install from https://aka.ms/azd-install"
        return $false
    }
    
    # Azure CLI स्थापना तपासा
    try {
        $azVersion = az version --output json | ConvertFrom-Json
        Write-Status "Azure CLI installed" "Success" "Version: $($azVersion.'azure-cli')"
    }
    catch {
        Write-Status "Azure CLI not found" "Error" "Install from https://aka.ms/azcli"
        return $false
    }
    
    # PowerShell आवृत्ती तपासा
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
        # AZD प्रमाणीकरण तपासा
        $azdAuth = azd auth login --check-status --output json 2>$null | ConvertFrom-Json
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
        }
        else {
            Write-Status "AZD authentication" "Error" "Run 'azd auth login'"
            return $false
        }
        
        # Azure CLI प्रमाणीकरण तपासा
        $azAccount = az account show --output json | ConvertFrom-Json
        Write-Status "Azure CLI authentication" "Success" "Subscription: $($azAccount.name)"
        
        # सदस्यता प्रवेशाची पडताळणी करा
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
        # सध्याच्या वापरकर्त्याच्या भूमिका नेमणुका मिळवा
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
        
        # रिसोर्स ग्रुप तयार करण्याची चाचणी करा (जर निर्दिष्ट असेल तर)
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # रिसोर्स ग्रुप तयार करण्याची क्षमता तपासा
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
        # कंप्यूट कोटा तपासा
        $computeUsage = az vm list-usage --location $Location --output json | ConvertFrom-Json
        
        # विशिष्ट कोटा तपासा
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
        
        # App Service मर्यादा तपासा
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
        
        # स्टोरेज अकाउंट मर्यादा तपासा
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
        return $true # अवरोधक नसलेले
    }
}

function Test-NetworkConnectivity {
    Write-Host "`n${Blue}=== Network Connectivity Check ===${Reset}"
    
    # Azure एंडपॉइंट्सची चाचणी करा
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
    
    # DNS निराकरणाची चाचणी करा
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
    
    # azure.yaml अस्तित्वात आहे का तपासा
    if (Test-Path "azure.yaml") {
        Write-Status "azure.yaml found" "Success"
        
        # azure.yaml पार्स करा
        try {
            $azureYaml = Get-Content "azure.yaml" -Raw | ConvertFrom-Yaml
            Write-Status "azure.yaml parsing" "Success"
            
            # सेवांची पडताळणी करा
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
    
    # इन्फ्रास्ट्रक्चर फाइल्स तपासा
    if (Test-Path "infra") {
        $bicepFiles = Get-ChildItem -Path "infra" -Filter "*.bicep" -Recurse
        if ($bicepFiles.Count -gt 0) {
            Write-Status "Infrastructure templates" "Success" "$($bicepFiles.Count) Bicep files found"
            
            # main.bicep अस्तित्वात असल्यास पडताळणी करा
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
    
    # 🧪 नवीन: इन्फ्रास्ट्रक्चर प्रीव्यूची चाचणी (सुरक्षित ड्राय-रन)
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
        # लोकेशन वैध आहे का तपासा
        $locations = az account list-locations --output json | ConvertFrom-Json
        $validLocation = $locations | Where-Object { $_.name -eq $Location -or $_.displayName -eq $Location }
        
        if ($validLocation) {
            Write-Status "Azure region" "Success" "Location '$Location' is valid"
        }
        else {
            Write-Status "Azure region" "Error" "Location '$Location' is not valid"
            return $false
        }
        
        # क्षेत्रातील सेवांची उपलब्धता तपासा
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
    
    # मूलभूत खर्च अंदाज (अचूक अंदाजासाठी Azure Pricing API आवश्यक आहे)
    Write-Status "Cost estimation" "Info" "Use Azure Pricing Calculator for detailed estimates"
    Write-Status "Monitoring setup" "Info" "Set up Azure Cost Management alerts"
    
    # बजेट अस्तित्वात आहे का तपासा
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
    
    # सामान्य सुरक्षा पद्धती तपासा
    try {
        # Key Vault कॉन्फिगर आहे का तपासा
        if (Select-String -Path "infra/*.bicep" -Pattern "Microsoft.KeyVault" -Quiet) {
            Write-Status "Key Vault usage" "Success" "Key Vault detected in templates"
        }
        else {
            Write-Status "Key Vault usage" "Warning" "Consider using Key Vault for secrets"
        }
        
        # मॅनेज्ड आयडेंटिटी वापर तपासा
        if (Select-String -Path "infra/*.bicep" -Pattern "managedIdentity|SystemAssigned" -Quiet) {
            Write-Status "Managed Identity" "Success" "Managed Identity detected"
        }
        else {
            Write-Status "Managed Identity" "Warning" "Consider using Managed Identity"
        }
        
        # HTTPS अंमलबजावणी तपासा
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
    
    # सर्व तपास चालवा
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

# प्री-फ्लाइट तपासणी चालवा
Invoke-PreflightCheck
```

### Bash प्री-फ्लाइट चेकर

```bash
#!/bin/bash
# Unix/Linux प्रणालींसाठी प्री-फ्लाइट तपासणींची Bash आवृत्ती

set -euo pipefail

# रंग कोड
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # कोणताही रंग नाही

# सार्वत्रिक चल
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
    
    # AZD स्थापना तपासा
    if command -v azd >/dev/null 2>&1; then
        local azd_version=$(azd version --output json | jq -r '.azd.version')
        print_status "AZD CLI installed" "success" "Version: $azd_version"
    else
        print_status "AZD CLI not found" "error" "Install from https://aka.ms/azd-install"
        return 1
    fi
    
    # Azure CLI स्थापना तपासा
    if command -v az >/dev/null 2>&1; then
        local az_version=$(az version --output json | jq -r '."azure-cli"')
        print_status "Azure CLI installed" "success" "Version: $az_version"
    else
        print_status "Azure CLI not found" "error" "Install from https://aka.ms/azcli"
        return 1
    fi
    
    # jq स्थापना तपासा
    if command -v jq >/dev/null 2>&1; then
        print_status "jq installed" "success"
    else
        print_status "jq not found" "warning" "Install jq for better JSON parsing"
    fi
    
    return 0
}

check_authentication() {
    echo -e "\n${BLUE}=== Authentication Check ===${NC}"
    
    # AZD प्रमाणिकरण तपासा
    if azd auth login --check-status >/dev/null 2>&1; then
        local principal_name=$(azd auth login --check-status --output json 2>/dev/null | jq -r '.principalName // "Unknown"')
        print_status "AZD authentication" "success" "User: $principal_name"
    else
        print_status "AZD authentication" "error" "Run 'azd auth login'"
        return 1
    fi
    
    # Azure CLI प्रमाणिकरण तपासा
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
    
    # azure.yaml तपासा
    if [[ -f "azure.yaml" ]]; then
        print_status "azure.yaml found" "success"
        
        # मूलभूत YAML वैधता तपासणी
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
    
    # इन्फ्रास्ट्रक्चर फाइल्स तपासा
    if [[ -d "infra" ]]; then
        local bicep_count=$(find infra -name "*.bicep" | wc -l)
        if [[ $bicep_count -gt 0 ]]; then
            print_status "Infrastructure templates" "success" "$bicep_count Bicep files found"
            
            # main.bicep अस्तित्वात असल्यास वैधता तपासा
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
    
    # स्थान वैध आहे का ते तपासा
    if az account list-locations --query "[?name=='$LOCATION' || displayName=='$LOCATION']" --output tsv | grep -q .; then
        print_status "Azure region" "success" "Location '$LOCATION' is valid"
    else
        print_status "Azure region" "error" "Location '$LOCATION' is not valid"
        return 1
    fi
    
    # सेवेची उपलब्धता तपासा
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
    # कमांड-लाइन आर्ग्युमेंट्स पार्स करा
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
    
    # आवश्यक पॅरामीटर्सची वैधता तपासा
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
    
    # तपासण्या चालवा
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

# मुख्य फंक्शन चालवा
main "$@"
```

---

## मॅन्युअल सत्यापन चेकलिस्ट

### प्री-तैनाती चेकलिस्ट

या चेकलिस्टची मुद्रित प्रत काढा आणि तैनातीपूर्वी प्रत्येक आयटम तपासा:

#### ✅ पर्यावरण सेटअप
- [ ] AZD CLI इन्स्टॉल केलेले आहे आणि नवीनतम आवृत्तीत अपडेट केलेले आहे
- [ ] Azure CLI इन्स्टॉल केलेले आहे आणि प्रमाणीकरण पूर्ण झालेले आहे
- [ ] योग्य Azure सदस्यता निवडलेली आहे
- [ ] पर्यावरणाचे नाव अद्वितीय आहे आणि नामकरणाच्या निकषांचे पालन करते
- [ ] लक्ष्य Resource Group ओळखले गेले आहे किंवा तयार केले जाऊ शकते

#### ✅ प्रमाणीकरण व परवानग्या
- [ ] यशस्वीपणे `azd auth login` द्वारे लॉगिन केले गेले आहे
- [ ] वापरकर्त्याकडे लक्ष्य सदस्यता/Resource Group वर Contributor भूमिका आहे
- [ ] CI/CD साठी सर्व्हिस प्रिन्सिपल कॉन्फिगर केलेला आहे (लागू असल्यास)
- [ ] मुदत संपलेली प्रमाणपत्रे किंवा क्रेडेन्शियल्स नाहीत

#### ✅ टेम्पलेट वैधता
- [ ] `azure.yaml` अस्तित्वात आहे आणि वैध YAML आहे
- [ ] azure.yaml मध्ये परिभाषित सर्व सेवांसाठी संबंधित स्रोत कोड आहे
- [ ] `infra/` निर्देशिकेत Bicep टेम्पलेट्स उपस्थित आहेत
- [ ] `main.bicep` त्रुटीशिवाय कंपाइल होते (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 Infrastructure preview यशस्वीपणे चालतो (`azd provision --preview`)
- [ ] सर्व आवश्यक पॅरामीटर्सना डीफॉल्ट मूल्ये आहेत किंवा ते दिले जाणार आहेत
- [ ] टेम्पलेटमध्ये हार्डकोड केलेले सिक्रेट्स नाहीत

#### ✅ संसाधन नियोजन
- [ ] लक्ष्य Azure प्रदेश निवडलेला आणि सत्यापित केला गेला आहे
- [ ] आवश्यक Azure सेवांची लक्ष्य प्रदेशात उपलब्धता तपासली गेली आहे
- [ ] नियोजित संसाधनांसाठी पुरेशी कोटे उपलब्ध आहेत
- [ ] संसाधन नामकरणातील संघर्षाची तपासणी केली गेली आहे
- [ ] संसाधनांमधील अवलंबित्व समजले गेले आहेत

#### ✅ नेटवर्क व सुरक्षा
- [ ] Azure एन्डपॉइंट्ससाठी नेटवर्क कनेक्टिव्हिटी सत्यापित केली गेली आहे
- [ ] फायरवॉल/प्रॉक्सी सेटिंग्ज आवश्यक असल्यास कॉन्फिगर केलेल्या आहेत
- [ ] सिक्रेट्स व्यवस्थापनासाठी Key Vault कॉन्फिगर केलेले आहे
- [ ] शक्य तितक्या ठिकाणी Managed Identities वापरल्या गेल्या आहेत
- [ ] वेब अनुप्रयोगांसाठी HTTPS जबरदस्तपणे लागू केलेले आहे

#### ✅ खर्च व्यवस्थापन
- [ ] Azure किंमती कॅल्क्युलेटर वापरून खर्च अंदाज काढले गेले आहेत
- [ ] आवश्यक असल्यास बजेट अलर्ट कॉन्फिगर केले गेले आहेत
- [ ] पर्यावरण प्रकारासाठी योग्य SKU निवडले गेले आहेत
- [ ] उत्पादन वर्कलोडसाठी राखीव क्षमता विचारात घेतलेली आहे

#### ✅ मॉनिटरिंग व ऑब्झर्वेबिलिटी
- [ ] Application Insights टेम्पलेटमध्ये कॉन्फिगर केलेले आहे
- [ ] Log Analytics कार्यक्षेत्र नियोजित केलेले आहे
- [ ] महत्त्वाच्या मेट्रिक्ससाठी अलर्ट नियम परिभाषित केलेले आहेत
- [ ] अनुप्रयोगांमध्ये हेल्थ चेक एंडपॉइंट्स अंमलात आणलेले आहेत

#### ✅ बॅकअॅप व पुनर्प्राप्ती
- [ ] डेटा संसाधनांसाठी बॅकअप धोरण परिभाषित केलेले आहे
- [ ] Recovery Time Objectives (RTO) दस्तऐवजीकृत केलेले आहेत
- [ ] Recovery Point Objectives (RPO) दस्तऐवजीकृत केलेले आहेत
- [ ] उत्पादनासाठी आपत्ती पुनर्प्राप्ती योजना अस्तित्वात आहे

---

## वातावरण सत्यापन

### विकास वातावरण सत्यापन

```bash
#!/bin/bash
# विकास पर्यावरणासाठी विशिष्ट पडताळण्या

validate_dev_environment() {
    echo "=== Development Environment Validation ==="
    
    # विकास-मैत्रीपूर्ण कॉन्फिगरेशन्स तपासा
    if grep -q "sku.*Free\|sku.*F1\|sku.*Basic" infra/*.bicep; then
        echo "✓ Development-appropriate SKUs detected"
    else
        echo "⚠ Consider using lower-cost SKUs for development"
    fi
    
    # ऑटो-शटडाउन कॉन्फिगरेशन्स तपासा
    if grep -q "autoShutdown\|deallocate" infra/*.bicep; then
        echo "✓ Auto-shutdown configuration found"
    else
        echo "ℹ Consider adding auto-shutdown for cost savings"
    fi
    
    # विकासासाठी डेटाबेस कॉन्फिगरेशन्सची पडताळणी करा
    if grep -q "Basic\|S0\|S1" infra/*.bicep; then
        echo "✓ Development database tiers configured"
    else
        echo "⚠ Consider using Basic/Standard tiers for development databases"
    fi
}
```

### उत्पादन वातावरण सत्यापन

```bash
#!/bin/bash
# उत्पादन वातावरणासाठी विशिष्ट पडताळण्या

validate_prod_environment() {
    echo "=== Production Environment Validation ==="
    
    # उच्च उपलब्धतेच्या विन्यासांसाठी तपासा
    if grep -q "zoneRedundant.*true\|Premium\|Standard_GRS" infra/*.bicep; then
        echo "✓ High availability configurations detected"
    else
        echo "⚠ Consider enabling high availability for production"
    fi
    
    # बॅकअप विन्यासांसाठी तपासा
    if grep -q "backup\|retention\|pointInTimeRestore" infra/*.bicep; then
        echo "✓ Backup configurations found"
    else
        echo "⚠ Ensure backup strategies are implemented"
    fi
    
    # निगराणी सेटअपची पडताळणी करा
    if grep -q "Microsoft.Insights\|Application_Type.*web" infra/*.bicep; then
        echo "✓ Monitoring and observability configured"
    else
        echo "⚠ Add comprehensive monitoring for production"
    fi
    
    # सुरक्षा विन्यासांसाठी तपासा
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
    
    # सब्सक्रिप्शनमधील स्टोरेज खाते मिळवा
    accounts = run_command(['az', 'storage', 'account', 'list'])
    
    if accounts is None:
        print("❌ Could not retrieve storage account information")
        return False
    
    account_count = len(accounts)
    max_accounts = 250  # डिफॉल्ट Azure मर्यादा
    
    usage_percent = (account_count / max_accounts) * 100
    status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
    
    print(f"{status} Storage Accounts: {account_count}/{max_accounts} ({usage_percent:.1f}%)")
    
    return usage_percent < 95

def check_network_limits(location: str) -> bool:
    """Check network-related limits"""
    print(f"\n=== Network Limits Check ({location}) ===")
    
    # व्हर्च्युअल नेटवर्क तपासा
    vnets = run_command(['az', 'network', 'vnet', 'list'])
    if vnets is not None:
        vnet_count = len(vnets)
        print(f"✅ Virtual Networks: {vnet_count}/1000")
    
    # सार्वजनिक IP पत्ते तपासा
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
    
    # तपास करा
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

## सुरक्षा आणि अनुपालन तपासण्या

### सुरक्षा सत्यापन स्क्रिप्ट

```bash
#!/bin/bash
# AZD तैनातींसाठी सुरक्षा आणि अनुपालन पडताळणी

check_security_practices() {
    echo "=== Security Best Practices Check ==="
    
    local issues_found=0
    
    # Key Vault चा वापर तपासा
    if grep -r "Microsoft.KeyVault" infra/ >/dev/null 2>&1; then
        echo "✅ Key Vault detected in infrastructure"
    else
        echo "⚠️  Key Vault not found - consider using for secrets management"
        ((issues_found++))
    fi
    
    # Managed Identity चा वापर तपासा
    if grep -r "managedIdentity\|SystemAssigned\|UserAssigned" infra/ >/dev/null 2>&1; then
        echo "✅ Managed Identity configuration detected"
    else
        echo "⚠️  Managed Identity not found - consider using for service authentication"
        ((issues_found++))
    fi
    
    # HTTPS लागू केले आहे का तपासा
    if grep -r "httpsOnly.*true\|requireHttps.*true" infra/ >/dev/null 2>&1; then
        echo "✅ HTTPS enforcement detected"
    else
        echo "⚠️  HTTPS enforcement not found - ensure secure connections"
        ((issues_found++))
    fi
    
    # किमान TLS आवृत्ती तपासा
    if grep -r "minimumTlsVersion.*'TLS1_2'" infra/ >/dev/null 2>&1; then
        echo "✅ Minimum TLS 1.2 configuration detected"
    else
        echo "⚠️  Minimum TLS version not specified - consider requiring TLS 1.2+"
        ((issues_found++))
    fi
    
    # सार्वजनिक प्रवेश निर्बंध तपासा
    if grep -r "allowBlobPublicAccess.*false\|publicNetworkAccess.*Disabled" infra/ >/dev/null 2>&1; then
        echo "✅ Public access restrictions detected"
    else
        echo "⚠️  Public access restrictions not found - consider limiting public access"
        ((issues_found++))
    fi
    
    # नेटवर्क सुरक्षा गट तपासा
    if grep -r "Microsoft.Network/networkSecurityGroups" infra/ >/dev/null 2>&1; then
        echo "✅ Network Security Groups detected"
    else
        echo "ℹ️  Network Security Groups not found - may be acceptable depending on architecture"
    fi
    
    return $issues_found
}

check_compliance_requirements() {
    echo -e "\n=== Compliance Requirements Check ==="
    
    # डेटा एन्क्रिप्शन तपासा
    if grep -r "encryption\|encryptionAtRest\|transparentDataEncryption" infra/ >/dev/null 2>&1; then
        echo "✅ Encryption configurations detected"
    else
        echo "⚠️  Encryption configurations not found - ensure data is encrypted"
    fi
    
    # ऑडिट लॉगिंग तपासा
    if grep -r "Microsoft.Insights.*auditingSettings\|diagnosticSettings" infra/ >/dev/null 2>&1; then
        echo "✅ Audit logging configurations detected"
    else
        echo "⚠️  Audit logging not found - consider enabling for compliance"
    fi
    
    # बॅकअप आणि जतन धोरणे तपासा
    if grep -r "backup.*Policy\|retentionPolicy\|retention.*Days" infra/ >/dev/null 2>&1; then
        echo "✅ Backup and retention policies detected"
    else
        echo "⚠️  Backup/retention policies not found - required for data governance"
    fi
}

# मुख्य अंमलबजावणी
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

## CI/CD सह समाकलन

### GitHub Actions समाकलन

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

### Azure DevOps समाकलन

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

## उत्तम पध्दतींचा सारांश

### ✅ प्री-फ्लाइट तपासणीच्या सर्वोत्तम पद्धती

1. **जहाँ शक्य आहे तिथे स्वयंचलित करा**
   - तपासण्या CI/CD पाइपलाइन्समध्ये एकत्र करा
   - पुनरावृत्तीयोग्य सत्यापनांसाठी स्क्रिप्ट वापरा
   - ऑडिट ट्रेलसाठी निकाल संग्रहित करा

2. **पर्यावरण-विशिष्ट सत्यापन**
   - dev/staging/prod साठी वेगवेगळ्या तपासण्या
   - प्रत्येक वातावरणासाठी योग्य सुरक्षा आवश्यकता
   - नॉन-प्रॉडक्शन वातावरणासाठी खर्च ऑप्टिमायझेशन

3. **संपूर्ण कव्हरेज**
   - प्रमाणीकरण आणि परवानग्या
   - संसाधन कोटे आणि उपलब्धता
   - टेम्पलेट वैधता आणि सिंटॅक्स
   - सुरक्षा आणि अनुपालन आवश्यकता

4. **स्पष्ट रिपोर्टिंग**
   - रंग-कोडेड स्थिती निर्देशक
   - सुधारात्मक पावलांसह तपशीलवार त्रुटी संदेश
   - जलद मुल्यांकनासाठी सारांश अहवाल

5. **त्वरित अयशस्वी करा**
   - जर महत्वाच्या तपासण्या अयशस्वी झाल्या तर तैनाती थांबवा
   - निवारणासाठी स्पष्ट मार्गदर्शन द्या
   - तपासण्या पुन्हा सहज चालवता याव्यात अशी व्यवस्था करा

### सामान्य प्री-फ्लाइट अडथळे

1. **"त्वरित" तैनातींसाठी** सत्यापन टाळणे
2. **पर्याप्त परवानग्या नसणे** तैनातीपूर्वी तपासण्यास
3. **कोटा मर्यादा दुर्लक्षित करणे** जोपर्यंत तैनाती अयशस्वी होत नाही
4. **CI/CD पाइपलाइन्समध्ये टेम्पलेट्सची वैधता तपासणे विसरले जाणे**
5. **उत्पादन वातावरणासाठी सुरक्षा सत्यापन कमी करणे**
6. **अपुरे खर्च अंदाज** ज्यामुळे बजेट अपेक्षा भंग होतात

---

**Pro Tip**: वास्तविक तैनाती जॉबच्या आधी आपल्या CI/CD पाइपलाइनमध्ये प्री-फ्लाइट तपासण्या स्वतंत्र जॉब म्हणून चालवा. यामुळे तुम्हाला लवकर समस्या पकडता येतात आणि डेव्हलपरांना जलद फीडबॅक मिळतो.

---

**नेव्हिगेशन**
- **मागील धडा**: [SKU निवड](sku-selection.md)
- **पुढील धडा**: [Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, परंतु कृपया लक्षात ठेवा की स्वयंचलित अनुवादांमध्ये त्रुटी किंवा अचूकतेचा अभाव असू शकतो. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत म्हणून मानला जावा. महत्त्वाची माहिती असल्यास व्यावसायिक मानवी अनुवादाची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उद्भवलेल्या कोणत्याही गैरसमजुती किंवा चुकीच्या अर्थ लावण्याबद्दल आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
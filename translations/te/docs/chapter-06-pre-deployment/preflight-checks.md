# AZD పంపిణీ కోసం ప్రీ-ఫ్లైట్ తనిఖీలు

**అధ్యాయం నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD For Beginners](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 6 - ప్రీ-డిప్లాయ్‌మెంట్ ధృవీకరణ & ప్లానింగ్
- **⬅️ ముందు**: [SKU Selection](sku-selection.md)
- **➡️ తదుపరి అధ్యాయం**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/common-issues.md)
- **🔧 సంబంధించినది**: [Chapter 4: Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

## పరిచయం

ఈ సమగ్ర గైడ్ ప్రీ-డిప్లాయ్‌మెంట్ ధృవీకరణ స్క్రిప్ట్‌లు మరియు విధానాలను అందిస్తుంది, Azure Developer CLI పంపిణీలు ప్రారంభమవడాన్ని నిర్ధారించేందుకు ముందే విజయవంతమైన డిప్లాయ్‌మెంట్ కోసం. ఆటోమేటెడ్ తనిఖీలను అమలు చేయడం నేర్చుకోండి, అవి యాజమాన్యం, వనరుల అందుబాటు, కోటాలు, సెక్యూరిటీ అనుగుణ్యత మరియు పనితీరు అవసరాలను నిర్దేశిస్తాయి, తద్వారా పంపిణీ విఫలమయ్యే ప్రమాదం నివారించి పంపిణీ విజయపు రేట్లను మెరుగుపరుస్తాయి.

## నేర్చేందుకు లక్ష్యాలు

ఈ గైడ్ పూర్తి చేసిన తర్వాత, మీరు:
- ఆటోమేటెడ్ ప్రీ-డిప్లాయ్‌మెంట్ ధృవీకరణ సాంకేతికతలు మరియు స్క్రిప్ట్‌లలో ప్రావీణ్యం పొందగలరు
- యాజమాన్యం, అనుమతులు మరియు కోటాల కోసం సమగ్రమైన తనిఖీ వ్యూహాలు అర్థం చేసుకోగలరు
- వనరు అందుబాటు మరియు సామర్థ్య ధృవీకరణ విధానాలను అమలు చేయగలరు
- సంస్థా విధానాలకు అనుగుణంగా భద్రత మరియు అనుగుణ్యత తనిఖీలను ఆకృతీకరించగలరు
- ఖర్చు అంచనాలు మరియు బడ్జెట్ ధృవీకరణ వర్క్‌ఫ్లోలను రూపొందించగలరు
- CI/CD పైప్‌లైన్ల కోసం కస్టమ్ ప్రీ-ఫ్లైట్ తనిఖీ ఆటోమెషన్‌ను సృష్టించగలరు

## నేర్చుకున్న ఫలితాలు

పూర్తి చేసిన తర్వాత, మీరు చేయగలరు:
- సమగ్ర ప్రీ-ఫ్లైట్ ధృవీకరణ స్క్రిప్ట్‌లు సృష్టించి అమలు చేయండి
- వివిధ డిప్లాయ్‌మెంట్ సన్నివేశాలకు ఆటోమేటెడ్ తనిఖీ వర్క్‌ఫ్లోలను రూపకల్పన చేయండి
- వాతావరణ నిర్దిష్ట ధృవీకరణ విధానాలు మరియు విధానాలను అమలు చేయండి
- డిప్లాయ్‌మెంట్ సిద్ధత కోసం సందర్భరహిత మానిటరింగ్ మరియు అలర్టింగ్‌ను ఆకృతీకరించండి
- ప్రీ-డిప్లాయ్‌మెంట్ సమస్యలను పరిష్కరించగలరు మరియు సరిదిద్దట చర్యలను అమలు చేయండి
- ప్రీ-ఫ్లైట్ తనిఖీలను DevOps పైప్‌లైన్‌లు మరియు ఆటోమెషన్ వర్క్‌ఫ్లోలలో సమ్మిళితం చేయండి

## విషయ సూచిక

- [అవలోకనం](#overview)
- [ఆటోమేటెడ్ ప్రీ-ఫ్లైట్ స్క్రిప్ట్](#automated-pre-flight-script)
- [మాన్యువల్ ధృవీకరణ తనిఖీ జాబితా](#manual-validation-checklist)
- [పరిసరాల ధృవీకరణ](#environment-validation)
- [వనరు ధృవీకరణ](#resource-validation)
- [భద్రత & అనుగుణ్యత తనిఖీలు](#security--compliance-checks)
- [పనితీరు & సామర్థ్య ప్రణాళిక](capacity-planning.md)
- [సాధారణ సమస్యల పరిష్కారం](../chapter-07-troubleshooting/common-issues.md)

---

## అవలోకనం

ప్రీ-ఫ్లైట్ తనిఖీలు అవసరమైన ధృవీకరణలు, ఇవి పంపిణీకి ముందే నిర్వహించబడతాయి, క్రింది విషయాలను నిర్ధారించడానికి:

- **లక్ష్య ప్రాంతాల్లో వనరు అందుబాటు** మరియు కోటాలు
- **యాజమాన్యం మరియు అనుమతులు** సరైనవిగా ఏర్పాటుచేయబడ్డాయా
- **టెంప్లేట్ చెలామణి** మరియు పారామీటర్ సరైనత
- **నెట్‌వర్క్ కనెక్టివిటీ** మరియు ఆధారాలు
- **సంస్థా విధానాలతో భద్రతా అనుగుణ్యత**
- **బడ్జెట్ పరిమితులలో ఖర్చు అంచనాలు**

### ఎప్పుడు ప్రీ-ఫ్లైట్ తనిఖీలు నిర్వహించాలి

- **కొత్త వాతావరణానికి మొదటి పంపిణీ ముందు**
- **ప్రభావవంతమైన టెంప్లెట్ మార్పులకు తర్వాత**
- **ఉత్పత్తి పంపిణీల ముందు**
- **Azure ప్రాంతాలు మార్చినప్పుడు**
- **CI/CD పైప్‌లైన్‌ల భాగంగా**

---

## ఆటోమేటెడ్ ప్రీ-ఫ్లైట్ స్క్రిప్ట్

> **వ్యాప్తి మరియు ముందు జాగ్రత్తలు:** ఇవి మీ స్వంత ప్రాజెక్ట్‌లో సేవ్ చేయడానికి ప్రారంభ పాయింట్ స్క్రిప్ట్‌లు, ఈ అధ్యాయం అందించే స్థానిక ఫైళ్లు కాదు. PowerShell వెర్షన్ PowerShell **7.3+** (స్ధానిక కమాండ్ error propagation) మరియు `powershell-yaml` మాడ్యూల్‌ని ఉపయోగిస్తుంది `ConvertFrom-Yaml` కోసం. Bash వెర్షన్ Bash, `jq`, Python 3.10+, మరియు PyYAML అవసరం. రెండూ Azure CLI, azd, మరియు పనిచేస్తున్న Bicep ప్రాజెక్ట్‌ను అవసరం. ఇవి డయాగ్నస్టిక్స్ మాత్రమే, పంపిణీ సిద్ధత, సామర్థ్యం, లేదా అనుగుణ్యత కు సాక్ష్యాలు కాదు. `azd provision --preview` కు ముందు టెంప్లేట్ హుక్స్‌ను పరిశీలించండి; హుక్స్ అనూహ్య ప్రాజెక్ట్ ఆదేశాలను అమలు చేయవచ్చు.

### PowerShell ప్రీ-ఫ్లైట్ చెకర్

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

# Fail native commands into catch blocks instead of reporting false successes.
$ErrorActionPreference = 'Stop'
if ($PSVersionTable.PSVersion -lt [version]'7.3') {
    throw 'PowerShell 7.3+ is required for this script.'
}
$PSNativeCommandUseErrorActionPreference = $true

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
        if ($azdAuth.status -eq "success") {
            Write-Status "AZD authentication" "Success" "Token available; expires $($azdAuth.expiresOn)"
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
        $subscription = az account show --subscription $subscriptionId --output json | ConvertFrom-Json
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
            $_.roleDefinitionName -eq "Owner"
        }
        
        if ($hasContributor) {
            Write-Status "Role assignment inventory" "Info" "Contributor/Owner found; verify effective scope, policy and any role-assignment permissions separately"
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
                Write-Status "Resource group creation" "Warning" "Group does not exist. Review subscription-scope permissions; this diagnostic does not create/delete test groups."
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
        if ($coreQuota -and $coreQuota.limit -gt 0) {
            $usagePercent = [math]::Round(($coreQuota.currentValue / $coreQuota.limit) * 100, 2)
            if ($usagePercent -lt 80) {
                Write-Status "Compute cores quota" "Success" "$($coreQuota.currentValue)/$($coreQuota.limit) ($usagePercent%)"
            } else {
                Write-Status "Compute cores quota" "Warning" "Missing or zero quota; verify service requirements"
            }
            else {
                Write-Status "Compute cores quota" "Warning" "$($coreQuota.currentValue)/$($coreQuota.limit) ($usagePercent%)"
            }
        }
        
        # Check App Service limits
        try {
            $appServiceUsage = az appservice list-locations --sku S1 --output json | ConvertFrom-Json
            $displayLocation = az account list-locations --query "[?name=='$Location'].displayName | [0]" -o tsv
            if ($appServiceUsage | Where-Object { $_.name -eq $Location -or $_.name -eq $displayLocation }) {
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
        $storageUsage = @(az storage account show-usage --location $Location --output json | ConvertFrom-Json)[0]
        if ($storageUsage -and $storageUsage.limit -gt 0 -and $storageUsage.currentValue -lt $storageUsage.limit) {
            Write-Status "Storage account quota" "Info" "$($storageUsage.currentValue)/$($storageUsage.limit) in $Location"
        }
        else {
            Write-Status "Storage account quota" "Warning" "No headroom or missing quota data"
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
            # A 401/403/404 response may still prove HTTP reachability.
            if ($_.Exception.Response) {
                Write-Status "Connectivity to $endpoint" "Info" "HTTP response received; this is not an authorization test"
            } else {
                Write-Status "Connectivity to $endpoint" "Error" $_.Exception.Message
                return $false
            }
        }
    }
    
    # Test DNS resolution
    try {
        $dnsResult = [System.Net.Dns]::GetHostAddresses("management.azure.com")
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
            if (-not (Get-Command ConvertFrom-Yaml -ErrorAction SilentlyContinue)) {
                throw 'ConvertFrom-Yaml requires the powershell-yaml module.'
            }
            $azureYaml = Get-Content "azure.yaml" -Raw | ConvertFrom-Yaml
            Write-Status "azure.yaml parsing" "Success"
            
            # Validate services
            if ($azureYaml.services) {
                $serviceCount = $azureYaml.services.Count
                Write-Status "Services defined" "Success" "$serviceCount services found"
            }
            else {
                Write-Status "Services defined" "Warning" "No services defined in azure.yaml"
            }
        }
        catch {
            Write-Status "azure.yaml parsing" "Error" $_.Exception.Message
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
    
    # Preview ARM changes only after reviewing the project's hooks.
    try {
        Write-Status "Infrastructure preview test" "Info" "Previewing proposed changes (not a capacity or deployment guarantee)..."
        $previewResult = azd provision --preview 2>$null
        if ($LASTEXITCODE -eq 0) {
            Write-Status "Infrastructure preview" "Success" "Preview completed; review changes and remaining diagnostics"
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
                $resourceTypes = $providers.resourceTypes | Where-Object { $_.locations -contains $validLocation.displayName }
                
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
    
    # Text-search heuristics only: presence of keywords is not compliance proof.
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
        Write-Host "${Green}✓ Implemented checks passed; review warnings and untested requirements.${Reset}"
        exit 0
    }
    else {
        Write-Host "${Red}✗ Some pre-flight checks failed ($passedCount/$totalCount)${Reset}"
        Write-Host "${Red}✗ Please resolve issues before deployment${Reset}"
        exit 1
    }
}

# Run the pre-flight check
azd env select $EnvironmentName
Invoke-PreflightCheck
```

### Bash ప్రీ-ఫ్లైట్ చెకర్

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
        print_status "jq not found" "error" "jq is required"
        return 1
    fi
    python3 -c "import yaml" >/dev/null 2>&1 || {
        print_status "Python/PyYAML not found" "error" "Python 3 and PyYAML are required"; return 1;
    }
    
    return 0
}

check_authentication() {
    echo -e "\n${BLUE}=== Authentication Check ===${NC}"
    
    # Check AZD authentication
    # --check-status returns exit code 0 even when unauthenticated; inspect JSON.
    if azd auth login --check-status --output json | jq -e '.status == "success"' >/dev/null; then
        print_status "AZD authentication" "success" "Token available"
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
    
    local display_location
    display_location=$(az account list-locations --query "[?name=='$LOCATION'].displayName | [0]" -o tsv)
    for service in "${services[@]}"; do
        if az provider show --namespace "$service" --query "resourceTypes[?contains(locations, '$display_location')]" --output tsv | grep -q .; then
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
    if ! $all_passed; then exit 1; fi
    azd env select "$ENVIRONMENT_NAME" || exit 1
    check_authentication || all_passed=false
    check_template_validation || all_passed=false
    check_regional_availability || all_passed=false
    
    # Summary
    echo -e "\n${BLUE}=== Pre-flight Check Summary ===${NC}"
    
    if $all_passed; then
        echo -e "${GREEN}✓ All pre-flight checks passed${NC}"
        echo -e "${GREEN}✓ Implemented checks passed; review warnings and untested requirements.${NC}"
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

## మాన్యువల్ ధృవీకరణ తనిఖీ జాబితా

### ప్రీ-డిప్లాయ్‌మెంట్ తనిఖీ జాబితా

ఈ తనిఖీ జాబితాను ముద్రించి, ప్రతి అంశాన్ని పంపిణీకి ముందు నిర్ధారించండి:

#### ✅ వాతావరణ ఏర్పాట్లు
- [ ] AZD CLI ఇన్‌స్టాల్ చేసి అప్‌డేట్ చేసిన తాజా వెర్షన్
- [ ] Azure CLI ఇన్‌స్టాల్ చేసి ధృవీకరించబడింది
- [ ] సరైన Azure సబ్స్క్రిప్షన్ ఎంపిక చేయబడింది
- [ ] వాతావరణ పేరు ప్రత్యేకంగా ఉండి పేరు నిబంధనలను అనుసరిస్తుంది
- [ ] లక్ష్య వనరు గ్రూప్ గుర్తించబడింది లేదా సృష్టించబడవచ్చు

#### ✅ యాజమాన్యం & అనుమతులు
- [ ] `azd auth login` తో విజయవంతంగా ధృవీకరించబడ్డారు
- [ ] యూజర్ లక్ష్య సబ్స్క్రిప్షన్/వనరు సమూహంపై కాంట్రిబ్యూటర్ పాత్ర కలిగి ఉన్నారు
- [ ] టెంప్లెట్లుగా పాత్ర కేటాయింపులు ఉంటే, పంపిణీ చేసే గుర్తింపు కూడా స్కోప్ చేయబడిన పాత్ర కేటాయింపు అనుమతులు కలిగి ఉండాలి (కాంట్రిబ్యూటర్ మాత్రమే ఈ అనుమతులు ఇవ్వదు)
- [ ] CI/CD కోసం సర్వీస్ ప్రిన్సిపల్ ఆర్గనైజ్ చేయబడింది (పనిచేస్తే)
- [ ] గడువు ముగిసిన సర్టిఫికెట్లు లేదా ప్రమాణపత్రాలు లేవు

#### ✅ టెంప్లేట్ ధృవీకరణ
- [ ] `azure.yaml` ఉంది మరియు సరైన YAML
- [ ] azure.yaml లో నిర్వచించిన అన్ని సేవలకు సరైన సోర్స్ కోడ్ ఉంది
- [ ] `infra/` డైరెక్టరీలో Bicep టెంప్లెట్లు ఉన్నాయి
- [ ] `main.bicep` లో తప్పుల్లేకుండా కంపైల్ అవుతుంది (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 ఇన్‌ఫ్రా వీవ్ విజయవంతంగా నడుస్తుంది (`azd provision --preview`)
- [ ] అవసరమైన అన్ని పారామీటర్లు డిఫాల్ట్ విలువలు కలిగి లేదా అందించబడ్డాయి
- [ ] టెంప్లెట్లలో హార్డ్‌కోడ్ చేసిన రహస్యాలు లేవు

#### ✅ వనరు ప్రణాళిక
- [ ] లక్ష్య Azure ప్రాంతం ఎంచుకుని ధృవీకరించబడింది
- [ ] లక్ష్య ప్రాంతంలో అవసరమైన Azure సేవలు అందుబాటులో ఉన్నాయి
- [ ] ప్రణాళిక చేసిన వనరులకు తగినంత కోటా లభ్యం
- [ ] వనరు పేరు పొరపాట్లు తనిఖీ చేయబడ్డాయి
- [ ] వనర్ల మధ్య ఆధారాలు అర్థం చేసుకోబడ్డాయి

#### ✅ నెట్‌వర్క్ & భద్రత
- [ ] Azure ఎండ్‌పాయింట్లకు నెట్‌వర్క్ కనెక్టివిటి ధృవీకరించబడింది
- [ ] అవసరమైతే ఫైర్వాల్/ప్రాక్సీ అమరికలు ఏర్పాటుచేయబడినవి
- [ ] రహస్య నిర్వహణ కోసం కీ వాల్ట్ ఆకృతీకరించబడింది
- [ ] సాధ్యమైన చోట్ల నిర్వహణ గుర్తింపులు ఉపయోగించబడ్డాయి
- [ ] వెబ్ అప్లికేషన్ల కోసం HTTPS అమలు చేయబడింది

#### ✅ ఖర్చు నిర్వహణ
- [ ] Azure ప్రైసింగ్ క్యాల్క్యులేటర్ ఉపయోగించి ఖర్చు అంచనాలు లెక్కించబడ్డాయి
- [ ] అవసరమైతే బడ్జెట్ అలర్ట్లు ఏర్పాటు చేయబడ్డాయి
- [ ] వాతావరణ రకానికి తగిన SKUs ఎంపిక చేయబడ్డాయి
- [ ] ఉత్పత్తి వర్క్‌లోడ్‌ల కోసం రిజర్వ్డ్ సామర్థ్యం పరిశీలించబడింది

#### ✅ మానిటరింగ్ & పరిశీలన
- [ ] టెంప్లెట్లలో అప్లికేషన్ ఇన్సైట్స్ ఆకృతీకరించబడింది
- [ ] లాగ్ అనలిటిక్స్ వర్క్‌స్పేస్ ప్రణాళిక చేయబడింది
- [ ] కీలక మెట్రిక్స్ కోసం అలర్ట్ నియమాలు నిర్వచించబడ్డాయి
- [ ] అప్లికేషన్లలో హెల్త్ చెక్ ఎండ్‌పాయింట్లు అమలు చేయబడ్డాయి

#### ✅ బ్యాకప్ & పునఃప్రాప్తి
- [ ] డేటా వనరుల కోసం బ్యాకప్ వ్యూహం నిర్వచించబడింది
- [ ] పునరుద్ధరణ సమయం లక్ష్యాలు (RTO) డాక్యుమెంట్ చేయబడ్డాయి
- [ ] పునరుద్ధరణ పాయింట్ లక్ష్యాలు (RPO) డాక్యుమెంట్ చేయబడ్డాయి
- [ ] ఉత్పత్తి కోసం విపత్తు పునరుద్ధరణ ప్రణాళిక ఉంది

---

## వాతావరణ ధృవీకరణ

క్రింది `grep` తనిఖీలు మాత్రమే చైతన్య గుర్తుదారికలో ఉపయోగించుకోదగినవి. ఒక సరిపోయే పదం కనుగొనడం తప్పకుండా ఒక లక్షణం సరైన వనరులో ఏర్పాటయిందని నిరూపించదు, మరియు ఒక పదం లేకపోవడం అప్పుడు అది లేనట్టే అని నిరూపించదు (మాడ్యూల్స్/డిఫాల్ట్స్ కలిగి ఉండొచ్చు). వీటిని ఉత్పత్తి అనుగుణ్యత గేట్లుగా ఉపయోగించవద్దు.

### అభివృద్ధి వాతావరణ ధృవీకరణ

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

### ఉత్పత్తి వాతావరణ ధృవీకరణ

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

## వనరు ధృవీకరణ

### కోటా ధృవీకరణ స్క్రిప్ట్

```python
#!/usr/bin/env python3
"""
Azure quota and limit validation script
"""

import json
import subprocess
import sys
from typing import Dict, List, Tuple

def run_command(command: List[str]) -> dict | list | None:
    """Run Azure CLI command and return JSON result"""
    try:
        result = subprocess.run(command, capture_output=True, text=True, check=True)
        return json.loads(result.stdout)
    except subprocess.CalledProcessError as e:
        print(f"Error running command {' '.join(command)}: {e}")
        return None
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON: {e}")
        return None

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
            if limit <= 0:
                print(f"❌ No quota for {quota_item['name']['value']}")
                return False
            usage_percent = (current / limit) * 100
            
            status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
            print(f"{status} {quota_item['name']['localizedValue']}: {current}/{limit} ({usage_percent:.1f}%)")
            
            if usage_percent >= 95:
                return False
    
    return True

def check_storage_limits(location: str) -> bool:
    """Check storage account limits"""
    print(f"\n=== Storage Limits Check ({location}) ===")
    
    # Retrieve regional quota rather than assuming a subscription-wide constant.
    usages = run_command(['az', 'storage', 'account', 'show-usage', '--location', location])
    
    if not usages:
        print("❌ Could not retrieve storage account information")
        return False
    
    account_count = usages['currentValue']
    max_accounts = usages['limit']
    if max_accounts <= 0:
        return False
    
    usage_percent = (account_count / max_accounts) * 100
    status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
    
    print(f"{status} Storage Accounts: {account_count}/{max_accounts} ({usage_percent:.1f}%)")
    
    return usage_percent < 95

def check_network_limits(location: str) -> bool:
    """Check network-related limits"""
    print(f"\n=== Network Limits Check ({location}) ===")
    
    usages = run_command(['az', 'network', 'list-usages', '--location', location])
    if not usages:
        return False
    for item in usages:
        current, limit = item['currentValue'], item['limit']
        print(f"{item['name']['value']}: {current}/{limit}")
        if limit <= 0 or current >= limit:
            return False
    return True

def main():
    if len(sys.argv) != 2:
        print("Usage: python3 quota_check.py <location>")
        sys.exit(1)
    
    location = sys.argv[1]
    
    print("🔍 Azure Quota and Limits Validation")
    print(f"📍 Location: {location}")
    from datetime import datetime, timezone
    print(f"⏰ Time: {datetime.now(timezone.utc).isoformat()}")
    
    all_passed = True
    
    # Run checks
    all_passed &= check_compute_quotas(location)
    all_passed &= check_storage_limits(location)
    all_passed &= check_network_limits(location)
    
    # Summary
    print(f"\n=== Quota Check Summary ===")
    if all_passed:
        print("✅ Implemented quota thresholds passed; not a capacity reservation")
        sys.exit(0)
    else:
        print("❌ Some quota limits are near capacity - consider requesting increases")
        sys.exit(1)

if __name__ == "__main__":
    main()
```

---

## భద్రత & అనుగుణ్యత తనిఖీలు

### భద్రత ధృవీకరణ స్క్రిప్ట్

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
    
    local security_issues=0
    check_security_practices || security_issues=$?
    check_compliance_requirements
    
    echo -e "\n=== Security Check Summary ==="
    if [[ $security_issues -eq 0 ]]; then
        echo "✅ Text-search reminders passed; this is not a security/compliance assessment"
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

## CI/CDతో ఏకీకరణ

### GitHub చర్యల ఏకీకరణ

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
    permissions:
      id-token: write
      contents: read
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    
    - name: Install AZD
      uses: Azure/setup-azd@v0.1.0
      with:
        version: 1.37.2
    
    - name: Verify prerequisites
      run: |
        az version
        jq --version
        python3 -c "import yaml"
    
    - name: Azure Login
      uses: azure/login@v2
      with:
        client-id: ${{ vars.AZURE_CLIENT_ID }}
        tenant-id: ${{ vars.AZURE_TENANT_ID }}
        subscription-id: ${{ vars.AZURE_SUBSCRIPTION_ID }}

    - name: AZD Login
      run: |
        azd auth login --client-id "${{ vars.AZURE_CLIENT_ID }}" \
          --tenant-id "${{ vars.AZURE_TENANT_ID }}" \
          --federated-credential-provider github
    
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
    
```

ఈ వర్క్‌ఫ్లో కోసం ఫెడరేటెడ్ క్రెడెన్షియల్స్‌ను ఆకృతీకరించండి మరియు సేవ్ చేసిన స్క్రిప్ట్‌లను నడిపించే ముందు ఎంపిక చేసిన azd వాతావరణాన్ని సృష్టించండి/పునరుద్ధరించండి. ఈ ఉదాహరణలు కన్సోల్ అవుట్పుట్‌ను మాత్రమే రాసి, `preflight-results.json` లేదా JUnit ఫైల్‌ను ఉత్పత్తి చేయవు.

### Azure DevOps ఏకీకరణ

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

- task: AzureCLI@2
  displayName: 'Run Pre-flight Checks'
  inputs:
    azureSubscription: $(serviceConnection)
    scriptType: bash
    scriptLocation: inlineScript
    inlineScript: |
      set -e
      # Requires a workload-identity-federated service connection.
      # AzureCLI@2 supplies AZURESUBSCRIPTION_* for the azd provider.
      azd auth login --federated-credential-provider azure-pipelines
      bash ./scripts/preflight-check.sh \
        --environment-name "${{ parameters.environment }}" \
        --location "${{ parameters.location }}"
  env:
    SYSTEM_ACCESSTOKEN: $(System.AccessToken)
```

పైప్‌లైన్ తన azd వాతావరణాన్ని పునరుద్ధరించాలి/సృష్టించాలి మరియు ఈ పాఠంలో చూపించిన స్క్రిప్ట్‌లను ఈ టాస్క్‍ ముందు సేవ్ చేయాలి. ఫెడరేటెడ్ సర్వీస్ కనెక్షన్‌ను కాన్ఫిగర్ చేసి పైప్‌లైన్‌కు అవసరమైన టోకెన్ అనుమతులు ఇవ్వండి. ఒక poprior `AzureCLI@2` టాస్క్ Azure CLI లాగిన్‌కు ఆధారంగా తర్వాతి సాధారణ Bash టాస్క్ ధృవీకరణ తీసుకోదని ఆశించవద్దు.

---

## ఉత్తమ అభ్యాసాల సారాంశం

### ✅ ప్రీ-ఫ్లైట్ తనిఖీ ఉత్తమ అభ్యాసాలు

1. **సాధ్యమైనన్ని ఆటోమేట్ చేయండి**
   - CI/CD పైప్‌లైన్‌లలో తనిఖీలు ఏకీకరించండి
   - పునరావృత ధృవీకరణలకు స్క్రిప్ట్‌లను ఉపయోగించండి
   - ఆడిట్ ట్రైల్స్ కోసం ఫలితాలను నిల్వ చేయండి

2. **వాతావరణ-ప్రత్యక్ష ధృవీకరణ**
   - dev/staging/prod కోసం వేర్వేరు తనిఖీలు
   - ప్రతి వాతావరణం కోసం సరైన భద్రత అవసరాలు
   - ఉత్పత్తి కాని వాతావరణాల కోసం ఖర్చు ఆప్టిమైజేషన్

3. **సమగ్ర కవరేజ్**
   - యాజమాన్యం మరియు అనుమతులు
   - వనరు కోటాలు మరియు అందుబాటు
   - టెంప్లేట్ ధృవీకరణ మరియు వాక్యరచన
   - భద్రత మరియు అనుగుణ్యత అవసరాలు

4. **స్పష్టమైన రిపోర్టింగ్**
   - రంగు-కోడెడ్ స్థితి సూచికలు
   - పరిష్కార చర్యలతో సమగ్ర తప్పిద సందేశాలు
   - త్వరిత అంచనాకు సారాంశ నివేదికలు

5. **త్వరగా విఫలమయ్యేలా ఉండండి**
   - నిస్సహాయ ఉన్నత తనిఖీలు విఫలమైతే పంపిణీ ఆపు
   - పరిష్కారం కోసం స్పష్టమైన మార్గదర్శన ఇవ్వండి
   - తనిఖీలను సులభంగా మళ్ళీ నిర్వహించండి

### సాధారణ ప్రీ-ఫ్లైట్ లోపాలు

1. **"త్వరిత" పంపిణీలు కోసం ధృవీకరణ మిస్ అవడం**
2. **పంపిణీ కి ముందు అనుమతులు సరిపోకపోవడం**
3. **కోటా పరిమితులు నిర్లక్ష్యం చేయడం పంపిణీ విఫలం అయ్యేవరకు**
4. **CI/CD పైప్‌లైన్‌లో టెంప్లెట్‌ల ధృవీకరణ చేయకపోవడం**
5. **ఉత్పత్తి వాతావరణాల కోసం భద్రత ధృవీకరణ మిస్ అవడం**
6. **అసమతుల ఖర్చు అంచనాల కారణంగా బడ్జెట్ ఆశ్చర్యాలు**

---

**ప్రో టిప్**: ప్రీ-ఫ్లైట్ తనిఖీలను మీ CI/CD పైప్‌లైన్‌లో నిజమైన పంపిణీ ఉద్యోగానికి ముందు వేరే ఉద్యోగంగా నిర్వహించండి. ఇది సమస్యలను తొందరగా గుర్తించడానికి మరియు అభివృద్ధి దారులకు వేగమైన ఫీడ്ബ్యాక్ ఇవ్వడానికి సహాయపడుతుంది.

---

**నావిగేషన్**
- **క్రితం పాఠం**: [SKU Selection](sku-selection.md)
- **తరువాత పాఠం**: [Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
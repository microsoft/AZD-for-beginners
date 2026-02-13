# AZD డిప్లాయ్‌మెంట్ల కోసం ప్రీ-ఫ్లైట్ చెక్స్

**అధ్యాయం నావిగేషన్:**
- **📚 కోర్స్ హోమ్**: [AZD For Beginners](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 6 - ప్రీ-డిప్లాయ్‌మెంట్ వాలిడేషన్ & ప్లానింగ్
- **⬅️ ముందు**: [SKU Selection](sku-selection.md)
- **➡️ తదుపరి అధ్యాయం**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/common-issues.md)
- **🔧 సంబంధిత**: [Chapter 4: Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

## పరిచయం

ఈ సమగ్ర మార్గదర్శకము ప్రారంభించడానికి ముందు Azure Developer CLI డిప్లాయ్‌మెంట్‌ల విజయాన్ని నిర్ధారించడానికి ప్రీ-డిప్లాయ్‌మెంట్ వాలిడేషన్ స్క్రిప్ట్‌లు మరియు ప్రక్రియలను అందిస్తుంది. ఆటోమేటెడ్ చెక్‌లను అమలు చేయడం ద్వారా ప్రామాణీకరణ, వనరు అందుబాటుపడి ఉండకపోవడం, కోటాస్, భద్రతా అనుకూలత, మరియు పనితీరు అవసరాలను నిర్ధారించి డిప్లాయ్‌మెంట్ వైఫల్యాలను నివారించండి మరియు డిప్లాయ్‌మెంట్ విజయాల రేట్లను మెరుగుపరచండి.

## నేర్చుకునే లక్ష్యాలు

ఈ మార్గదర్శకాన్ని పూర్తి చేసిన తర్వాత మీరు:
- ఆటోమేటెడ్ ప్రీ-డిప్లాయ్‌మెంట్ వాలిడేషన్ సాంకేతికతలు మరియు స్క్రిప్ట్‌లను అధిగమిస్తారు
- ప్రామాణీకరణ, అనుమతులు, మరియు కోటాస్ కోసం సమగ్ర చెక్కింగ్ వ్యూహాలను అర్థం చేసుకుంటారు
- వనరు అందుబాటు మరియు సామర్థ్య వాలిడేషన్ ప్రక్రియలను అమలు చేస్తారు
- సంస్థా విధానాల కోసం భద్రత మరియు అనుకూలత చెక్స్‌ను కాన్ఫిగర్ చేస్తారు
- ఖర్చు అంచనాలు మరియు బడ్జెట్ వాలిడేషన్ పనితీరులను డిజైన్ చేస్తారు
- CI/CD పైప్‌లైన్ల కోసం కస్టమ్ ప్రీ-ఫ్లైట్ చెక్ ఆటోమేషన్‌ను సృష్టిస్తారు

## నేర్చుకున్న ఫలితాలు

పూర్తీ చేయగానే, మీరు చేయగలరు:
- సమగ్ర ప్రీ-ఫ్లైట్ వాలిడేషన్ స్క్రిప్ట్‌లను సృష్టించడం మరియు అమలు చేయడం
- విభిన్న డిప్లాయ్‌మెంట్ సన్నివేశాల కోసం ఆటోమేటెడ్ చెకింగ్ వర్క్‌ఫ్లోలను రూపకల్పన చేయడం
- పరిసర-నిర్దిష్ట వాలిడేషన్ ప్రక్రియలు మరియు విధానాలను అమలు చేయడం
- డిప్లాయ్‌మెంట్ రెడినెస్ కోసం ప్రాస్సుల సూచన మరియు అలర్టింగ్‌ను కాన్ఫిగర్ చేయడం
- ప్రీ-డిప్లాయ్‌మెంట్ సమస్యలను ట్రబుల్షూట్ చేయడం మరియు సవరణ చర్యలను అమలు చేయడం
- ప్రీ-ఫ్లైట్ చెక్స్‌ను DevOps పైప్‌లైన్లు మరియు ఆటోమేషన్ వర్క్‌ఫ్లోలకు సమగ్రీకరించడం

## విషయ సూచిక

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

ప్రీ-ఫ్లైట్ చెక్స్ అనేవి డిప్లాయ్‌మెంట్ ప్రారంభించే ముందు నిర్వహించే అవసరమైన వాలిడేషన్లు, ఇవి నిర్ధారిస్తాయి:

- టార్గెట్ రీజియన్లలో వనరు అందుబాటు మరియు కోటాస్
- ప్రామాణీకరణ మరియు అనుమతులు సరిగ్గా కాన్ఫిగర్ చేయబడ్డాయా
- టెంప్లేట్ చెల్లుబాటు మరియు పారామీటర్‌ల సరైనత
- నెట్‌వర్క్ కనెక్టివిటీ మరియు ఆధారితతలు
- సంస్థా విధానాలకు అనుగుణంగా భద్రతా అనుకూలత
- బడ్జెట్ పరిమితులలో ఖర్చు అంచనా

### ఎప్పుడు ప్రీ-ఫ్లైట్ చెక్స్ నడపాలి

- కొత్త పరిసరానికి మొదటి డిప్లాయ్‌మెంట్ ముందు
- టెంప్లేట్‌లలో పెద్ద మార్పులు చేసిన తర్వాత
- ప్రొడక్షన్ డిప్లాయ్‌మెంట్‌ల ముందు
- Azure రీజియన్లు మారుతున్నప్పుడు
- CI/CD పైప్‌లైన్ల భాగంగా

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

# అవుట్పుట్ కోసం రంగు కోడింగ్
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
    
    # AZD ఇన్‌స్టాలేషన్‌ను తనిఖీ చేయండి
    try {
        $azdVersion = azd version --output json | ConvertFrom-Json
        Write-Status "AZD CLI installed" "Success" "Version: $($azdVersion.azd.version)"
    }
    catch {
        Write-Status "AZD CLI not found" "Error" "Install from https://aka.ms/azd-install"
        return $false
    }
    
    # Azure CLI ఇన్‌స్టాలేషన్‌ను తనిఖీ చేయండి
    try {
        $azVersion = az version --output json | ConvertFrom-Json
        Write-Status "Azure CLI installed" "Success" "Version: $($azVersion.'azure-cli')"
    }
    catch {
        Write-Status "Azure CLI not found" "Error" "Install from https://aka.ms/azcli"
        return $false
    }
    
    # PowerShell సంస్కరణను తనిఖీ చేయండి
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
        # AZD ప్రామాణీకరణను తనిఖీ చేయండి
        $azdAuth = azd auth login --check-status --output json 2>$null | ConvertFrom-Json
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
        }
        else {
            Write-Status "AZD authentication" "Error" "Run 'azd auth login'"
            return $false
        }
        
        # Azure CLI ప్రామాణీకరణను తనిఖీ చేయండి
        $azAccount = az account show --output json | ConvertFrom-Json
        Write-Status "Azure CLI authentication" "Success" "Subscription: $($azAccount.name)"
        
        # సబ్‌స్క్రిప్షన్ యాక్సెస్‌ను ధృవీకరించండి
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
        # ప్రస్తుత వినియోగదారుడి పాత్ర నియామకాలను పొందండి
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
        
        # రీసోర్స్ గ్రూప్ సృష్టిని పరీక్షించండి (నిర్దేశించబడితే)
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # రీసోర్స్ గ్రూప్ సృష్టించగల సామర్థ్యాన్ని పరీక్షించండి
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
        # కంప్యూట్ కోటాలను తనిఖీ చేయండి
        $computeUsage = az vm list-usage --location $Location --output json | ConvertFrom-Json
        
        # నిర్దిష్ట కోటాలను తనిఖీ చేయండి
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
        
        # App Service పరిమితులను తనిఖీ చేయండి
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
        
        # స్టోరేజ్ అకౌంట్ పరిమితులను తనిఖీ చేయండి
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
        return $true # అడ్డపడదు
    }
}

function Test-NetworkConnectivity {
    Write-Host "`n${Blue}=== Network Connectivity Check ===${Reset}"
    
    # Azure ఎండ్‌పాయింట్లను పరీక్షించండి
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
    
    # DNS పరిష్కరణను పరీక్షించండి
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
    
    # azure.yaml ఉన్నదో లేదో తనిఖీ చేయండి
    if (Test-Path "azure.yaml") {
        Write-Status "azure.yaml found" "Success"
        
        # azure.yamlని పార్స్ చేయండి
        try {
            $azureYaml = Get-Content "azure.yaml" -Raw | ConvertFrom-Yaml
            Write-Status "azure.yaml parsing" "Success"
            
            # సేవలను ధృవీకరించండి
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
    
    # ఇన్ఫ్రాస్ట్రక్చర్ ఫైళ్ల కోసం తనిఖీ చేయండి
    if (Test-Path "infra") {
        $bicepFiles = Get-ChildItem -Path "infra" -Filter "*.bicep" -Recurse
        if ($bicepFiles.Count -gt 0) {
            Write-Status "Infrastructure templates" "Success" "$($bicepFiles.Count) Bicep files found"
            
            # main.bicep ఉంటే దాన్ని ధృవీకరించండి
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
    
    # 🧪 కొత్త: ఇన్ఫ్రాస్ట్రక్చర్ ప్రివ్యూ (సురక్షిత డ్రై-రన్)ను పరీక్షించండి
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
        # లొకేషన్ సరైనదో లేదో తనిఖీ చేయండి
        $locations = az account list-locations --output json | ConvertFrom-Json
        $validLocation = $locations | Where-Object { $_.name -eq $Location -or $_.displayName -eq $Location }
        
        if ($validLocation) {
            Write-Status "Azure region" "Success" "Location '$Location' is valid"
        }
        else {
            Write-Status "Azure region" "Error" "Location '$Location' is not valid"
            return $false
        }
        
        # రీజియన్‌లో సేవల అందుబాటును తనిఖీ చేయండి
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
    
    # ప్రాథమిక ఖర్చు అంచనా (సరైన అంచనాలకు Azure Pricing API అవసరం)
    Write-Status "Cost estimation" "Info" "Use Azure Pricing Calculator for detailed estimates"
    Write-Status "Monitoring setup" "Info" "Set up Azure Cost Management alerts"
    
    # బడ్జెట్ ఉందో లేదో తనిఖీ చేయండి
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
    
    # సాధారణ భద్రతా పద్ధతుల కోసం తనిఖీ చేయండి
    try {
        # Key Vault కాన్ఫిగర్ అయిందో లేదో తనిఖీ చేయండి
        if (Select-String -Path "infra/*.bicep" -Pattern "Microsoft.KeyVault" -Quiet) {
            Write-Status "Key Vault usage" "Success" "Key Vault detected in templates"
        }
        else {
            Write-Status "Key Vault usage" "Warning" "Consider using Key Vault for secrets"
        }
        
        # Managed identity వినియోగం కోసం తనిఖీ చేయండి
        if (Select-String -Path "infra/*.bicep" -Pattern "managedIdentity|SystemAssigned" -Quiet) {
            Write-Status "Managed Identity" "Success" "Managed Identity detected"
        }
        else {
            Write-Status "Managed Identity" "Warning" "Consider using Managed Identity"
        }
        
        # HTTPS బలవంతీకరణ కోసం తనిఖీ చేయండి
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

# ప్రధాన అమలు
function Invoke-PreflightCheck {
    Write-Host "${Green}AZD Pre-flight Check${Reset}" -ForegroundColor Green
    Write-Host "Environment: $EnvironmentName"
    Write-Host "Location: $Location"
    if ($ResourceGroup) { Write-Host "Resource Group: $ResourceGroup" }
    Write-Host "Time: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    Write-Host ""
    
    $allPassed = $true
    $results = @{}
    
    # అన్ని తనిఖీలను నడిపించండి
    $results["Prerequisites"] = Test-Prerequisites
    $results["Authentication"] = Test-Authentication
    $results["Permissions"] = Test-Permissions
    $results["QuotasAndLimits"] = Test-QuotasAndLimits
    $results["NetworkConnectivity"] = Test-NetworkConnectivity
    $results["TemplateValidation"] = Test-TemplateValidation
    $results["RegionalAvailability"] = Test-RegionalAvailability
    $results["CostEstimation"] = Test-CostEstimation
    $results["SecurityCompliance"] = Test-SecurityCompliance
    
    # సారాంశం
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

# ముందస్తు తనిఖీని నడిపించండి
Invoke-PreflightCheck
```

### Bash Pre-flight Checker

```bash
#!/bin/bash
# Unix/Linux సిస్టమ్‌ల కోసం ప్రీ-ఫ్లైట్ తనిఖీల బాష్ సంస్కరణ

set -euo pipefail

# రంగు కోడ్లు
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # రంగు లేదు

# గ్లోబల్ వేరియబుల్స్
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
    
    # AZD ఇన్‌స్టాలేషన్‌ను తనిఖీ చేయండి
    if command -v azd >/dev/null 2>&1; then
        local azd_version=$(azd version --output json | jq -r '.azd.version')
        print_status "AZD CLI installed" "success" "Version: $azd_version"
    else
        print_status "AZD CLI not found" "error" "Install from https://aka.ms/azd-install"
        return 1
    fi
    
    # Azure CLI ఇన్‌స్టాలేషన్‌ను తనిఖీ చేయండి
    if command -v az >/dev/null 2>&1; then
        local az_version=$(az version --output json | jq -r '."azure-cli"')
        print_status "Azure CLI installed" "success" "Version: $az_version"
    else
        print_status "Azure CLI not found" "error" "Install from https://aka.ms/azcli"
        return 1
    fi
    
    # jq ఇన్‌స్టాలేషన్‌ను తనిఖీ చేయండి
    if command -v jq >/dev/null 2>&1; then
        print_status "jq installed" "success"
    else
        print_status "jq not found" "warning" "Install jq for better JSON parsing"
    fi
    
    return 0
}

check_authentication() {
    echo -e "\n${BLUE}=== Authentication Check ===${NC}"
    
    # AZD ప్రామాణీకరణను తనిఖీ చేయండి
    if azd auth login --check-status >/dev/null 2>&1; then
        local principal_name=$(azd auth login --check-status --output json 2>/dev/null | jq -r '.principalName // "Unknown"')
        print_status "AZD authentication" "success" "User: $principal_name"
    else
        print_status "AZD authentication" "error" "Run 'azd auth login'"
        return 1
    fi
    
    # Azure CLI ప్రామాణీకరణను తనిఖీ చేయండి
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
    
    # azure.yaml‌ను తనిఖీ చేయండి
    if [[ -f "azure.yaml" ]]; then
        print_status "azure.yaml found" "success"
        
        # ప్రాథమిక YAML ధృవీకరణ
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
    
    # ఇన్ఫ్రాస్ట్రక్చర్ ఫైళ్లను తనిఖీ చేయండి
    if [[ -d "infra" ]]; then
        local bicep_count=$(find infra -name "*.bicep" | wc -l)
        if [[ $bicep_count -gt 0 ]]; then
            print_status "Infrastructure templates" "success" "$bicep_count Bicep files found"
            
            # main.bicep ఉన్నట్లయితే ధృవీకరించండి
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
    
    # లొకేషన్ చెల్లుబాటు అవుతుందో లేదో తనిఖీ చేయండి
    if az account list-locations --query "[?name=='$LOCATION' || displayName=='$LOCATION']" --output tsv | grep -q .; then
        print_status "Azure region" "success" "Location '$LOCATION' is valid"
    else
        print_status "Azure region" "error" "Location '$LOCATION' is not valid"
        return 1
    fi
    
    # సేవ లభ్యతను తనిఖీ చేయండి
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
    # కమాండ్ లైన్ ఆర్గ్యుమెంట్స్‌ను పార్స్ చేయండి
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
    
    # అవసరమైన పారామీటర్లు ధృవీకరించండి
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
    
    # తనిఖీలు అమలు చేయండి
    local all_passed=true
    
    check_prerequisites || all_passed=false
    check_authentication || all_passed=false
    check_template_validation || all_passed=false
    check_regional_availability || all_passed=false
    
    # సారాంశం
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

# ప్రధాన ఫంక్షన్‌ను నడపండి
main "$@"
```

---

## Manual Validation Checklist

### Pre-Deployment Checklist

ఈ చెక్లిస్ట్‌ను ప్రింట్ చేసి ప్రతి అంశాన్ని డిప్లాయ్‌మెంట్‌కు ముందు ధృవీకరించండి:

#### ✅ Environment Setup
- [ ] AZD CLI installed and updated to latest version
- [ ] Azure CLI installed and authenticated
- [ ] Correct Azure subscription selected
- [ ] Environment name is unique and follows naming conventions
- [ ] Target resource group identified or can be created

#### ✅ Authentication & Permissions
- [ ] Successfully authenticated with `azd auth login`
- [ ] User has Contributor role on target subscription/resource group
- [ ] Service principal configured for CI/CD (if applicable)
- [ ] No expired certificates or credentials

#### ✅ Template Validation
- [ ] `azure.yaml` exists and is valid YAML
- [ ] All services defined in azure.yaml have corresponding source code
- [ ] Bicep templates in `infra/` directory are present
- [ ] `main.bicep` compiles without errors (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 Infrastructure preview runs successfully (`azd provision --preview`)
- [ ] All required parameters have default values or will be provided
- [ ] No hardcoded secrets in templates

#### ✅ Resource Planning
- [ ] Target Azure region selected and validated
- [ ] Required Azure services available in target region
- [ ] Sufficient quotas available for planned resources
- [ ] Resource naming conflicts checked
- [ ] Dependencies between resources understood

#### ✅ Network & Security
- [ ] Network connectivity to Azure endpoints verified
- [ ] Firewall/proxy settings configured if needed
- [ ] Key Vault configured for secrets management
- [ ] Managed identities used where possible
- [ ] HTTPS enforcement enabled for web applications

#### ✅ Cost Management
- [ ] Cost estimates calculated using Azure Pricing Calculator
- [ ] Budget alerts configured if required
- [ ] Appropriate SKUs selected for environment type
- [ ] Reserved capacity considered for production workloads

#### ✅ Monitoring & Observability
- [ ] Application Insights configured in templates
- [ ] Log Analytics workspace planned
- [ ] Alert rules defined for critical metrics
- [ ] Health check endpoints implemented in applications

#### ✅ Backup & Recovery
- [ ] Backup strategy defined for data resources
- [ ] Recovery time objectives (RTO) documented
- [ ] Recovery point objectives (RPO) documented
- [ ] Disaster recovery plan in place for production

---

## Environment Validation

### Development Environment Validation

```bash
#!/bin/bash
# డెవలప్‌మెంట్ పర్యావరణానికి ప్రత్యేకమైన ధృవీకరణలు

validate_dev_environment() {
    echo "=== Development Environment Validation ==="
    
    # డెవలప్‌మెంట్‌కు అనుకూలంగా ఉన్న కాన్ఫిగరేషన్లను తనిఖీ చేయండి
    if grep -q "sku.*Free\|sku.*F1\|sku.*Basic" infra/*.bicep; then
        echo "✓ Development-appropriate SKUs detected"
    else
        echo "⚠ Consider using lower-cost SKUs for development"
    fi
    
    # ఆటో-షట్‌డౌన్ కాన్ఫిగరేషన్లను తనిఖీ చేయండి
    if grep -q "autoShutdown\|deallocate" infra/*.bicep; then
        echo "✓ Auto-shutdown configuration found"
    else
        echo "ℹ Consider adding auto-shutdown for cost savings"
    fi
    
    # డెవలప్‌మెంట్ డేటాబేస్ కాన్ఫిగరేషన్లను ధృవీకరించండి
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
# ఉత్పత్తి (ప్రొడక్షన్) వాతావరణానికి ప్రత్యేక ధృవీకరణలు

validate_prod_environment() {
    echo "=== Production Environment Validation ==="
    
    # హై-అవైలబిలిటీ కాన్ఫిగరేషన్లను తనిఖీ చేయండి
    if grep -q "zoneRedundant.*true\|Premium\|Standard_GRS" infra/*.bicep; then
        echo "✓ High availability configurations detected"
    else
        echo "⚠ Consider enabling high availability for production"
    fi
    
    # బ్యాకప్ కాన్ఫిగరేషన్లను తనిఖీ చేయండి
    if grep -q "backup\|retention\|pointInTimeRestore" infra/*.bicep; then
        echo "✓ Backup configurations found"
    else
        echo "⚠ Ensure backup strategies are implemented"
    fi
    
    # పర్యవేక్షణ సెటప్‌ను ధృవీకరించండి
    if grep -q "Microsoft.Insights\|Application_Type.*web" infra/*.bicep; then
        echo "✓ Monitoring and observability configured"
    else
        echo "⚠ Add comprehensive monitoring for production"
    fi
    
    # భద్రతా కాన్ఫిగరేషన్లను తనిఖీ చేయండి
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
    
    # సబ్‌స్క్రిప్షన్లో స్టోరేజ్ ఖాతాలను పొందండి
    accounts = run_command(['az', 'storage', 'account', 'list'])
    
    if accounts is None:
        print("❌ Could not retrieve storage account information")
        return False
    
    account_count = len(accounts)
    max_accounts = 250  # డిఫాల్ట్ Azure పరిమితి
    
    usage_percent = (account_count / max_accounts) * 100
    status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
    
    print(f"{status} Storage Accounts: {account_count}/{max_accounts} ({usage_percent:.1f}%)")
    
    return usage_percent < 95

def check_network_limits(location: str) -> bool:
    """Check network-related limits"""
    print(f"\n=== Network Limits Check ({location}) ===")
    
    # వర్చువల్ నెట్‌వర్క్స్‌ను తనిఖీ చేయండి
    vnets = run_command(['az', 'network', 'vnet', 'list'])
    if vnets is not None:
        vnet_count = len(vnets)
        print(f"✅ Virtual Networks: {vnet_count}/1000")
    
    # పబ్లిక్ IP చిరునామాలను తనిఖీ చేయండి
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
    
    # తనిఖీలను నడపండి
    all_passed &= check_compute_quotas(location)
    all_passed &= check_storage_limits(location)
    all_passed &= check_network_limits(location)
    
    # సారాంశం
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
# AZD డిప్లాయ్‌మెంట్స్ కోసం భద్రత మరియు అనుగుణత ధృవీకరణ

check_security_practices() {
    echo "=== Security Best Practices Check ==="
    
    local issues_found=0
    
    # Key Vault వినియోగాన్ని తనిఖీ చేయండి
    if grep -r "Microsoft.KeyVault" infra/ >/dev/null 2>&1; then
        echo "✅ Key Vault detected in infrastructure"
    else
        echo "⚠️  Key Vault not found - consider using for secrets management"
        ((issues_found++))
    fi
    
    # Managed Identity వినియోగాన్ని తనిఖీ చేయండి
    if grep -r "managedIdentity\|SystemAssigned\|UserAssigned" infra/ >/dev/null 2>&1; then
        echo "✅ Managed Identity configuration detected"
    else
        echo "⚠️  Managed Identity not found - consider using for service authentication"
        ((issues_found++))
    fi
    
    # HTTPS అమలుని తనిఖీ చేయండి
    if grep -r "httpsOnly.*true\|requireHttps.*true" infra/ >/dev/null 2>&1; then
        echo "✅ HTTPS enforcement detected"
    else
        echo "⚠️  HTTPS enforcement not found - ensure secure connections"
        ((issues_found++))
    fi
    
    # కనిష్ట TLS వెర్షన్ కోసం తనిఖీ చేయండి
    if grep -r "minimumTlsVersion.*'TLS1_2'" infra/ >/dev/null 2>&1; then
        echo "✅ Minimum TLS 1.2 configuration detected"
    else
        echo "⚠️  Minimum TLS version not specified - consider requiring TLS 1.2+"
        ((issues_found++))
    fi
    
    # సార్వజనిక ప్రవేశ పరిమితులను తనిఖీ చేయండి
    if grep -r "allowBlobPublicAccess.*false\|publicNetworkAccess.*Disabled" infra/ >/dev/null 2>&1; then
        echo "✅ Public access restrictions detected"
    else
        echo "⚠️  Public access restrictions not found - consider limiting public access"
        ((issues_found++))
    fi
    
    # నెట్‌వర్క్ సెక్యూరిటీ గ్రూప్స్‌ను తనిఖీ చేయండి
    if grep -r "Microsoft.Network/networkSecurityGroups" infra/ >/dev/null 2>&1; then
        echo "✅ Network Security Groups detected"
    else
        echo "ℹ️  Network Security Groups not found - may be acceptable depending on architecture"
    fi
    
    return $issues_found
}

check_compliance_requirements() {
    echo -e "\n=== Compliance Requirements Check ==="
    
    # డేటా ఎన్క్రిప్షన్‌ను తనిఖీ చేయండి
    if grep -r "encryption\|encryptionAtRest\|transparentDataEncryption" infra/ >/dev/null 2>&1; then
        echo "✅ Encryption configurations detected"
    else
        echo "⚠️  Encryption configurations not found - ensure data is encrypted"
    fi
    
    # ఆడిట్ లాగింగ్‌ను తనిఖీ చేయండి
    if grep -r "Microsoft.Insights.*auditingSettings\|diagnosticSettings" infra/ >/dev/null 2>&1; then
        echo "✅ Audit logging configurations detected"
    else
        echo "⚠️  Audit logging not found - consider enabling for compliance"
    fi
    
    # బ్యాకప్ మరియు నిల్వ విధానాలను తనిఖీ చేయండి
    if grep -r "backup.*Policy\|retentionPolicy\|retention.*Days" infra/ >/dev/null 2>&1; then
        echo "✅ Backup and retention policies detected"
    else
        echo "⚠️  Backup/retention policies not found - required for data governance"
    fi
}

# ప్రధాన అమలు
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

1. **ఆటోమేట్ చేయండి ఎక్కడైనా చేయగలిగినంత**
   - చెక్లను CI/CD పైప్‌లైన్లలో సమీకరించండి
   - పునరావృత వాలిడేషన్‌ల కోసం స్క్రిప్ట్‌లను ఉపయోగించండి
   - ఆడిట్ ట్రైల్స్ కోసం ఫలితాలను నిల్వ చేయండి

2. **పరిసర-నిర్దిష్ట వాలిడేషన్**
   - dev/staging/prod కోసం వేర్వేరు చెక్స్
   - ప్రతి పరిసరానికి సరిపోయే భద్రతా అవసరాలు
   - non-production పరిసరాల కోసం ఖర్చు tốiమీకరణ

3. **సమగ్ర వర్తింపు**
   - ప్రామాణీకరణ మరియు అనుమతులు
   - వనరు కోటాస్ మరియు అందుబాటు
   - టెంప్లేట్ వాలిడేషన్ మరియు సింట్యాక్స్
   - భద్రత మరియు అనుకూలత అవసరాలు

4. **స్పష్ట రిపోర్టింగ్**
   - కలర్-కోడ్ చేసిన స్టేటస్ సూచికలు
   - పరిష్కార సూచనలతో విపులమైన లోప సందేశాలు
   - త్వరిత మూల్యాంకనానికి సమరీ రిపోర్ట్స్

5. **ఫెయిల్ ఫాస్ట్**
   - కీలకమైన చెక్స్ విఫలమైతే డిప్లాయ్‌మెంట్‌ను నిలిపివేయండి
   - పరిష్కారం కోసం స్పష్ట మార్గదర్శకాన్ని అందించండి
   - చెక్స్‌ను మళ్లీ నడపడం సులభంగా చేయండి

### Common Pre-flight Pitfalls

1. **వాలిడేషన్‌ను స్కిప్ చేయడం** "ఇంటి త్వరిత" డిప్లాయ్‌మెంట్స్ కోసం
2. **అనుమతుల అసంపూర్ణ తనిఖీ** డిప్లాయ్‌మెంట్ ముందు
3. **కోటా పరిమితులను గమనించకపోవడం** డిప్లాయ్‌మెంట్ విఫలమైనప్పుడు గమనిస్తారు
4. **CI/CD పైప్‌లైన్లలో టెంప్లేట్‌లను వాలిడేట్ చేయకపోవడం**
5. **ప్రొడక్షన్ పరిసరాల కోసం భద్రతా వాలిడేషన్ మిస్ అవ్వడం**
6. **అనుకూలంగా లేని ఖర్చు అంచనాలు** బడ్జెట్ ఆశ్చర్యాలకు కారణం

---

**ప్రో టిప్**: ప్రీ-ఫ్లైట్ చెక్స్‌ను మీ CI/CD పైప్‌లైన్‌లో అసలైన డిప్లాయ్‌మెంట్ జాబ్ ముందు వేరు జాబ్‌గా నడపండి. ఇది సమస్యలను త్వరగా పట్టుకోవడానికి మరియు డెవలపర్లకు వేగవంతమైన ఫీడ్‌బ్యాక్ ఇవ్వడానికి అనుమతిస్తుంది.

---

**నావిగేషన్**
- **మునుపటి పాఠం**: [SKU Selection](sku-selection.md)
- **తదుపరి పాఠం**: [Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
నిరాకరణ:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ద్వారా అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, స్వయంచాలక (ఆటోమెటెడ్) అనువాదాల్లో పొరపాట్లు లేదా లోపాలు ఉండవచ్చని దయచేసి గమనించండి. స్థానిక భాషలో ఉన్న మూల పత్రంనే అధికారిక మూలంగా పరిగణించాలి. ముఖ్యమైన సమాచారానికి వృత్తిపరమైన మానవ అనువాదం సూచించబడుతుంది. ఈ అనువాదాన్ని ఉపయోగించడంతో కలిగే ఏవైనా అపార్థాలు లేదా తప్పుగా అర్థముకావడంపై మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
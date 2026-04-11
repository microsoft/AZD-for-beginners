# AZD డిప్లాయ్‌మెంట్ల కోసం ప్రీ-ఫ్లైట్ తనిఖీలు

**అధ్యాయం నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [ప్రారంభికులకు AZD](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 6 - ముందుగా-డిప్లాయ్ ధృవీకరణ & ప్రణాళిక
- **⬅️ మునుపటి**: [SKU ఎంపిక](sku-selection.md)
- **➡️ తదుపరి అధ్యాయం**: [అధ్యాయం 7: ట్రబుల్షూటింగ్](../chapter-07-troubleshooting/common-issues.md)
- **🔧 సంబంధిత**: [అధ్యాయం 4: డిప్లాయ్ గైడ్](../chapter-04-infrastructure/deployment-guide.md)

## పరిచయం

ఈ సమగ్ర గైడ్ డిప్లాయ్‌మెంట్లు ప్రారంభమయ్యే ముందు విజయవంతంగా Azure Developer CLI డిప్లాయ్‌మెంట్లను నిర్ధారించడానికి ప్రీ-డిప్లాయ్ ధృవీకరణ స్క్రిప్టులు మరియు ప్రొసీజర్లు అందిస్తుంది. ప్రామాణీకరణ, వనరు లభ్యత, క్వోటాలు, భద్రతా కంప్లయెన్స్ మరియు పనితీరు అవసరాల కోసం ఆటోమేటెడ్ చెక్స్ను ఎలా అమలు చేయాలో నేర్చుకోండి, తద్వారా డిప్లాయ్ విఫలమయ్యే అవకాశాలను తగ్గించి విజయాలు పెంపొందించగలరు.

## అధ్యయన లక్ష్యాలు

ఈ గైడ్‌ను పూర్తి చేసి మీరు:
- ఆటోమేటెడ్ ప్రీ-డిప్లాయ్ ధృవీకరణ సాంకేతికతలు మరియు స్క్రిప్టులను అలవరిస్తారు
- ప్రామాణీకరణ, అనుమతులు మరియు క్వోటాలకు సంబంధించిన సమగ్ర చెక్ స్ట్రాటజీలను అవగాహన చేసుకుంటారు
- వనరు లభ్యత మరియు సామర్థ్య ధృవీకరణ ప్రొసీజర్లు అమలు చేస్తారు
- సంస్థా విధానాలకు అనుగుణంగా భద్రతా మరియు కంప్లయెన్స్ చెక్స్ కాన్ఫిగర్ చేస్తారు
- ఖర్చు అంచనా మరియు బడ్జెట్ ధృవీకరణ వర్క్‌ఫ్లోలను డిజైన్ చేస్తారు
- CI/CD పైప్‌లైన్ల కోసం కస్టమ్ ప్రీ-ఫ్లైట్ చెక్ ఆటోమేషన్ సృష్టిస్తారు

## అభ్యాస ఫలితాలు

పూర్తి చేసిన తర్వాత మీరు చేయగలుగుతారు:
- సమగ్ర ప్రీ-ఫ్లైట్ ధృవీకరణ స్క్రిప్టులను సృష్టించి అమలు చేయడం
- వివిధ డిప్లాయ్ సన్నివేశాల కోసం ఆటోమేటెడ్ చెకింగ్ వర్క్‌ఫ్లోలను డిజైన్ చేయడం
- పరిసరానికి ప్రత్యేక ధృవీకరణ ప్రొసీజర్లు మరియు పాలసీలను అమలు చేయడం
- డిప్లాయ్ సిద్ధత కోసం ప్రోఅక్టివ్ మానిటరింగ్ మరియు అలర్టింగ్ కన్ఫిగర్ చేయడం
- ప్రీ-డిప్లాయ్ సమస్యలను ట్రబుల్షూట్ చేసి సరిదిద్దే చర్యలు అమలు చేయడం
- ప్రీ-ఫ్లైట్ చెక్స్‌ను డెవ్‌ఓప్స్ పైప్‌లైన్లు మరియు ఆటోమేషన్ వర్క్‌ఫ్లోలలో సమీకరించడం

## అంశాల జాబితా

- [సారాంశం](#సారాంశం)
- [ఆటోమేటెడ్ ప్రీ-ఫ్లైట్ స్క్రిప్ట్](#ఆటోమేటెడ్-ప్రీ-ఫ్లైట్-స్క్రిప్ట్)
- [మాన్యువల్ ధృవీకరణ చెక్లిస్ట్](#codeblock1)
- [పర్యావరణ ధృవీకరణ](#✅-బ్యాకప్-రికవరీ)
- [వనరు ధృవీకరణ](#ప్రొడక్షన్-పర్యావరణ-ధృవీకరణ)
- [సెక్యూరిటీ & కంప్లయెన్స్ తనిఖీలు](#security--compliance-checks)
- [పనితీరు & సామర్థ్య ప్రణాళిక](#performance--capacity-planning)
- [సాధారణ సమస్యలను పరిష్కరించడం](#troubleshooting-common-issues)

---

## సారాంశం

ప్రీ-ఫ్లైట్ తనిఖీలు డిప్లాయ్ చేయడానికి ముందు అమలు చేయబడే కీలక ధృవీకరణలు, ఇవి నిర్ధారిస్తాయి:

- **లక్ష్య ప్రాంతాలలో వనరుల లభ్యత** మరియు క్వోటాలు
- **ప్రామాణీకరణ మరియు అనుమతులు** సరైనగా కాన్ఫిగర్ చేయబడ్డాయా
- **టెంప్లేట్ చెల్లుబాటు తత్వం** మరియు పారామితుల సరైనత
- **నెట్‌వర్క్ కనెక్టివిటీ** మరియు ఆధార్యతలు
- **సంస్థా విధానాలతో భద్రతా అనుగుణత**
- **ఖర్చు అంచనా** బడ్జెట్ పరిమితులలో ఉందా

### ప్రీ-ఫ్లైట్ చెక్స్ను ఎప్పుడు నిర్వహించాలి

- **కొత్త పరిసరానికి మొదటి డిప్లాయ్ ముందు**
- **ప్రముఖ టెంప్లేట్ మార్పుల తర్వాత**
- **ప్రొడక్షన్ డిప్లాయ్‌ల ముందు**
- **Azure ప్రాంతాలను మార్చేప్పుడు**
- **CI/CD పైప్‌లైన్ల భాగంగా**

---

## ఆటోమేటెడ్ ప్రీ-ఫ్లైట్ స్క్రిప్ట్

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

# అవుట్పుట్ కోసం రంగుల కోడింగ్
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
    
    # PowerShell వెర్షన్‌ను తనిఖీ చేయండి
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
        # AZD ప్రమాణీకరణను తనిఖీ చేయండి
        $azdAuth = azd auth login --check-status --output json 2>$null | ConvertFrom-Json
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
        }
        else {
            Write-Status "AZD authentication" "Error" "Run 'azd auth login'"
            return $false
        }
        
        # Azure CLI ప్రమాణీకరణను తనిఖీ చేయండి
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
        # ప్రస్తుత వినియోగదారుడి పాత్ర కేటాయింపులను పొందండి
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
        
        # రిసోర్స్ గ్రూప్ సృష్టిని పరీక్షించండి (నిర్దేశించబడితే)
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # రిసోర్స్ గ్రూప్‌ను సృష్టించే సామర్థ్యాన్ని పరీక్షించండి
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
        return $true # అడ్డంకి కలిగించదు
    }
}

function Test-NetworkConnectivity {
    Write-Host "`n${Blue}=== Network Connectivity Check ===${Reset}"
    
    # Azure ఎండ్పాయింట్‌లను పరీక్షించండి
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
    
    # DNS రిజల్యూషన్‌ను పరీక్షించండి
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
    
    # azure.yaml ఉందో లేదో తనిఖీ చేయండి
    if (Test-Path "azure.yaml") {
        Write-Status "azure.yaml found" "Success"
        
        # azure.yaml‌ని పార్స్ చేయండి
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
    
    # ఇన్‌ఫ్రాస్ట్రక్చర్ ఫైళ్లను తనిఖీ చేయండి
    if (Test-Path "infra") {
        $bicepFiles = Get-ChildItem -Path "infra" -Filter "*.bicep" -Recurse
        if ($bicepFiles.Count -gt 0) {
            Write-Status "Infrastructure templates" "Success" "$($bicepFiles.Count) Bicep files found"
            
            # main.bicep ఉంటే దానిని ధృవీకరించండి
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
    
    # 🧪 కొత్త: ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రివ్యూను పరీక్షించండి (సురక్షిత డ్రై-రన్)
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
        # లోకేషన్ చెల్లుబాటులో ఉందో తనిఖీ చేయండి
        $locations = az account list-locations --output json | ConvertFrom-Json
        $validLocation = $locations | Where-Object { $_.name -eq $Location -or $_.displayName -eq $Location }
        
        if ($validLocation) {
            Write-Status "Azure region" "Success" "Location '$Location' is valid"
        }
        else {
            Write-Status "Azure region" "Error" "Location '$Location' is not valid"
            return $false
        }
        
        # ప్రాంతంలో సేవుల అందుబాటును తనిఖీ చేయండి
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
    
    # మూలభూత ఖర్చు అంచనా (ఖచ్చితమైన అంచనాలకు Azure Pricing API అవసరం)
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
    
    # సాధారణ భద్రతా పద్ధతులను తనిఖీ చేయండి
    try {
        # Key Vault కాన్ఫిగర్ చేయబడిందా తనిఖీ చేయండి
        if (Select-String -Path "infra/*.bicep" -Pattern "Microsoft.KeyVault" -Quiet) {
            Write-Status "Key Vault usage" "Success" "Key Vault detected in templates"
        }
        else {
            Write-Status "Key Vault usage" "Warning" "Consider using Key Vault for secrets"
        }
        
        # మెనేజ్డ్ ఐడెంటిటీ వినియోగాన్ని తనిఖీ చేయండి
        if (Select-String -Path "infra/*.bicep" -Pattern "managedIdentity|SystemAssigned" -Quiet) {
            Write-Status "Managed Identity" "Success" "Managed Identity detected"
        }
        else {
            Write-Status "Managed Identity" "Warning" "Consider using Managed Identity"
        }
        
        # HTTPS అమలును తనిఖీ చేయండి
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
    
    # అన్ని తనిఖీలను నడపండి
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

# ప్రీ-ఫ్లైట్ తనిఖీని నడపండి
Invoke-PreflightCheck
```

### Bash ప్రీ-ఫ్లైట్ చెకర్

```bash
#!/bin/bash
# Unix/Linux వ్యవస్థల కోసం ముందస్తు తనిఖీల యొక్క Bash సంస్కరణ

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
    
    # AZD సంస్థాపనను తనిఖీ చేయండి
    if command -v azd >/dev/null 2>&1; then
        local azd_version=$(azd version --output json | jq -r '.azd.version')
        print_status "AZD CLI installed" "success" "Version: $azd_version"
    else
        print_status "AZD CLI not found" "error" "Install from https://aka.ms/azd-install"
        return 1
    fi
    
    # Azure CLI సంస్థాపనను తనిఖీ చేయండి
    if command -v az >/dev/null 2>&1; then
        local az_version=$(az version --output json | jq -r '."azure-cli"')
        print_status "Azure CLI installed" "success" "Version: $az_version"
    else
        print_status "Azure CLI not found" "error" "Install from https://aka.ms/azcli"
        return 1
    fi
    
    # jq సంస్థాపనను తనిఖీ చేయండి
    if command -v jq >/dev/null 2>&1; then
        print_status "jq installed" "success"
    else
        print_status "jq not found" "warning" "Install jq for better JSON parsing"
    fi
    
    return 0
}

check_authentication() {
    echo -e "\n${BLUE}=== Authentication Check ===${NC}"
    
    # AZD ప్రమాణీకరణను తనిఖీ చేయండి
    if azd auth login --check-status >/dev/null 2>&1; then
        local principal_name=$(azd auth login --check-status --output json 2>/dev/null | jq -r '.principalName // "Unknown"')
        print_status "AZD authentication" "success" "User: $principal_name"
    else
        print_status "AZD authentication" "error" "Run 'azd auth login'"
        return 1
    fi
    
    # Azure CLI ప్రమాణీకరణను తనిఖీ చేయండి
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
    
    # azure.yamlను తనిఖీ చేయండి
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
            
            # main.bicep ఉంటే దాన్ని ధృవీకరించండి
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
    
    # స్థానం చెల్లుబాటు ఉందా అని తనిఖీ చేయండి
    if az account list-locations --query "[?name=='$LOCATION' || displayName=='$LOCATION']" --output tsv | grep -q .; then
        print_status "Azure region" "success" "Location '$LOCATION' is valid"
    else
        print_status "Azure region" "error" "Location '$LOCATION' is not valid"
        return 1
    fi
    
    # సేవా అందుబాటును తనిఖీ చేయండి
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
    # కమాండ్ లైన్ ఆర్గ్యుమెంట్లను పార్స్ చేయండి
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
    
    # అవసరమైన పరామితులను ధృవీకరించండి
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
    
    # తనిఖీలు నడపండి
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

## మాన్యువల్ ధృవీకరణ చెక్లిస్ట్

### ప్రీ-డిప్లాయ్ చెక్లిస్ట్

ఈ చెక్లిస్ట్‌ను ప్రింట్ చేసి ప్రతి అంశాన్ని డిప్లాయ్ ముందు నిర్ధారించండి:

#### ✅ పర్యావరణ ఏర్పాట్లు
- [ ] AZD CLI ఇన్‌స్టాల్ చేయబడింది మరియు తాజా వెర్షన్‌కు అప్‌డేట్ చేయబడింది
- [ ] Azure CLI ఇన్‌స్టాల్ చేయబడినది మరియు ప్రామాణీకరించబడింది
- [ ] సరైన Azure subscription ఎంపిక చేయబడింది
- [ ] పర్యావరణ పేరు ప్రత్యేకంగా ఉంది మరియు నామకరణ నియమాలను అనుసరిస్తుంది
- [ ] లక్ష్య resource group గుర్తించబడింది లేదా సృష్టించబడగలదు

#### ✅ ప్రామాణీకరణ & అనుమతులు
- [ ] విజయవంతంగా `azd auth login` తో ప్రామాణీకరించబడింది
- [ ] యూజర్‌కు లక్ష్య subscription/resource group పై Contributor role ఉంది
- [ ] CI/CD కోసం service principal కాన్ఫిగర్ చేయబడినది (ఆవశ్యకమైనప్పుడు)
- [ ] కాలపరిమితి ముగిసిన సర్టిఫికేట్లు లేదా క్రెడెన్షియల్స్ ఉండవు

#### ✅ టెంప్లేట్ ధృవీకరణ
- [ ] `azure.yaml` ఉనికిలో ఉంది మరియు చెల్లుబాటు అయ్యే YAML
- [ ] azure.yamlలో నిర్వచించబడిన అన్ని సేవలకు అనుగుణమైన సోర్సు కోడ్ ఉంది
- [ ] `infra/` డైరెక్టరీలో Bicep టెంప్లేట్లు ఉన్నాయని నిర్ధారించండి
- [ ] `main.bicep` లో ఎర్రర్లు లేకుండా కంపైల్ అవుతుంది (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 Infrastructure preview విజయవంతంగా రన్ అవుతుంది (`azd provision --preview`)
- [ ] అవసరమైన అన్ని పారామితులకు డిఫాల్ట్ విలువలు ఉన్నాయి లేదా అందిస్తారు
- [ ] టెంప్లేట్‌లలో హార్డ్‌కోడ్ చేసిన రహస్యాలు ఉండవు

#### ✅ వనరు ప్రణాళిక
- [ ] లక్ష్య Azure region ఎంచుకోబడింది మరియు ధృవీకరించబడింది
- [ ] లక్ష్య ప్రాంతంలో అవసరమైన Azure సేవలు అందుబాటులో ఉన్నాయి
- [ ] ప్లాన్ చేసిన వనరులకు సరిపడా క్వాటాలు అందుబాటులో ఉన్నాయి
- [ ] వనరు నామకరణ تضాదాలు తనిఖీ చేయబడ్డాయి
- [ ] వనరుల మధ్య ఆధార్యతలు అర్థం చేసుకోబడ్డాయి

#### ✅ నెట్‌వర్క్ & సెక్యూరిటీ
- [ ] Azure ఎండ్‌పాయింట్‌లకు నెట్‌వర్క్ కనెక్టివిటీ ధృవీకరించబడింది
- [ ] అవసరమైతే ఫైర్‌వాల్/ప్రాక్సీ సెట్టింగ్స్ కాన్ఫిగర్ చేయబడ్డాయి
- [ ] రహస్యాలు నిర్వహణ కోసం Key Vault కాన్ఫిగర్ చేయబడింది
- [ ] సాధ్యమైన చోట Managed identities ఉపయోగించబడ్డాయి
- [ ] వెబ్ అప్లికేషన్ల కోసం HTTPS బలవంతం చేయబడింది

#### ✅ ఖర్చు నిర్వహణ
- [ ] ఖర్చుల అంచనాలు Azure Pricing Calculator ఉపయోగించి లెక్కించబడ్డాయి
- [ ] అవసరమైతే బడ్జెట్ అలర్ట్స్ కాన్ఫిగర్ చేయబడ్డాయి
- [ ] పరిసర రకానికి సరిపోయే SKUs ఎంపిక చేయబడ్డాయి
- [ ] ప్రొడక్షన్ వర్క్లోడ్‌ల కోసం రిజర్వ్డ్ వ్యాసమును పరిగణనలోకి తీసుకున్నారు

#### ✅ మానిటరింగ్ & ఆబ్జర్వబిలిటీ
- [ ] టెంప్లేట్‌లలో Application Insights కాన్ఫిగర్ చేయబడ్డాయి
- [ ] Log Analytics workspace ప్లాన్ చేయబడింది
- [ ] కీలక మెట్రిక్‌ల కోసం అలర్ట్ రూల్స్ నిర్వచించబడ్డాయి
- [ ] అప్లికేషన్లలో హెల్త్ చెక్ ఎండ్‌పాయింట్‌లు అమలు చేయబడ్డాయి

#### ✅ బ్యాకప్ & రికవరీ
- [ ] డేటా వనరుల కోసం బ్యాకప్ వ్యూహం నిర్వచించబడింది
- [ ] Recovery Time Objectives (RTO) డాక్యుమెంట్ చేయబడ్డాయి
- [ ] Recovery Point Objectives (RPO) డాక్యుమెంట్ చేయబడ్డాయి
- [ ] ప్రొడక్షన్ కోసం డిజాస్టర్ రికవరీ ప్లాన్ సిద్ధంగా ఉంది

---

## పర్యావరణ ధృవీకరణ

### డెవలప్మెంట్ పర్యావరణ ధృవీకరణ

```bash
#!/bin/bash
# డెవలప్‌మెంట్ వాతావరణానికి ప్రత్యేక ధృవీకరణలు

validate_dev_environment() {
    echo "=== Development Environment Validation ==="
    
    # డెవలప్‌మెంట్‌కు అనుకూలంగా ఉన్న కాన్ఫిగరేషన్లను తనిఖీ చేయండి
    if grep -q "sku.*Free\|sku.*F1\|sku.*Basic" infra/*.bicep; then
        echo "✓ Development-appropriate SKUs detected"
    else
        echo "⚠ Consider using lower-cost SKUs for development"
    fi
    
    # ఆటో-షట్‌డౌన్ కాన్ఫిగరेषన్ల కోసం తనిఖీ చేయండి
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

### ప్రొడక్షన్ పర్యావరణ ధృవీకరణ

```bash
#!/bin/bash
# ప్రొడక్షన్ పర్యావరణానికి సంబంధించిన ప్రత్యేక ధృవీకరణలు

validate_prod_environment() {
    echo "=== Production Environment Validation ==="
    
    # అధిక లభ్యత కాన్ఫిగరేషన్లను తనిఖీ చేయండి
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
    
    # మానిటరింగ్ సెటప్‌ను ధృవీకరించండి
    if grep -q "Microsoft.Insights\|Application_Type.*web" infra/*.bicep; then
        echo "✓ Monitoring and observability configured"
    else
        echo "⚠ Add comprehensive monitoring for production"
    fi
    
    # భద్రత కాన్ఫిగరేషన్లను తనిఖీ చేయండి
    if grep -q "Microsoft.KeyVault\|managedIdentity\|httpsOnly.*true" infra/*.bicep; then
        echo "✓ Security best practices implemented"
    else
        echo "⚠ Review security configurations for production"
    fi
}
```

---

## వనరు ధృవీకరణ

### క్వోటా ధృవీకరణ స్క్రిప్ట్

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
    
    # సబ్‌స్క్రిప్షన్‌లో స్టోరేజ్ అకౌంట్లను పొందండి
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
    
    # వర్చువల్ నెట్‌వర్క్‌లను తనిఖీ చేయండి
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
    
    # తనిఖీలు నిర్వహించండి
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

## సెక్యూరిటీ & కంప్లయెన్స్ తనిఖీలు

### సెక్యూరిటీ ధృవీకరణ స్క్రిప్ట్

```bash
#!/bin/bash
# AZD పంపిణీల కోసం భద్రత మరియు అనుగుణత ధృవీకరణ

check_security_practices() {
    echo "=== Security Best Practices Check ==="
    
    local issues_found=0
    
    # కీ వాల్ట్ వినియోగాన్ని తనిఖీ చేయండి
    if grep -r "Microsoft.KeyVault" infra/ >/dev/null 2>&1; then
        echo "✅ Key Vault detected in infrastructure"
    else
        echo "⚠️  Key Vault not found - consider using for secrets management"
        ((issues_found++))
    fi
    
    # మేనేజ్డ్ ఐడెంటిటీ వినియోగాన్ని తనిఖీ చేయండి
    if grep -r "managedIdentity\|SystemAssigned\|UserAssigned" infra/ >/dev/null 2>&1; then
        echo "✅ Managed Identity configuration detected"
    else
        echo "⚠️  Managed Identity not found - consider using for service authentication"
        ((issues_found++))
    fi
    
    # HTTPS అమలును తనిఖీ చేయండి
    if grep -r "httpsOnly.*true\|requireHttps.*true" infra/ >/dev/null 2>&1; then
        echo "✅ HTTPS enforcement detected"
    else
        echo "⚠️  HTTPS enforcement not found - ensure secure connections"
        ((issues_found++))
    fi
    
    # కనిష్ట TLS సంచిక కోసం తనిఖీ చేయండి
    if grep -r "minimumTlsVersion.*'TLS1_2'" infra/ >/dev/null 2>&1; then
        echo "✅ Minimum TLS 1.2 configuration detected"
    else
        echo "⚠️  Minimum TLS version not specified - consider requiring TLS 1.2+"
        ((issues_found++))
    fi
    
    # సార్వజనిక ప్రవేశ పరిమితుల కోసం తనిఖీ చేయండి
    if grep -r "allowBlobPublicAccess.*false\|publicNetworkAccess.*Disabled" infra/ >/dev/null 2>&1; then
        echo "✅ Public access restrictions detected"
    else
        echo "⚠️  Public access restrictions not found - consider limiting public access"
        ((issues_found++))
    fi
    
    # నెట్‌వర్క్ సెక్యూరిటీ గ్రూప్‌ల కోసం తనిఖీ చేయండి
    if grep -r "Microsoft.Network/networkSecurityGroups" infra/ >/dev/null 2>&1; then
        echo "✅ Network Security Groups detected"
    else
        echo "ℹ️  Network Security Groups not found - may be acceptable depending on architecture"
    fi
    
    return $issues_found
}

check_compliance_requirements() {
    echo -e "\n=== Compliance Requirements Check ==="
    
    # డేటా ఎన్‌క్రిప్షన్ కోసం తనిఖీ చేయండి
    if grep -r "encryption\|encryptionAtRest\|transparentDataEncryption" infra/ >/dev/null 2>&1; then
        echo "✅ Encryption configurations detected"
    else
        echo "⚠️  Encryption configurations not found - ensure data is encrypted"
    fi
    
    # ఆడిట్ లాగింగ్ కోసం తనిఖీ చేయండి
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

## CI/CD తో సమీకరణ

### GitHub Actions సమీకరణ

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

### Azure DevOps సమీకరణ

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

## ఉత్తమ పద్ధతుల సారాంశం

### ✅ ప్రీ-ఫ్లైట్ చెక్ ఉత్తమ పద్ధతులు

1. **సాధ్యమైనంత వరకు ఆటోమేట్ చేయండి**
   - చెక్స్‌ను CI/CD పైప్‌లైన్లలో ఇంటిగ్రేట్ చేయండి
   - పునరావృత ధృవీకరణల కోసం స్క్రిప్టులను ఉపయోగించండి
   - ఆడిట్ ట్రెయిల్స్ కోసం ఫలితాలను నిల్వ చేయండి

2. **పర్యావరణ-ఆధారిత ధృవీకరణ**
   - dev/staging/prod కోసం వేర్వేరు చెక్సు అమలు చేయండి
   - ప్రతి పరిసరానికి తగిన భద్రతా అవసరాలు నిర్ధారించండి
   - కానని-ప్రొడక్షన్ పరిసరాలకు ఖర్చు ఆప్టిమైజేషన్ చేయండి

3. **సమగ్ర కవరేజ్**
   - ప్రామాణీకరణ మరియు అనుమతులు
   - వనరు క్వోటాలు మరియు లభ్యత
   - టెంప్లేట్ ధృవీకరణ మరియు సింటాక్స్
   - సెక్యూరిటీ మరియు కంప్లయెన్స్ అవసరాలు

4. **స్పష్ట నివేదిక**
   - రంగు-కోడ్ చేసిన స్థితి సూచనలు
   - పరిమర్శనాత్మక సందేశాలు మరియు పరిష్కార చర్యల వివరణ
   - వేగమైన తనిఖీ కోసం సారాంశ నివేదికలు

5. **త్వరగా విఫలమవ్వండి (Fail Fast)**
   - కీలక చెక్స్ విఫలైతే డిప్లాయ్‌ను నిలిపివేయండి
   - పరిష్కారానికి స్పష్టమైన మార్గదర్శకత ఇవ్వండి
   - చెక్స్ మళ్లీ రన్ చేయడానికి సులభతర మార్గాలు అందించండి

### సాధారణ ప్రీ-ఫ్లైట్ లోపాలు

1. **"వేగంగా" డిప్లాయ్‌మెంట్‌ల కోసం ధృవీకరణను వదులుకోవడం**
2. **డిప్లాయ్ ముందు అనుమతుల సరిపోని తనిఖీలు**
3. **డిప్లాయ్ విఫలమైన తర్వాతే క్వోటా పరిమితులను గమనించడం**
4. **CI/CD పైప్‌లైన్లలో టెంప్లేట్లను ధృవీకరించకపోవడం**
5. **ప్రొడక్షన్ పరిసరాల కోసం భద్రతా ధృవీకరణ మిస్ అవడం**
6. **అప్రాప్రియేట్ ఖర్చు అంచనాలు, బడ్జెట్ ఆశ్చర్యాలను కలిగించడం**

---

**సూచన**: అసలు డిప్లాయ్ జాబ్ మొదలు పెట్టేముందు మీ CI/CD పైప్‌లైన్‌లో ప్రీ-ఫ్లైట్ చెక్సును వేర్వేరు జాబ్‌గా రన్ చేయండి. ఇది సమస్యలను ముందుగా పట్టుకోవడానికి సహాయపడుతుంది మరియు డెవలపర్లకు వేగవంతమైన ఫీడ్‌బ్యాక్ అందిస్తుంది.

---

**నావిగేషన్**
- **మునుపటి పాఠం**: [SKU ఎంపిక](sku-selection.md)
- **తదుపరి పాఠం**: [చీట్ షీట్](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, స్వయంచాలక అనువాదాలలో పొరపాట్లు లేదా తప్పిదాలు ఉండొచ్చు అని దయచేసి గమనించండి. మూల పత్రాన్ని దాని స్థానిక భాషలో అధికారిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారానికి వృత్తిపరులైన మానవ అనువాదాన్ని సిఫార్సు చేయబడుతోంది. ఈ అనువాదాన్ని ఉపయోగించడం వల్ల కలిగిన ఏ అపార్థాలు లేదా తప్పుదోషాలకు మేము బాధ్యులు కాదాము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
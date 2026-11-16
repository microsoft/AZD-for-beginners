# AZD விண்ணப்பிக்கும்முன் சரிபார்ப்புகள்

**அத்தியாயம் வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [முதல் படி AZD](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 6 - முன்கூட்டிய நடைமுறை சரிபார்ப்பு & திட்டமிடல்
- **⬅️ முந்தைய அத்தியாயம்**: [SKU தேர்வு](sku-selection.md)
- **➡️ அடுத்த அத்தியாயம்**: [அத்தியாயம் 7: பிரச்சினை தீர்க்கல்](../chapter-07-troubleshooting/common-issues.md)
- **🔧 தொடர்புடையது**: [அத்தியாயம் 4: விண்ணப்பிக்கும்முறை கையேடு](../chapter-04-infrastructure/deployment-guide.md)

## அறிமுகம்

இந்த விரிவான கையேடு, Azure Developer CLI விண்ணப்பங்களை வெற்றிகரமாக செய்ய முன் பணிகளை சரிபார்க்கும் ஸ்கிரிப்ட்கள் மற்றும் செயல்முறைகளை வழங்குகிறது. அங்கீகாரம், வளங்களின் கிடைமைகள், கடவுச்சீட்டுக்கள், பாதுகாப்பு ஒத்திசைவு மற்றும் செயல்திறன் தேவைகள் ஆகியவற்றிற்கான தானியங்கி சரிபார்ப்புகளை செயல்படுத்த கற்றுக்கொள்ளுங்கள், இவை விண்ணப்ப தோல்விகளை தடுத்து நிறுத்தி, வெற்றிகரமான விண்ணப்ப அளிப்பை மேம்படுத்தும்.

## கற்றல் இலக்குகள்

இந்தக் கையேட்டை முடிப்பதால், நீங்கள்:
- தானியங்கி முன்கூட்டிய சரிபார்ப்பு தொழில்நுட்பங்கள் மற்றும் ஸ்கிரிப்ட்களை அனுபவிக்கலாம்
- அங்கீகாரம், அனுமதிகள் மற்றும் கடவுச்சீட்டுக்களை சரிபார்க்கும் முழுமையான ռազմவிளக்கங்களைப் புரிந்துகொள்ளலாம்
- வளங்களின் கிடைமைகள் மற்றும் வள சேமிப்பு சரிபார்ப்பு செயல்முறைகளை செயல்படுத்தலாம்
- நிறுவன கொள்கைகளுக்கு பாதுகாப்பு மற்றும் ஒத்திசைவு சரிபார்ப்புகளை அமைக்கலாம்
- செலவுக் கணக்கீடு மற்றும் பட்ஜெட் சரிபார்ப்பு ஓட்டங்களை வடிவமைக்கலாம்
- CI/CD குழாய் வழிகளுக்கான தனிப்பயன் முன்கூட்டிய சரிபார்ப்பு தானியக்கங்களை உருவாக்கலாம்

## கற்றல் முடிவுகள்

முடித்து விட்டதும், நீங்கள் முடியும்:
- முழுமையான முன்கூட்டிய சரிபார்ப்பு ஸ்கிரிப்ட்களை உருவாக்கி செயல்படுத்தலாம்
- வெவ்வேறு விண்ணப்ப நிலையமைப்புகளுக்கான தானியங்கி சரிபார்ப்பு ஓட்டங்களை வடிவமைக்கலாம்
- சூழல்-நிலை சரிபார்ப்பு செயல்முறைகள் மற்றும் கொள்கைகளை செயல்படுத்தலாம்
- விண்ணப்பத் தயார் நிலைக்கான முன்கூட்டிய கண்காணிப்பு மற்றும் எச்சரிக்கை அமைப்புகளை அமைக்கலாம்
- முன்கூட்டிய பிரச்சினைகளை கண்டறிந்து சரி செய்யும் நடவடிக்கைகளைச் செய்யலாம்
- DevOps குழாய் மற்றும் தானியக்க ஓட்டங்களில் முன்கூட்டிய சரிபார்ப்புகளை இணைக்கலாம்

## உள்ளடக்க அட்டவணை

- [கண்ணோட்டம்](#overview)
- [தானியங்கி முன்கூட்டிய ஸ்கிரிப்ட்](#automated-pre-flight-script)
- [கையேடு சரிபார்ப்பு சேகரம்](#manual-validation-checklist)
- [சூழல் சரிபார்ப்பு](#environment-validation)
- [வளங்கள் சரிபார்ப்பு](#resource-validation)
- [பாதுகாப்பு மற்றும் ஒத்திசைவு சரிபார்ப்புகள்](#security--compliance-checks)
- [செயல்திறன் மற்றும் திறன் திட்டமிடல்](capacity-planning.md)
- [பொது பிரச்சினைகள் தீர்க்கல்](../chapter-07-troubleshooting/common-issues.md)

---

## கண்ணோட்டம்

விண்ணப்பிக்கும்முன் சரிபார்ப்புகள் அவசியமான சரிபார்ப்புகள், அவை விண்ணப்பிப்பதற்கு முன் மேற்கொள்ளப்படுகின்றன, இதனால்:

- **இலக்குக் பகுதிகளில் வளங்களின் கிடைமைகள்** மற்றும் கடவுச்சீட்டுக்கள் உறுதிப்படுத்தப்படும்
- **அங்கீகாரம் மற்றும் அனுமதிகள்** சரியாக அமைக்கப்பட்டிருப்பது உறுதிசெய்யப்படும்
- **டெம்ப்ளேட் செல்லுபடியும்** மற்றும் பரிமாணங்கள் சரியாக இருப்பதும் உறுதியானது
- **வலைப்பின்னல் இணைப்பு** மற்றும் சார்புகள் சரிபார்க்கப்படும்
- **பாதுகாப்பு ஒத்திசைவு** நிறுவன கொள்கைகளுடன் பரிசோதிக்கப்படும்
- **செலவு கணக்கீடு** பட்ஜெட் வரம்புக்குள் இருப்பது உறுதிசெய்யப்படும்

### 언제 முன்னர் விண்ணப்பிக்கும்முன் சரிபார்ப்புகள் செய்வது

- **புதிய சூழலை ஆரம்பிக்கும் முதல் விண்ணப்பிக்கும்முன்**
- **முக்கிய டெம்ப்ளேட் மாற்றங்களுக்குப் பிறகு**
- **உற்பத்தி விண்ணப்பிக்கும்போது முன்பே**
- **Azure பகுதிகளை மாற்றும்போது**
- **CI/CD குழாய்களின் ஒரு பகுதியாக**

---

## தானியங்கி முன்கூட்டிய ஸ்கிரிப்ட்

> **விரிவு மற்றும் முன்னுரிமைகள்:** இவை உங்கள் சொந்த திட்டத்தில் சேமிக்க தொடங்கும் நிலை ஸ்கிரிப்ட்கள், இந்த அத்தியாயத்தில் வழங்கப்பட்ட உள்ளூர் கோப்புகள் அல்ல. PowerShell பதிப்பு PowerShell **7.3+** (உள்ளூர்-கட்டளை பிழை பரவல்) மற்றும் `powershell-yaml` தொகுப்பைப் பயன்படுத்துகிறது `ConvertFrom-Yaml` க்காக. Bash பதிப்பு Bash, `jq`, Python 3.10+, மற்றும் PyYAML ஐ தேவைப்படுகிறது. இரண்டும் Azure CLI, azd, மற்றும் செயல்படும் Bicep திட்டத்தை தேவைப்படுகிறது. இவை வினோத அறிக்கைகள், கனிவாயர்கள், திறன், அல்லது உடன்பாட்டின் ஆதாரமாக அல்ல. `azd provision --preview` முன்பு டெம்ப்ளேட் ஹூக்களை ஆய்வு செய்யவும்; ஹூக்கள் எந்தவொரு திட்ட கட்டளைகளையும் செயல்படுத்தலாம்.

### PowerShell முன்-உறுதிப்படுத்தல் சேகரி

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

### Bash முன்-உறுதிப்படுத்தல் சேகரி

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

## கைமுறை சரிபார்ப்பு பட்டியல்

### முன்னணி சமர்ப்பிப்பு சரிபார்ப்பு பட்டியல்

இந்த பட்டியலை அச்சிடவும் மற்றும் சமர்ப்பிப்புக்கு முன்பு ஒவ்வொரு உருப்படியையும் உறுதி செய்யவும்:

#### ✅ சுற்றுப்புற அமைப்பு
- [ ] AZD CLI நிறுவப்பட்டது மற்றும் சமீபத்திய பதிப்புக்கு மேம்படுத்தப்பட்டது
- [ ] Azure CLI நிறுவப்பட்டது மற்றும் அங்கீகாரம் பெற்றது
- [ ] சரியான Azure சந்தா தேர்ந்தெடுக்கப்பட்டது
- [ ] சுற்றுப்புற பெயர் தனித்துவமானதும் பெயரிடும் விதிகளுக்கு அமையுமானதும்
- [ ] இலக்கு வள குழு அடையாளம் காணப்பட்டது அல்லது உருவாக்க முடியும்

#### ✅ அங்கீகாரம் & அனுமதிகள்
- [ ] `azd auth login` உடன் வெற்றிகரமாக அங்கீகரிக்கப்பட்டது
- [ ] பயனர் இலக்கு சந்தா/வளம் குழுவில் பங்களிப்பாளர் வரலாறு கொண்டவர்
- [ ] டெம்ப்ளேட்கள் பங்கு ஒதுக்கீடுகளை உருவாக்கினால், சமர்ப்பிக்கும் அடையாளத்துக்கும் இடையிலான வரம்பளிக்கப்பட்ட பங்கு ஒதுக்கீடு அனுமதிகள் உள்ளன (பங்களிப்பாளர் மட்டும் இதை வழங்கவில்லை)
- [ ] சேவை பிரதிநிதி CI/CD க்காக கட்டமைக்கப்பட்டது (பயன்படுத்தக்கூடியால்)
- [ ] காலாவதியான சான்றிதழ்கள் அல்லது அங்கீகாரங்கள் இல்லை

#### ✅ டெம்ப்ளேட் சரிபார்ப்பு
- [ ] `azure.yaml` உள்ளது மற்றும் செல்லுபடியாகும் YAML ஆகும்
- [ ] azure.yamlல் வரையறுக்கப்பட்ட அனைத்து சேவைகளுக்கும் தொடர்புடைய மூலக் குறியீடு உள்ளது
- [ ] `infra/` அடைவு உள்ள Bicep டெம்ப்ளேட்கள் உள்ளன
- [ ] `main.bicep` பிழைகள் இல்லாமல் அவர்க்கப்படுகிறது (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 கட்டமைப்பு முன்னோட்டம் வெற்றிகரமாக இயங்குகிறது (`azd provision --preview`)
- [ ] அவசியமான அனைத்து அளவுருக்களுக்கும் இயல்புநிலை மதிப்புகள் உள்ளன அல்லது வழங்கபட உள்ளன
- [ ] டெம்ப்ளேட்டுகளில் எந்தவொரு கடின குறியீட்டுக்கள் இல்லை

#### ✅ வள திட்டமிடல்
- [ ] இலக்கு Azure பிராந்தியம் தேர்ந்தெடுக்கப்பட்டது மற்றும் சரிபார்க்கப்பட்டது
- [ ] இலக்கு பிராந்தியத்தில் அவசியமான Azure சேவைகள் கிடைக்கின்றன
- [ ] திட்டமிடப்பட்ட வளங்களுக்கு போதுமான அட்டவணைகள் உள்ளன
- [ ] வள பெயரிடல் முரண்பாடுகள் சரிபார்க்கப்பட்டன
- [ ] வளகளுக்கிடையேயான சார்புகள் புரிந்துள்ளன

#### ✅ நெட்வொர்க் & பாதுகாப்பு
- [ ] Azure முனையங்களுக்கு நெட்வொர்க் தொடர்பு உறுதிப்படுத்தப்பட்டது
- [ ] தேவையானபோது ஃபயர்வால்/ப்ராக்சி அமைப்புகள் கொண்டமைக்கப்பட்டன
- [ ] ரகசிய மேலாண்மைக்காக விசை குவாண்டு அமைக்கப்பட்டது
- [ ] மேலாண்மை அடையாளங்கள் பயன்படுத்தப்பட்ட இடங்களில் பயன்படுத்தப்பட்டன
- [ ] வலை செயலிகளுக்கான HTTPS கடுமைப்படுத்தல் இயக்குப்பட்டது

#### ✅ செலவு மேலாண்மை
- [ ] செலவு மதிப்பீடுகள் Azure விலை கணக்கீட்டியை பயன்படுத்தி கணக்கிடப்பட்டது
- [ ] தேவையானபோது பட்ஜெட் எச்சரிக்கை அமைக்கப்பட்டது
- [ ] சுற்றுப்புற வகைக்கேற்றுக் கண்டறிக்கப்பட்ட SKUகள் தேர்வு செய்யப்பட்டன
- [ ] உற்பத்தி பணிகளுக்கு முன்கூட்டிய திறன் பரிசீலிக்கப்பட்டது

#### ✅ கண்காணிப்பு & பார்வையிடல்
- [ ] செயலி அறிவுப்படுத்தல்கள் டெம்ப்ளேட்களில் அமைக்கப்பட்டன
- [ ] பதிவு பகுப்பாய்வு பணியிடம் திட்டமிடப்பட்டது
- [ ] முக்கிய அளவுகோல்களுக்கு எச்சரிக்கை விதிகள் வரையறுக்கப்பட்டன
- [ ] செயலிகளில் ஆரோக்கியச் சோதனை முனையங்கள் நடைமுறைப்படுத்தப்பட்டன

#### ✅ காப்பு & மீட்பு
- [ ] தரவு வளங்களுக்கு காப்பு திட்டம் வரையறுக்கப்பட்டது
- [ ] மீட்பு நேர குறிக்கோள்கள் (RTO) ஆவணமிடப்பட்டன
- [ ] மீட்பு புள்ளி குறிக்கோள்கள் (RPO) ஆவணமிடப்பட்டன
- [ ] உற்பத்திக்கான பேரிடர் மீட்பு திட்டம் இருப்பது

---

## சுற்றுப்புற சரிபார்ப்பு

பின்வரும் `grep` சரிபார்ப்புகள் வரையறுக்கப்பட்ட நினைவூட்டல்கள் மட்டுமே. பொருந்தும் சொல்லின் இருக்கும் என்பதுதான் அந்த அம்சம் சரியான வளத்திற்கு அமைக்கப்பட்டிருப்பதைக் காண்பதில்லை, மற்றும் சொல்லின் இல்லையெனில் அது இல்லை என்பதற்கான சட்டச்சான்றாகாது (மொடியூல்கள்/இயல்புநிலைகள் அதை வழங்கலாம்). இவற்றை உற்பத்தி உடன்பாட்டுக் கதவுகளாக பயன்படுத்த வேண்டாம்.

### மேம்பாட்டு சுற்றுப்புற சரிபார்ப்பு

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

### உற்பத்தி சுற்றுப்புற சரிபார்ப்பு

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

## வள சரிபார்ப்பு

### அட்டவணை சரிபார்ப்பு ஸ்கிரிப்ட்

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

## பாதுகாப்பு மற்றும் உடன்பாடு சரிபார்ப்பு

### பாதுகாப்பு சரிபார்ப்பு ஸ்கிரிப்ட்

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

## CI/CD உடன் ஒருங்கிணைப்பு

### GitHub செயல்பாடுகள் ஒருங்கிணைப்பு

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

இந்த வேலைப்பாட்டிற்கான கூட்டிணைந்த அங்கீகாரங்களை அமைக்கவும், சேமிக்கப்பட்ட ஸ்கிரிப்ட்களை இயக்குவதற்கு முன் தேர்ந்தெடுத்த azd சுற்றுப்புறத்தை உருவாக்கவும்/புதுப்பிக்கவும். இந்த எடுத்துக்காட்டுகள் கணினி வெளிப்பாடுகளை மட்டுமே எழுதி விடும்; எந்தவொரு `preflight-results.json` அல்லது JUnit கோப்பையும் உருவாக்காது.

### Azure DevOps ஒருங்கிணைப்பு

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

பைபிளைன் இதற்குப் முன்பு அதன் azd சுற்றுப்புறத்தை மீட்டமைக்க/உருவாக்கி இந்த பாடத்தில் காட்டியுள்ள ஸ்கிரிப்ட்களை சேமிக்க வேண்டும். கூட்டிணைந்த சேவை இணைப்பைப் அமைக்கவும் மற்றும் பைபிளைனுக்கு தேவையான டோக்கன் அனுமதிகளை வழங்கவும். அப்போதைய `AzureCLI@2` பணியை பயன்படுத்தி Azure CLI உள்நுழைவானது பின்னர் வரும் சீரற்ற Bash பணிக்கு அங்கீகாரம் தருவதைக் எதிர்பார்க்காதீர்கள்.

---

## சிறந்த நடைமுறைகள் சுருக்கம்

### ✅ முன்-பறக்கும் சரிபார்ப்பு சிறந்த நடைமுறைகள்

1. **இயக்கும் இடத்தில் தானாகச் செயல்படுத்தவும்**
   - CI/CD பைபிளைன்களில் சரிபார்ப்புகளை ஒருங்கிணைக்கவும்
   - மீண்டும் செய்யக்கூடிய சரிபார்ப்புகளுக்கு ஸ்கிரிப்ட்களை பயன்படுத்தவும்
   - கணக்குபடலுக்கான முடிவுகளை சேமிக்கவும்

2. **சுற்றுப்புற-தனி சரிபார்ப்பு**
   - dev/staging/prod க்கான வேறுபட்ட சரிபார்ப்புகள்
   - சுற்றுப்புறத்திற்கு ஏற்ற பாதுகாப்பு தேவைகள்
   - உற்பத்தி அல்லாத சுற்றுப்புறங்களுக்கான செலவு ஒழுங்குமுறை

3. **முழுமையான கவரேஜ்**
   - அங்கீகாரம் மற்றும் அனுமதிகள்
   - வள அட்டவணைகள் மற்றும் கிடைப்புகள்
   - டெம்ப்ளேட் சரிபார்ப்பு மற்றும் வாக்கியவியல்
   - பாதுகாப்பு மற்றும் உடன்பாடு தேவைகள்

4. **தெளிவான அறிக்கை**
   - வண்ணக் குறியீடு நிலை குறிக்கும் संकेतகள்
   - சரிசெய்யும் படிகள் உடன் விரிவான பிழை குறிப்புகள்
   - துறைமுக அறிக்கைகள் விரைந்து மதிப்பீட்டிற்கு

5. **விரைவில் தோல்வி அடையவும்**
   - முக்கிய சரிபார்ப்புகள் தோல்வியுற்றால் பிரசவம் நிறுத்தவும்
   - தீர்வுக்கான தெளிவான வழிகாட்டல் வழங்கவும்
   - சரிபார்ப்புகளை எளிதாக மீண்டும் இயக்கு தேர்வுகளை உள்கிறது

### பொதுவான முன்-பறக்கும் தவறுகள்

1. **விரைவான** சமர்ப்பிப்புகளுக்காக சரிபார்ப்பை தவிர்க்குதல்
2. சமர்ப்பிப்புக்கு முன்பு **அனுமதிகள் போதுமான அளவில் இல்லை** என்று சரிபார்க்காதல்
3. சமர்ப்பிப்பு தோல்வியடையும் வரை **அட்டவணை எல்லைகளைக் கவனிக்காதல்**
4. CI/CD பைபிளைன்களில் **டெம்ப்ளேட்களை சரிபார்க்காதல்**
5. உற்பத்தி சுற்றுப்புறங்களுக்கு **பாதுகாப்பு சரிபார்ப்பை தவிர்க்குதல்**
6. செலவுக் கணக்கீட்டில் **போதுமான தவறுகள்** காரணமாக பட்ஜெட் அதிர்ச்சிகள்

---

**திறமை வாய்ந்த குறிப்பு**: உண்மையான சமர்ப்பிப்பு பணிக்கு முன் உங்கள் CI/CD பைபிளைனில் முன்-பறக்கும் சரிபார்ப்புகளை தனித்தனி பணியாக இயக்கவும். இது பிரச்சினைகளை விரைவில் கண்டுபிடிக்க உதவுகிறது மற்றும் மேம்பாட்டாளர்களுக்கு வேகமான பின்னூட்டத்தை வழங்குகிறது.

---

**வழி**
- **முந்தைய பாடம்**: [SKU தேர்வு](sku-selection.md)
- **அடுத்த பாடம்**: [மயமாக்கப்பட்ட பட்டியல்](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்துள்ளோம், ஆனால் தானாக செய்யப்படும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் தாய்மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்நுட்பமான மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பில்வில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
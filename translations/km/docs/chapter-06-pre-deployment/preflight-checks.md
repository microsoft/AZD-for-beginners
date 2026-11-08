# ចាប់ផ្តើមពិនិត្យមុនពេលបញ្ចូល AZD

**ការរុករកជំពូក៖**
- **📚 ទំព័របណ្ដុំព័ត៌មានមេរៀន**: [AZD សម្រាប់អ្នកចាប់ផ្តើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូក 6 - ការធ្វើតេស្ត និងផែនការ មុនពេលបញ្ចូល
- **⬅️ មុននេះ**: [ការជ្រើសរើស SKU](sku-selection.md)
- **➡️ ជំពូកបន្ទាប់**: [ជំពូក 7: ការរកស្រាយបញ្ហា](../chapter-07-troubleshooting/common-issues.md)
- **🔧 ទាក់ទង**: [ជំពូក 4: មគ្គុទេសក៍បញ្ចូល](../chapter-04-infrastructure/deployment-guide.md)

## បើកបរ

មគ្គុទេសក៍ពេញលេញនេះផ្តល់ជាស្គ្រីប និងនីតិវិធីធ្វើតេស្តមុនការបញ្ចូល ដើម្បីធានាពីភាពជោគជ័យនៃការបញ្ចូល Azure Developer CLI មុនពេលចាប់ផ្តើម។ រៀនពីរបៀបអនុវត្តការត្រួតពិនិត្យស្វ័យប្រវត្តិសម្រាប់ការផ្ទៀងផ្ទាត់អត្តសញ្ញាណ ការចូលកាន់ធនធាន គ្រុកូទា ការអនុវត្តតាមសុវត្ថិភាព និងតម្រូវការសមត្ថភាព ដើម្បីទប់ស្កាត់ការបរាជ័យក្នុងការបញ្ចូល និងបង្កើនអត្រាជោគជ័យនៃការបញ្ចូល។

## គោលបំណងសិក្សា

បន្ទាប់ពីបញ្ចប់មគ្គុទេសក៍នេះ អ្នកនឹងអាច៖
- ជំនាញបច្ចេកទេសធ្វើតេស្តមុនការបញ្ចូលដោយស្វ័យប្រវត្តិ និងស្គ្រីប
- យល់ដឹងពីយុទ្ធសាស្ត្រត្រួតពិនិត្យទូលំទូលាយសម្រាប់អត្តសញ្ញាណ ការអនុញ្ញាត និងគ្រុកូទា
- អនុវត្តន៍នីតិវិធីផ្ទៀងផ្ទាត់សមត្ថភាព និងស្តុកធនធាន
- កំណត់ការត្រួតពិនិត្យសុវត្ថិភាព និងអនុវត្តតាមគោលការណ៍របស់អង្គភាព
- រចនាដំណើរការសមតុល្យថ្លៃ និងការធ្វើតេស្តថវិការ
- បង្កើតការត្រួតពិនិត្យមុនការហោះហើរស្វ័យប្រវត្តិសម្រាប់ផ្លូវបណ្ដាញ CI/CD

## លទ្ធផលសិក្សា

បន្ទាប់ពីបញ្ចប់ អ្នកនឹងអាច៖
- បង្កើត និងប្រតិបត្តិស្គ្រីបត្រួតពិនិត្យមុនការហោះហើរបំពេញលេញ
- រចនាដំណើរការត្រួតពិនិត្យស្វ័យប្រវត្តិសម្រាប់ស្ថានភាពបញ្ចូលខុសៗគ្នា
- អនុវត្តន៍នីតិវិធីផ្ទៀងផ្ទាត់ និងគោលការណ៍សម្រាប់បរិយាកាសនីមួយៗ
- កំណត់ការត្រួតពិនិត្យជាមុន និងប័ត្រព្រមានសម្រាប់ត្រៀមការបញ្ចូល
- ដោះស្រាយបញ្ហាមុនការបញ្ចូល និងអនុវត្តកាតព្វកិច្ចកែសម្រួល
- ផ្ទេរការត្រួតពិនិត្យមុនការហោះហើរចូលទៅក្នុងផ្លូវបណ្ដាញ និងប្រតិបត្តិការស្វ័យប្រវត្តិ

## តារាងមាតិកា

- [ទិដ្ឋភាពទូទៅ](#overview)
- [ស្គ្រីបត្រួតពិនិត្យមុនការហោះហើរស្វ័យប្រវត្តិ](#automated-pre-flight-script)
- [បញ្ជីពិនិត្យការធ្វើតេស្តដៃ](#manual-validation-checklist)
- [ការធ្វើតេស្តបរិយាកាស](#environment-validation)
- [ការធ្វើតេស្តធនធាន](#resource-validation)
- [ត្រួតពិនិត្យសុវត្ថិភាព និងការអនុវត្តតាម](#security--compliance-checks)
- [ការធ្វើផែនការសមត្ថភាព និងសមត្ថភាព](capacity-planning.md)
- [ការរកស្រាយបញ្ហារួម](../chapter-07-troubleshooting/common-issues.md)

---

## ទិដ្ឋភាពទូទៅ

ការត្រួតពិនិត្យមុនការហោះហើរជាការត្រួតពិនិត្យសំខាន់មួយដែលធ្វើមុនពេលបញ្ចូល ដើម្បីធានាថា៖

- **សមត្ថភាពធនធាន** និងគ្រុកូទានៅតំបន់គោលដោល
- **ការផ្ទៀងផ្ទាត់អត្តសញ្ញាណ និងការអនុញ្ញាត** ត្រូវបានកំណត់ត្រឹមត្រូវ
- **ភាពត្រឹមត្រូវរបស់ទម្រង់** និងប៉ារ៉ាម៉ែត្រ
- **ការតភ្ជាប់បណ្តាញ** និងការគាំទ្រផ្សេងៗ
- **ការអនុវត្តតាមសុវត្ថិភាព** លក្ខខណ្ឌរបស់អង្គភាព
- **ការប៉ាន់ស្មានថ្លៃ** នៅក្នុងដែនកំណត់ថវិការ

### ពេលណាដើម្បីរត់ការត្រួតពិនិត្យមុនការហោះហើរ

- **មុនការបញ្ចូលជាលើកដំបូងទៅបរិយាកាសថ្មី**
- **បន្ទាប់ពីមានការផ្លាស់ប្តូរទម្រង់យ៉ាងសំខាន់**
- **មុនការបញ្ចូលក្នុងផលិតកម្ម**
- **ពេលប្តូរតំបន់ Azure**
- **ជាផ្នែកនៃផ្លូវបណ្ដាញ CI/CD**

---

## ស្គ្រីបត្រួតពិនិត្យមុនការហោះហើរស្វ័យប្រវត្តិ

> **វិសាលភាព និងលក្ខខណ្ឌមុន៖** ស្គ្រីបទាំងនេះជា script ចាប់ផ្តើមដែលត្រូវរក្សាទុកក្នុងគម្រោងរបស់អ្នកផ្ទាល់ ជាមិនមែនជាឯកសារសម្រាប់ប្រើរបស់មុខជើង។ ជំនាន់ PowerShell ត្រូវការចាប់ពី PowerShell **7.3+** (ដំណើរការកំហុសនៅ native-command) និងម៉ូឌុល `powershell-yaml` សម្រាប់ `ConvertFrom-Yaml`។ ជំនាន់ Bash ត្រូវការបង្ហាញ Bash, `jq`, Python 3.10+, និង PyYAML។ ទាំងពីរត្រូវការកម្មវិធី Azure CLI, azd, និងគម្រោង Bicep ដែលដំណើរការបាន។ ពួកវាជាការវិភាគមិនមែនជាភស្តុតាងនៃភាពត្រៀមខ្លួនសម្រាប់ការបញ្ចូល សមត្ថភាព ឬការអនុវត្តតាម។ ពិនិត្យនូវការចាក់ចូលទម្រង់ស្គ្រីបមុន `azd provision --preview`; ទ្រង់ទ្រាយអាចបញ្ចូលពាក្យបញ្ជាគម្រោងដោយចៃដន្យ។

### កម្មវិធីត្រួតពិនិត្យមុនការហោះហើរ PowerShell

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

### កម្មវិធីត្រួតពិនិត្យមុនការហោះហើរ Bash

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

## បញ្ជីពិនិត្យការធ្វើតេស្តដៃ

### បញ្ជីពិនិត្យមុនការបញ្ចូល

បោះពុម្ពបញ្ជីនេះ ហើយផ្ទៀងផ្ទាត់រាល់ធាតុមុនការបញ្ចូល៖

#### ✅ ការតំឡើងបរិយាកាស
- [ ] តំឡើង AZD CLI ហើយធ្វើបច្ចុប្បន្នភាពទៅជំនាន់ចុងក្រោយ
- [ ] តំឡើង Azure CLI ហើយផ្ទៀងផ្ទាត់អត្តសញ្ញាណ
- [ ] ជ្រើសរើសការជាវ Azure ត្រឹមត្រូវ
- [ ] ឈ្មោះបរិយាកាសត្រូវមានឯកសិទ្ធិ និងបន្សំពីគោលការណ៍ឈ្មោះ
- [ ] កំណត់ក្រុមធនធានគោលដោល ឬអាចបង្កើតបាន

#### ✅ អត្តសញ្ញាណ និងការអនុញ្ញាត
- [ ] ផ្ទៀងផ្ទាត់អត្តសញ្ញាណជោគជ័យជាមួយ `azd auth login`
- [ ] អ្នកប្រើមានតួនាទី Contributor លើការជាវ/ក្រុមធនធានគោលដោល
- [ ] ប្រសិនបើទម្រង់បង្កើតការតែងតាំងតួនាទី អត្តសញ្ញាណបញ្ចូលក៏ត្រូវមានសិទិ្ធតួនាទីជាក់លាក់ (តួនាទី Contributor តែម្តងមិនគ្រប់គ្រាន់)
- [ ] កំណត់ Service principal សម្រាប់ CI/CD (បើមាន)
- [ ] មិនមានវិញ្ញាបនបត្រ ឬគ្រឹះស្ថានផុតកំណត់

#### ✅ ការត្រួតពិនិត្យទម្រង់
- [ ] `azure.yaml` មាន និងជាទម្រង់ YAML ត្រឹមត្រូវ
- [ ] សេវាកម្មទាំងអស់ដែលកំណត់នៅក្នុង azure.yaml មានកូដដើមផ្គូផ្គង
- [ ] ទម្រង់ Bicep នៅថត `infra/` មានវត្ថុ
- [ ] `main.bicep` ប្រមូលផ្តុំដោយគ្មានកំហុស (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 ការពិនិត្យមើលហេដ្ឋារចនាសម្ព័ន្ធដំណើរការជោគជ័យ (`azd provision --preview`)
- [ ] ប៉ារ៉ាម៉ែត្រដ៏ទូលំទូលាយទាំងអស់មានតម្លៃលំនាំឬនឹងបានផ្តល់ជូន
- [ ] មិនមានគន្លឹះសំងាត់កូដរឹងនៅក្នុងទម្រង់

#### ✅ ការធ្វើផែនការទ្រព្យសម្បត្តិ
- [ ] ជ្រើសរើស និងបញ្ជាក់តំបន់ Azure គោលដោល
- [ ] សេវាកម្ម Azure ត្រូវការចំពោះតំបន់គោលដោលមានស្រាប់
- [ ] មានគ្រុកូទាដល់គ្រប់ធនធានដែលបានផែនការ
- [ ] ពិនិត្យការផ្សងព្រេងឈ្មោះធនធាន
- [ ] យល់ដឹងពីការពឹងផ្អែករវាងធនធាន

#### ✅ បណ្តាញ & សុវត្ថិភាព
- [ ] ពិនិត្យការតភ្ជាប់បណ្តាញទៅច្រក Azure
- [ ] ការកំណត់ firewall/proxy ប្រសិនបើត្រូវការ
- [ ] កំណត់ Key Vault សម្រាប់ការគ្រប់គ្រងគន្លឹះសំងាត់
- [ ] ប្រើសម្ថភាពគ្រប់គ្រងនៅពេលអាចធ្វើទៅបាន
- [ ] បង្ហាញការរឹតប្តឹង HTTPS សម្រាប់កម្មវិធីវេប

#### ✅ ការគ្រប់គ្រងថ្លៃដើម
- [ ] គណនាការប៉ាន់ស្មានថ្លៃដោយប្រើ Azure Pricing Calculator
- [ ] កំណត់បញ្ញ៉ាការត្រួតពិនិត្យថវិការ ប្រសិនបើត្រូវការ
- [ ] ជ្រើសរើស SKU សមរម្យសម្រាប់ប្រភេទបរិយាកាស
- [ ] ពិចារណាសមត្ថភាពរក្សាទុកសម្រាប់ថ្នាក់ផលិតកម្ម

#### ✅ ការត្រួតពិនិត្យ និងអាចម៍បាន
- [ ] កំណត់ប្រព័ន្ធ Application Insights នៅក្នុងទម្រង់
- [ ] ផែនការកន្លែង Log Analytics
- [ ] កំណត់ច្បាប់ព្រមានសម្រាប់សញ្ញាចំបង
- [ ] អនុវត្តន៍ច្រកប្រព្រឹត្តិការណ៍សុខភាពនៅកម្មវិធី

#### ✅ ការបម្រុងទុក & ការស្ដារឡើងវិញ
- [ ] កំណត់យុទ្ធសាស្ត្របម្រុងទុកសម្រាប់ធនធានទិន្នន័យ
- [ ] ចុះបញ្ជីវេលាស្ដារឡើងវិញ (RTO)
- [ ] ចុះបញ្ជីចំណុចស្ដារឡើងវិញ (RPO)
- [ ] មានផែនការដោះស្រាយគ្រោះថ្នាក់សម្រាប់ផលិតកម្ម

---

## ការត្រួតពិនិត្យបរិយាកាស

ការត្រួតពិនិត្យ `grep` ខាងក្រោមគឺជាការជួយរំលឹកតែមួយ។ ពាក្យផ្គូផ្គងមិនបញ្ជាក់ថាលក្ខណៈពិសេសនៅលើធនធានត្រឹមត្រូវ ហើយការខ្វះខាតមិនបញ្ជាក់ថាលក្ខណៈនោះគ្មានទេ (ម៉ូឌុល/លំនាំអាចផ្តល់បាន)។ កុំប្រើវាជាទ្វារសមើលផលិតកម្ម។

### ការត្រួតពិនិត្យបរិយាកាសអភិវឌ្ឍន៍

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

### ការត្រួតពិនិត្យបរិយាកាសផលិតកម្ម

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

## ការត្រួតពិនិត្យធនធាន

### ស្គ្រីបទ្រួតពិនិត្យគ្រុកូទា

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

## ការត្រួតពិនិត្យសុវត្ថិភាព និងការអនុវត្តតាម

### ស្គ្រីបទ្រួតពិនិត្យសុវត្ថិភាព

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

## ភ្ជាប់ជាមួយ CI/CD

### ភ្ជាប់ជាមួយ GitHub Actions

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

កំណត់អត្តសញ្ញាណផ្ទេរទំនាក់ទំនងសម្រាប់ដំណើរការនេះ ហើយបង្កើត/ស្តារឡើងវិញបរិយាកាស azd ជ្រើសរើសមុនរត់ស្គ្រីបដែលបានរក្សាទុក។ ឧទាហរណ៍ទាំងនេះសរសេរចេញតែការបង្ហាញលើកុងសូល ប៉ុណ្ណោះ មិនផលិតឯកសារ `preflight-results.json` ឬ JUnit ទេ។

### ភ្ជាប់ជាមួយ Azure DevOps

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

ផ្លូវបណ្ដាញត្រូវតែស្តារឬបង្កើតបរិយាកាស azd របស់ខ្លួន ហើយរក្សាទុកស្គ្រីបក្នុងមេរៀននេះមុនធ្វើភារកិច្ចនេះ។ កំណត់ការតភ្ជាប់សេវាផ្ទេរសិទ្ធិ ហើយផ្តល់សិទ្ធិ Token ត្រូវការ។ កុំរំពឹងថាការចូលប្រើ Azure CLI ក្នុងភារកិច្ច `AzureCLI@2` មុន នឹងអាចធានាការផ្ទៀងផ្ទាត់សម្រាប់ភារកិច្ច Bash រួចទៅ។

---

## សង្ខេបអចិន្ត្រៃយ៍បែបប្រពៃណីល្អបំផុត

### ✅ អនុវត្តន៍ត្រួតពិនិត្យមុនការហោះហើរយ៉ាងល្អបំផុត

1. **ស្វ័យប្រវត្តិសម្រាប់កន្លែងដែលអាចធ្វើបាន**
   - ភ្ជាប់ការត្រួតពិនិត្យទៅកាន់ផ្លូវបណ្ដាញ CI/CD
   - ប្រើស្គ្រីបសម្រាប់ការត្រួតពិនិត្យដែលអាចធ្វើឡើងឡើងវិញ
   - រក្សាទុកលទ្ធផលសម្រាប់តាមដាន

2. **ការត្រួតពិនិត្យឧបសម្ព័ន្ធមែនទែន**
   - ត្រួតពិនិត្យផ្សេងគ្នាសម្រាប់ dev/staging/production
   - តម្រូវការសុវត្ថិភាពសមរម្យសម្រាប់បរិយាកាសនីមួយៗ
   - បញ្ចេញផែនការចំណាយសម្រាប់បរិយាកាសក្រៅផលិតកម្ម

3. **ការគ្របដណ្តប់ទូលំទូលាយ**
   - អត្តសញ្ញាណ និងការអនុញ្ញាត
   - គ្រុកូទា និងសមត្ថភាពធនធាន
   - ការត្រួតពិនិត្យទម្រង់ និងវេយ្យាករណ៍
   - តម្រូវការសុវត្ថិភាព និងការអនុវត្តតាម

4. **របាយការណ៍ច្បាស់**
   - សញ្ញាចំណុចស្ថានភាពពណ៌-coded
   - សារកំហុសលម្អិតជាមួយជំហានដោះស្រាយ
   - របាយការណ៍សង្ខេបសម្រាប់ការវាយតម្លៃរហ័ស

5. **បរាជ័យយ៉ាងរហ័ស**
   - បញ្ឈប់ការបញ្ចូល ប្រសិនបើត្រួតពិនិត្យសំខាន់បរាជ័យ
   - ផ្ដល់មាតិការណែនាំច្បាស់សម្រាប់ដោះស្រាយ
   - អនុញ្ញាតឱ្យធ្វើការរត់ត្រួតពិនិត្យម្តងទៀតបានយ៉ាងងាយស្រួល

### កំហុសពេញនិយមមុនការហោះហើរ

1. **រំលងការត្រួតពិនិត្យ** សម្រាប់ការបញ្ចូល “រហ័ស”
2. **ការត្រួតពិនិត្យកំណត់សិទ្ធិមិនគ្រប់គ្រាន់** មុនការបញ្ចូល
3. **មិនយកគួរឱ្យចាប់អារម្មណ៍រឹងប៉ោងគ្រុកូទា** រហូតដល់បញ្ចូលបរាជ័យ
4. **មិនត្រួតពិនិត្យទម្រង់ក្នុងផ្លូវបណ្ដាញ CI/CD**
5. **ខ្វះការត្រួតពិនិត្យសុវត្ថិភាព** សម្រាប់បរិយាកាសផលិតកម្ម
6. **ការប៉ាន់ស្មានថ្លៃមិនគ្រប់គ្រាន់** ធ្វើឱ្យមានភាពភ្ញាក់ផ្អើលក្នុងថវិការ

---

**គន្លឹះជំនួយ**៖ ជួញដូរត្រួតពិនិត្យមុនការហោះហើរ ក្នុងតួនាទីការងារផ្សេងទៀតក្នុងផ្លូវបណ្ដាញ CI/CD មុនការងារបញ្ចូលពិតប្រាកដ។ វាធ្វើឱ្យអ្នកអាចចាប់យកបញ្ហាពីមុន និងផ្ដល់មតិយោបល់រហ័សសម្រាប់អ្នកអភិវឌ្ឍន៍។

---

**ការរុករក**
- **មេរៀនមុន**: [ការជ្រើសរើស SKU](sku-selection.md)
- **មេរៀនបន្ទាប់**: [សន្លឹកជំនួយ](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
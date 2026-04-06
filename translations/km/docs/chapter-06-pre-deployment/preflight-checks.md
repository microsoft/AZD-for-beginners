# ការត្រួតពិនិត្យមុនបញ្ជូនសម្រាប់ការតំណាង AZD

**ចរន្តជំពូក:**
- **📚 ផ្ទះវគ្គសិក្សា**: [AZD សម្រាប់អ្នកចាប់ផ្តើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូកទី 6 - ការត្រួតពិនិត្យ និងការធ្វើផែនការ មុនការនាំចេញ
- **⬅️ មុននេះ**: [ការជ្រើសរើស SKU](sku-selection.md)
- **➡️ ជំពូកបន្ទាប់**: [ជំពូក 7: ការដោះស្រាយបញ្ហា](../chapter-07-troubleshooting/common-issues.md)
- **🔧 ទាក់ទង**: [ជំពូក 4: មគ្គុទេសក៍នាំចេញ](../chapter-04-infrastructure/deployment-guide.md)

## ការណែនាំ

មគ្គុទេសក៍ពេញលេញនេះផ្តល់ជូនសครីប និងនីតិវិធីត្រួតពិនិត្យមុនការនាំចេញ ដើម្បីធានាថាការដាក់ចេញ Azure Developer CLI ប្រសើរឡើង យល់ដឹងពីរបៀបអនុវត្តការត្រួតពិនិត្យស្វ័យប្រវត្តិ សម្រាប់ការផ្ទៀងផ្ទាត់ការផ្ទៀងផ្ទាត់ការផ្ទៀងផ្ទាត់ អាណត្តិ ការ అందមានធនធាន កំណត់ប្រើហន្តត្រួតពិនិត្យសុវត្ថិភាព និងតម្រូវការសមត្ថភាព ដើម្បីជៀសវាងបញ្ហាក្នុងការបញ្ជូន និងបង្កើនអត្រានៃការជោគជ័យ។

## គោលបំណងសិក្សា

ដោយបញ្ចប់មគ្គុទេសក៍នេះ អ្នកនឹង:
- ជំនាញវិធីសាស្ត្រត្រួតពិនិត្យមុនការនាំចេញស្វ័យប្រវត្តិ និងសครីប
- យល់ដឹងពីយុទ្ធសាស្ត្រត្រួតពិនិត្យទូលំទូលាយសម្រាប់ការផ្ទៀងផ្ទាត់អាណត្តិ កំណត់សិទ្ធិ និងកំណត់ប្រើ
- អនុវត្តន៍នីតិវិធីផ្ទៀងផ្ទាត់កម្រិត ទំនុកចិត្ត និងប្រើធនធាន
- កំណត់ការត្រួតពិនិត្យសុវត្ថិភាព និងការអនុវត្តតាមគោលការណ៍អង្គភាព
- រចនាលំនាំការប៉ាន់ស្មានថ្លៃ និងបញ្ជាក់ថវិការប្រាក់
- បង្កើតស្វ័យប្រវត្តិការត្រួតពិនិត្យមុនការបញ្ជូនផ្ទាល់ខ្លួនសម្រាប់ CI/CD

## លទ្ធផលសិក្សា

បន្ទាប់ពីបញ្ចប់ អ្នកនឹងអាច:
- បង្កើត និងអនុវត្តសครីបការត្រួតពិនិត្យមុនការនាំចេញទូលំទូលាយ
- រចនាលំនាំស្វ័យប្រវត្តិត្រួតពិនិត្យសម្រាប់សេចក្តីប្រកាសផ្ទាំងផ្សេងៗ
- អនុវត្តន៍នីតិវិធី និងគោលការណ៍បរិវេណបញ្ជាក់ជាក់លាក់
- កំណត់ការត្រួតពិនិត្យដំណើរការ និងជូនសេចក្តីជូនដំណឹងយៈពេលសមរម្យសម្រាប់ការត្រៀមខ្លួនបញ្ជូន
- ដោះស្រាយបញ្ហាមុនការនាំចេញ និងអនុវត្តវិធានការកែតម្រូវ
- បញ្ចូលការត្រួតពិនិត្យមុនបញ្ជូនចូលក្នុងបណ្ដាញ DevOps និងស្វ័យប្រវត្តិភាព

## តារាងមាតិកា

- [ទិដ្ឋភាពទូទៅ](#ទិដ្ឋភាពទូទៅ)
- [សครីបត្រួតពិនិត្យមុនបញ្ជូនស្វ័យប្រវត្តិ](#សครីបត្រួតពិនិត្យមុនបញ្ជូនស្វ័យប្រវត្តិ)
- [បញ្ជីត្រួតពិនិត្យដោយដៃ](#codeblock1)
- [ការត្រួតពិនិត្យបរិវេណ](#✅-ការបម្រុងទុក-និងការបង្រួមខុស)
- [ការត្រួតពិនិត្យធនធាន](#ការត្រួតពិនិត្យបរិវេណផលិតកម្ម)
- [ការត្រួតពិនិត្យសុវត្ថិភាព និងការអនុវត្ត](#security--compliance-checks)
- [ការធ្វើផែនការសមត្ថភាព និងការអត្រាបាន](#performance--capacity-planning)
- [ការដោះស្រាយបញ្ហាទូទៅ](#troubleshooting-common-issues)

---

## ទិដ្ឋភាពទូទៅ

ការត្រួតពិនិត្យមុនបញ្ជូនគឺជាការផ្ទៀងផ្ទាត់ដ៏សំខាន់ដែលធ្វើមុននឹងធ្វើការនាំចេញ ដើម្បីធានា:

- **មានធនធាន** និងកំណត់ប្រើនៅតំបន់គោលដៅ
- **ការផ្ទៀងផ្ទាត់អត្តសញ្ញាណ និងសិទ្ធិ** ត្រូវបានកំណត់យ៉ាងត្រឹមត្រូវ
- **តម្រូវការគំរូ** និងប៉ារ៉ាម៉ែត្រត្រឹមត្រូវ
- **ការតភ្ជាប់បណ្តាញ** និងភាពជាប់ពាក់ព័ន្ធ
- **ការអនុវត្តតាមគោលការណ៍សុវត្ថិភាព** របស់អង្គភាព
- **ការប៉ាន់ស្មានថ្លៃ** នៅក្នុងព្រំដែនថវិកា

### ពេលណាត្រូវដំណើរការការត្រួតពិនិត្យមុនបញ្ជូន

- **មុនការនាំចេញដំបូង** ទៅបរិវេណថ្មី
- **បន្ទាប់ពីការផ្លាស់ប្ដូរការគំរូសំខាន់ៗ**
- **មុនការនាំចេញផលិតកម្ម**
- **ពេលផ្លាស់ប្ដូរតំបន់ Azure**
- **ជាផ្នែកនៃបណ្ដាញ CI/CD**

---

## សครីបត្រួតពិនិត្យមុនបញ្ជូនស្វ័យប្រវត្តិ

### ពិនិត្យមុនបញ្ជូន PowerShell

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

# កូដពណ៌សម្រាប់លទ្ធផល
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
    
    # ត្រួតពិនិត្យការដំឡើង AZD
    try {
        $azdVersion = azd version --output json | ConvertFrom-Json
        Write-Status "AZD CLI installed" "Success" "Version: $($azdVersion.azd.version)"
    }
    catch {
        Write-Status "AZD CLI not found" "Error" "Install from https://aka.ms/azd-install"
        return $false
    }
    
    # ត្រួតពិនិត្យការដំឡើង Azure CLI
    try {
        $azVersion = az version --output json | ConvertFrom-Json
        Write-Status "Azure CLI installed" "Success" "Version: $($azVersion.'azure-cli')"
    }
    catch {
        Write-Status "Azure CLI not found" "Error" "Install from https://aka.ms/azcli"
        return $false
    }
    
    # ត្រួតពិនិត្យកំណែ PowerShell
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
        # ត្រួតពិនិត្យការផ្ទៀងផ្ទាត់ជាមួយ AZD
        $azdAuth = azd auth login --check-status --output json 2>$null | ConvertFrom-Json
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
        }
        else {
            Write-Status "AZD authentication" "Error" "Run 'azd auth login'"
            return $false
        }
        
        # ត្រួតពិនិត្យការផ្ទៀងផ្ទាត់ជាមួយ Azure CLI
        $azAccount = az account show --output json | ConvertFrom-Json
        Write-Status "Azure CLI authentication" "Success" "Subscription: $($azAccount.name)"
        
        # វាយតម្លៃការចូលប្រើជាវាយតម្លៃ
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
        # ទទួលបានតួនាទីអ្នកប្រើបច្ចុប្បន្ន
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
        
        # សាកល្បងបង្កើតក្រុមធនធាន (បើបានបញ្ជាក់)
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # សាកល្បងសមត្ថភាពបង្កើតក្រុមធនធាន
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
        # ត្រួតពិនិត្យចំនួនកំណត់កុំព្យូទ័រ
        $computeUsage = az vm list-usage --location $Location --output json | ConvertFrom-Json
        
        # ត្រួតពិនិត្យចំនួនកំណត់ជាក់លាក់
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
        
        # ត្រួតពិនិត្យកំណត់សេវា App Service
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
        
        # ត្រួតពិនិត្យកំណត់គណនីផ្ទុក
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
        return $true # មិនបន្លំ
    }
}

function Test-NetworkConnectivity {
    Write-Host "`n${Blue}=== Network Connectivity Check ===${Reset}"
    
    # សាកល្បងចំណុចផ្ដល់សេវា Azure
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
    
    # សាកល្បងការរកមុខ DNS
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
    
    # ត្រួតពិនិត្យថាតើ azure.yaml មានឬទេ
    if (Test-Path "azure.yaml") {
        Write-Status "azure.yaml found" "Success"
        
        # បកបអាសយដ្ឋាន azure.yaml
        try {
            $azureYaml = Get-Content "azure.yaml" -Raw | ConvertFrom-Yaml
            Write-Status "azure.yaml parsing" "Success"
            
            # វាយតម្លៃសេវាកម្ម
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
    
    # ត្រួតពិនិត្យឯកសាររចនាសម្ព័ន្ធ
    if (Test-Path "infra") {
        $bicepFiles = Get-ChildItem -Path "infra" -Filter "*.bicep" -Recurse
        if ($bicepFiles.Count -gt 0) {
            Write-Status "Infrastructure templates" "Success" "$($bicepFiles.Count) Bicep files found"
            
            # វាយតម្លៃ main.bicep បើវាមាន
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
    
    # 🧪 ថ្មី: សាកល្បងមុនហ្វ្ដ្រីរចនាសម្ព័ន្ធ (ប្រើប្រាស់សំណួរដ៏សុវត្ថិភាព)
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
        # ត្រួតពិនិត្យថាតើទីតាំងមានសុពលភាព
        $locations = az account list-locations --output json | ConvertFrom-Json
        $validLocation = $locations | Where-Object { $_.name -eq $Location -or $_.displayName -eq $Location }
        
        if ($validLocation) {
            Write-Status "Azure region" "Success" "Location '$Location' is valid"
        }
        else {
            Write-Status "Azure region" "Error" "Location '$Location' is not valid"
            return $false
        }
        
        # ត្រួតពិនិត្យភាពមានសេសសេវាក្នុងតំបន់
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
    
    # ការប៉ាន់ប្រមាណតម្លៃមូលដ្ឋាន (ត្រូវការកម្មវិធី Azure Pricing API សម្រាប់ការប៉ាន់ប្រមាណត្រឹមត្រូវ)
    Write-Status "Cost estimation" "Info" "Use Azure Pricing Calculator for detailed estimates"
    Write-Status "Monitoring setup" "Info" "Set up Azure Cost Management alerts"
    
    # ត្រួតពិនិត្យថាតើមានថវិកាឬទេ
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
    
    # ត្រួតពិនិត្យវិធានការសន្តិសុខទូទៅ
    try {
        # ត្រួតពិនិត្យថាតើ Key Vault បានកំណត់រួចហើយ
        if (Select-String -Path "infra/*.bicep" -Pattern "Microsoft.KeyVault" -Quiet) {
            Write-Status "Key Vault usage" "Success" "Key Vault detected in templates"
        }
        else {
            Write-Status "Key Vault usage" "Warning" "Consider using Key Vault for secrets"
        }
        
        # ត្រួតពិនិត្យការប្រើប្រាស់ managed identity
        if (Select-String -Path "infra/*.bicep" -Pattern "managedIdentity|SystemAssigned" -Quiet) {
            Write-Status "Managed Identity" "Success" "Managed Identity detected"
        }
        else {
            Write-Status "Managed Identity" "Warning" "Consider using Managed Identity"
        }
        
        # ត្រួតពិនិត្យការបង្ខំ HTTPS
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

# ការប្រតិបត្តិប្រាំជាប់
function Invoke-PreflightCheck {
    Write-Host "${Green}AZD Pre-flight Check${Reset}" -ForegroundColor Green
    Write-Host "Environment: $EnvironmentName"
    Write-Host "Location: $Location"
    if ($ResourceGroup) { Write-Host "Resource Group: $ResourceGroup" }
    Write-Host "Time: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    Write-Host ""
    
    $allPassed = $true
    $results = @{}
    
    # ប្រតិបត្តិការត្រួតពិនិត្យទាំងអស់
    $results["Prerequisites"] = Test-Prerequisites
    $results["Authentication"] = Test-Authentication
    $results["Permissions"] = Test-Permissions
    $results["QuotasAndLimits"] = Test-QuotasAndLimits
    $results["NetworkConnectivity"] = Test-NetworkConnectivity
    $results["TemplateValidation"] = Test-TemplateValidation
    $results["RegionalAvailability"] = Test-RegionalAvailability
    $results["CostEstimation"] = Test-CostEstimation
    $results["SecurityCompliance"] = Test-SecurityCompliance
    
    # សង្ខេប
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

# ប្រតិបត្តិការត្រួតពិនិត្យមុនបើកบิน
Invoke-PreflightCheck
```

### ពិនិត្យមុនបញ្ជូន Bash

```bash
#!/bin/bash
# ការត្រួតពិនិត្យមុនបង្ហោះសម្រាប់ប្រព័ន្ធ Unix/Linux ជាជំហ៊ាន Bash

set -euo pipefail

# កូដពណ៌
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # គ្មានពណ៌

# អថេរពិភពលោក
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
    
    # ត្រួតពិនិត្យការដំឡើង AZD
    if command -v azd >/dev/null 2>&1; then
        local azd_version=$(azd version --output json | jq -r '.azd.version')
        print_status "AZD CLI installed" "success" "Version: $azd_version"
    else
        print_status "AZD CLI not found" "error" "Install from https://aka.ms/azd-install"
        return 1
    fi
    
    # ត្រួតពិនិត្យការដំឡើង Azure CLI
    if command -v az >/dev/null 2>&1; then
        local az_version=$(az version --output json | jq -r '."azure-cli"')
        print_status "Azure CLI installed" "success" "Version: $az_version"
    else
        print_status "Azure CLI not found" "error" "Install from https://aka.ms/azcli"
        return 1
    fi
    
    # ត្រួតពិនិត្យការដំឡើង jq
    if command -v jq >/dev/null 2>&1; then
        print_status "jq installed" "success"
    else
        print_status "jq not found" "warning" "Install jq for better JSON parsing"
    fi
    
    return 0
}

check_authentication() {
    echo -e "\n${BLUE}=== Authentication Check ===${NC}"
    
    # ត្រួតពិនិត្យការផ្ទៀងផ្ទាត់ AZD
    if azd auth login --check-status >/dev/null 2>&1; then
        local principal_name=$(azd auth login --check-status --output json 2>/dev/null | jq -r '.principalName // "Unknown"')
        print_status "AZD authentication" "success" "User: $principal_name"
    else
        print_status "AZD authentication" "error" "Run 'azd auth login'"
        return 1
    fi
    
    # ត្រួតពិនិត្យការផ្ទៀងផ្ទាត់ Azure CLI
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
    
    # ត្រួតពិនិត្យ azure.yaml
    if [[ -f "azure.yaml" ]]; then
        print_status "azure.yaml found" "success"
        
        # ផ្ទៀងផ្ទាត់ YAML មូលដ្ឋាន
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
    
    # ត្រួតពិនិត្យឯកសារឧបករណ៍ហេដ្ឋារចនាសម្ព័ន្ធ
    if [[ -d "infra" ]]; then
        local bicep_count=$(find infra -name "*.bicep" | wc -l)
        if [[ $bicep_count -gt 0 ]]; then
            print_status "Infrastructure templates" "success" "$bicep_count Bicep files found"
            
            # ផ្ទៀងផ្ទាត់ main.bicep បើមាន
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
    
    # ត្រួតពិនិត្យលេខទីតាំងថាត្រឹមត្រូវ
    if az account list-locations --query "[?name=='$LOCATION' || displayName=='$LOCATION']" --output tsv | grep -q .; then
        print_status "Azure region" "success" "Location '$LOCATION' is valid"
    else
        print_status "Azure region" "error" "Location '$LOCATION' is not valid"
        return 1
    fi
    
    # ត្រួតពិនិត្យភាពជាអាចប្រើបាននៃសេវាកម្ម
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
    # បម្រែបម្រួលអគ្គីសនីបញ្ជា
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
    
    # ផ្ទៀងផ្ទាត់ប៉ារ៉ាម៉ែត្រដែលត្រូវការ
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
    
    # ប្រតិបត្តិត្រួតពិនិត្យ
    local all_passed=true
    
    check_prerequisites || all_passed=false
    check_authentication || all_passed=false
    check_template_validation || all_passed=false
    check_regional_availability || all_passed=false
    
    # សង្ខេប
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

# ប្រតិបត្តិមុខងារសំខាន់
main "$@"
```

---

## បញ្ជីត្រួតពិនិត្យដោយដៃ

### បញ្ជីត្រួតពិនិត្យមុនការនាំចេញ

ថតបញ្ជីនេះ និងផ្ទៀងផ្ទាត់ធាតុចុងក្រោយមុនការនាំចេញ៖

#### ✅ ការតំឡើងបរិវេណ
- [ ] បានដំឡើង AZD CLI និងធ្វើការអាប់ដេតទៅកំណែថ្មីបំផុត
- [ ] បានដំឡើង Azure CLI និងផ្ទៀងផ្ទាត់អាណត្តិ
- [ ] ជ្រើសរើសអាជ្ញាប័ណ្ណ Azure ត្រឹមត្រូវ
- [ ] ឈ្មោះបរិវេណមានភាពដាច់ដោយឡែក និងធ្វើតាមលក្ខខណ្ឌនៃការកំណត់ឈ្មោះ
- [ ] កំណត់ក្រុមធនធានគោលដៅ ឬអាចបង្កើតថ្មីបាន

#### ✅ ការផ្ទៀងផ្ទាត់អាណត្តិ និងសិទ្ធិ
- [ ] ផ្ទៀងផ្ទាត់ជោគជ័យជាមួយ `azd auth login`
- [ ] អ្នកប្រើមានតួនាទី Contributor នៅលើអាជ្ញាប័ណ្ណ/ក្រុមធនធានគោលដៅ
- [ ] បង្កើត Service principal សម្រាប់ CI/CD (បើមាន)
- [ ] គ្មានវិញ្ញាបនបត្រ ឬសញ្ញាភាពផុតកំណត់

#### ✅ ការផ្ទៀងផ្ទាត់គំរូ
- [ ] `azure.yaml` មាន និងជាឯកសារ YAML ត្រឹមត្រូវ
- [ ] សេវាកម្មទាំងឡាយដែលបានកំណត់ក្នុង azure.yaml មានកូដប្រភពពាក់ព័ន្ធ
- [ ] គំរូ Bicep ក្នុងថត `infra/` មានស្រាប់
- [ ] `main.bicep` កំពុងបញ្ចូលដោយគ្មានកំហុស (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 ពិនិត្យមើលហេដ្ាហ្វ្រងជោគជ័យ (`azd provision --preview`)
- [ ] ប៉ារ៉ាម៉ែត្រទាំងអស់មានតម្លៃលំនាំដើម ឬនឹងត្រូវផ្ដល់
- [ ] គ្មានអ្វីដែលជាចំលងសម្ងាត់ក្នុងគំរូ

#### ✅ ការធ្វើផែនការធនធាន
- [ ] ជ្រើសរើសនិងផ្ទៀងផ្ទាត់តំបន់ Azure គោលដៅ
- [ ] សេវាកម្ម Azure ត្រូវបានផ្គត់ផ្គង់នៅតំបន់គោលដៅ
- [ ] បរិមាណកំណត់គ្រប់គ្រាន់សម្រាប់ធនធានដែលបានរៀបចំ
- [ ] ពិនិត្យវិវាទការកំណត់ឈ្មោះធនធាន
- [ ] យល់ដឹងពីភាពពាក់ព័ន្ធរវាងធនធាន

#### ✅ បណ្តាញ និងសុវត្ថិភាព
- [ ] តភ្ជាប់បណ្តាញទៅកាន់ចំណុចបញ្ចប់ Azure បានផ្ទៀងផ្ទាត់
- [ ] ការកំណត់ទ្វារ ភ្នែកទ្រង់ទ្រាយផ្នែកផ្សេងៗត្រូវបានកំណត់ប្រសើរបើចាំបាច់
- [ ] កំណត់ Key Vault សម្រាប់ការគ្រប់គ្រងសម្ងាត់
- [ ] ប្រើរូបមន្តគ្រប់គ្រង ID ដូចដែលអាចធ្វើបាន
- [ ] បើកកម្មវិធី HTTPS សម្រាប់កម្មវិធីវេប

#### ✅ ការគ្រប់គ្រងថ្លៃ
- [ ] ការប៉ាន់ស្មានថ្លៃបានធ្វើដោយប្រើ Azure Pricing Calculator
- [ ] កំណត់ជូនដំណឹងថវិកាបើចាំបាច់
- [ ] ជ្រើស SKU សមរម្យសម្រាប់ប្រភេទបរិវេណ
- [ ] ការពិចារណាកម្លាំងទុកចិត្តសម្រាប់បន្ទុកការងារផលិតកម្ម

#### ✅ ការត្រួតពិនិត្យ និងការតាមដាន
- [ ] កំណត់ Application Insights ក្នុងគំរូ
- [ ] គម្រោងលំហតំបន់ Log Analytics
- [ ] កំណត់ច្បាប់ជូនដំណឹងសម្រាប់វិមាត្រសំខាន់ៗ
- [ ] ច្រកត្រួតពិនិត្យសុខភាពបានអនុវត្តនៅក្នុងកម្មវិធី

#### ✅ ការបម្រុងទុក និងការបង្រួមខុស
- [ ] កំណត់យុទ្ធសាស្ត្របម្រុងទុកសម្រាប់ធនធានទិន្នន័យ
- [ ] កំណត់គោលបំណងអតិផរណាការស្ដារឡើងវិញ (RTO)
- [ ] កំណត់គោលបំណងចំណុចស្ដារឡើងវិញ (RPO)
- [ ] មានផែនការស្ដារឡើងវិញសម្រាប់ផលិតកម្ម

---

## ការត្រួតពិនិត្យបរិវេណ

### ការត្រួតពិនិត្យបរិវេណអភិវឌ្ឍន៍

```bash
#!/bin/bash
# ការត្រួតពិនិត្យជាក់លាក់សម្រាប់បរិបទអភិវឌ្ឍ

validate_dev_environment() {
    echo "=== Development Environment Validation ==="
    
    # ពិនិត្យការកំណត់ដែលសម្របសម្រួលសម្រាប់ការអភិវឌ្ឍ
    if grep -q "sku.*Free\|sku.*F1\|sku.*Basic" infra/*.bicep; then
        echo "✓ Development-appropriate SKUs detected"
    else
        echo "⚠ Consider using lower-cost SKUs for development"
    fi
    
    # ពិនិត្យការកំណត់ចុះក្រោមដោយស្វ័យប្រវត្តិ
    if grep -q "autoShutdown\|deallocate" infra/*.bicep; then
        echo "✓ Auto-shutdown configuration found"
    else
        echo "ℹ Consider adding auto-shutdown for cost savings"
    fi
    
    # ផ្ទៀងផ្ទាត់ការកំណត់មូលដ្ឋានទិន្នន័យសម្រាប់ការអភិវឌ្ឍ
    if grep -q "Basic\|S0\|S1" infra/*.bicep; then
        echo "✓ Development database tiers configured"
    else
        echo "⚠ Consider using Basic/Standard tiers for development databases"
    fi
}
```

### ការត្រួតពិនិត្យបរិវេណផលិតកម្ម

```bash
#!/bin/bash
# ការផ្ទៀងផ្ទាត់ជាក់លាក់សម្រាប់បរិយាកាសផលិតកម្ម

validate_prod_environment() {
    echo "=== Production Environment Validation ==="
    
    # ពិនិត្យការកំណត់តម្រង់ភាពមានស្រាប់ខ្ពស់
    if grep -q "zoneRedundant.*true\|Premium\|Standard_GRS" infra/*.bicep; then
        echo "✓ High availability configurations detected"
    else
        echo "⚠ Consider enabling high availability for production"
    fi
    
    # ពិនិត្យការកំណត់ការបម្រុងទុក
    if grep -q "backup\|retention\|pointInTimeRestore" infra/*.bicep; then
        echo "✓ Backup configurations found"
    else
        echo "⚠ Ensure backup strategies are implemented"
    fi
    
    # ផ្ទៀងផ្ទាត់ការដំឡើងតាមដាន
    if grep -q "Microsoft.Insights\|Application_Type.*web" infra/*.bicep; then
        echo "✓ Monitoring and observability configured"
    else
        echo "⚠ Add comprehensive monitoring for production"
    fi
    
    # ពិនិត្យការកំណត់សុវត្ថិភាព
    if grep -q "Microsoft.KeyVault\|managedIdentity\|httpsOnly.*true" infra/*.bicep; then
        echo "✓ Security best practices implemented"
    else
        echo "⚠ Review security configurations for production"
    fi
}
```

---

## ការត្រួតពិនិត្យធនធាន

### សครីបប៉ាន់ស្មាន Quota

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
    
    # ទទួលបានគណនីបញ្ចូលទិន្នន័យក្នុងការជាវ
    accounts = run_command(['az', 'storage', 'account', 'list'])
    
    if accounts is None:
        print("❌ Could not retrieve storage account information")
        return False
    
    account_count = len(accounts)
    max_accounts = 250  # កំណត់ដើម Azure
    
    usage_percent = (account_count / max_accounts) * 100
    status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
    
    print(f"{status} Storage Accounts: {account_count}/{max_accounts} ({usage_percent:.1f}%)")
    
    return usage_percent < 95

def check_network_limits(location: str) -> bool:
    """Check network-related limits"""
    print(f"\n=== Network Limits Check ({location}) ===")
    
    # ពិនិត្យបណ្ដាញវីជួរប្រព័ន្ធ
    vnets = run_command(['az', 'network', 'vnet', 'list'])
    if vnets is not None:
        vnet_count = len(vnets)
        print(f"✅ Virtual Networks: {vnet_count}/1000")
    
    # ពិនិត្យអាសយដ្ឋាន IP សាធារណៈ
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
    
    # ប្រតិបត្តិការពិនិត្យ
    all_passed &= check_compute_quotas(location)
    all_passed &= check_storage_limits(location)
    all_passed &= check_network_limits(location)
    
    # សង្ខេប
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

## ការត្រួតពិនិត្យសុវត្ថិភាព និងការអនុវត្ត

### សครីបត្រួតពិនិត្យសុវត្ថិភាព

```bash
#!/bin/bash
# ការផ្ទៀងផ្ទាត់សុវត្ថិភាព និងភាពស្របច្បាប់សម្រាប់ការចេញផ្សាយ AZD

check_security_practices() {
    echo "=== Security Best Practices Check ==="
    
    local issues_found=0
    
    # ពិនិត្យការប្រើប្រាស់ Key Vault
    if grep -r "Microsoft.KeyVault" infra/ >/dev/null 2>&1; then
        echo "✅ Key Vault detected in infrastructure"
    else
        echo "⚠️  Key Vault not found - consider using for secrets management"
        ((issues_found++))
    fi
    
    # ពិនិត្យការប្រើប្រាស់អត្តសញ្ញាណគ្រប់គ្រង
    if grep -r "managedIdentity\|SystemAssigned\|UserAssigned" infra/ >/dev/null 2>&1; then
        echo "✅ Managed Identity configuration detected"
    else
        echo "⚠️  Managed Identity not found - consider using for service authentication"
        ((issues_found++))
    fi
    
    # ពិនិត្យការអនុវត្ត HTTPS
    if grep -r "httpsOnly.*true\|requireHttps.*true" infra/ >/dev/null 2>&1; then
        echo "✅ HTTPS enforcement detected"
    else
        echo "⚠️  HTTPS enforcement not found - ensure secure connections"
        ((issues_found++))
    fi
    
    # ពិនិត្យកំណែកម្មវិធី TLS តិចបំផុត
    if grep -r "minimumTlsVersion.*'TLS1_2'" infra/ >/dev/null 2>&1; then
        echo "✅ Minimum TLS 1.2 configuration detected"
    else
        echo "⚠️  Minimum TLS version not specified - consider requiring TLS 1.2+"
        ((issues_found++))
    fi
    
    # ពិនិត្យការកំណត់កំណត់ការចូលប្រើសាធារណៈ
    if grep -r "allowBlobPublicAccess.*false\|publicNetworkAccess.*Disabled" infra/ >/dev/null 2>&1; then
        echo "✅ Public access restrictions detected"
    else
        echo "⚠️  Public access restrictions not found - consider limiting public access"
        ((issues_found++))
    fi
    
    # ពិនិត្យក្រុមសុវត្ថិភាពបណ្តាញ
    if grep -r "Microsoft.Network/networkSecurityGroups" infra/ >/dev/null 2>&1; then
        echo "✅ Network Security Groups detected"
    else
        echo "ℹ️  Network Security Groups not found - may be acceptable depending on architecture"
    fi
    
    return $issues_found
}

check_compliance_requirements() {
    echo -e "\n=== Compliance Requirements Check ==="
    
    # ពិនិត្យការអ៊ិនគ្រីបទិន្នន័យ
    if grep -r "encryption\|encryptionAtRest\|transparentDataEncryption" infra/ >/dev/null 2>&1; then
        echo "✅ Encryption configurations detected"
    else
        echo "⚠️  Encryption configurations not found - ensure data is encrypted"
    fi
    
    # ពិនិត្យកំណត់ត្រាការត្រួតពិនិត្យ
    if grep -r "Microsoft.Insights.*auditingSettings\|diagnosticSettings" infra/ >/dev/null 2>&1; then
        echo "✅ Audit logging configurations detected"
    else
        echo "⚠️  Audit logging not found - consider enabling for compliance"
    fi
    
    # ពិនិត្យគោលការណ៍បម្រុងទុក និងការរក្សាទុក
    if grep -r "backup.*Policy\|retentionPolicy\|retention.*Days" infra/ >/dev/null 2>&1; then
        echo "✅ Backup and retention policies detected"
    else
        echo "⚠️  Backup/retention policies not found - required for data governance"
    fi
}

# ការអនុវត្តសំខាន់
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

## ការបញ្ចូលជាមួយ CI/CD

### ការបញ្ចូល GitHub Actions

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

### ការបញ្ចូល Azure DevOps

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

## សេចក្តីសង្ខេបអំពីអនុវត្តល្អបំផុត

### ✅ អនុវត្តល្អបំផុតសម្រាប់ការត្រួតពិនិត្យមុនបញ្ជូន

1. **ធ្វើស្វ័យប្រវត្តិបំផុតតាមដែលអាចធ្វើបាន**
   - បញ្ចូលការត្រួតពិនិត្យចូលក្នុងបណ្ដាញ CI/CD
   - ប្រើសครីបសម្រាប់ការផ្ទៀងផ្ទាត់ដែលអាចធ្វើម្តងទៀតបាន
   - រក្សាទិន្នន័យសម្រាប់ការត្រួតពិនិត្យមើល

2. **ការត្រួតពិនិត្យជាក់លាក់សម្រាប់បរិវេណ**
   - ការត្រួតពិនិត្យខុសគ្នាសម្រាប់ dev/staging/prod
   - តម្រូវការសុវត្ថិភាពសមរម្យក្នុងមួយបរិវេណ
   - ការបំប៉នថ្លៃសម្រាប់បរិវេណមិនផលិតកម្ម

3. **ការគ្រប់គ្រងទូលំទូលាយ**
   - អាណត្តិ និងសិទ្ធិ
   - កំណត់គំនូស និងមានធនធាន
   - ការត្រួតពិនិត្យគំរូ និងរចនាសម្ព័ន្ធ
   - តម្រូវការសុវត្ថិភាព និងអនុវត្ត

4. **រាយការណ៍ច្បាស់លាស់**
   - សញ្ញាពណ៌សម្រាប់ស្ថានភាព
   - សារ​កំហុសលម្អិតជាមួយជំហានដោះស្រាយ
   - របាយការណ៍សង្ខេបសម្រាប់ការវាយតម្លៃលឿន

5. **បរាជ័យយ៉ាងឆាប់រហ័ស**
   - បញ្ឈប់ការនាំចេញបើបញ្ជាក់សំខាន់បរាជ័យ
   - ផ្ដល់ការណែនាំច្បាស់លាស់សម្រាប់ដំណោះស្រាយ
   - អនុញ្ញាតឲ្យបើកដំណើរការត្រួតពិនិត្យម្តងទៀតបានយ៉ាងងាយស្រួល

### បញ្ហាទូទៅរបស់ការត្រួតពិនិត្យមុនបញ្ជូន

1. **លើកលែងការត្រួតពិនិត្យ** សម្រាប់ការបញ្ជូន "រហ័ស"
2. **ការត្រួតពិនិត្យសិទ្ធិមិនគ្រប់គ្រាន់** មុនការនាំចេញ
3. **មិនពិចារណាកំណត់គំនូស** រហូតដល់ការនាំចេញបរាជ័យ
4. **មិនត្រួតពិនិត្យគំរូ** ក្នុងបណ្ដាញ CI/CD
5. **ខ្វះការបញ្ជាក់សុវត្ថិភាព** សម្រាប់បរិវេណផលិតកម្ម
6. **ប៉ាន់ស្មានថ្លៃមិនគ្រប់គ្រាន់** ធ្វើឲ្យមានការភ្ញាក់ផ្អើលថវិការប្រាក់

---

**អនុសាសន៍ពិសេស**៖ រត់ការត្រួតពិនិត្យមុនបញ្ជូនជាការងារផ្សេងទៀតក្នុងបណ្ដាញ CI/CD មុនការងារនាំចេញពិតប្រាកដ។ នេះអនុញ្ញាតឲ្យអ្នកចាប់យកបញ្ហារហ័ស និងផ្ដល់មតិយោបល់លឿនដល់អ្នកអភិវឌ្ឍន៍។

---

**ចរន្តបើកបរ**
- **មេរៀនមុននេះ**: [ការជ្រើសរើស SKU](sku-selection.md)
- **មេរៀនបន្ទាប់**: [តារាង Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការរក្សាសិទ្ធិ**៖
ឯកសារនេះត្រូវបានបកប្រែដោយប្រើសេវាកម្មបកប្រែ AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ខណៈដែលយើងខិតខំរក្សាសុវត្ថិភាពនៃភាពត្រឹមត្រូវ សូមចំណាំថាការបកប្រែដោយស្វ័យប្រវត្តិអាចមានកំហុស ឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមក្នុងភាសាដើមគួរត្រូវបានពិចារណាថាជាឯកសារយោងដ៏មានសុពលភាព។ សម្រាប់ព័ត៌មានសំខាន់ សូមណែនាំឱ្យប្រើការបកប្រែដោយមនុស្សជំនាញវិជ្ជាជីវៈ។ យើងគ្មានកាតព្វកិច្ចចំពោះការយល់ច្រឡំ ឬការបកប្រែខុសពីការប្រើប្រាស់ការបកប្រែនេះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
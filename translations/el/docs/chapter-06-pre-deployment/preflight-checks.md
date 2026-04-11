# Προέλεγχοι για αναπτύξεις AZD

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 6 - Επικύρωση & Σχεδιασμός πριν την Ανάπτυξη
- **⬅️ Προηγούμενο**: [Επιλογή SKU](sku-selection.md)
- **➡️ Επόμενο Κεφάλαιο**: [Κεφάλαιο 7: Αντιμετώπιση προβλημάτων](../chapter-07-troubleshooting/common-issues.md)
- **🔧 Σχετικό**: [Κεφάλαιο 4: Οδηγός Ανάπτυξης](../chapter-04-infrastructure/deployment-guide.md)

## Εισαγωγή

Αυτός ο ολοκληρωμένος οδηγός παρέχει σενάρια και διαδικασίες προ-επικύρωσης πριν την ανάπτυξη για να διασφαλίσει επιτυχημένες αναπτύξεις με το Azure Developer CLI πριν ξεκινήσουν. Μάθετε να υλοποιείτε αυτοματοποιημένους ελέγχους για έλεγχο ταυτότητας, διαθεσιμότητα πόρων, ποσοστώσεις, συμμόρφωση ασφαλείας και απαιτήσεις απόδοσης για να αποτρέψετε αποτυχίες ανάπτυξης και να βελτιστοποιήσετε τα ποσοστά επιτυχίας των αναπτύξεων.

## Στόχοι Μάθησης

Με την ολοκλήρωση αυτού του οδηγού, θα:
- Εξειδικευτείτε σε αυτοματοποιημένες τεχνικές και σενάρια προ-επικύρωσης
- Κατανοήσετε ολοκληρωμένες στρατηγικές ελέγχου για έλεγχο ταυτότητας, δικαιώματα και ποσοστώσεις
- Υλοποιήσετε διαδικασίες επικύρωσης διαθεσιμότητας και χωρητικότητας πόρων
- Διαμορφώσετε ελέγχους ασφάλειας και συμμόρφωσης με τις πολιτικές της οργάνωσης
- Σχεδιάσετε ροές εργασίας εκτίμησης κόστους και επικύρωσης προϋπολογισμού
- Δημιουργήσετε προσαρμοσμένη αυτοματοποίηση προ-ελέγχων για CI/CD pipelines

## Αποτελέσματα Μάθησης

Μετά την ολοκλήρωση, θα μπορείτε να:
- Δημιουργείτε και να εκτελείτε ολοκληρωμένα σενάρια επικύρωσης προ-εκκίνησης
- Σχεδιάζετε αυτοματοποιημένες ροές ελέγχων για διάφορα σενάρια ανάπτυξης
- Υλοποιείτε διαδικασίες και πολιτικές επικύρωσης ειδικές για κάθε περιβάλλον
- Διαμορφώνετε προληπτική παρακολούθηση και ειδοποίηση για την ετοιμότητα ανάπτυξης
- Αντιμετωπίζετε προβλήματα πριν την ανάπτυξη και εφαρμόζετε διορθωτικές ενέργειες
- Ενσωματώνετε τους προελέγχους σε DevOps pipelines και ροές αυτοματοποίησης

## Πίνακας Περιεχομένων

- [Overview](#overview)
- [Automated Pre-flight Script](#αυτοματοποιημένο-σενάριο-προ-ελέγχου)
- [Manual Validation Checklist](#codeblock1)
- [Environment Validation](#✅-backup-ανάκτηση)
- [Resource Validation](#επικύρωση-περιβάλλοντος-παραγωγής)
- [Security & Compliance Checks](#security--compliance-checks)
- [Performance & Capacity Planning](#performance--capacity-planning)
- [Troubleshooting Common Issues](#troubleshooting-common-issues)

---

## Overview

Οι προ-έλεγχοι είναι ουσιώδεις επικυρώσεις που πραγματοποιούνται πριν την ανάπτυξη για να διασφαλίσουν:

- **Διαθεσιμότητα πόρων** και ποσοστώσεις στις στοχευμένες περιοχές
- **Έλεγχος ταυτότητας και δικαιώματα** είναι σωστά διαμορφωμένα
- **Εγκυρότητα προτύπων** και σωστότητα παραμέτρων
- **Συνδεσιμότητα δικτύου** και εξαρτήσεις
- **Συμμόρφωση ασφάλειας** με τις πολιτικές της οργάνωσης
- **Εκτίμηση κόστους** εντός ορίων προϋπολογισμού

### Πότε να Εκτελέσετε Προελέγχους

- **Πριν την πρώτη ανάπτυξη** σε ένα νέο περιβάλλον
- **Μετά από σημαντικές αλλαγές σε πρότυπα**
- **Πριν από αναπτύξεις σε παραγωγή**
- **Όταν αλλάζετε περιοχές Azure**
- **Ως μέρος pipelines CI/CD**

---

## Αυτοματοποιημένο Σενάριο Προ-ελέγχου

### PowerShell Προ-έλεγχος

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

# Έγχρωμη κωδικοποίηση για την έξοδο
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
    
    # Έλεγχος εγκατάστασης AZD
    try {
        $azdVersion = azd version --output json | ConvertFrom-Json
        Write-Status "AZD CLI installed" "Success" "Version: $($azdVersion.azd.version)"
    }
    catch {
        Write-Status "AZD CLI not found" "Error" "Install from https://aka.ms/azd-install"
        return $false
    }
    
    # Έλεγχος εγκατάστασης Azure CLI
    try {
        $azVersion = az version --output json | ConvertFrom-Json
        Write-Status "Azure CLI installed" "Success" "Version: $($azVersion.'azure-cli')"
    }
    catch {
        Write-Status "Azure CLI not found" "Error" "Install from https://aka.ms/azcli"
        return $false
    }
    
    # Έλεγχος έκδοσης PowerShell
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
        # Έλεγχος αυθεντικοποίησης AZD
        $azdAuth = azd auth login --check-status --output json 2>$null | ConvertFrom-Json
        if ($azdAuth.status -eq "Logged-in") {
            Write-Status "AZD authentication" "Success" "User: $($azdAuth.principalName)"
        }
        else {
            Write-Status "AZD authentication" "Error" "Run 'azd auth login'"
            return $false
        }
        
        # Έλεγχος αυθεντικοποίησης Azure CLI
        $azAccount = az account show --output json | ConvertFrom-Json
        Write-Status "Azure CLI authentication" "Success" "Subscription: $($azAccount.name)"
        
        # Επικύρωση πρόσβασης στη συνδρομή
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
        # Λήψη αναθέσεων ρόλων του τρέχοντος χρήστη
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
        
        # Δοκιμή δημιουργίας ομάδας πόρων (αν καθοριστεί)
        if ($ResourceGroup) {
            $rgExists = az group exists --name $ResourceGroup --output tsv
            if ($rgExists -eq "true") {
                Write-Status "Resource group access" "Success" "Resource group '$ResourceGroup' exists"
            }
            else {
                # Δοκιμή δυνατότητας δημιουργίας ομάδας πόρων
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
        # Έλεγχος ορίων υπολογισμού
        $computeUsage = az vm list-usage --location $Location --output json | ConvertFrom-Json
        
        # Έλεγχος συγκεκριμένων ορίων
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
        
        # Έλεγχος ορίων App Service
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
        
        # Έλεγχος ορίων λογαριασμού αποθήκευσης
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
        return $true # Μη αποκλειστικό
    }
}

function Test-NetworkConnectivity {
    Write-Host "`n${Blue}=== Network Connectivity Check ===${Reset}"
    
    # Δοκιμή τελικών σημείων Azure
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
    
    # Δοκιμή επίλυσης DNS
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
    
    # Έλεγχος αν υπάρχει το azure.yaml
    if (Test-Path "azure.yaml") {
        Write-Status "azure.yaml found" "Success"
        
        # Ανάλυση του azure.yaml
        try {
            $azureYaml = Get-Content "azure.yaml" -Raw | ConvertFrom-Yaml
            Write-Status "azure.yaml parsing" "Success"
            
            # Επικύρωση υπηρεσιών
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
    
    # Έλεγχος για αρχεία υποδομής
    if (Test-Path "infra") {
        $bicepFiles = Get-ChildItem -Path "infra" -Filter "*.bicep" -Recurse
        if ($bicepFiles.Count -gt 0) {
            Write-Status "Infrastructure templates" "Success" "$($bicepFiles.Count) Bicep files found"
            
            # Επικύρωση του main.bicep αν υπάρχει
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
    
    # 🧪 ΝΕΟ: Δοκιμή προεπισκόπησης υποδομής (ασφαλής προσομοιωμένη εκτέλεση)
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
        # Έλεγχος αν η τοποθεσία είναι έγκυρη
        $locations = az account list-locations --output json | ConvertFrom-Json
        $validLocation = $locations | Where-Object { $_.name -eq $Location -or $_.displayName -eq $Location }
        
        if ($validLocation) {
            Write-Status "Azure region" "Success" "Location '$Location' is valid"
        }
        else {
            Write-Status "Azure region" "Error" "Location '$Location' is not valid"
            return $false
        }
        
        # Έλεγχος διαθεσιμότητας υπηρεσίας στην περιοχή
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
    
    # Βασική εκτίμηση κόστους (θα απαιτούνταν το Azure Pricing API για ακριβείς εκτιμήσεις)
    Write-Status "Cost estimation" "Info" "Use Azure Pricing Calculator for detailed estimates"
    Write-Status "Monitoring setup" "Info" "Set up Azure Cost Management alerts"
    
    # Έλεγχος αν υπάρχει προϋπολογισμός
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
    
    # Έλεγχος για κοινές πρακτικές ασφάλειας
    try {
        # Έλεγχος αν το Key Vault είναι ρυθμισμένο
        if (Select-String -Path "infra/*.bicep" -Pattern "Microsoft.KeyVault" -Quiet) {
            Write-Status "Key Vault usage" "Success" "Key Vault detected in templates"
        }
        else {
            Write-Status "Key Vault usage" "Warning" "Consider using Key Vault for secrets"
        }
        
        # Έλεγχος για χρήση διαχειριζόμενης ταυτότητας
        if (Select-String -Path "infra/*.bicep" -Pattern "managedIdentity|SystemAssigned" -Quiet) {
            Write-Status "Managed Identity" "Success" "Managed Identity detected"
        }
        else {
            Write-Status "Managed Identity" "Warning" "Consider using Managed Identity"
        }
        
        # Έλεγχος επιβολής HTTPS
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

# Κύρια εκτέλεση
function Invoke-PreflightCheck {
    Write-Host "${Green}AZD Pre-flight Check${Reset}" -ForegroundColor Green
    Write-Host "Environment: $EnvironmentName"
    Write-Host "Location: $Location"
    if ($ResourceGroup) { Write-Host "Resource Group: $ResourceGroup" }
    Write-Host "Time: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    Write-Host ""
    
    $allPassed = $true
    $results = @{}
    
    # Εκτέλεση όλων των ελέγχων
    $results["Prerequisites"] = Test-Prerequisites
    $results["Authentication"] = Test-Authentication
    $results["Permissions"] = Test-Permissions
    $results["QuotasAndLimits"] = Test-QuotasAndLimits
    $results["NetworkConnectivity"] = Test-NetworkConnectivity
    $results["TemplateValidation"] = Test-TemplateValidation
    $results["RegionalAvailability"] = Test-RegionalAvailability
    $results["CostEstimation"] = Test-CostEstimation
    $results["SecurityCompliance"] = Test-SecurityCompliance
    
    # Περίληψη
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

# Εκτέλεση του προκαταρκτικού ελέγχου
Invoke-PreflightCheck
```

### Bash Προ-έλεγχος

```bash
#!/bin/bash
# Έκδοση σε Bash των ελέγχων πριν την εκτέλεση για συστήματα Unix/Linux

set -euo pipefail

# Κωδικοί χρωμάτων
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # Χωρίς χρώμα

# Παγκόσμιες μεταβλητές
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
    
    # Έλεγχος εγκατάστασης AZD
    if command -v azd >/dev/null 2>&1; then
        local azd_version=$(azd version --output json | jq -r '.azd.version')
        print_status "AZD CLI installed" "success" "Version: $azd_version"
    else
        print_status "AZD CLI not found" "error" "Install from https://aka.ms/azd-install"
        return 1
    fi
    
    # Έλεγχος εγκατάστασης του Azure CLI
    if command -v az >/dev/null 2>&1; then
        local az_version=$(az version --output json | jq -r '."azure-cli"')
        print_status "Azure CLI installed" "success" "Version: $az_version"
    else
        print_status "Azure CLI not found" "error" "Install from https://aka.ms/azcli"
        return 1
    fi
    
    # Έλεγχος εγκατάστασης του jq
    if command -v jq >/dev/null 2>&1; then
        print_status "jq installed" "success"
    else
        print_status "jq not found" "warning" "Install jq for better JSON parsing"
    fi
    
    return 0
}

check_authentication() {
    echo -e "\n${BLUE}=== Authentication Check ===${NC}"
    
    # Έλεγχος πιστοποίησης AZD
    if azd auth login --check-status >/dev/null 2>&1; then
        local principal_name=$(azd auth login --check-status --output json 2>/dev/null | jq -r '.principalName // "Unknown"')
        print_status "AZD authentication" "success" "User: $principal_name"
    else
        print_status "AZD authentication" "error" "Run 'azd auth login'"
        return 1
    fi
    
    # Έλεγχος πιστοποίησης του Azure CLI
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
    
    # Έλεγχος azure.yaml
    if [[ -f "azure.yaml" ]]; then
        print_status "azure.yaml found" "success"
        
        # Βασική επικύρωση YAML
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
    
    # Έλεγχος αρχείων υποδομής
    if [[ -d "infra" ]]; then
        local bicep_count=$(find infra -name "*.bicep" | wc -l)
        if [[ $bicep_count -gt 0 ]]; then
            print_status "Infrastructure templates" "success" "$bicep_count Bicep files found"
            
            # Επικύρωση του main.bicep εάν υπάρχει
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
    
    # Έλεγχος εάν η τοποθεσία είναι έγκυρη
    if az account list-locations --query "[?name=='$LOCATION' || displayName=='$LOCATION']" --output tsv | grep -q .; then
        print_status "Azure region" "success" "Location '$LOCATION' is valid"
    else
        print_status "Azure region" "error" "Location '$LOCATION' is not valid"
        return 1
    fi
    
    # Έλεγχος διαθεσιμότητας υπηρεσίας
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
    # Ανάλυση ορισμάτων γραμμής εντολών
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
    
    # Επικύρωση απαιτούμενων παραμέτρων
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
    
    # Εκτέλεση ελέγχων
    local all_passed=true
    
    check_prerequisites || all_passed=false
    check_authentication || all_passed=false
    check_template_validation || all_passed=false
    check_regional_availability || all_passed=false
    
    # Περίληψη
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

# Εκτέλεση της κύριας συνάρτησης
main "$@"
```

---

## Χειροκίνητη Λίστα Ελέγχου

### Λίστα Ελέγχου πριν την Ανάπτυξη

Εκτυπώστε αυτή τη λίστα ελέγχου και επαληθεύστε κάθε στοιχείο πριν την ανάπτυξη:

#### ✅ Ρύθμιση Περιβάλλοντος
- [ ] Το AZD CLI είναι εγκατεστημένο και ενημερωμένο στην τελευταία έκδοση
- [ ] Το Azure CLI είναι εγκατεστημένο και έχει γίνει έλεγχος ταυτότητας
- [ ] Επιλεγμένη η σωστή συνδρομή Azure
- [ ] Το όνομα του περιβάλλοντος είναι μοναδικό και ακολουθεί τις συμβάσεις ονοματοδοσίας
- [ ] Ο προοριζόμενος resource group έχει εντοπιστεί ή μπορεί να δημιουργηθεί

#### ✅ Έλεγχος ταυτότητας & Δικαιώματα
- [ ] Επιτυχής έλεγχος ταυτότητας με `azd auth login`
- [ ] Ο χρήστης έχει ρόλο Contributor στη στοχευμένη συνδρομή/ομάδα πόρων
- [ ] Service principal διαμορφωμένο για CI/CD (αν ισχύει)
- [ ] Δεν υπάρχουν ληγμένα πιστοποιητικά ή διαπιστευτήρια

#### ✅ Επικύρωση Προτύπων
- [ ] Το `azure.yaml` υπάρχει και είναι έγκυρο YAML
- [ ] Όλες οι υπηρεσίες που ορίζονται στο azure.yaml έχουν αντίστοιχο πηγαίο κώδικα
- [ ] Τα Bicep πρότυπα στον κατάλογο `infra/` υπάρχουν
- [ ] Το `main.bicep` μεταγλωττίζεται χωρίς σφάλματα (`az bicep build --file infra/main.bicep`)
- [ ] 🧪 Η προεπισκόπηση υποδομής εκτελείται επιτυχώς (`azd provision --preview`)
- [ ] Όλες οι απαιτούμενες παράμετροι έχουν προεπιλεγμένες τιμές ή θα παρέχονται
- [ ] Δεν υπάρχουν σκληροκωδικοποιημένα μυστικά στα πρότυπα

#### ✅ Σχεδιασμός Πόρων
- [ ] Επιλεγμένη και επικυρωμένη η στοχευμένη περιοχή Azure
- [ ] Οι απαιτούμενες υπηρεσίες Azure είναι διαθέσιμες στην στοχευμένη περιοχή
- [ ] Διαθέσιμες επαρκείς ποσοστώσεις για τους προγραμματισμένους πόρους
- [ ] Ελέγχθηκαν συγκρούσεις ονοματοδοσίας πόρων
- [ ] Κατανοούνται οι εξαρτήσεις μεταξύ πόρων

#### ✅ Δίκτυο & Ασφάλεια
- [ ] Επαληθεύτηκε η συνδεσιμότητα δικτύου προς τα endpoints του Azure
- [ ] Οι ρυθμίσεις firewall/proxy έχουν διαμορφωθεί εάν χρειάζεται
- [ ] Το Key Vault έχει διαμορφωθεί για διαχείριση μυστικών
- [ ] Χρησιμοποιούνται managed identities όπου είναι δυνατόν
- [ ] Η επιβολή HTTPS ενεργοποιήθηκε για τις web εφαρμογές

#### ✅ Διαχείριση Κόστους
- [ ] Οι εκτιμήσεις κόστους υπολογίστηκαν χρησιμοποιώντας το Azure Pricing Calculator
- [ ] Οι ειδοποιήσεις προϋπολογισμού διαμορφώθηκαν εάν απαιτείται
- [ ] Επιλέχθηκαν κατάλληλα SKU για τον τύπο περιβάλλοντος
- [ ] Λήφθηκε υπόψη η δεσμευμένη χωρητικότητα για παραγωγικά φορτία

#### ✅ Παρακολούθηση & Παρατηρησιμότητα
- [ ] Το Application Insights έχει διαμορφωθεί στα πρότυπα
- [ ] Ο χώρος εργασίας Log Analytics έχει σχεδιαστεί
- [ ] Ορίστηκαν κανόνες ειδοποιήσεων για κρίσιμες μετρήσεις
- [ ] Υλοποιήθηκαν endpoints ελέγχου κατάστασης στις εφαρμογές

#### ✅ Backup & Ανάκτηση
- [ ] Ορίστηκε στρατηγική backup για πόρους δεδομένων
- [ ] Τα Recovery Time Objectives (RTO) τεκμηριώθηκαν
- [ ] Τα Recovery Point Objectives (RPO) τεκμηριώθηκαν
- [ ] Υπάρχει σχέδιο ανάκαμψης καταστροφών για την παραγωγή

---

## Επικύρωση Περιβάλλοντος

### Επικύρωση Περιβάλλοντος Ανάπτυξης

```bash
#!/bin/bash
# Ελέγχοι ειδικοί για το περιβάλλον ανάπτυξης

validate_dev_environment() {
    echo "=== Development Environment Validation ==="
    
    # Έλεγχος για ρυθμίσεις φιλικές προς την ανάπτυξη
    if grep -q "sku.*Free\|sku.*F1\|sku.*Basic" infra/*.bicep; then
        echo "✓ Development-appropriate SKUs detected"
    else
        echo "⚠ Consider using lower-cost SKUs for development"
    fi
    
    # Έλεγχος για ρυθμίσεις αυτόματης απενεργοποίησης
    if grep -q "autoShutdown\|deallocate" infra/*.bicep; then
        echo "✓ Auto-shutdown configuration found"
    else
        echo "ℹ Consider adding auto-shutdown for cost savings"
    fi
    
    # Επικύρωση ρυθμίσεων βάσης δεδομένων ανάπτυξης
    if grep -q "Basic\|S0\|S1" infra/*.bicep; then
        echo "✓ Development database tiers configured"
    else
        echo "⚠ Consider using Basic/Standard tiers for development databases"
    fi
}
```

### Επικύρωση Περιβάλλοντος Παραγωγής

```bash
#!/bin/bash
# Ειδικοί έλεγχοι για το περιβάλλον παραγωγής

validate_prod_environment() {
    echo "=== Production Environment Validation ==="
    
    # Έλεγχος για ρυθμίσεις υψηλής διαθεσιμότητας
    if grep -q "zoneRedundant.*true\|Premium\|Standard_GRS" infra/*.bicep; then
        echo "✓ High availability configurations detected"
    else
        echo "⚠ Consider enabling high availability for production"
    fi
    
    # Έλεγχος για ρυθμίσεις αντιγράφων ασφαλείας
    if grep -q "backup\|retention\|pointInTimeRestore" infra/*.bicep; then
        echo "✓ Backup configurations found"
    else
        echo "⚠ Ensure backup strategies are implemented"
    fi
    
    # Επαλήθευση ρύθμισης παρακολούθησης
    if grep -q "Microsoft.Insights\|Application_Type.*web" infra/*.bicep; then
        echo "✓ Monitoring and observability configured"
    else
        echo "⚠ Add comprehensive monitoring for production"
    fi
    
    # Έλεγχος για ρυθμίσεις ασφαλείας
    if grep -q "Microsoft.KeyVault\|managedIdentity\|httpsOnly.*true" infra/*.bicep; then
        echo "✓ Security best practices implemented"
    else
        echo "⚠ Review security configurations for production"
    fi
}
```

---

## Επικύρωση Πόρων

### Σενάριο Επικύρωσης Ποσοστώσεων

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
    
    # Λήψη λογαριασμών αποθήκευσης στη συνδρομή
    accounts = run_command(['az', 'storage', 'account', 'list'])
    
    if accounts is None:
        print("❌ Could not retrieve storage account information")
        return False
    
    account_count = len(accounts)
    max_accounts = 250  # Προεπιλεγμένο όριο του Azure
    
    usage_percent = (account_count / max_accounts) * 100
    status = "✅" if usage_percent < 80 else "⚠️" if usage_percent < 95 else "❌"
    
    print(f"{status} Storage Accounts: {account_count}/{max_accounts} ({usage_percent:.1f}%)")
    
    return usage_percent < 95

def check_network_limits(location: str) -> bool:
    """Check network-related limits"""
    print(f"\n=== Network Limits Check ({location}) ===")
    
    # Έλεγχος εικονικών δικτύων
    vnets = run_command(['az', 'network', 'vnet', 'list'])
    if vnets is not None:
        vnet_count = len(vnets)
        print(f"✅ Virtual Networks: {vnet_count}/1000")
    
    # Έλεγχος δημόσιων διευθύνσεων IP
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
    
    # Εκτέλεση ελέγχων
    all_passed &= check_compute_quotas(location)
    all_passed &= check_storage_limits(location)
    all_passed &= check_network_limits(location)
    
    # Περίληψη
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

## Έλεγχοι Ασφάλειας & Συμμόρφωσης

### Σενάριο Επικύρωσης Ασφάλειας

```bash
#!/bin/bash
# Επαλήθευση ασφάλειας και συμμόρφωσης για αναπτύξεις AZD

check_security_practices() {
    echo "=== Security Best Practices Check ==="
    
    local issues_found=0
    
    # Έλεγχος για χρήση του Key Vault
    if grep -r "Microsoft.KeyVault" infra/ >/dev/null 2>&1; then
        echo "✅ Key Vault detected in infrastructure"
    else
        echo "⚠️  Key Vault not found - consider using for secrets management"
        ((issues_found++))
    fi
    
    # Έλεγχος για χρήση διαχειριζόμενης ταυτότητας
    if grep -r "managedIdentity\|SystemAssigned\|UserAssigned" infra/ >/dev/null 2>&1; then
        echo "✅ Managed Identity configuration detected"
    else
        echo "⚠️  Managed Identity not found - consider using for service authentication"
        ((issues_found++))
    fi
    
    # Έλεγχος για επιβολή HTTPS
    if grep -r "httpsOnly.*true\|requireHttps.*true" infra/ >/dev/null 2>&1; then
        echo "✅ HTTPS enforcement detected"
    else
        echo "⚠️  HTTPS enforcement not found - ensure secure connections"
        ((issues_found++))
    fi
    
    # Έλεγχος για ελάχιστη έκδοση TLS
    if grep -r "minimumTlsVersion.*'TLS1_2'" infra/ >/dev/null 2>&1; then
        echo "✅ Minimum TLS 1.2 configuration detected"
    else
        echo "⚠️  Minimum TLS version not specified - consider requiring TLS 1.2+"
        ((issues_found++))
    fi
    
    # Έλεγχος για περιορισμούς δημόσιας πρόσβασης
    if grep -r "allowBlobPublicAccess.*false\|publicNetworkAccess.*Disabled" infra/ >/dev/null 2>&1; then
        echo "✅ Public access restrictions detected"
    else
        echo "⚠️  Public access restrictions not found - consider limiting public access"
        ((issues_found++))
    fi
    
    # Έλεγχος για ομάδες ασφάλειας δικτύου
    if grep -r "Microsoft.Network/networkSecurityGroups" infra/ >/dev/null 2>&1; then
        echo "✅ Network Security Groups detected"
    else
        echo "ℹ️  Network Security Groups not found - may be acceptable depending on architecture"
    fi
    
    return $issues_found
}

check_compliance_requirements() {
    echo -e "\n=== Compliance Requirements Check ==="
    
    # Έλεγχος για κρυπτογράφηση δεδομένων
    if grep -r "encryption\|encryptionAtRest\|transparentDataEncryption" infra/ >/dev/null 2>&1; then
        echo "✅ Encryption configurations detected"
    else
        echo "⚠️  Encryption configurations not found - ensure data is encrypted"
    fi
    
    # Έλεγχος για καταγραφή ελέγχου
    if grep -r "Microsoft.Insights.*auditingSettings\|diagnosticSettings" infra/ >/dev/null 2>&1; then
        echo "✅ Audit logging configurations detected"
    else
        echo "⚠️  Audit logging not found - consider enabling for compliance"
    fi
    
    # Έλεγχος για πολιτικές αντιγράφων ασφαλείας και διατήρησης
    if grep -r "backup.*Policy\|retentionPolicy\|retention.*Days" infra/ >/dev/null 2>&1; then
        echo "✅ Backup and retention policies detected"
    else
        echo "⚠️  Backup/retention policies not found - required for data governance"
    fi
}

# Κύρια εκτέλεση
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

## Ενσωμάτωση με CI/CD

### Ενσωμάτωση GitHub Actions

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

### Ενσωμάτωση Azure DevOps

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

## Περίληψη Βέλτιστων Πρακτικών

### ✅ Βέλτιστες Πρακτικές Προ-ελέγχων

1. **Αυτοματοποιήστε όπου είναι δυνατόν**
   - Ενσωματώστε τους ελέγχους σε pipelines CI/CD
   - Χρησιμοποιήστε scripts για επαναλαμβανόμενους ελέγχους
   - Αποθηκεύστε τα αποτελέσματα για αρχεία ελέγχου (audit trails)

2. **Επικύρωση ειδική για το περιβάλλον**
   - Διάφοροι έλεγχοι για dev/staging/prod
   - Κατάλληλες απαιτήσεις ασφάλειας ανά περιβάλλον
   - Βελτιστοποίηση κόστους για μη-παραγωγικά περιβάλλοντα

3. **Πλήρης Κάλυψη**
   - Έλεγχος ταυτότητας και δικαιωμάτων
   - Ποσοστώσεις πόρων και διαθεσιμότητα
   - Επικύρωση προτύπων και σύνταξη
   - Απαιτήσεις ασφάλειας και συμμόρφωσης

4. **Σαφής Αναφορά**
   - Δείκτες κατάστασης με χρωματική κωδικοποίηση
   - Λεπτομερή μηνύματα σφάλματος με βήματα αποκατάστασης
   - Συνοπτικές αναφορές για γρήγορη αξιολόγηση

5. **Αποτυχία γρήγορα**
   - Διακόψτε την ανάπτυξη εάν αποτύχουν κρίσιμοι έλεγχοι
   - Παρέχετε σαφείς οδηγίες για επίλυση
   - Επιτρέψτε εύκολη επανεκτέλεση των ελέγχων

### Συνήθη Σφάλματα Προ-ελέγχων

1. **Παράβλεψη επικύρωσης** για "γρήγορες" αναπτύξεις
2. **Ανεπαρκείς έλεγχοι δικαιωμάτων** πριν την ανάπτυξη
3. **Αγνόηση ορίων ποσοστώσεων** μέχρι να αποτύχει η ανάπτυξη
4. **Μη επικύρωση προτύπων** στα pipelines CI/CD
5. **Έλλειψη ελέγχου ασφάλειας** για παραγωγικά περιβάλλοντα
6. **Ανεπαρκής εκτίμηση κόστους** που οδηγεί σε απρόβλεπτες υπερβάσεις προϋπολογισμού

---

**Συμβουλή**: Εκτελέστε τους προελέγχους ως ξεχωριστή εργασία στο CI/CD pipeline πριν την πραγματική εργασία ανάπτυξης. Αυτό σας επιτρέπει να εντοπίζετε προβλήματα νωρίς και να παρέχετε ταχύτερη ανατροφοδότηση στους προγραμματιστές.

---

**Πλοήγηση**
- **Προηγούμενο Μάθημα**: [Επιλογή SKU](sku-selection.md)
- **Επόμενο Μάθημα**: [Σύντομος Οδηγός](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθύνης**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Παρότι προσπαθούμε για ακρίβεια, παρακαλούμε να λάβετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στην αρχική του γλώσσα πρέπει να θεωρείται η επίσημη πηγή. Για κρίσιμες πληροφορίες συνιστάται επαγγελματική μετάφραση από ανθρώπινο μεταφραστή. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
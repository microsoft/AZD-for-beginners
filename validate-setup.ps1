$errors = 0
$warnings = 0

Write-Host "AZD beginner setup validation" -ForegroundColor Cyan
Write-Host ""

function Show-Success($message) {
    Write-Host "[OK] $message" -ForegroundColor Green
}

function Show-Warning($message) {
    Write-Host "[WARN] $message" -ForegroundColor Yellow
}

function Show-Error($message) {
    Write-Host "[ERROR] $message" -ForegroundColor Red
}

if (Get-Command azd -ErrorAction SilentlyContinue) {
    $azdVersion = azd version 2>$null
    Show-Success "Azure Developer CLI installed: $azdVersion"
} else {
    Show-Error "Azure Developer CLI not found. Install with: winget install microsoft.azd"
    $errors++
}

if (Get-Command git -ErrorAction SilentlyContinue) {
    $gitVersion = git --version 2>$null
    Show-Success "Git installed: $gitVersion"
} else {
    Show-Error "Git not found. Install from https://git-scm.com/downloads"
    $errors++
}

if (Get-Command az -ErrorAction SilentlyContinue) {
    try {
        $accountName = az account show --query name -o tsv 2>$null
        if ($LASTEXITCODE -eq 0 -and $accountName) {
            Show-Success "Azure CLI installed and authenticated: $accountName"
        } else {
            Show-Warning "Azure CLI installed, but not signed in. Run: az login only if you plan to use az commands in this course."
            $warnings++
        }
    } catch {
        Show-Warning "Azure CLI installed, but not signed in. Run: az login only if you plan to use az commands in this course."
        $warnings++
    }
} else {
    Show-Warning "Azure CLI not found. Install it only if you plan to run az commands in the course."
    $warnings++
}

if (Get-Command node -ErrorAction SilentlyContinue) {
    $nodeVersion = node --version 2>$null
    Show-Success "Node.js installed: $nodeVersion"
} else {
    Show-Warning "Node.js not found. The Chapter 1 todo template requires Node.js."
    $warnings++
}

Write-Host ""
Write-Host "Summary" -ForegroundColor Cyan

if ($errors -eq 0 -and $warnings -eq 0) {
    Write-Host "Your machine is ready for the beginner path." -ForegroundColor Green
} elseif ($errors -eq 0) {
    Write-Host "Required tools are present for the AZD beginner path. Review warnings before starting template-specific or Azure CLI-based exercises." -ForegroundColor Yellow
} else {
    Write-Host "Install the missing required tools above before starting Chapter 1. Warnings are optional for the AZD-only beginner path." -ForegroundColor Red
}

exit $errors
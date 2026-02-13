# Installation & Setup Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md)
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Diese umfassende Anleitung führt Sie durch die Installation und Konfiguration der Azure Developer CLI (azd) auf Ihrem System. Sie lernen mehrere Installationsmethoden für verschiedene Betriebssysteme, die Einrichtung der Authentifizierung und die anfängliche Konfiguration, um Ihre Entwicklungsumgebung für Azure-Bereitstellungen vorzubereiten.

## Learning Goals

Am Ende dieser Lektion werden Sie:
- Die Azure Developer CLI erfolgreich auf Ihrem Betriebssystem installiert haben
- Die Authentifizierung mit Azure auf mehrere Arten konfigurieren können
- Ihre Entwicklungsumgebung mit den notwendigen Voraussetzungen eingerichtet haben
- Verschiedene Installationsoptionen verstehen und wissen, wann welche zu verwenden ist
- Häufige Installations- und Einrichtungsprobleme beheben können

## Learning Outcomes

Nach Abschluss dieser Lektion werden Sie in der Lage sein:
- azd mit der für Ihre Plattform geeigneten Methode zu installieren
- Sich mit azd auth login bei Azure zu authentifizieren
- Ihre Installation zu überprüfen und grundlegende azd-Befehle zu testen
- Ihre Entwicklungsumgebung für eine optimale Nutzung von azd zu konfigurieren
- Häufige Installationsprobleme eigenständig zu lösen

Diese Anleitung hilft Ihnen, die Azure Developer CLI auf Ihrem System zu installieren und zu konfigurieren, unabhängig von Ihrem Betriebssystem oder Ihrer Entwicklungsumgebung.

## Prerequisites

Bevor Sie azd installieren, stellen Sie sicher, dass Sie:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - Für Authentifizierung und Ressourcenverwaltung
- **Git** - Zum Klonen von Vorlagen und für Versionskontrolle
- **Docker** (optional) - Für containerisierte Anwendungen

## Installation Methods

### Windows

#### Option 1: PowerShell (Recommended)
```powershell
# Als Administrator oder mit erhöhten Rechten ausführen
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Option 3: Chocolatey
```cmd
choco install azd
```

#### Option 4: Manual Installation
1. Download the latest release from [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extract to `C:\Program Files\azd\`
3. Add to PATH environment variable

### macOS

#### Option 1: Homebrew (Recommended)
```bash
brew tap azure/azd
brew install azd
```

#### Option 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 3: Manual Installation
```bash
# Herunterladen und installieren
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Install Script (Recommended)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

**Ubuntu/Debian:**
```bash
# Microsoft-Paket-Repository hinzufügen
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd installieren
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Microsoft-Paket-Repository hinzufügen
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd comes pre-installed in GitHub Codespaces. Simply create a codespace and start using azd immediately.

### Docker

```bash
# azd in einem Container ausführen
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Erstelle ein Alias für eine einfachere Nutzung
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verify Installation

Nach der Installation überprüfen Sie, ob azd korrekt funktioniert:

```bash
# Version prüfen
azd version

# Hilfe anzeigen
azd --help

# Verfügbare Vorlagen auflisten
azd template list
```

Erwartete Ausgabe:
```
azd version 1.x.x (commit xxxxxx)
```

**Hinweis**: Die tatsächliche Versionsnummer kann variieren. Prüfen Sie die [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) für die neueste Version.

**✅ Installation Success Checklist:**
- [ ] `azd version` shows version number without errors
- [ ] `azd --help` displays command documentation
- [ ] `azd template list` shows available templates
- [ ] `az account show` displays your Azure subscription
- [ ] You can create a test directory and run `azd init` successfully

**If all checks pass, you're ready to proceed to [Your First Project](first-project.md)!**

## Authentication Setup

### Azure CLI Authentication (Recommended)
```bash
# Installieren Sie die Azure CLI, falls sie noch nicht installiert ist
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Melden Sie sich bei Azure an
az login

# Überprüfen Sie die Authentifizierung
az account show
```

### Device Code Authentication
If you're on a headless system or having browser issues:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
For automated environments:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Configuration

### Global Configuration
```bash
# Standardabonnement festlegen
azd config set defaults.subscription <subscription-id>

# Standardstandort festlegen
azd config set defaults.location eastus2

# Alle Konfigurationen anzeigen
azd config list
```

### Environment Variables
Add to your shell profile (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure-Konfiguration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd-Konfiguration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Debug-Protokollierung aktivieren
```

## IDE Integration

### Visual Studio Code
Install the Azure Developer CLI extension:
1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X)
3. Search for "Azure Developer CLI"
4. Install the extension

Features:
- IntelliSense for azure.yaml
- Integrated terminal commands
- Template browsing
- Deployment monitoring

### GitHub Codespaces
Create a `.devcontainer/devcontainer.json`:
```json
{
  "name": "Azure Developer CLI",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/azure/azure-dev/azd:latest": {}
  },
  "postCreateCommand": "azd version"
}
```

### IntelliJ/JetBrains
1. Install the Azure plugin
2. Configure Azure credentials
3. Use integrated terminal for azd commands

## 🐛 Troubleshooting Installation

### Common Issues

#### Permission Denied (Windows)
```powershell
# Führen Sie PowerShell als Administrator aus
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH Issues
Manually add azd to your PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Network/Proxy Issues
```bash
# Proxy konfigurieren
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL-Überprüfung überspringen (für Produktionsumgebungen nicht empfohlen)
azd config set http.insecure true
```

#### Version Conflicts
```bash
# Alte Installationen entfernen
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Konfiguration bereinigen
rm -rf ~/.azd
```

### Getting More Help
```bash
# Debug-Logging aktivieren
export AZD_DEBUG=true
azd <command> --debug

# Aktuelle Konfiguration anzeigen
azd config list

# Aktuellen Bereitstellungsstatus anzeigen
azd show
```

## Updating azd

### Automatic Updates
azd will notify you when updates are available:
```bash
azd version --check-for-updates
```

### Manual Updates

**Windows (winget):**
```cmd
winget upgrade Microsoft.Azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 Frequently Asked Questions

<details>
<summary><strong>Was ist der Unterschied zwischen azd und der Azure CLI (az)?</strong></summary>

**Azure CLI (az)**: Low-Level-Tool zur Verwaltung einzelner Azure-Ressourcen
- `az webapp create`, `az storage account create`
- Jeweils eine Ressource
- Fokus auf Infrastrukturverwaltung

**Azure Developer CLI (azd)**: High-Level-Tool für komplette Anwendungsbereitstellungen
- `azd up` deployt die gesamte App mit allen Ressourcen
- Vorlagenbasierte Workflows
- Fokus auf Entwicklerproduktivität

**Sie benötigen beide**: azd verwendet die Azure CLI (az) zur Authentifizierung
</details>

<details>
<summary><strong>Kann ich azd mit vorhandenen Azure-Ressourcen verwenden?</strong></summary>

Ja! Sie können:
1. Vorhandene Ressourcen in azd-Umgebungen importieren
2. Vorhandene Ressourcen in Ihren Bicep-Vorlagen referenzieren
3. azd für neue Bereitstellungen zusammen mit bestehender Infrastruktur verwenden

Siehe [Configuration Guide](configuration.md) für Details.
</details>

<details>
<summary><strong>Funktioniert azd mit Azure Government oder Azure China?</strong></summary>

Ja, konfigurieren Sie die Cloud:
```bash
# Azure für Regierungsbehörden
az cloud set --name AzureUSGovernment
az login

# Azure China
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Kann ich azd in CI/CD-Pipelines verwenden?</strong></summary>

Absolut! azd ist für die Automatisierung ausgelegt:
- GitHub Actions-Integration
- Azure DevOps-Unterstützung
- Service Principal-Authentifizierung
- Nicht-interaktiver Modus

Siehe [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) für CI/CD-Muster.
</details>

<details>
<summary><strong>Was kostet die Nutzung von azd?</strong></summary>

azd selbst ist **vollständig kostenlos** und Open Source. Sie zahlen nur für:
- Azure-Ressourcen, die Sie bereitstellen
- Azure-Verbrauchskosten (Compute, Storage, etc.)

Verwenden Sie `azd provision --preview`, um Kosten vor der Bereitstellung abzuschätzen.
</details>

## Next Steps

1. **Complete authentication**: Ensure you can access your Azure subscription
2. **Try your first deployment**: Follow the [First Project Guide](first-project.md)
3. **Explore templates**: Browse available templates with `azd template list`
4. **Configure your IDE**: Set up your development environment

## Support

If you encounter issues:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md) 
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installation Complete!** Continue to [Your First Project](first-project.md) to start building with azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache ist als maßgebliche Quelle zu betrachten. Für kritische Informationen wird eine professionelle, menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Installation & Setup Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD für Einsteiger](../../README.md)
- **📖 Current Chapter**: Kapitel 1 - Grundlagen & Schnellstart
- **⬅️ Previous**: [AZD Basics](azd-basics.md)
- **➡️ Next**: [Ihr erstes Projekt](first-project.md)
- **🚀 Next Chapter**: [Kapitel 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Dieser umfassende Leitfaden führt Sie durch die Installation und Konfiguration der Azure Developer CLI (azd) auf Ihrem System. Sie lernen mehrere Installationsmethoden für verschiedene Betriebssysteme, die Einrichtung der Authentifizierung und die anfängliche Konfiguration, um Ihre Entwicklungsumgebung für Azure-Bereitstellungen vorzubereiten.

## Learning Goals

Am Ende dieser Lektion werden Sie:
- Azure Developer CLI erfolgreich auf Ihrem Betriebssystem installiert haben
- Die Authentifizierung mit Azure mit mehreren Methoden konfiguriert haben
- Ihre Entwicklungsumgebung mit den erforderlichen Voraussetzungen eingerichtet haben
- Die verschiedenen Installationsoptionen und deren Einsatzmöglichkeiten verstehen
- Häufige Installations- und Einrichtungsprobleme beheben können

## Learning Outcomes

Nach Abschluss dieser Lektion werden Sie in der Lage sein:
- azd mit der für Ihre Plattform geeigneten Methode zu installieren
- Sich mit azd auth login bei Azure zu authentifizieren
- Ihre Installation zu überprüfen und grundlegende azd-Befehle zu testen
- Ihre Entwicklungsumgebung für optimale azd-Nutzung zu konfigurieren
- Häufige Installationsprobleme eigenständig zu lösen

Dieser Leitfaden hilft Ihnen, die Azure Developer CLI auf Ihrem System zu installieren und zu konfigurieren, unabhängig von Ihrem Betriebssystem oder Ihrer Entwicklungsumgebung.

## Prerequisites

Bevor Sie azd installieren, stellen Sie sicher, dass Sie Folgendes haben:
- **Azure subscription** - [Kostenloses Konto erstellen](https://azure.microsoft.com/free/)
- **Azure CLI** - Für Authentifizierung und Ressourcenverwaltung
- **Git** - Zum Klonen von Vorlagen und zur Versionskontrolle
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
1. Laden Sie die neueste Veröffentlichung von [GitHub](https://github.com/Azure/azure-dev/releases) herunter
2. Entpacken nach `C:\Program Files\azd\`
3. Zur PATH-Umgebungsvariable hinzufügen

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

azd ist in GitHub Codespaces vorinstalliert. Erstellen Sie einfach einen Codespace und beginnen Sie sofort mit azd.

### Docker

```bash
# Führe azd in einem Container aus
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Erstelle ein Alias zur einfacheren Nutzung
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

**Note**: Die tatsächliche Versionsnummer kann variieren. Prüfen Sie [Azure Developer CLI-Veröffentlichungen](https://github.com/Azure/azure-dev/releases) für die neueste Version.

**✅ Checkliste für erfolgreiche Installation:**
- [ ] `azd version` zeigt die Versionsnummer ohne Fehler an
- [ ] `azd --help` zeigt die Befehlsdokumentation an
- [ ] `azd template list` zeigt verfügbare Vorlagen an
- [ ] `az account show` zeigt Ihr Azure-Abonnement an
- [ ] Sie können ein Testverzeichnis erstellen und `azd init` erfolgreich ausführen

**Wenn alle Prüfungen bestanden sind, sind Sie bereit, zu [Ihr erstes Projekt](first-project.md) weiterzugehen!**

## Authentication Setup

### Azure CLI Authentication (Recommended)
```bash
# Azure CLI installieren, falls noch nicht installiert
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Bei Azure anmelden
az login

# Authentifizierung überprüfen
az account show
```

### Device Code Authentication
Wenn Sie ein headless System verwenden oder Probleme mit dem Browser haben:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Für automatisierte Umgebungen:
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

# Gesamte Konfiguration anzeigen
azd config list
```

### Environment Variables
Fügen Sie Ihrem Shell-Profil (`.bashrc`, `.zshrc`, `.profile`) hinzu:
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
Installieren Sie die Azure Developer CLI-Erweiterung:
1. Öffnen Sie VS Code
2. Gehen Sie zu Erweiterungen (Strg+Shift+X)
3. Suchen Sie nach "Azure Developer CLI"
4. Installieren Sie die Erweiterung

Funktionen:
- IntelliSense für azure.yaml
- Integrierte Terminalbefehle
- Vorlagen durchsuchen
- Bereitstellungsüberwachung

### GitHub Codespaces
Erstellen Sie eine `.devcontainer/devcontainer.json`:
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
1. Installieren Sie das Azure-Plugin
2. Konfigurieren Sie Azure-Zugangsdaten
3. Verwenden Sie das integrierte Terminal für azd-Befehle

## 🐛 Troubleshooting Installation

### Common Issues

#### Permission Denied (Windows)
```powershell
# PowerShell als Administrator ausführen
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH Issues
Fügen Sie azd manuell zu Ihrem PATH hinzu:

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
# Debug-Protokollierung aktivieren
export AZD_DEBUG=true
azd <command> --debug

# Aktuelle Konfiguration anzeigen
azd config list

# Aktuellen Bereitstellungsstatus anzeigen
azd show
```

## Updating azd

### Automatic Updates
azd benachrichtigt Sie, wenn Updates verfügbar sind:
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
<summary><strong>Was ist der Unterschied zwischen azd und az CLI?</strong></summary>

**Azure CLI (az)**: Low-Level-Tool zur Verwaltung einzelner Azure-Ressourcen
- `az webapp create`, `az storage account create`
- Eine Ressource nach der anderen
- Fokus auf Infrastrukturverwaltung

**Azure Developer CLI (azd)**: High-Level-Tool für vollständige Anwendungsbereitstellungen
- `azd up` setzt die gesamte Anwendung mit allen Ressourcen bereit
- Vorlagenbasierte Workflows
- Fokus auf Entwicklerproduktivität

**Sie benötigen beides**: azd verwendet az CLI für die Authentifizierung
</details>

<details>
<summary><strong>Kann ich azd mit vorhandenen Azure-Ressourcen verwenden?</strong></summary>

Ja! Sie können:
1. Vorhandene Ressourcen in azd-Umgebungen importieren
2. Vorhandene Ressourcen in Ihren Bicep-Vorlagen referenzieren
3. azd für neue Bereitstellungen neben vorhandener Infrastruktur verwenden

Siehe [Konfigurationsanleitung](configuration.md) für Details.
</details>

<details>
<summary><strong>Funktioniert azd mit Azure Government oder Azure China?</strong></summary>

Ja, konfigurieren Sie die Cloud:
```bash
# Azure Regierung
az cloud set --name AzureUSGovernment
az login

# Azure China
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Kann ich azd in CI/CD-Pipelines verwenden?</strong></summary>

Absolut! azd ist für die Automatisierung konzipiert:
- GitHub Actions-Integration
- Azure DevOps-Unterstützung
- Service Principal-Authentifizierung
- Nicht-interaktiver Modus

Siehe [Bereitstellungsanleitung](../chapter-04-infrastructure/deployment-guide.md) für CI/CD-Muster.
</details>

<details>
<summary><strong>Was kostet die Nutzung von azd?</strong></summary>

azd selbst ist **vollkommen kostenlos** und Open Source. Sie zahlen nur für:
- Azure-Ressourcen, die Sie bereitstellen
- Azure-Verbrauchskosten (Compute, Storage, etc.)

Verwenden Sie `azd provision --preview`, um die Kosten vor der Bereitstellung zu schätzen.
</details>

## Next Steps

1. **Vervollständigen Sie die Authentifizierung**: Stellen Sie sicher, dass Sie auf Ihr Azure-Abonnement zugreifen können
2. **Versuchen Sie Ihre erste Bereitstellung**: Folgen Sie dem [Leitfaden zum ersten Projekt](first-project.md)
3. **Durchsuchen Sie Vorlagen**: Durchsuchen Sie verfügbare Vorlagen mit `azd template list`
4. **Konfigurieren Sie Ihre IDE**: Richten Sie Ihre Entwicklungsumgebung ein

## Support

Wenn Sie auf Probleme stoßen:
- [Offizielle Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Probleme melden](https://github.com/Azure/azure-dev/issues)
- [Community-Diskussionen](https://github.com/Azure/azure-dev/discussions)
- [Azure-Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Holen Sie sich Azure-Befehlsanleitungen direkt in Ihren Editor mit `npx skills add microsoft/github-copilot-for-azure`

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD für Einsteiger](../../README.md)
- **📖 Current Chapter**: Kapitel 1 - Grundlagen & Schnellstart
- **⬅️ Previous**: [AZD Basics](azd-basics.md) 
- **➡️ Next**: [Ihr erstes Projekt](first-project.md)
- **🚀 Next Chapter**: [Kapitel 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installation abgeschlossen!** Fahren Sie mit [Ihr erstes Projekt](first-project.md) fort, um mit azd zu beginnen.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mithilfe des KI-Übersetzungsdienstes [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir um Genauigkeit bemüht sind, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in der Ausgangssprache gilt als maßgebliche Quelle. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
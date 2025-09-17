<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "90202d23bcaf40c8fd99b6a444ddce4a",
  "translation_date": "2025-09-12T17:08:03+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "de"
}
-->
# Installations- und Einrichtungsanleitung

**Vorher:** [Hauptdokumentation](../../README.md) | **Nächster Schritt:** [AZD Grundlagen](azd-basics.md)

## Einführung

Diese umfassende Anleitung führt Sie durch die Installation und Konfiguration des Azure Developer CLI (azd) auf Ihrem System. Sie lernen verschiedene Installationsmethoden für unterschiedliche Betriebssysteme, die Einrichtung der Authentifizierung und die erste Konfiguration, um Ihre Entwicklungsumgebung für Azure-Bereitstellungen vorzubereiten.

## Lernziele

Am Ende dieser Lektion werden Sie:
- Azure Developer CLI erfolgreich auf Ihrem Betriebssystem installieren
- Die Authentifizierung mit Azure auf verschiedene Arten konfigurieren
- Ihre Entwicklungsumgebung mit den notwendigen Voraussetzungen einrichten
- Verschiedene Installationsoptionen verstehen und wissen, wann Sie welche verwenden sollten
- Häufige Installations- und Einrichtungsprobleme beheben können

## Lernergebnisse

Nach Abschluss dieser Lektion werden Sie in der Lage sein:
- azd mit der passenden Methode für Ihre Plattform zu installieren
- Sich mit Azure über `azd auth login` zu authentifizieren
- Ihre Installation zu überprüfen und grundlegende azd-Befehle zu testen
- Ihre Entwicklungsumgebung für eine optimale Nutzung von azd zu konfigurieren
- Häufige Installationsprobleme eigenständig zu lösen

Diese Anleitung hilft Ihnen, Azure Developer CLI auf Ihrem System zu installieren und zu konfigurieren, unabhängig von Ihrem Betriebssystem oder Ihrer Entwicklungsumgebung.

## Voraussetzungen

Bevor Sie azd installieren, stellen Sie sicher, dass Sie Folgendes haben:
- **Azure-Abonnement** - [Erstellen Sie ein kostenloses Konto](https://azure.microsoft.com/free/)
- **Azure CLI** - Für Authentifizierung und Ressourcenmanagement
- **Git** - Zum Klonen von Vorlagen und für Versionskontrolle
- **Docker** (optional) - Für containerisierte Anwendungen

## Installationsmethoden

### Windows

#### Option 1: PowerShell (Empfohlen)
```powershell
# Run as Administrator or with elevated privileges
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

#### Option 4: Manuelle Installation
1. Laden Sie die neueste Version von [GitHub](https://github.com/Azure/azure-dev/releases) herunter
2. Entpacken Sie die Dateien nach `C:\Program Files\azd\`
3. Fügen Sie den Pfad zur PATH-Umgebungsvariable hinzu

### macOS

#### Option 1: Homebrew (Empfohlen)
```bash
brew tap azure/azd
brew install azd
```

#### Option 2: Installationsskript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 3: Manuelle Installation
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Installationsskript (Empfohlen)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Paketmanager

**Ubuntu/Debian:**
```bash
# Add Microsoft package repository
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Add Microsoft package repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd ist in GitHub Codespaces vorinstalliert. Erstellen Sie einfach einen Codespace und beginnen Sie sofort mit der Nutzung von azd.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Installation überprüfen

Nach der Installation überprüfen Sie, ob azd korrekt funktioniert:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Erwartete Ausgabe:
```
azd version 1.5.0 (commit abc123)
```

## Authentifizierungseinrichtung

### Azure CLI-Authentifizierung (Empfohlen)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login to Azure
az login

# Verify authentication
az account show
```

### Gerätecode-Authentifizierung
Falls Sie ein System ohne grafische Oberfläche verwenden oder Browserprobleme haben:
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

## Konfiguration

### Globale Konfiguration
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Umgebungsvariablen
Fügen Sie diese Ihrer Shell-Profildatei hinzu (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## IDE-Integration

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
2. Konfigurieren Sie die Azure-Anmeldedaten
3. Verwenden Sie das integrierte Terminal für azd-Befehle

## 🐛 Fehlerbehebung bei der Installation

### Häufige Probleme

#### Zugriff verweigert (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH-Probleme
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

#### Netzwerk-/Proxyprobleme
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Versionskonflikte
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Weitere Hilfe erhalten
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## azd aktualisieren

### Automatische Updates
azd benachrichtigt Sie, wenn Updates verfügbar sind:
```bash
azd version --check-for-updates
```

### Manuelle Updates

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

## Nächste Schritte

1. **Authentifizierung abschließen**: Stellen Sie sicher, dass Sie Zugriff auf Ihr Azure-Abonnement haben
2. **Erste Bereitstellung ausprobieren**: Folgen Sie der [Ersten Projektanleitung](first-project.md)
3. **Vorlagen erkunden**: Durchsuchen Sie verfügbare Vorlagen mit `azd template list`
4. **Ihre IDE konfigurieren**: Richten Sie Ihre Entwicklungsumgebung ein

## Support

Falls Sie auf Probleme stoßen:
- [Offizielle Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Probleme melden](https://github.com/Azure/azure-dev/issues)
- [Community-Diskussionen](https://github.com/Azure/azure-dev/discussions)
- [Azure-Support](https://azure.microsoft.com/support/)

---

**Vorher:** [Hauptdokumentation](../../README.md) | **Nächster Schritt:** [AZD Grundlagen](azd-basics.md)

**Installation abgeschlossen!** Fahren Sie mit [Ihr erstes Projekt](first-project.md) fort, um mit azd zu starten.

---

**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.
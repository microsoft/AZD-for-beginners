# Installations- und Einrichtungsanleitung

**Kapitelübersicht:**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 1 - Grundlagen & Schnellstart
- **⬅️ Vorheriges**: [AZD Grundlagen](azd-basics.md)
- **➡️ Nächstes**: [Ihr erstes Projekt](first-project.md)
- **🚀 Nächstes Kapitel**: [Kapitel 2: AI-First Entwicklung](../microsoft-foundry/microsoft-foundry-integration.md)

## Einführung

Dieser umfassende Leitfaden führt Sie durch die Installation und Konfiguration der Azure Developer CLI (azd) auf Ihrem System. Sie lernen verschiedene Installationsmethoden für unterschiedliche Betriebssysteme, die Einrichtung der Authentifizierung und die Erstkonfiguration, um Ihre Entwicklungsumgebung für Azure-Bereitstellungen vorzubereiten.

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

Dieser Leitfaden hilft Ihnen, die Azure Developer CLI auf Ihrem System zu installieren und zu konfigurieren, unabhängig von Ihrem Betriebssystem oder Ihrer Entwicklungsumgebung.

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

#### Option 4: Manuelle Installation
1. Laden Sie die neueste Version von [GitHub](https://github.com/Azure/azure-dev/releases) herunter
2. Entpacken Sie die Dateien nach `C:\Program Files\azd\`
3. Fügen Sie den Pfad zur Umgebungsvariablen PATH hinzu

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
# Herunterladen und installieren
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

azd ist in GitHub Codespaces vorinstalliert. Erstellen Sie einfach einen Codespace und beginnen Sie sofort mit der Nutzung von azd.

### Docker

```bash
# Führen Sie azd in einem Container aus
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Erstellen Sie ein Alias für eine einfachere Nutzung
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Installation überprüfen

Nach der Installation überprüfen Sie, ob azd korrekt funktioniert:

```bash
# Version überprüfen
azd version

# Hilfe anzeigen
azd --help

# Verfügbare Vorlagen auflisten
azd template list
```

Erwartete Ausgabe:
```
azd version 1.5.0 (commit abc123)
```

**✅ Checkliste für erfolgreiche Installation:**
- [ ] `azd version` zeigt die Versionsnummer ohne Fehler an
- [ ] `azd --help` zeigt die Befehlsdokumentation an
- [ ] `azd template list` zeigt verfügbare Vorlagen an
- [ ] `az account show` zeigt Ihr Azure-Abonnement an
- [ ] Sie können ein Testverzeichnis erstellen und `azd init` erfolgreich ausführen

**Wenn alle Überprüfungen bestanden sind, können Sie mit [Ihr erstes Projekt](first-project.md) fortfahren!**

## Authentifizierungseinrichtung

### Azure CLI Authentifizierung (Empfohlen)
```bash
# Installieren Sie Azure CLI, falls noch nicht installiert
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Melden Sie sich bei Azure an
az login

# Authentifizierung überprüfen
az account show
```

### Gerätecode-Authentifizierung
Falls Sie ein System ohne Benutzeroberfläche verwenden oder Browserprobleme haben:
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
# Standardabonnement festlegen
azd config set defaults.subscription <subscription-id>

# Standardstandort festlegen
azd config set defaults.location eastus2

# Alle Konfigurationen anzeigen
azd config list
```

### Umgebungsvariablen
Fügen Sie diese Ihrer Shell-Profildatei hinzu (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure-Konfiguration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd-Konfiguration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Debug-Logging aktivieren
```

## IDE-Integration

### Visual Studio Code
Installieren Sie die Azure Developer CLI-Erweiterung:
1. Öffnen Sie VS Code
2. Gehen Sie zu Erweiterungen (Ctrl+Shift+X)
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
2. Konfigurieren Sie Azure-Anmeldedaten
3. Verwenden Sie das integrierte Terminal für azd-Befehle

## 🐛 Fehlerbehebung bei der Installation

### Häufige Probleme

#### Zugriff verweigert (Windows)
```powershell
# Führen Sie PowerShell als Administrator aus
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

#### Netzwerk-/Proxy-Probleme
```bash
# Proxy konfigurieren
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL-Überprüfung überspringen (nicht für die Produktion empfohlen)
azd config set http.insecure true
```

#### Versionskonflikte
```bash
# Entfernen Sie alte Installationen
# Windows: winget deinstallieren Microsoft.Azd
# macOS: brew deinstallieren azd
# Linux: sudo apt entfernen azd

# Konfiguration bereinigen
rm -rf ~/.azd
```

### Weitere Hilfe erhalten
```bash
# Debug-Logging aktivieren
export AZD_DEBUG=true
azd <command> --debug

# Detaillierte Protokolle anzeigen
azd logs

# Systeminformationen überprüfen
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

## 💡 Häufig gestellte Fragen

<details>
<summary><strong>Was ist der Unterschied zwischen azd und az CLI?</strong></summary>

**Azure CLI (az)**: Low-Level-Tool zur Verwaltung einzelner Azure-Ressourcen
- `az webapp create`, `az storage account create`
- Eine Ressource auf einmal
- Fokus auf Infrastrukturmanagement

**Azure Developer CLI (azd)**: High-Level-Tool für vollständige Anwendungsbereitstellungen
- `azd up` stellt die gesamte App mit allen Ressourcen bereit
- Vorlagenbasierte Workflows
- Fokus auf Entwicklerproduktivität

**Sie benötigen beide**: azd verwendet az CLI für die Authentifizierung
</details>

<details>
<summary><strong>Kann ich azd mit bestehenden Azure-Ressourcen verwenden?</strong></summary>

Ja! Sie können:
1. Bestehende Ressourcen in azd-Umgebungen importieren
2. Bestehende Ressourcen in Ihren Bicep-Vorlagen referenzieren
3. azd für neue Bereitstellungen neben bestehender Infrastruktur verwenden

Details finden Sie im [Konfigurationsleitfaden](configuration.md).
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

Absolut! azd ist für die Automatisierung ausgelegt:
- Integration mit GitHub Actions
- Unterstützung für Azure DevOps
- Service Principal Authentifizierung
- Nicht-interaktiver Modus

Details finden Sie im [Bereitstellungsleitfaden](../deployment/deployment-guide.md) für CI/CD-Muster.
</details>

<details>
<summary><strong>Was kostet die Nutzung von azd?</strong></summary>

azd selbst ist **komplett kostenlos** und Open-Source. Sie zahlen nur für:
- Azure-Ressourcen, die Sie bereitstellen
- Azure-Nutzungskosten (Rechenleistung, Speicher usw.)

Verwenden Sie `azd provision --preview`, um die Kosten vor der Bereitstellung zu schätzen.
</details>

## Nächste Schritte

1. **Authentifizierung abschließen**: Stellen Sie sicher, dass Sie Zugriff auf Ihr Azure-Abonnement haben
2. **Erste Bereitstellung ausprobieren**: Folgen Sie dem [Leitfaden für Ihr erstes Projekt](first-project.md)
3. **Vorlagen erkunden**: Durchsuchen Sie verfügbare Vorlagen mit `azd template list`
4. **Ihre IDE konfigurieren**: Richten Sie Ihre Entwicklungsumgebung ein

## Support

Falls Sie auf Probleme stoßen:
- [Offizielle Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Probleme melden](https://github.com/Azure/azure-dev/issues)
- [Community-Diskussionen](https://github.com/Azure/azure-dev/discussions)
- [Azure-Support](https://azure.microsoft.com/support/)

---

**Kapitelübersicht:**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 1 - Grundlagen & Schnellstart
- **⬅️ Vorheriges**: [AZD Grundlagen](azd-basics.md) 
- **➡️ Nächstes**: [Ihr erstes Projekt](first-project.md)
- **🚀 Nächstes Kapitel**: [Kapitel 2: AI-First Entwicklung](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ Installation abgeschlossen!** Fahren Sie mit [Ihr erstes Projekt](first-project.md) fort, um mit azd zu starten.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
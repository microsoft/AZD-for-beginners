# Installation & Einrichtungsleitfaden

**Kapitelnavigation:**
- **📚 Kursübersicht**: [AZD Für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 1 - Foundation & Quick Start
- **⬅️ Vorheriges**: [AZD Basics](azd-basics.md)
- **➡️ Nächstes**: [Ihr erstes Projekt](first-project.md)
- **🚀 Nächstes Kapitel**: [Kapitel 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Einführung

Dieser umfassende Leitfaden führt Sie durch die Installation und Konfiguration der Azure Developer CLI (azd) auf Ihrem System. Sie lernen mehrere Installationsmethoden für verschiedene Betriebssysteme, die Einrichtung der Authentifizierung und die anfängliche Konfiguration, um Ihre Entwicklungsumgebung für Azure-Bereitstellungen vorzubereiten.

## Lernziele

Am Ende dieser Lektion werden Sie:
- Azure Developer CLI erfolgreich auf Ihrem Betriebssystem installieren
- Die Authentifizierung mit Azure auf mehrere Arten konfigurieren
- Ihre Entwicklungsumgebung mit den notwendigen Voraussetzungen einrichten
- Verschiedene Installationsoptionen verstehen und wissen, wann welche zu verwenden ist
- Häufige Installations- und Einrichtungsprobleme beheben können

## Lernergebnisse

Nach Abschluss dieser Lektion werden Sie in der Lage sein:
- azd mit der geeigneten Methode für Ihre Plattform zu installieren
- Sich mit Azure über azd auth login zu authentifizieren
- Ihre Installation zu überprüfen und grundlegende azd-Befehle zu testen
- Ihre Entwicklungsumgebung für eine optimale Nutzung von azd zu konfigurieren
- Häufige Installationsprobleme eigenständig zu lösen

Dieser Leitfaden hilft Ihnen, die Azure Developer CLI auf Ihrem System zu installieren und zu konfigurieren, unabhängig von Ihrem Betriebssystem oder Ihrer Entwicklungsumgebung.

## Voraussetzungen

Bevor Sie azd installieren, stellen Sie sicher, dass Sie Folgendes haben:
- **Azure-Abonnement** - [Erstellen Sie ein kostenloses Konto](https://azure.microsoft.com/free/)
- **Azure CLI** - Für Authentifizierung und Ressourcenverwaltung
- **Git** - Zum Klonen von Vorlagen und für Versionskontrolle
- **Docker** (optional) - Für containerisierte Anwendungen

## Installationsmethoden

### Windows

#### Option 1: Windows Package Manager (Empfohlen)
```cmd
winget install microsoft.azd
```

#### Option 2: PowerShell-Installationsskript
```powershell
# Nützlich, wenn winget nicht verfügbar ist.
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 3: Chocolatey
```cmd
choco install azd
```

#### Option 4: Manuelle Installation
1. Laden Sie die neueste Version von [GitHub](https://github.com/Azure/azure-dev/releases) herunter
2. Entpacken nach `C:\Program Files\azd\`
3. Fügen Sie es der PATH-Umgebungsvariablen hinzu

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

**Manuelle Installation aus Release-Assets:**
```bash
# Laden Sie das neueste Archiv für Ihre Linux-Architektur herunter von:
# https://github.com/Azure/azure-dev/releases
# Entpacken Sie es dann und fügen Sie die azd-Binärdatei zu Ihrem PATH hinzu.
```

### GitHub Codespaces

Einige Codespaces und Dev-Container-Umgebungen enthalten bereits `azd`, aber Sie sollten das überprüfen, anstatt es anzunehmen:

```bash
azd version
```

Wenn `azd` fehlt, installieren Sie es mit dem Standard-Skript für die Umgebung.

### Docker

```bash
# Führe azd in einem Container aus
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Erstelle ein Alias zur einfacheren Nutzung
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Installation überprüfen

Nach der Installation prüfen Sie, ob azd korrekt funktioniert:

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

**✅ Installations-Erfolgs-Checkliste:**
- [ ] `azd version` zeigt Versionsnummer ohne Fehler
- [ ] `azd --help` zeigt die Befehlsdokumentation an
- [ ] `azd template list` zeigt verfügbare Vorlagen an
- [ ] Sie können ein Testverzeichnis erstellen und `azd init` erfolgreich ausführen

**Wenn alle Prüfungen bestanden sind, sind Sie bereit, zu [Ihrem ersten Projekt](first-project.md) weiterzugehen!**

## Authentifizierungseinrichtung

### Empfohlene Einrichtung für Anfänger

Für AZD-first-Workflows melden Sie sich mit `azd auth login` an.

```bash
# Erforderlich für AZD-Befehle wie z. B. azd up
azd auth login

# AZD-Authentifizierungsstatus überprüfen
azd auth login --check-status
```

Verwenden Sie die Azure CLI-Anmeldung nur, wenn Sie während des Kurses selbst `az`-Befehle ausführen möchten.

### Azure CLI-Authentifizierung (Optional)
```bash
# Azure CLI installieren, falls noch nicht installiert
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: siehe die Installationsanleitung der Azure CLI für Ihre Distribution

# Bei Azure anmelden
az login

# Authentifizierung überprüfen
az account show
```

### Welchen Anmeldefluss sollten Sie verwenden?

- Verwenden Sie `azd auth login`, wenn Sie dem Anfängerpfad für AZD folgen und hauptsächlich `azd`-Befehle ausführen.
- Verwenden Sie zusätzlich `az login`, wenn Sie Azure CLI-Befehle wie `az account show` ausführen oder Ressourcen direkt inspizieren möchten.
- Wenn eine Übung sowohl `azd`- als auch `az`-Befehle enthält, führen Sie beide Anmeldungen einmal zu Beginn aus.

### Gerätecode-Authentifizierung
Wenn Sie sich auf einem Headless-System befinden oder Browserprobleme haben:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Für automatisierte Umgebungen:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Validieren Sie Ihre vollständige Einrichtung

Wenn Sie vor dem Start von Kapitel 1 eine schnelle Überprüfung der Einsatzbereitschaft wünschen:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Konfiguration

### Globale Konfiguration
```bash
# Standardabonnement festlegen
azd config set defaults.subscription <subscription-id>

# Standardstandort festlegen
azd config set defaults.location eastus2

# Alle Konfigurationen anzeigen
azd config show
```

### Umgebungsvariablen
Fügen Sie Ihrem Shell-Profil (`.bashrc`, `.zshrc`, `.profile`) hinzu:
```bash
# Azure-Konfiguration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd-Konfiguration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Debugprotokollierung aktivieren
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
2. Konfigurieren Sie Azure-Anmeldeinformationen
3. Verwenden Sie das integrierte Terminal für azd-Befehle

## 🐛 Fehlerbehebung bei der Installation

### Häufige Probleme

#### Zugriff verweigert (Windows)
```powershell
# PowerShell als Administrator ausführen.
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

# SSL-Überprüfung überspringen (für Produktionsumgebungen nicht empfohlen)
azd config set http.insecure true
```

#### Versionskonflikte
```bash
# Alte Installationen entfernen
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: Entfernen Sie vor der Neuinstallation die vorherige azd-Binärdatei oder den symbolischen Link

# Konfiguration bereinigen
rm -rf ~/.azd
```

### Weitere Hilfe erhalten
```bash
# Debug-Protokollierung aktivieren
export AZD_DEBUG=true
azd <command> --debug

# Aktuelle Konfiguration anzeigen
azd config show

# Aktuellen Bereitstellungsstatus anzeigen
azd show
```

## azd aktualisieren

### Update-Prüfung
azd warnt, wenn eine neuere Version verfügbar ist, und Sie können Ihre aktuelle Buildversion mit folgendem Befehl bestätigen:
```bash
azd version
```

### Manuelle Updates

**Windows (winget):**
```cmd
winget upgrade microsoft.azd
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
<summary><strong>Was ist der Unterschied zwischen azd und der az CLI?</strong></summary>

**Azure CLI (az)**: Low-Level-Tool zur Verwaltung einzelner Azure-Ressourcen
- `az webapp create`, `az storage account create`
- Eine Ressource nach der anderen
- Fokus auf Infrastrukturverwaltung

**Azure Developer CLI (azd)**: High-Level-Tool für vollständige Anwendungsbereitstellungen
- `azd up` stellt die gesamte Anwendung mit allen Ressourcen bereit
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

Siehe [Konfigurationsanleitung](configuration.md) für Details.
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

Absolut! azd ist für die Automatisierung konzipiert:
- Integration mit GitHub Actions
- Unterstützung für Azure DevOps
- Service-Principal-Authentifizierung
- Nicht-interaktiver Modus

Siehe [Bereitstellungsanleitung](../chapter-04-infrastructure/deployment-guide.md) für CI/CD-Muster.
</details>

<details>
<summary><strong>Was kostet die Nutzung von azd?</strong></summary>

azd selbst ist **völlig kostenlos** und Open Source. Sie zahlen nur für:
- die Azure-Ressourcen, die Sie bereitstellen
- Azure-Verbrauchskosten (Compute, Storage usw.)

Verwenden Sie `azd provision --preview`, um die Kosten vor der Bereitstellung zu schätzen.
</details>

## Nächste Schritte

1. **Authentifizierung abschließen**: Stellen Sie sicher, dass Sie auf Ihr Azure-Abonnement zugreifen können
2. **Versuchen Sie Ihre erste Bereitstellung**: Folgen Sie dem [Leitfaden zum ersten Projekt](first-project.md)
3. **Vorlagen erkunden**: Durchsuchen Sie verfügbare Vorlagen mit `azd template list`
4. **Konfigurieren Sie Ihre IDE**: Richten Sie Ihre Entwicklungsumgebung ein

## Support

Wenn Sie auf Probleme stoßen:
- [Offizielle Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Probleme melden](https://github.com/Azure/azure-dev/issues)
- [Community-Diskussionen](https://github.com/Azure/azure-dev/discussions)
- [Azure-Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Erhalten Sie Azure-Befehlsanleitungen direkt in Ihrem Editor mit `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitelnavigation:**
- **📚 Kursübersicht**: [AZD Für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 1 - Foundation & Quick Start
- **⬅️ Vorheriges**: [AZD Basics](azd-basics.md) 
- **➡️ Nächstes**: [Ihr erstes Projekt](first-project.md)
- **🚀 Nächstes Kapitel**: [Kapitel 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installation abgeschlossen!** Fahren Sie mit [Ihrem ersten Projekt](first-project.md) fort, um mit azd zu beginnen.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Während wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir haften nicht für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
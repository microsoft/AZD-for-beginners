# Command Cheat Sheet - Wichtige AZD-Befehle

**Schnellreferenz für alle Kapitel**
- **📚 Kursübersicht**: [AZD für Anfänger](../README.md)
- **📖 Schnellstart**: [Kapitel 1: Grundlage & Schnellstart](../README.md#-chapter-1-foundation--quick-start)
- **🤖 KI-Befehle**: [Kapitel 2: KI-zentrierte Entwicklung (empfohlen für KI-Entwickler)](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Erweitert**: [Kapitel 4: Infrastruktur als Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Einführung

Dieses umfassende Spickzettel bietet eine Schnellreferenz für die am häufigsten verwendeten Azure Developer CLI-Befehle, nach Kategorien mit praktischen Beispielen organisiert. Ideal für schnelle Nachschläge während der Entwicklung, Fehlerbehebung und dem täglichen Betrieb mit azd-Projekten.

## Lernziele

Durch die Nutzung dieses Spickzettels werden Sie:
- Sofortigen Zugriff auf essentielle Azure Developer CLI-Befehle und deren Syntax haben
- Die Befehle nach funktionalen Kategorien und Anwendungsfällen verstehen
- Praktische Beispiele für typische Entwicklungs- und Bereitstellungsszenarien nachschlagen können
- Befehle zur Fehlerdiagnose für schnelle Problemlösungen finden
- Erweiterte Konfigurations- und Anpassungsoptionen effizient nutzen können
- Befehle zur Verwaltung von Umgebungen und Workflows für mehrere Umgebungen finden

## Lernergebnisse

Bei regelmäßiger Nutzung dieses Spickzettels werden Sie in der Lage sein:
- azd-Befehle sicher auszuführen, ohne ständig die vollständige Dokumentation zu konsultieren
- Häufige Probleme schnell mit passenden Diagnosebefehlen zu lösen
- Mehrere Umgebungen und Bereitstellungsszenarien effizient zu verwalten
- Erweiterte azd-Funktionen und Konfigurationsoptionen nach Bedarf anzuwenden
- Bereitstellungsprobleme systematisch mit passenden Befehlssequenzen zu beheben
- Workflows durch effektive Nutzung von azd-Abkürzungen und Optionen zu optimieren

## Erste Befehle

### Authentifizierung
```bash
# Bei Azure über AZD anmelden
azd auth login

# Bei der Azure CLI anmelden (AZD verwendet dies im Hintergrund)
az login

# Aktuelles Konto prüfen
az account show

# Standardabonnement festlegen
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Von AZD abmelden
azd auth logout

# Von der Azure CLI abmelden
az logout
```

### Projektinitialisierung
```bash
# Verfügbare Vorlagen durchsuchen
azd template list

# Von Vorlage initialisieren
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Im aktuellen Verzeichnis initialisieren
azd init .

# Mit benutzerdefiniertem Namen initialisieren
azd init --template todo-nodejs-mongo my-awesome-app
```

## Kern-Bereitstellungsbefehle

### Vollständiger Bereitstellungs-Workflow
```bash
# Alles bereitstellen (Provisionierung + Bereitstellung)
azd up

# Bereitstellen mit deaktivierten Bestätigungsaufforderungen
azd up --confirm-with-no-prompt

# In eine bestimmte Umgebung bereitstellen
azd up --environment production

# Bereitstellen mit benutzerdefinierten Parametern
azd up --parameter location=westus2
```

### Nur Infrastruktur
```bash
# Azure-Ressourcen bereitstellen
azd provision

# 🧪 Vorschau der Infrastrukturänderungen
azd provision --preview
# Zeigt eine Trockenlaufansicht dessen, welche Ressourcen erstellt, geändert oder gelöscht würden
# Ähnlich wie 'terraform plan' oder 'bicep what-if' - sicher auszuführen, es werden keine Änderungen vorgenommen
```

### Nur Anwendung
```bash
# Anwendungscode bereitstellen
azd deploy

# Einen bestimmten Dienst bereitstellen
azd deploy --service web
azd deploy --service api

# Alle Dienste bereitstellen
azd deploy --all
```

### Erstellen und Verpacken
```bash
# Anwendungen erstellen
azd package

# Einen bestimmten Dienst erstellen
azd package --service api
```

## 🌍 Umgebungsverwaltung

### Umgebungsoperationen
```bash
# Alle Umgebungen auflisten
azd env list

# Neue Umgebung erstellen
azd env new development
azd env new staging --location westus2

# Umgebung auswählen
azd env select production

# Aktuelle Umgebung anzeigen
azd env show

# Umgebungszustand aktualisieren
azd env refresh
```

### Umgebungsvariablen
```bash
# Umgebungsvariable setzen
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Umgebungsvariable abrufen
azd env get API_KEY

# Alle Umgebungsvariablen auflisten
azd env get-values

# Umgebungsvariable entfernen
azd env unset DEBUG
```

## ⚙️ Konfigurationsbefehle

### Globale Konfiguration
```bash
# Alle Konfigurationen auflisten
azd config list

# Globale Standardwerte festlegen
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Konfiguration entfernen
azd config unset defaults.location

# Alle Konfigurationen zurücksetzen
azd config reset
```

### Projektkonfiguration
```bash
# azure.yaml validieren
azd config validate

# Projektinformationen anzeigen
azd show

# Service-Endpunkte abrufen
azd show --output json
```

## 📊 Überwachung und Diagnose

### Überwachungs-Dashboard
```bash
# Azure-Portal-Überwachungs-Dashboard öffnen
azd monitor

# Application Insights Live-Metriken öffnen
azd monitor --live

# Application Insights-Logs-Blade öffnen
azd monitor --logs

# Application Insights-Übersicht öffnen
azd monitor --overview
```

### Container-Protokolle anzeigen
```bash
# Protokolle über die Azure CLI anzeigen (für Container-Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Protokolle in Echtzeit verfolgen
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Protokolle im Azure-Portal anzeigen
azd monitor --logs
```

### Log Analytics-Abfragen
```bash
# Zugriff auf Log Analytics über das Azure-Portal
azd monitor --logs

# Protokolle mit der Azure CLI abfragen
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Wartungsbefehle

### Aufräumen
```bash
# Alle Azure-Ressourcen entfernen
azd down

# Löschen ohne Bestätigung erzwingen
azd down --force

# Weichgelöschte Ressourcen endgültig löschen
azd down --purge

# Vollständige Bereinigung
azd down --force --purge
```

### Aktualisierungen
```bash
# Auf azd-Updates prüfen
azd version

# Aktuelle Version abrufen
azd version

# Aktuelle Konfiguration anzeigen
azd config list
```

## 🔧 Fortgeschrittene Befehle

### Pipeline und CI/CD
```bash
# GitHub Actions konfigurieren
azd pipeline config

# Azure DevOps konfigurieren
azd pipeline config --provider azdo

# Pipeline-Konfiguration anzeigen
azd pipeline show
```

### Infrastrukturverwaltung
```bash
# Infrastrukturvorlagen generieren
azd infra generate

# 🧪 Infrastrukturvorschau & Planung
azd provision --preview
# Simuliert die Bereitstellung der Infrastruktur, ohne sie tatsächlich bereitzustellen
# Analysiert Bicep-/Terraform-Vorlagen und zeigt:
# - Hinzuzufügende Ressourcen (grün +)
# - Zu ändernde Ressourcen (gelb ~)
# - Zu löschende Ressourcen (rot -)
# Sicher ausführbar - es werden keine tatsächlichen Änderungen an der Azure-Umgebung vorgenommen

# Infrastruktur aus azure.yaml erzeugen
azd infra synth
```

### Projektinformationen
```bash
# Projektstatus und Endpunkte anzeigen
azd show

# Detaillierte Projektinformationen als JSON anzeigen
azd show --output json

# Service-Endpunkte abrufen
azd show --output json | jq '.services'
```

## 🤖 KI- & Erweiterungsbefehle

### AZD-Erweiterungen
```bash
# Liste alle verfügbaren Erweiterungen auf (einschließlich KI)
azd extension list

# Installiere die Foundry Agents-Erweiterung
azd extension install azure.ai.agents

# Installiere die Feinabstimmungs-Erweiterung
azd extension install azure.ai.finetune

# Installiere die Erweiterung für benutzerdefinierte Modelle
azd extension install azure.ai.models

# Aktualisiere alle installierten Erweiterungen
azd extension upgrade --all
```

### KI-Agentenbefehle
```bash
# Ein Agent-Projekt aus einem Manifest initialisieren
azd ai agent init -m <manifest-path-or-uri>

# Ein bestimmtes Foundry-Projekt angeben
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Das Quellverzeichnis des Agenten angeben
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Ein Hosting-Ziel auswählen
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP-Server (Alpha)
```bash
# Starten Sie den MCP-Server für Ihr Projekt
azd mcp start

# Verwalten Sie die Zustimmungen von Tools für MCP-Operationen
azd mcp consent
```

### Infrastrukturgenerierung
```bash
# Generiere IaC-Dateien aus deiner Projektdefinition
azd infra generate

# Erzeuge Infrastruktur aus azure.yaml
azd infra synth
```

---

## 🎯 Schnelle Workflows

### Entwicklungs-Workflow
```bash
# Neues Projekt starten
azd init --template todo-nodejs-mongo
cd my-project

# In die Entwicklungsumgebung bereitstellen
azd env new dev
azd up

# Änderungen vornehmen und erneut bereitstellen
azd deploy

# Überwachungs-Dashboard öffnen
azd monitor --live
```

### Mehrere-Umgebungen-Workflow
```bash
# Umgebungen einrichten
azd env new dev
azd env new staging  
azd env new production

# In die Entwicklungsumgebung bereitstellen
azd env select dev
azd up

# Testen und in die Staging-Umgebung überführen
azd env select staging
azd up

# In die Produktionsumgebung bereitstellen
azd env select production
azd up
```

### Fehlerbehebungs-Workflow
```bash
# Debug-Modus aktivieren
export AZD_DEBUG=true

# Bereitstellungsstatus prüfen
azd show

# Konfiguration validieren
azd config list

# Überwachungs-Dashboard für Protokolle öffnen
azd monitor --logs

# Ressourcenstatus prüfen
azd show --output json
```

## 🔍 Debugging-Befehle

### Debug-Informationen
```bash
# Debug-Ausgabe aktivieren
export AZD_DEBUG=true
azd <command> --debug

# Telemetrie deaktivieren für eine sauberere Ausgabe
export AZD_DISABLE_TELEMETRY=true

# Aktuelle Konfiguration prüfen
azd config list

# Authentifizierungsstatus prüfen
az account show
```

### Vorlagen-Debugging
```bash
# Verfügbare Vorlagen mit Details auflisten
azd template list --output json

# Vorlageninformationen anzeigen
azd template show <template-name>

# Vorlage vor der Initialisierung validieren
azd template validate <template-name>
```

## 📁 Datei- und Verzeichnisbefehle

### Projektstruktur
```bash
# Aktuelle Verzeichnisstruktur anzeigen
tree /f  # Windows
find . -type f  # Linux/macOS

# Zum Stammverzeichnis des azd-Projekts navigieren
cd $(azd root)

# azd-Konfigurationsverzeichnis anzeigen
echo $AZD_CONFIG_DIR  # Normalerweise ~/.azd
```

## 🎨 Ausgabeformatierung

### JSON-Ausgabe
```bash
# JSON-Ausgabe zum Skripten erhalten
azd show --output json
azd env list --output json
azd config list --output json

# Mit jq parsen
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tabellen-Ausgabe
```bash
# Als Tabelle formatieren
azd env list --output table

# Bereitgestellte Dienste anzeigen
azd show --output json | jq '.services | keys'
```

## 🔧 Gängige Befehlskombinationen

### Health-Check-Skript
```bash
#!/bin/bash
# Kurzer Gesundheitscheck
azd show
azd env show
azd monitor --logs
```

### Bereitstellungsvalidierung
```bash
#!/bin/bash
# Validierung vor der Bereitstellung
azd show
azd provision --preview  # Änderungen vor der Bereitstellung ansehen
az account show
```

### Umgebungsvergleich
```bash
#!/bin/bash
# Umgebungen vergleichen
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Ressourcen-Aufräumskript
```bash
#!/bin/bash
# Alte Umgebungen bereinigen
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Umgebungsvariablen

### Gängige Umgebungsvariablen
```bash
# Azure-Konfiguration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD-Konfiguration
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Anwendungskonfiguration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Notfallbefehle

### Schnelle Lösungen
```bash
# Authentifizierung zurücksetzen
az account clear
az login

# Umgebung zwangsweise aktualisieren
azd env refresh

# Alle Dienste neu bereitstellen
azd deploy

# Bereitstellungsstatus prüfen
azd show --output json
```

### Wiederherstellungsbefehle
```bash
# Von fehlgeschlagener Bereitstellung wiederherstellen - bereinigen und neu bereitstellen
azd down --force --purge
azd up

# Nur Infrastruktur neu bereitstellen
azd provision

# Nur Anwendung neu bereitstellen
azd deploy
```

## 💡 Profi-Tipps

### Aliasnamen für schnelleren Workflow
```bash
# Fügen Sie es Ihrer .bashrc oder .zshrc hinzu.
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funktionskürzel
```bash
# Schneller Wechsel der Umgebung
azd-env() {
    azd env select $1 && azd show
}

# Schnelle Bereitstellung mit Überwachung
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Status der Umgebung
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Hilfe und Dokumentation

### Hilfe erhalten
```bash
# Allgemeine Hilfe
azd --help
azd help

# Befehlspezifische Hilfe
azd up --help
azd env --help
azd config --help

# Versions- und Build-Informationen anzeigen
azd version
azd version --output json
```

### Dokumentationslinks
```bash
# Dokumentation im Browser öffnen
azd docs

# Vorlagendokumentation anzeigen
azd template show <template-name> --docs
```

---

**Tipp**: Setzen Sie ein Lesezeichen für dieses Spickzettel und verwenden Sie `Ctrl+F`, um schnell die Befehle zu finden, die Sie benötigen!

---

**Navigation**
- **Vorherige Lektion**: [Preflight-Checks](../docs/pre-deployment/preflight-checks.md)
- **Nächste Lektion**: [Glossar](glossary.md)

---

> **💡 Möchten Sie Azure-Befehlsunterstützung in Ihrem Editor?** Installieren Sie [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) mit `npx skills add microsoft/github-copilot-for-azure` — 37 Skills für KI, Foundry, Bereitstellung, Diagnostik und mehr.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Haftungsausschluss:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst Co-op Translator (https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ausgangssprache ist als maßgebliche Quelle zu betrachten. Bei wichtigen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir haften nicht für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
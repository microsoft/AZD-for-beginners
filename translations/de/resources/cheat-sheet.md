# Befehls-Spickzettel - Wichtige AZD-Befehle

**Schnellreferenz für alle Kapitel**
- **📚 Kurs-Startseite**: [AZD für Einsteiger](../README.md)
- **📖 Schnellstart**: [Kapitel 1: Grundlagen & Schnellstart](../README.md#-chapter-1-foundation--quick-start)
- **🤖 KI-Befehle**: [Kapitel 2: KI-zentrierte Entwicklung](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Erweitert**: [Kapitel 4: Infrastruktur als Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Einführung

Dieser umfassende Spickzettel bietet eine Schnellreferenz für die am häufigsten verwendeten Azure Developer CLI-Befehle, organisiert nach Kategorien und mit praktischen Beispielen. Perfekt für schnelle Nachschläge während der Entwicklung, Fehlerbehebung und dem täglichen Betrieb mit azd-Projekten.

## Lernziele

Durch die Verwendung dieses Spickzettels erhalten Sie:
- Sofortigen Zugriff auf wichtige Azure Developer CLI-Befehle und deren Syntax
- Verständnis der Organisation von Befehlen nach funktionalen Kategorien und Anwendungsfällen
- Nachschlagbare praktische Beispiele für gängige Entwicklungs- und Deployment-Szenarien
- Zugriff auf Fehlerbehebungsbefehle für schnelle Problemlösungen
- Effizientes Auffinden erweiterter Konfigurations- und Anpassungsoptionen
- Auffinden von Befehlen zur Umgebungverwaltung und Workflows für mehrere Umgebungen

## Lernergebnisse

Bei regelmäßiger Nutzung dieses Spickzettels werden Sie in der Lage sein:
- azd-Befehle sicher auszuführen, ohne ständig die vollständige Dokumentation zu konsultieren
- Häufige Probleme schnell mit geeigneten Diagnosebefehlen zu lösen
- Mehrere Umgebungen und Deployment-Szenarien effizient zu verwalten
- Erweiterte azd-Funktionen und Konfigurationsoptionen bei Bedarf anzuwenden
- Bereitstellungsprobleme mithilfe systematischer Befehlsfolgen zu beheben
- Workflows durch effektiven Einsatz von azd-Kurzbefehlen und Optionen zu optimieren

## Erste Schritte - Befehle

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

# Aus Vorlage initialisieren
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
# Alles bereitstellen (Einrichten + Bereitstellung)
azd up

# Bereitstellen mit deaktivierten Bestätigungsabfragen
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

# 🧪 Vorschau von Infrastrukturänderungen
azd provision --preview
# Zeigt eine Trockenlaufansicht, welche Ressourcen erstellt, geändert oder gelöscht würden
# Ähnlich wie 'terraform plan' oder 'bicep what-if' - sicher auszuführen, es werden keine Änderungen angewendet
```

### Nur Anwendung
```bash
# Anwendungscode bereitstellen
azd deploy

# Bestimmten Dienst bereitstellen
azd deploy --service web
azd deploy --service api

# Alle Dienste bereitstellen
azd deploy --all
```

### Erstellen und Paketieren
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

# Status der Umgebung aktualisieren
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

# Globale Standardwerte setzen
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
# Überwachungs-Dashboard im Azure-Portal öffnen
azd monitor

# Live-Metriken von Application Insights öffnen
azd monitor --live

# Blade für Application Insights-Logs öffnen
azd monitor --logs

# Application Insights-Übersicht öffnen
azd monitor --overview
```

### Containerprotokolle anzeigen
```bash
# Protokolle mit der Azure CLI anzeigen (für Container Apps)
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

# Löschung erzwingen ohne Bestätigung
azd down --force

# Softgelöschte Ressourcen endgültig löschen
azd down --purge

# Vollständige Bereinigung
azd down --force --purge
```

### Aktualisierungen
```bash
# Auf Updates für azd prüfen
azd version

# Aktuelle Version abrufen
azd version

# Aktuelle Konfiguration anzeigen
azd config list
```

## 🔧 Erweiterte Befehle

### Pipelines und CI/CD
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

# 🧪 Infrastrukturvorschau und Planung
azd provision --preview
# Simuliert die Bereitstellung der Infrastruktur, ohne sie tatsächlich bereitzustellen
# Analysiert Bicep/Terraform-Vorlagen und zeigt:
# - Ressourcen, die hinzugefügt werden (grün +)
# - Ressourcen, die geändert werden (gelb ~)
# - Ressourcen, die gelöscht werden (rot -)
# Sicher auszuführen - es werden keine tatsächlichen Änderungen an der Azure-Umgebung vorgenommen

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

### Workflow für mehrere Umgebungen
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

# Telemetrie deaktivieren für sauberere Ausgabe
export AZD_DISABLE_TELEMETRY=true

# Aktuelle Konfiguration prüfen
azd config list

# Authentifizierungsstatus prüfen
az account show
```

### Template-Debugging
```bash
# Verfügbare Vorlagen mit Details auflisten
azd template list --output json

# Informationen zur Vorlage anzeigen
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
# JSON-Ausgabe für Skripte
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

## 🔧 Häufige Befehlskombinationen

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
azd provision --preview  # Änderungen vor der Bereitstellung anzeigen
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

### Skript zum Aufräumen von Ressourcen
```bash
#!/bin/bash
# Bereinige alte Umgebungen
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Umgebungsvariablen

### Häufige Umgebungsvariablen
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

# Nur Infrastruktur erneut bereitstellen
azd provision

# Nur Anwendung neu bereitstellen
azd deploy
```

## 💡 Profi-Tipps

### Aliasse für schnellere Workflows
```bash
# Füge es deiner .bashrc- oder .zshrc-Datei hinzu.
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funktionskürzel
```bash
# Schnelles Umschalten der Umgebung
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

# Befehlsbezogene Hilfe
azd up --help
azd env --help
azd config --help

# Version- und Build-Informationen anzeigen
azd version
azd version --output json
```

### Links zur Dokumentation
```bash
# Dokumentation im Browser öffnen
azd docs

# Dokumentation der Vorlage anzeigen
azd template show <template-name> --docs
```

---

**Tipp**: Setzen Sie ein Lesezeichen für diesen Spickzettel und verwenden Sie `Ctrl+F`, um schnell die benötigten Befehle zu finden!

---

**Navigation**
- **Vorherige Lektion**: [Preflight-Checks](../docs/pre-deployment/preflight-checks.md)
- **Nächste Lektion**: [Glossar](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Haftungsausschluss:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in der Ausgangssprache ist als maßgebliche Quelle zu betrachten. Bei wichtigen Informationen wird eine professionelle Übersetzung durch einen Menschen empfohlen. Wir haften nicht für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
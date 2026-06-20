# Command-Cheat-Sheet - Wichtige AZD-Befehle

**Schnellreferenz für alle Kapitel**
- **📚 Course Home**: [AZD für Anfänger](../README.md)
- **📖 Quick Start**: [Kapitel 1: Grundlagen & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commands**: [Kapitel 2: KI-zentrierte Entwicklung](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [Kapitel 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Einführung

Dieses umfassende Spickzettel bietet eine Schnellreferenz für die am häufigsten verwendeten Azure Developer CLI-Befehle, geordnet nach Kategorien mit praktischen Beispielen. Perfekt für schnelle Nachschläge während der Entwicklung, Fehlerbehebung und dem täglichen Betrieb mit azd-Projekten.

## Lernziele

Durch die Nutzung dieses Spickzettels werden Sie:
- Sofortigen Zugriff auf essentielle Azure Developer CLI-Befehle und die Syntax haben
- Die Befehlsorganisation nach funktionalen Kategorien und Anwendungsfällen verstehen
- Praktische Beispiele für gängige Entwicklungs- und Bereitstellungsszenarien nachschlagen können
- Auf Befehle zur Fehlerbehebung für schnelle Problemlösung zugreifen können
- Fortgeschrittene Konfigurations- und Anpassungsoptionen effizient finden
- Befehlsfolgen für Umfeldverwaltung und Multi-Environment-Workflows lokalisieren können

## Lernergebnisse

Bei regelmäßiger Nutzung dieses Spickzettels werden Sie in der Lage sein:
- Azd-Befehle sicher auszuführen, ohne ständig die vollständige Dokumentation zu konsultieren
- Häufige Probleme schnell mit den passenden Diagnosebefehlen zu lösen
- Mehrere Umgebungen und Bereitstellungsszenarien effizient zu verwalten
- Erweiterte azd-Funktionen und Konfigurationsoptionen bei Bedarf anzuwenden
- Bereitstellungsprobleme systematisch mit Befehlssequenzen zu debuggen
- Workflows durch effektive Nutzung von azd-Abkürzungen und Optionen zu optimieren

## Befehle zum Einstieg

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

# 🧪 Vorschau auf Infrastrukturänderungen
azd provision --preview
# Zeigt eine Dry-Run-Ansicht dessen, welche Ressourcen erstellt, geändert oder gelöscht würden
# Ähnlich wie 'terraform plan' oder 'bicep what-if' - sicher ausführbar, keine Änderungen werden angewendet
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

### Bauen und Paketieren
```bash
# Anwendungsabhängigkeiten wiederherstellen (herunterladen)
azd restore

# Einen bestimmten Dienst wiederherstellen
azd restore --service api

# Ein bereitstellbares Artefakt erstellen, ohne es bereitzustellen
azd package

# Einen bestimmten Dienst erstellen
azd package --service api
```

> **`azd restore`** lädt die Abhängigkeiten Ihrer App herunter (npm, pip, NuGet, Maven etc.). Es wird automatisch während `azd package` und `azd deploy` ausgeführt, daher rufen Sie es selten direkt auf — führen Sie es manuell aus, um Abhängigkeiten vorab zu laden (zum Beispiel, um einen CI-Cache zu erwärmen oder danach offline weiterzuarbeiten).

> **`azd package`** erstellt das deployfähige Artefakt (ein Container-Image oder Zip) **ohne** es nach Azure zu pushen. Verwenden Sie es eigenständig, um zu überprüfen, ob ein Build erfolgreich ist, die Ausgabe zu inspizieren oder ein Artefakt zu erzeugen, das ein separater Prozess später bereitstellt. `azd deploy` paketiert automatisch, daher benötigen Sie `azd package` nur, wenn Sie das Artefakt ohne Bereitstellung haben möchten.


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

# Verfügbare Umgebungen anzeigen
azd env list

# Umgebungsstatus aktualisieren
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
azd config show

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
# Öffne das Überwachungs-Dashboard im Azure-Portal
azd monitor

# Öffne die Live-Metriken von Application Insights
azd monitor --live

# Öffne das Logs-Blade von Application Insights
azd monitor --logs

# Öffne die Übersicht von Application Insights
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

### Bereinigung
```bash
# Alle Azure-Ressourcen entfernen
azd down

# Löschung ohne Bestätigung erzwingen
azd down --force

# weich gelöschte Ressourcen bereinigen
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
azd config show
```

## 🔧 Erweiterte Befehle

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
# Simuliert die Bereitstellung der Infrastruktur, ohne zu deployen
# Analysiert Bicep-/Terraform-Vorlagen und zeigt:
# - Hinzuzufügende Ressourcen (grün +)
# - Zu ändernde Ressourcen (gelb ~)
# - Zu löschende Ressourcen (rot -)
# Sicher auszuführen - es werden keine tatsächlichen Änderungen an der Azure-Umgebung vorgenommen

# Infrastruktur aus azure.yaml synthetisieren
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
# Alle verfügbaren Erweiterungen auflisten (einschließlich KI)
azd extension list

# Foundry Agents-Erweiterung installieren
azd extension install azure.ai.agents

# Agent Skills-Erweiterung installieren (Vorschau)
azd extension install azure.ai.skills

# Foundry Connections-Erweiterung installieren (Vorschau)
azd extension install azure.ai.connections

# Fine-Tuning-Erweiterung installieren
azd extension install azure.ai.finetune

# Erweiterung für benutzerdefinierte Modelle installieren
azd extension install azure.ai.models

# Alle installierten Erweiterungen aktualisieren
azd extension upgrade --all
```

### KI-Agent-Befehle
```bash
# Ein Agentenprojekt aus einem Manifest initialisieren
azd ai agent init -m <manifest-path-or-uri>

# Ein bestimmtes Foundry-Projekt angeben
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Das Quellverzeichnis des Agenten angeben
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Ein Hosting-Ziel wählen
azd ai agent init -m agent-manifest.yaml --host containerapp

# Einen bereitgestellten Agenten testen (gibt Latenz und Time-to-First-Byte aus)
azd ai agent invoke

# Die Konfiguration des Live-Endpunkts anzeigen
azd ai agent endpoint show

# Einen Evaluierungsdatensatz erstellen und dann den Agenten optimieren
azd ai agent eval generate
azd ai agent optimize

# Den bereitgestellten Quellcode eines codebasierten gehosteten Agenten herunterladen
azd ai agent code download

# Einen gehosteten Agenten und alle seine Versionen löschen (--force beendet aktive Sitzungen)
azd ai agent delete --force
```

### MCP-Server (Alpha)
```bash
# Starten Sie den MCP-Server für Ihr Projekt
azd mcp start

# Verwalten Sie die Zustimmung für Tools bei MCP-Operationen
azd copilot consent list
```

### Infrastrukturerstellung
```bash
# Generiere IaC-Dateien aus Ihrer Projektdefinition
azd infra generate

# Erzeuge Infrastruktur aus azure.yaml
azd infra synth
```

---

## 🎯 Schnellworkflows

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

### Multi-Umgebungs-Workflow
```bash
# Umgebungen einrichten
azd env new dev
azd env new staging  
azd env new production

# Auf dev bereitstellen
azd env select dev
azd up

# Testen und in Staging überführen
azd env select staging
azd up

# In Produktion bereitstellen
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
azd config show

# Monitoring-Dashboard für Protokolle öffnen
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
azd config show

# Authentifizierungsstatus prüfen
az account show
```

### Template-Debugging
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
# JSON-Ausgabe für Skripte erhalten
azd show --output json
azd env list --output json
azd config show --output json

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
# Schneller Gesundheitscheck
azd show
azd env get-values
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

### Ressourcen-Aufräum-Skript
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

### Schnelllösungen
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
# Wiederherstellung nach fehlgeschlagener Bereitstellung - bereinigen und neu bereitstellen
azd down --force --purge
azd up

# Nur Infrastruktur neu provisionieren
azd provision

# Nur Anwendung neu bereitstellen
azd deploy
```

## 💡 Profi-Tipps

### Aliase für schnelleren Workflow
```bash
# Füge es zu deiner .bashrc oder .zshrc hinzu
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
    azd env get-values
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

# Befehlsspezifische Hilfe
azd up --help
azd env --help
azd config --help

# Version- und Build-Informationen anzeigen
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

**Tipp**: Lesezeichen für dieses Spickzettel setzen und `Strg+F` verwenden, um schnell die Befehle zu finden, die Sie benötigen!

---

**Navigation**
- **Vorherige Lektion**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Nächste Lektion**: [Glossar](glossary.md)

---

> **💡 Möchten Sie Unterstützung für Azure-Befehle in Ihrem Editor?** Installieren Sie [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) mit `npx skills add microsoft/github-copilot-for-azure` — 37 Skills für KI, Foundry, Bereitstellung, Diagnose und mehr.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
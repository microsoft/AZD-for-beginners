# Ihr erstes Projekt - Praxis-Tutorial

**Kapitel-Navigation:**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 1 - Grundlagen & Schneller Einstieg
- **⬅️ Previous**: [Installation & Einrichtung](installation.md)
- **➡️ Next**: [Konfiguration](configuration.md)
- **🚀 Next Chapter**: [Kapitel 2: KI-First-Entwicklung](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Einleitung

Willkommen zu Ihrem ersten Azure Developer CLI-Projekt! Dieses umfassende Praxis-Tutorial bietet eine vollständige Schritt-für-Schritt-Anleitung zum Erstellen, Bereitstellen und Verwalten einer Full-Stack-Anwendung auf Azure mit azd. Sie arbeiten mit einer echten Todo-Anwendung, die ein React-Frontend, ein Node.js-API-Backend und eine MongoDB-Datenbank umfasst.

## Lernziele

Durch den Abschluss dieses Tutorials werden Sie:
- Den azd-Projektinitialisierungs-Workflow mithilfe von Templates meistern
- Die Projektstruktur und Konfigurationsdateien der Azure Developer CLI verstehen
- Eine komplette Anwendungsbereitstellung auf Azure inklusive Infrastrukturprovisionierung durchführen
- Anwendungsaktualisierungen und Redeploy-Strategien umsetzen
- Mehrere Umgebungen für Entwicklung und Staging verwalten
- Ressourcenbereinigung und Kostenmanagement anwenden

## Lernergebnisse

Nach Abschluss werden Sie in der Lage sein:
- azd-Projekte eigenständig aus Vorlagen zu initialisieren und zu konfigurieren
- azd-Projektstrukturen effektiv zu navigieren und zu ändern
- Full-Stack-Anwendungen mit einzelnen Befehlen nach Azure bereitzustellen
- Häufige Bereitstellungsprobleme und Authentifizierungsfehler zu beheben
- Mehrere Azure-Umgebungen für unterschiedliche Bereitstellungsstufen zu verwalten
- Continuous-Deployment-Workflows für Anwendungsaktualisierungen zu implementieren

## Loslegen

### Voraussetzungen
- ✅ Azure Developer CLI installiert ([Installationsanleitung](installation.md))
- ✅ AZD-Authentifizierung mit `azd auth login` abgeschlossen
- ✅ Git auf Ihrem System installiert
- ✅ Node.js 16+ (für dieses Tutorial)
- ✅ Visual Studio Code (empfohlen)

Bevor Sie fortfahren, führen Sie den Setup-Validator aus dem Repository-Stammverzeichnis aus:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Einrichtung überprüfen
```bash
# Überprüfe die azd-Installation
azd version

# Überprüfe die AZD-Authentifizierung
azd auth login --check-status
```

### Optionale Azure CLI-Authentifizierung überprüfen

```bash
az account show
```

### Node.js-Version prüfen
```bash
node --version
```

## Schritt 1: Vorlage auswählen und initialisieren

Beginnen wir mit einer beliebten Todo-Anwendungs-Vorlage, die ein React-Frontend und ein Node.js-API-Backend enthält.

```bash
# Durchsuchen Sie verfügbare Vorlagen
azd template list

# Initialisieren Sie die Todo-App-Vorlage
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Folgen Sie den Eingabeaufforderungen:
# - Geben Sie einen Namen für die Umgebung ein: "dev"
# - Wählen Sie ein Abonnement (falls Sie mehrere haben)
# - Wählen Sie eine Region: "East US 2" (oder Ihre bevorzugte Region)
```

### Was ist gerade passiert?
- Den Vorlagen-Code in Ihr lokales Verzeichnis heruntergeladen
- Eine `azure.yaml`-Datei mit Service-Definitionen erstellt
- Infrastrukturcode im Verzeichnis `infra/` eingerichtet
- Eine Umgebungskonfiguration erstellt

## Schritt 2: Projektstruktur erkunden

Schauen wir uns an, was azd für uns erstellt hat:

```bash
# Projektstruktur anzeigen
tree /f   # Windows
# oder
find . -type f | head -20   # macOS/Linux
```

Sie sollten sehen:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Wichtige Dateien zum Verstehen

**azure.yaml** - Das Herz Ihres azd-Projekts:
```bash
# Projektkonfiguration anzeigen
cat azure.yaml
```

**infra/main.bicep** - Infrastrukturbeschreibung:
```bash
# Infrastrukturcode anzeigen
head -30 infra/main.bicep
```

## Schritt 3: Projekt anpassen (optional)

Bevor Sie bereitstellen, können Sie die Anwendung anpassen:

### Frontend anpassen
```bash
# Öffne die React-App-Komponente
code src/web/src/App.tsx
```

Nehmen Sie eine einfache Änderung vor:
```typescript
// Finde den Titel und ändere ihn
<h1>My Awesome Todo App</h1>
```

### Umgebungsvariablen konfigurieren
```bash
# Benutzerdefinierte Umgebungsvariablen festlegen
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Alle Umgebungsvariablen anzeigen
azd env get-values
```

## Schritt 4: Auf Azure bereitstellen

Nun zum aufregenden Teil – alles auf Azure bereitstellen!

```bash
# Infrastruktur und Anwendung bereitstellen
azd up

# Dieser Befehl führt Folgendes aus:
# 1. Azure-Ressourcen bereitstellen (App Service, Cosmos DB, usw.)
# 2. Ihre Anwendung erstellen
# 3. Auf die bereitgestellten Ressourcen bereitstellen
# 4. Die URL der Anwendung anzeigen
```

### Was passiert während der Bereitstellung?

Der Befehl `azd up` führt diese Schritte aus:
1. **Provision** (`azd provision`) - Erstellt Azure-Ressourcen
2. **Package** - Baut Ihren Anwendungscode
3. **Deploy** (`azd deploy`) - Stellt Code auf Azure-Ressourcen bereit

### Erwartete Ausgabe
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Schritt 5: Anwendung testen

### Auf Ihre Anwendung zugreifen
Klicken Sie auf die in der Bereitstellungsausgabe angegebene URL oder rufen Sie sie jederzeit ab:
```bash
# Anwendungsendpunkte abrufen
azd show

# Öffnen Sie die Anwendung in Ihrem Browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Die Todo-App testen
1. **Todo-Element hinzufügen** - Klicken Sie auf "Add Todo" und geben Sie eine Aufgabe ein
2. **Als erledigt markieren** - Abgeschlossene Elemente abhaken
3. **Elemente löschen** - Entfernen Sie Todos, die Sie nicht mehr benötigen

### Ihre Anwendung überwachen
```bash
# Azure-Portal für Ihre Ressourcen öffnen
azd monitor

# Anwendungsprotokolle anzeigen
azd monitor --logs

# Live-Metriken anzeigen
azd monitor --live
```

### ✅ Überprüfen Sie Ihre Bereitstellung

Bevor Sie fortfahren, gehen Sie diese kurze Checkliste durch, um zu bestätigen, dass wirklich alles funktioniert — nehmen Sie nicht an, dass "deploy succeeded" bedeutet, dass "app works":

```bash
# 1. Bestätigen Sie, dass der Endpunkt existiert und erreichbar ist
azd show

# 2. Führen Sie einen Smoke-Test des Endpunkts durch (erwartet HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Prüfen Sie den Health-Endpunkt, falls Ihre Anwendung einen bereitstellt
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Die Bereitstellung ist verifiziert, wenn:**
- ✅ `azd show` listet eine erreichbare Endpunkt-URL auf
- ✅ Die URL öffnet sich in Ihrem Browser ohne Fehler
- ✅ Kernfunktionen funktionieren (todo hinzufügen/als erledigt markieren/löschen)
- ✅ `azd monitor --logs` zeigt ankommende Anfragen ohne unerwartete Fehler

Wenn eine Prüfung fehlschlägt, springen Sie zu [Kapitel 7: Fehlerbehebung](../chapter-07-troubleshooting/README.md).

## Schritt 6: Änderungen vornehmen und neu bereitstellen

Nehmen wir eine Änderung vor und sehen wir, wie einfach ein Update ist:

### API anpassen
```bash
# Bearbeite den API-Code
code src/api/src/routes/lists.js
```

Einen benutzerdefinierten Antwort-Header hinzufügen:
```javascript
// Finde einen Route-Handler und füge Folgendes hinzu:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Nur die Code-Änderungen bereitstellen
```bash
# Nur den Anwendungscode bereitstellen (Infrastruktur überspringen)
azd deploy

# Das ist viel schneller als 'azd up', da die Infrastruktur bereits vorhanden ist.
```

## Schritt 7: Mehrere Umgebungen verwalten

Erstellen Sie eine Staging-Umgebung, um Änderungen vor der Produktion zu testen:

```bash
# Erstelle eine neue Staging-Umgebung
azd env new staging

# Auf die Staging-Umgebung bereitstellen
azd up

# Zurück zur Entwicklungsumgebung wechseln
azd env select dev

# Alle Umgebungen auflisten
azd env list
```

### Umgebungsvergleich
```bash
# Entwicklungsumgebung anzeigen
azd env select dev
azd show

# Staging-Umgebung anzeigen
azd env select staging
azd show
```

## Schritt 8: Ressourcen bereinigen

Wenn Sie mit dem Experimentieren fertig sind, bereinigen Sie die Ressourcen, um fortlaufende Kosten zu vermeiden:

```bash
# Alle Azure-Ressourcen für die aktuelle Umgebung löschen
azd down

# Löschung ohne Bestätigung erzwingen und softgelöschte Ressourcen bereinigen
azd down --force --purge

# Spezifische Umgebung löschen
azd env select staging
azd down --force --purge
```

## Klassische App vs. KI-gestützte App: Gleicher Workflow

Sie haben gerade eine traditionelle Webanwendung bereitgestellt. Was aber, wenn Sie stattdessen eine KI-gestützte App bereitstellen möchten – zum Beispiel eine Chat-Anwendung, die von Microsoft Foundry Models unterstützt wird?

Die gute Nachricht: **der Workflow ist identisch.**

| Schritt | Klassische Todo-App | KI-Chat-App |
|------|-----------------|-------------|
| Initialisieren | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authentifizieren | `azd auth login` | `azd auth login` |
| Bereitstellen | `azd up` | `azd up` |
| Überwachen | `azd monitor` | `azd monitor` |
| Bereinigen | `azd down --force --purge` | `azd down --force --purge` |

Der einzige Unterschied ist die **Vorlage**, von der Sie ausgehen. Eine KI-Vorlage enthält zusätzliche Infrastruktur (wie eine Microsoft Foundry Models-Ressource oder einen AI Search-Index), aber azd übernimmt all das für Sie. Sie müssen keine neuen Befehle lernen, kein anderes Tool übernehmen oder Ihre Denkweise zur Bereitstellung ändern.

Das ist das Kernprinzip von azd: **ein Workflow, jede Arbeitslast.** Die Fähigkeiten, die Sie in diesem Tutorial geübt haben — Initialisierung, Bereitstellung, Überwachung, erneute Bereitstellung und Bereinigung — gelten gleichermaßen für KI-Anwendungen und Agenten.

---

## Was Sie gelernt haben

Glückwunsch! Sie haben erfolgreich:
- ✅ Ein azd-Projekt aus einer Vorlage initialisiert
- ✅ Die Projektstruktur und wichtige Dateien erkundet
- ✅ Eine Full-Stack-Anwendung auf Azure bereitgestellt
- ✅ Codeänderungen vorgenommen und neu bereitgestellt
- ✅ Mehrere Umgebungen verwaltet
- ✅ Ressourcen bereinigt

## 🎯 Übungen zur Kompetenzüberprüfung

### Übung 1: Eine andere Vorlage bereitstellen (15 Minuten)
**Ziel**: Beherrschung von azd init und dem Bereitstellungs-Workflow demonstrieren

```bash
# Python + MongoDB-Stack ausprobieren
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Bereitstellung überprüfen
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Aufräumen
azd down --force --purge
```

**Erfolgskriterien:**
- [ ] Anwendung wird ohne Fehler bereitgestellt
- [ ] Kann die Anwendungs-URL im Browser aufrufen
- [ ] Anwendung funktioniert korrekt (hinzufügen/entfernen von Todos)
- [ ] Alle Ressourcen wurden erfolgreich bereinigt

### Übung 2: Konfiguration anpassen (20 Minuten)
**Ziel**: Umgang mit Umgebungsvariablen üben

```bash
cd my-first-azd-app

# Benutzerdefinierte Umgebung erstellen
azd env new custom-config

# Benutzerdefinierte Variablen setzen
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Variablen überprüfen
azd env get-values | grep APP_TITLE

# Mit benutzerdefinierter Konfiguration bereitstellen
azd up
```

**Erfolgskriterien:**
- [ ] Benutzerdefinierte Umgebung erfolgreich erstellt
- [ ] Umgebungsvariablen gesetzt und abrufbar
- [ ] Anwendung wird mit benutzerdefinierter Konfiguration bereitgestellt
- [ ] Kann benutzerdefinierte Einstellungen in der bereitgestellten Anwendung verifizieren

### Übung 3: Multi-Environment-Workflow (25 Minuten)
**Ziel**: Umgebungsverwaltung und Bereitstellungsstrategien meistern

```bash
# Entwicklungsumgebung erstellen
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Dev-URL notieren
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Staging-Umgebung erstellen
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Staging-URL notieren
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Umgebungen vergleichen
azd env list

# Beide Umgebungen testen
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Beide Umgebungen bereinigen
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Erfolgskriterien:**
- [ ] Zwei Umgebungen mit unterschiedlichen Konfigurationen erstellt
- [ ] Beide Umgebungen erfolgreich bereitgestellt
- [ ] Zwischen Umgebungen mit `azd env select` wechseln können
- [ ] Umgebungsvariablen unterscheiden sich zwischen den Umgebungen
- [ ] Beide Umgebungen erfolgreich bereinigt

## 📊 Ihr Fortschritt

**Investierte Zeit**: ~60-90 Minuten  
**Erworbene Fähigkeiten**:
- ✅ Template-basierte Projektinitialisierung
- ✅ Azure-Ressourcenprovisionierung
- ✅ Anwendungs-Bereitstellungsworkflows
- ✅ Umgebungsverwaltung
- ✅ Konfigurationsmanagement
- ✅ Ressourcenbereinigung und Kostenmanagement

**Nächster Schritt**: Sie sind bereit für den [Konfigurationsleitfaden](configuration.md), um fortgeschrittene Konfigurationsmuster zu lernen!

## Fehlersuche bei häufigen Problemen

### Authentifizierungsfehler
```bash
# Erneut bei Azure authentifizieren
az login

# Zugriff auf das Abonnement überprüfen
az account show
```

### Bereitstellungsfehler
```bash
# Debug-Protokollierung aktivieren
export AZD_DEBUG=true
azd up --debug

# Anwendungsprotokolle in Azure anzeigen
azd monitor --logs

# Für Container Apps verwenden Sie die Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Konflikte bei Ressourcennamen
```bash
# Verwenden Sie einen eindeutigen Umgebungsnamen
azd env new dev-$(whoami)-$(date +%s)
```

### Port-/Netzwerkprobleme
```bash
# Überprüfen, ob Ports verfügbar sind
netstat -an | grep :3000
netstat -an | grep :3100
```

## Nächste Schritte

Nachdem Sie Ihr erstes Projekt abgeschlossen haben, erkunden Sie diese fortgeschrittenen Themen:

### 1. Infrastruktur anpassen
- [Infrastruktur als Code](../chapter-04-infrastructure/provisioning.md)
- [Datenbanken, Speicher und andere Dienste hinzufügen](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD einrichten
- [Bereitstellungsleitfaden](../chapter-04-infrastructure/deployment-guide.md) - Vollständige CI/CD-Workflows
- [Azure Developer CLI-Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline-Konfiguration

### 3. Best Practices für die Produktion
- [Bereitstellungsleitfaden](../chapter-04-infrastructure/deployment-guide.md) - Sicherheit, Leistung und Überwachung

### 4. Weitere Vorlagen entdecken
```bash
# Vorlagen nach Kategorie durchsuchen
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Verschiedene Technologie-Stacks ausprobieren
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Zusätzliche Ressourcen

### Lernmaterialien
- [Azure Developer CLI-Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Community & Support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Vorlagen & Beispiele
- [Offizielle Vorlagengalerie](https://azure.github.io/awesome-azd/)
- [Community-Vorlagen](https://github.com/Azure-Samples/azd-templates)
- [Unternehmensmuster](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Herzlichen Glückwunsch zum Abschluss Ihres ersten azd-Projekts!** Sie sind nun bereit, großartige Anwendungen sicher auf Azure zu entwickeln und bereitzustellen.

---

**Kapitel-Navigation:**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 1 - Grundlagen & Schneller Einstieg
- **⬅️ Previous**: [Installation & Einrichtung](installation.md)
- **➡️ Next**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Next Chapter**: [Kapitel 2: KI-First-Entwicklung](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
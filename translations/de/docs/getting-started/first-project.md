# Ihr erstes Projekt - Praktisches Tutorial

**Kapitel Navigation:**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 1 - Grundlagen & Schnellstart
- **⬅️ Vorheriges**: [Installation & Einrichtung](installation.md)
- **➡️ Nächstes**: [Konfiguration](configuration.md)
- **🚀 Nächstes Kapitel**: [Kapitel 2: AI-First Entwicklung](../microsoft-foundry/microsoft-foundry-integration.md)

## Einführung

Willkommen zu Ihrem ersten Azure Developer CLI Projekt! Dieses umfassende praktische Tutorial bietet eine vollständige Anleitung zur Erstellung, Bereitstellung und Verwaltung einer Full-Stack-Anwendung auf Azure mit azd. Sie arbeiten mit einer echten Todo-Anwendung, die ein React-Frontend, ein Node.js API-Backend und eine MongoDB-Datenbank umfasst.

## Lernziele

Durch den Abschluss dieses Tutorials werden Sie:
- Den azd-Projektinitialisierungs-Workflow mit Vorlagen meistern
- Die Struktur und Konfigurationsdateien von Azure Developer CLI-Projekten verstehen
- Eine vollständige Anwendungsbereitstellung auf Azure mit Infrastrukturprovisionierung durchführen
- Strategien für Anwendungsupdates und erneute Bereitstellungen implementieren
- Mehrere Umgebungen für Entwicklung und Staging verwalten
- Ressourcenbereinigung und Kostenmanagementpraktiken anwenden

## Lernergebnisse

Nach Abschluss werden Sie in der Lage sein:
- azd-Projekte unabhängig von Vorlagen zu initialisieren und zu konfigurieren
- azd-Projektstrukturen effektiv zu navigieren und zu ändern
- Full-Stack-Anwendungen mit einfachen Befehlen auf Azure bereitzustellen
- Häufige Bereitstellungsprobleme und Authentifizierungsprobleme zu beheben
- Mehrere Azure-Umgebungen für verschiedene Bereitstellungsstufen zu verwalten
- Kontinuierliche Bereitstellungs-Workflows für Anwendungsupdates zu implementieren

## Erste Schritte

### Checkliste der Voraussetzungen
- ✅ Azure Developer CLI installiert ([Installationsanleitung](installation.md))
- ✅ Azure CLI installiert und authentifiziert
- ✅ Git auf Ihrem System installiert
- ✅ Node.js 16+ (für dieses Tutorial)
- ✅ Visual Studio Code (empfohlen)

### Überprüfen Sie Ihre Einrichtung
```bash
# Überprüfen Sie die azd-Installation
azd version
```
### Azure-Authentifizierung überprüfen

```bash
az account show
```

### Node.js-Version überprüfen
```bash
node --version
```

## Schritt 1: Vorlage auswählen und initialisieren

Beginnen wir mit einer beliebten Todo-Anwendungsvorlage, die ein React-Frontend und ein Node.js API-Backend enthält.

```bash
# Verfügbare Vorlagen durchsuchen
azd template list

# Die To-Do-App-Vorlage initialisieren
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Den Anweisungen folgen:
# - Einen Umgebungsnamen eingeben: "dev"
# - Ein Abonnement auswählen (falls Sie mehrere haben)
# - Eine Region auswählen: "East US 2" (oder Ihre bevorzugte Region)
```

### Was ist gerade passiert?
- Der Vorlagencode wurde in Ihr lokales Verzeichnis heruntergeladen
- Eine `azure.yaml`-Datei mit Dienstdefinitionen wurde erstellt
- Infrastrukturcode im Verzeichnis `infra/` eingerichtet
- Eine Umgebungskonfiguration erstellt

## Schritt 2: Projektstruktur erkunden

Lassen Sie uns untersuchen, was azd für uns erstellt hat:

```bash
# Sehen Sie die Projektstruktur
tree /f   # Windows
# oder
find . -type f | head -20   # macOS/Linux
```

Sie sollten Folgendes sehen:
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

**azure.yaml** - Das Herzstück Ihres azd-Projekts:
```bash
# Anzeigen der Projektkonfiguration
cat azure.yaml
```

**infra/main.bicep** - Infrastrukturdefinition:
```bash
# Sehen Sie sich den Infrastrukturcode an
head -30 infra/main.bicep
```

## Schritt 3: Ihr Projekt anpassen (optional)

Bevor Sie bereitstellen, können Sie die Anwendung anpassen:

### Frontend ändern
```bash
# Öffnen Sie die React-App-Komponente
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

## Schritt 4: Bereitstellung auf Azure

Jetzt kommt der spannende Teil - alles auf Azure bereitstellen!

```bash
# Infrastruktur und Anwendung bereitstellen
azd up

# Dieser Befehl wird:
# 1. Azure-Ressourcen bereitstellen (App Service, Cosmos DB, etc.)
# 2. Ihre Anwendung erstellen
# 3. Auf die bereitgestellten Ressourcen bereitstellen
# 4. Die Anwendungs-URL anzeigen
```

### Was passiert während der Bereitstellung?

Der Befehl `azd up` führt folgende Schritte aus:
1. **Provisionierung** (`azd provision`) - Erstellt Azure-Ressourcen
2. **Packaging** - Baut Ihren Anwendungscode
3. **Bereitstellung** (`azd deploy`) - Stellt Code auf Azure-Ressourcen bereit

### Erwartete Ausgabe
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Schritt 5: Ihre Anwendung testen

### Zugriff auf Ihre Anwendung
Klicken Sie auf die URL, die in der Bereitstellungsausgabe bereitgestellt wird, oder rufen Sie sie jederzeit ab:
```bash
# Abrufen der Anwendungsendpunkte
azd show

# Öffnen Sie die Anwendung in Ihrem Browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo-App testen
1. **Todo-Element hinzufügen** - Klicken Sie auf "Add Todo" und geben Sie eine Aufgabe ein
2. **Als erledigt markieren** - Haken Sie erledigte Elemente ab
3. **Elemente löschen** - Entfernen Sie Todos, die Sie nicht mehr benötigen

### Ihre Anwendung überwachen
```bash
# Azure-Portal für Ihre Ressourcen öffnen
azd monitor

# Anwendungsprotokolle anzeigen
azd logs
```

## Schritt 6: Änderungen vornehmen und erneut bereitstellen

Nehmen wir eine Änderung vor und sehen, wie einfach es ist, ein Update durchzuführen:

### API ändern
```bash
# Bearbeiten Sie den API-Code
code src/api/src/routes/lists.js
```

Fügen Sie einen benutzerdefinierten Antwort-Header hinzu:
```javascript
// Finde einen Routen-Handler und füge hinzu:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Nur die Codeänderungen bereitstellen
```bash
# Nur den Anwendungscode bereitstellen (Infrastruktur überspringen)
azd deploy

# Dies ist viel schneller als 'azd up', da die Infrastruktur bereits existiert
```

## Schritt 7: Mehrere Umgebungen verwalten

Erstellen Sie eine Staging-Umgebung, um Änderungen vor der Produktion zu testen:

```bash
# Erstellen Sie eine neue Staging-Umgebung
azd env new staging

# In Staging bereitstellen
azd up

# Zurück zur Entwicklungsumgebung wechseln
azd env select dev

# Alle Umgebungen auflisten
azd env list
```

### Vergleich der Umgebungen
```bash
# Entwicklungsumgebung anzeigen
azd env select dev
azd show

# Staging-Umgebung anzeigen
azd env select staging
azd show
```

## Schritt 8: Ressourcen bereinigen

Wenn Sie mit dem Experimentieren fertig sind, bereinigen Sie, um laufende Kosten zu vermeiden:

```bash
# Löschen Sie alle Azure-Ressourcen für die aktuelle Umgebung
azd down

# Erzwingen Sie das Löschen ohne Bestätigung und bereinigen Sie weichgelöschte Ressourcen
azd down --force --purge

# Löschen Sie eine bestimmte Umgebung
azd env select staging
azd down --force --purge
```

## Was Sie gelernt haben

Herzlichen Glückwunsch! Sie haben erfolgreich:
- ✅ Ein azd-Projekt aus einer Vorlage initialisiert
- ✅ Die Projektstruktur und wichtige Dateien erkundet
- ✅ Eine Full-Stack-Anwendung auf Azure bereitgestellt
- ✅ Codeänderungen vorgenommen und erneut bereitgestellt
- ✅ Mehrere Umgebungen verwaltet
- ✅ Ressourcen bereinigt

## 🎯 Übungen zur Validierung Ihrer Fähigkeiten

### Übung 1: Eine andere Vorlage bereitstellen (15 Minuten)
**Ziel**: Beherrschung des azd-Init- und Bereitstellungs-Workflows demonstrieren

```bash
# Versuchen Sie den Python + MongoDB-Stack
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
- [ ] Anwendung wird fehlerfrei bereitgestellt
- [ ] URL der Anwendung im Browser zugänglich
- [ ] Anwendung funktioniert korrekt (Todos hinzufügen/löschen)
- [ ] Alle Ressourcen erfolgreich bereinigt

### Übung 2: Konfiguration anpassen (20 Minuten)
**Ziel**: Übung zur Konfiguration von Umgebungsvariablen

```bash
cd my-first-azd-app

# Erstelle benutzerdefinierte Umgebung
azd env new custom-config

# Benutzerdefinierte Variablen festlegen
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
- [ ] Benutzerdefinierte Einstellungen in der bereitgestellten App überprüfbar

### Übung 3: Multi-Umgebungs-Workflow (25 Minuten)
**Ziel**: Beherrschung der Umgebungsverwaltung und Bereitstellungsstrategien

```bash
# Entwicklungsumgebung erstellen
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Entwicklungs-URL notieren
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

# Beide bereinigen
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Erfolgskriterien:**
- [ ] Zwei Umgebungen mit unterschiedlichen Konfigurationen erstellt
- [ ] Beide Umgebungen erfolgreich bereitgestellt
- [ ] Wechsel zwischen Umgebungen mit `azd env select` möglich
- [ ] Umgebungsvariablen unterscheiden sich zwischen den Umgebungen
- [ ] Beide Umgebungen erfolgreich bereinigt

## 📊 Ihr Fortschritt

**Investierte Zeit**: ~60-90 Minuten  
**Erworbene Fähigkeiten**:
- ✅ Vorlagebasierte Projektinitialisierung
- ✅ Azure-Ressourcen-Provisionierung
- ✅ Anwendungsbereitstellungs-Workflows
- ✅ Umgebungsverwaltung
- ✅ Konfigurationsmanagement
- ✅ Ressourcenbereinigung und Kostenmanagement

**Nächstes Level**: Sie sind bereit für [Konfigurationsanleitung](configuration.md), um fortgeschrittene Konfigurationsmuster zu lernen!

## Häufige Probleme beheben

### Authentifizierungsfehler
```bash
# Erneut bei Azure authentifizieren
az login

# Abonnementzugriff überprüfen
az account show
```

### Bereitstellungsfehler
```bash
# Debug-Logging aktivieren
export AZD_DEBUG=true
azd up --debug

# Detaillierte Protokolle anzeigen
azd logs --service api
azd logs --service web
```

### Ressourcennamenskonflikte
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
- [Infrastructure as Code](../deployment/provisioning.md)
- [Datenbanken, Speicher und andere Dienste hinzufügen](../deployment/provisioning.md#adding-services)

### 2. CI/CD einrichten
- [GitHub Actions Integration](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Best Practices für die Produktion
- [Sicherheitskonfigurationen](../deployment/best-practices.md#security)
- [Leistungsoptimierung](../deployment/best-practices.md#performance)
- [Überwachung und Protokollierung](../deployment/best-practices.md#monitoring)

### 4. Weitere Vorlagen erkunden
```bash
# Durchsuchen Sie Vorlagen nach Kategorie
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Probieren Sie verschiedene Technologiestacks aus
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Zusätzliche Ressourcen

### Lernmaterialien
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architekturzentrum](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Community & Support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Vorlagen & Beispiele
- [Offizielle Vorlagengalerie](https://azure.github.io/awesome-azd/)
- [Community-Vorlagen](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Herzlichen Glückwunsch zum Abschluss Ihres ersten azd-Projekts!** Sie sind jetzt bereit, großartige Anwendungen auf Azure mit Zuversicht zu erstellen und bereitzustellen.

---

**Kapitel Navigation:**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 1 - Grundlagen & Schnellstart
- **⬅️ Vorheriges**: [Installation & Einrichtung](installation.md)
- **➡️ Nächstes**: [Konfiguration](configuration.md)
- **🚀 Nächstes Kapitel**: [Kapitel 2: AI-First Entwicklung](../microsoft-foundry/microsoft-foundry-integration.md)
- **Nächste Lektion**: [Bereitstellungsanleitung](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Nutzung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
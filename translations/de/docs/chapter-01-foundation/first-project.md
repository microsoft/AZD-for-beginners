# Dein erstes Projekt - Praxis-Tutorial

**Kapitel-Navigation:**
- **📚 Kursstart**: [AZD für Einsteiger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 1 - Grundlagen & Schnellstart
- **⬅️ Zurück**: [Installation & Einrichtung](installation.md)
- **➡️ Weiter**: [Konfiguration](configuration.md)
- **🚀 Nächstes Kapitel**: [Kapitel 2: KI-zentrierte Entwicklung](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Einführung

Willkommen zu Ihrem ersten Azure Developer CLI-Projekt! Dieses umfassende praxisorientierte Tutorial bietet eine vollständige Anleitung zum Erstellen, Bereitstellen und Verwalten einer Full-Stack-Anwendung auf Azure mit azd. Sie arbeiten mit einer echten To‑do-Anwendung, die ein React-Frontend, ein Node.js-API-Backend und eine MongoDB-Datenbank umfasst.

## Lernziele

Durch das Abschließen dieses Tutorials werden Sie:
- Den azd-Projektinitialisierungsablauf mit Vorlagen meistern
- Die Projektstruktur und Konfigurationsdateien der Azure Developer CLI verstehen
- Die vollständige Bereitstellung der Anwendung in Azure inklusive Infrastrukturprovisionierung ausführen
- Anwendungsaktualisierungen und Redeploy-Strategien implementieren
- Mehrere Umgebungen für Entwicklung und Staging verwalten
- Ressourcenbereinigung und Kostenmanagement anwenden

## Lernergebnisse

Nach Abschluss werden Sie in der Lage sein:
- azd-Projekte aus Vorlagen eigenständig zu initialisieren und zu konfigurieren
- azd-Projektstrukturen effektiv zu navigieren und anzupassen
- Full-Stack-Anwendungen mit einzelnen Befehlen nach Azure bereitzustellen
- Häufige Bereitstellungsfehler und Authentifizierungsprobleme zu beheben
- Mehrere Azure-Umgebungen für unterschiedliche Bereitstellungsphasen zu verwalten
- Continuous-Deployment-Workflows für Anwendungsupdates zu implementieren

## Erste Schritte

### Voraussetzungen (Checkliste)
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

### Node.js-Version prüfen
```bash
node --version
```

## Schritt 1: Vorlage auswählen und initialisieren

Beginnen wir mit einer beliebten To‑do-Anwendungs‑Vorlage, die ein React-Frontend und ein Node.js-API-Backend enthält.

```bash
# Verfügbare Vorlagen durchsuchen
azd template list

# Die Todo-App-Vorlage initialisieren
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Folgen Sie den Eingabeaufforderungen:
# - Geben Sie einen Namen für die Umgebung ein: "dev"
# - Wählen Sie ein Abonnement (falls Sie mehrere haben)
# - Wählen Sie eine Region: "East US 2" (oder Ihre bevorzugte Region)
```

### Was ist gerade passiert?
- Hat den Vorlagen-Code in Ihr lokales Verzeichnis heruntergeladen
- Eine `azure.yaml`-Datei mit Dienstdefinitionen erstellt
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

You should see:
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

### Wichtige Dateien, die Sie verstehen sollten

**azure.yaml** - Das Herz Ihres azd-Projekts:
```bash
# Projektkonfiguration anzeigen
cat azure.yaml
```

**infra/main.bicep** - Infrastrukturdefinition:
```bash
# Den Infrastrukturcode anzeigen
head -30 infra/main.bicep
```

## Schritt 3: Projekt anpassen (Optional)

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

## Schritt 4: In Azure bereitstellen

Nun zum spannenden Teil - alles in Azure bereitstellen!

```bash
# Infrastruktur und Anwendung bereitstellen
azd up

# Dieser Befehl führt Folgendes aus:
# 1. Azure-Ressourcen bereitstellen (App Service, Cosmos DB usw.)
# 2. Ihre Anwendung erstellen
# 3. In die bereitgestellten Ressourcen deployen
# 4. Die Anwendungs-URL anzeigen
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
Klicken Sie auf die URL, die in der Bereitstellungsausgabe angegeben ist, oder rufen Sie sie jederzeit ab:
```bash
# Rufen Sie die Endpunkte der Anwendung ab
azd show

# Öffnen Sie die Anwendung in Ihrem Browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Die To‑do-App testen
1. **Ein To‑do hinzufügen** - Klicken Sie auf "Add Todo" und geben Sie eine Aufgabe ein
2. **Als erledigt markieren** - Setzen Sie ein Häkchen bei erledigten Einträgen
3. **Einträge löschen** - Entfernen Sie To‑dos, die Sie nicht mehr benötigen

### Ihre Anwendung überwachen
```bash
# Öffnen Sie das Azure-Portal für Ihre Ressourcen
azd monitor

# Anwendungsprotokolle anzeigen
azd monitor --logs

# Live-Metriken anzeigen
azd monitor --live
```

## Schritt 6: Änderungen vornehmen und erneut bereitstellen

Nehmen wir eine Änderung vor und sehen, wie einfach ein Update ist:

### API anpassen
```bash
# API-Code bearbeiten
code src/api/src/routes/lists.js
```

Fügen Sie einen benutzerdefinierten Antwort-Header hinzu:
```javascript
// Finde einen Route-Handler und füge hinzu:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Nur die Code-Änderungen bereitstellen
```bash
# Nur den Anwendungscode bereitstellen (Infrastruktur überspringen)
azd deploy

# Das ist deutlich schneller als 'azd up', da die Infrastruktur bereits vorhanden ist
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

Wenn Sie mit dem Experimentieren fertig sind, bereinigen Sie die Ressourcen, um fortlaufende Kosten zu vermeiden:

```bash
# Alle Azure-Ressourcen für die aktuelle Umgebung löschen
azd down

# Löschung ohne Bestätigung erzwingen und weichgelöschte Ressourcen bereinigen
azd down --force --purge

# Bestimmte Umgebung löschen
azd env select staging
azd down --force --purge
```

## Was Sie gelernt haben

Herzlichen Glückwunsch! Sie haben erfolgreich:
- ✅ Ein azd-Projekt aus einer Vorlage initialisiert
- ✅ Die Projektstruktur und wichtige Dateien erkundet
- ✅ Eine Full-Stack-Anwendung in Azure bereitgestellt
- ✅ Codeänderungen vorgenommen und erneut bereitgestellt
- ✅ Mehrere Umgebungen verwaltet
- ✅ Ressourcen bereinigt

## 🎯 Übungen zur Kompetenzüberprüfung

### Übung 1: Eine andere Vorlage bereitstellen (15 Minuten)
**Ziel**: Beherrschung des azd init- und Bereitstellungs-Workflows demonstrieren

```bash
# Python- und MongoDB-Stack ausprobieren
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
- [ ] Zugriff auf die Anwendungs-URL im Browser möglich
- [ ] Anwendung funktioniert korrekt (To‑dos hinzufügen/entfernen)
- [ ] Alle Ressourcen erfolgreich bereinigt

### Übung 2: Konfiguration anpassen (20 Minuten)
**Ziel**: Üben der Konfiguration von Umgebungsvariablen

```bash
cd my-first-azd-app

# Erstelle benutzerdefinierte Umgebung
azd env new custom-config

# Setze benutzerdefinierte Variablen
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Überprüfe Variablen
azd env get-values | grep APP_TITLE

# Stelle mit benutzerdefinierter Konfiguration bereit
azd up
```

**Erfolgskriterien:**
- [ ] Eigene Umgebung erfolgreich erstellt
- [ ] Umgebungsvariablen gesetzt und abrufbar
- [ ] Anwendung mit benutzerdefinierter Konfiguration bereitgestellt
- [ ] Benutzerdefinierte Einstellungen in der bereitgestellten App verifizierbar

### Übung 3: Multi-Environment-Workflow (25 Minuten)
**Ziel**: Verwaltung von Umgebungen und Bereitstellungsstrategien meistern

```bash
# Dev-Umgebung erstellen
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
- [ ] Wechsel zwischen Umgebungen mit `azd env select` möglich
- [ ] Umgebungsvariablen unterscheiden sich zwischen den Umgebungen
- [ ] Beide Umgebungen erfolgreich bereinigt

## 📊 Ihr Fortschritt

**Aufgewendete Zeit**: ~60-90 Minuten  
**Erworbene Fähigkeiten**:
- ✅ Vorlagenbasierte Projektinitialisierung
- ✅ Azure-Ressourcenprovisionierung
- ✅ Workflows zur Anwendungsbereitstellung
- ✅ Umgebungsverwaltung
- ✅ Konfigurationsverwaltung
- ✅ Ressourcenbereinigung und Kostenmanagement

**Nächstes Level**: Sie sind bereit für den [Konfigurationsleitfaden](configuration.md), um fortgeschrittene Konfigurationsmuster zu lernen!

## Fehlerbehebung bei häufigen Problemen

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

# Für Container-Apps die Azure CLI verwenden:
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

Nachdem Sie Ihr erstes Projekt abgeschlossen haben, erkunden Sie diese erweiterten Themen:

### 1. Infrastruktur anpassen
- [Infrastruktur als Code](../chapter-04-infrastructure/provisioning.md)
- [Datenbanken, Speicher und andere Dienste hinzufügen](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD einrichten
- [Bereitstellungsleitfaden](../chapter-04-infrastructure/deployment-guide.md) - Vollständige CI/CD-Workflows
- [Azure Developer CLI-Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline-Konfiguration

### 3. Best Practices für die Produktion
- [Bereitstellungsleitfaden](../chapter-04-infrastructure/deployment-guide.md) - Sicherheit, Leistung und Überwachung

### 4. Weitere Vorlagen erkunden
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
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Herzlichen Glückwunsch zum Abschluss Ihres ersten azd-Projekts!** Sie sind jetzt bereit, fantastische Anwendungen auf Azure mit Selbstvertrauen zu entwickeln und bereitzustellen.

---

**Kapitel-Navigation:**
- **📚 Kursstart**: [AZD für Einsteiger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 1 - Grundlagen & Schnellstart
- **⬅️ Zurück**: [Installation & Einrichtung](installation.md)
- **➡️ Weiter**: [Konfiguration](configuration.md)
- **🚀 Nächstes Kapitel**: [Kapitel 2: KI-zentrierte Entwicklung](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [Bereitstellungsleitfaden](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Haftungsausschluss:
Dieses Dokument wurde mit dem KI‑Übersetzungsdienst Co‑op Translator (https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir um Genauigkeit bemüht sind, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in der Originalsprache ist als maßgebliche Quelle zu betrachten. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Ihr erstes Projekt - Praxis-Tutorial

**Kapitelnavigation:**
- **📚 Kursübersicht**: [AZD für Einsteiger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 1 - Grundlagen & Schnellstart
- **⬅️ Zurück**: [Installation & Einrichtung](installation.md)
- **➡️ Weiter**: [Konfiguration](configuration.md)
- **🚀 Nächstes Kapitel**: [Kapitel 2: KI-zentrierte Entwicklung](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Einführung

Willkommen zu Ihrem ersten Azure Developer CLI-Projekt! Dieses umfassende Praxis-Tutorial bietet eine vollständige Schritt-für-Schritt-Anleitung zum Erstellen, Bereitstellen und Verwalten einer Full-Stack-Anwendung in Azure mit azd. Sie arbeiten mit einer echten Todo-Anwendung, die ein React-Frontend, ein Node.js-API-Backend und eine MongoDB-Datenbank umfasst.

## Lernziele

Durch das Abschließen dieses Tutorials werden Sie:
- Den azd-Projektinitialisierungs-Workflow mit Vorlagen beherrschen
- Die Struktur von Azure Developer CLI-Projekten und Konfigurationsdateien verstehen
- Die vollständige Anwendung mit Infrastrukturbereitstellung in Azure bereitstellen
- Aktualisierungs- und erneute Bereitstellungsstrategien für Anwendungen implementieren
- Mehrere Umgebungen für Entwicklung und Staging verwalten
- Maßnahmen zur Ressourcenbereinigung und Kostenverwaltung anwenden

## Lernergebnisse

Nach Abschluss werden Sie in der Lage sein:
- azd-Projekte aus Vorlagen eigenständig zu initialisieren und zu konfigurieren
- azd-Projektstrukturen effektiv zu navigieren und zu ändern
- Full-Stack-Anwendungen mit einfachen Befehlen in Azure bereitzustellen
- Häufige Bereitstellungsprobleme und Authentifizierungsprobleme zu beheben
- Mehrere Azure-Umgebungen für verschiedene Bereitstellungsphasen zu verwalten
- Kontinuierliche Bereitstellungs-Workflows für Anwendungsaktualisierungen zu implementieren

## Erste Schritte

### Checkliste der Voraussetzungen
- ✅ Azure Developer CLI installiert ([Installationsanleitung](installation.md))
- ✅ AZD-Authentifizierung mit `azd auth login` abgeschlossen
- ✅ Git auf Ihrem System installiert
- ✅ Node.js 16+ (für dieses Tutorial)
- ✅ Visual Studio Code (empfohlen)

Bevor Sie fortfahren, führen Sie den Setup-Validator im Repository-Stammverzeichnis aus:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Überprüfen Sie Ihre Einrichtung
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
# Verfügbare Vorlagen durchsuchen
azd template list

# Die Todo-App-Vorlage initialisieren
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Befolgen Sie die Eingabeaufforderungen:
# - Geben Sie einen Namen für die Umgebung ein: "dev"
# - Wählen Sie ein Abonnement (falls Sie mehrere haben)
# - Wählen Sie eine Region: "East US 2" (oder Ihre bevorzugte Region)
```

### Was ist gerade passiert?
- Die Vorlagen-Code wurde in Ihr lokales Verzeichnis heruntergeladen
- Eine `azure.yaml`-Datei mit Dienstdefinitionen wurde erstellt
- Infrastrukturcode im Verzeichnis `infra/` wurde eingerichtet
- Eine Umgebungs-Konfiguration wurde erstellt

## Schritt 2: Projektstruktur erkunden

Lassen Sie uns ansehen, was azd für uns erstellt hat:

```bash
# Projektstruktur anzeigen
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

**azure.yaml** - Das Herz Ihres azd-Projekts:
```bash
# Projektkonfiguration anzeigen
cat azure.yaml
```

**infra/main.bicep** - Infrastrukturdefinition:
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

## Schritt 4: In Azure bereitstellen

Nun zum spannenden Teil - stellen Sie alles in Azure bereit!

```bash
# Infrastruktur und Anwendung bereitstellen
azd up

# Dieser Befehl wird:
# 1. Azure-Ressourcen bereitstellen (App Service, Cosmos DB usw.)
# 2. Ihre Anwendung erstellen
# 3. Die Anwendung auf den bereitgestellten Ressourcen bereitstellen
# 4. Die URL der Anwendung anzeigen
```

### Was passiert während der Bereitstellung?

Der Befehl `azd up` führt diese Schritte aus:
1. **Provision** (`azd provision`) - Erstellt Azure-Ressourcen
2. **Package** - Baut Ihren Anwendungscode
3. **Deploy** (`azd deploy`) - Stellt den Code auf Azure-Ressourcen bereit

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

### Auf Ihre Anwendung zugreifen
Klicken Sie auf die in der Bereitstellungsausgabe angegebene URL, oder rufen Sie sie jederzeit ab:
```bash
# Anwendungsendpunkte abrufen
azd show

# Öffnen Sie die Anwendung in Ihrem Browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Die Todo-App testen
1. **Ein Todo-Element hinzufügen** - Klicken Sie auf "Add Todo" und geben Sie eine Aufgabe ein
2. **Als erledigt markieren** - Setzen Sie ein Häkchen bei erledigten Einträgen
3. **Einträge löschen** - Entfernen Sie Todos, die Sie nicht mehr benötigen

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

Nehmen wir eine Änderung vor und sehen, wie einfach es ist, zu aktualisieren:

### API ändern
```bash
# Bearbeite den API-Code
code src/api/src/routes/lists.js
```

Einen benutzerdefinierten Antwort-Header hinzufügen:
```javascript
// Finde einen Route-Handler und füge hinzu:
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

# In die Staging-Umgebung bereitstellen
azd up

# Zurück zur Dev-Umgebung wechseln
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

Wenn Sie mit dem Experimentieren fertig sind, bereinigen Sie die Ressourcen, um laufende Kosten zu vermeiden:

```bash
# Alle Azure-Ressourcen für die aktuelle Umgebung löschen
azd down

# Löschen ohne Bestätigung erzwingen und soft-gelöschte Ressourcen bereinigen
azd down --force --purge

# Bestimmte Umgebung löschen
azd env select staging
azd down --force --purge
```

## Klassische App vs. KI-gestützte App: Gleicher Workflow

Sie haben gerade eine traditionelle Webanwendung bereitgestellt. Aber was wäre, wenn Sie stattdessen eine KI-gestützte Anwendung bereitstellen wollten — z. B. eine Chat-Anwendung, die von Microsoft Foundry Models unterstützt wird?

Die gute Nachricht: **der Workflow ist identisch.**

| Schritt | Klassische Todo-App | KI-Chat-App |
|------|-----------------|-------------|
| Initialisieren | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authentifizieren | `azd auth login` | `azd auth login` |
| Bereitstellen | `azd up` | `azd up` |
| Überwachen | `azd monitor` | `azd monitor` |
| Bereinigen | `azd down --force --purge` | `azd down --force --purge` |

Der einzige Unterschied ist die **Vorlage**, mit der Sie starten. Eine KI-Vorlage umfasst zusätzliche Infrastruktur (wie eine Microsoft Foundry Models-Ressource oder einen AI Search-Index), aber azd kümmert sich um all das für Sie. Sie müssen keine neuen Befehle lernen, kein anderes Tool einsetzen oder Ihre Denkweise zur Bereitstellung ändern.

Das ist das Kernprinzip von azd: **ein Workflow, beliebige Arbeitslast.** Die Fähigkeiten, die Sie in diesem Tutorial geübt haben — Initialisierung, Bereitstellung, Überwachung, erneute Bereitstellung und Bereinigung — gelten gleichermaßen für KI-Anwendungen und Agenten.

---

## Was Sie gelernt haben

Herzlichen Glückwunsch! Sie haben erfolgreich:
- ✅ Ein azd-Projekt aus einer Vorlage initialisiert
- ✅ Die Projektstruktur und wichtige Dateien erkundet
- ✅ Eine Full-Stack-Anwendung in Azure bereitgestellt
- ✅ Codeänderungen vorgenommen und erneut bereitgestellt
- ✅ Mehrere Umgebungen verwaltet
- ✅ Ressourcen bereinigt

## 🎯 Übungsaufgaben zur Überprüfung der Fähigkeiten

### Übung 1: Eine andere Vorlage bereitstellen (15 Minuten)
**Ziel**: Beherrschung von azd init und dem Bereitstellungs-Workflow demonstrieren

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
- [ ] Anwendung ohne Fehler bereitgestellt
- [ ] Auf die Anwendungs-URL im Browser zugreifen können
- [ ] Anwendung funktioniert korrekt (Hinzufügen/Entfernen von Todos)
- [ ] Alle Ressourcen erfolgreich bereinigt

### Übung 2: Konfiguration anpassen (20 Minuten)
**Ziel**: Übung zur Konfiguration von Umgebungsvariablen

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
- [ ] Anwendung mit benutzerdefinierter Konfiguration bereitgestellt
- [ ] Benutzerdefinierte Einstellungen in der bereitgestellten App verifizierbar

### Übung 3: Multi-Umgebungs-Workflow (25 Minuten)
**Ziel**: Verwaltung von Umgebungen und Bereitstellungsstrategien meistern

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
- ✅ Projektinitialisierung auf Vorlagenbasis
- ✅ Azure-Ressourcenbereitstellung
- ✅ Workflows zur Anwendungsbereitstellung
- ✅ Umgebungsverwaltung
- ✅ Konfigurationsverwaltung
- ✅ Ressourcenbereinigung und Kostenmanagement

**Nächster Schritt**: Sie sind bereit für den [Konfigurationsleitfaden](configuration.md), um fortgeschrittene Konfigurationsmuster zu erlernen!

## Häufige Probleme beheben

### Authentifizierungsfehler
```bash
# Erneut bei Azure authentifizieren
az login

# Zugriff auf das Abonnement überprüfen
az account show
```

### Fehler bei der Bereitstellung
```bash
# Debug-Protokollierung aktivieren
export AZD_DEBUG=true
azd up --debug

# Anwendungsprotokolle in Azure anzeigen
azd monitor --logs

# Für Container-Apps verwenden Sie die Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Namenskonflikte von Ressourcen
```bash
# Verwende einen eindeutigen Umgebungsnamen
azd env new dev-$(whoami)-$(date +%s)
```

### Port-/Netzwerkprobleme
```bash
# Prüfen, ob Ports verfügbar sind
netstat -an | grep :3000
netstat -an | grep :3100
```

## Nächste Schritte

Jetzt, da Sie Ihr erstes Projekt abgeschlossen haben, erkunden Sie diese fortgeschrittenen Themen:

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
- [Azure Developer CLI auf GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Vorlagen & Beispiele
- [Offizielle Vorlagengalerie](https://azure.github.io/awesome-azd/)
- [Community-Vorlagen](https://github.com/Azure-Samples/azd-templates)
- [Enterprise-Muster](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Herzlichen Glückwunsch zum Abschluss Ihres ersten azd-Projekts!** Sie sind nun bereit, mit Zuversicht großartige Anwendungen auf Azure zu entwickeln und bereitzustellen.

---

**Kapitelnavigation:**
- **📚 Kursübersicht**: [AZD für Einsteiger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 1 - Grundlagen & Schnellstart
- **⬅️ Zurück**: [Installation & Einrichtung](installation.md)
- **➡️ Weiter**: [Konfiguration](configuration.md)
- **🚀 Nächstes Kapitel**: [Kapitel 2: KI-zentrierte Entwicklung](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Nächste Lektion**: [Bereitstellungsleitfaden](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir um Genauigkeit bemüht sind, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ausgangssprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
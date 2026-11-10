# Ihr Erstes Projekt - Praktische Anleitung

**Kapitel Navigation:**
- **📚 Kurs Startseite**: [AZD Für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 1 - Grundlagen & Schneller Start
- **⬅️ Vorheriges**: [Installation & Einrichtung](installation.md)
- **➡️ Nächstes**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Nächstes Kapitel**: [Kapitel 2: AI-First Entwicklung](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Einführung

Willkommen zu Ihrem ersten Azure Developer CLI Projekt! Sie werden eine Todo-Anwendung mit einem React-Frontend, Node.js API und Azure Cosmos DB bereitstellen. Die Vorlage behält den historischen Namen `todo-nodejs-mongo`; die aktuelle Infrastruktur verwendet Cosmos DB für NoSQL, also sehen Sie sich das heruntergeladene README und `infra/` an, anstatt die Datenbank-API aus dem Namen abzuleiten.

> Überprüft gegenüber `azd 1.37.2` und der öffentlichen Vorlage im November 2026. Die folgenden Beispiele verwenden Bash; JSON-Extraktion erfordert außerdem `jq`. Azure-Bereitstellungen verursachen Kosten und wurden während dieser Überprüfung nicht ausgeführt.

## Lernziele

Durch das Abschließen dieses Tutorials werden Sie:
- Den azd Projektinitialisierungs-Workflow mit Vorlagen meistern
- Die Azure Developer CLI Projektstruktur und Konfigurationsdateien verstehen
- Eine komplette Anwendungsbereitstellung in Azure mit Infrastrukturbereitstellung ausführen
- Anwendungsaktualisierungen und Wiederbereitstellungsstrategien implementieren
- Mehrere Umgebungen für Entwicklung und Staging verwalten
- Ressourcenbereinigung und Kostenmanagement anwenden

## Lernergebnisse

Nach Abschluss werden Sie in der Lage sein:
- Azd-Projekte von Vorlagen selbständig zu initialisieren und zu konfigurieren
- Azd-Projektstrukturen effektiv zu navigieren und zu modifizieren
- Full-Stack-Anwendungen mit einem einzigen Befehl auf Azure bereitzustellen
- Häufige Bereitstellungsprobleme und Authentifizierungsfehler zu beheben
- Mehrere Azure-Umgebungen für unterschiedliche Bereitstellungsphasen zu verwalten
- Continuous Deployment-Workflows für Anwendungsupdates zu implementieren

## Erste Schritte

### Voraussetzungen Checkliste
- ✅ Azure Developer CLI installiert ([Installationsanleitung](installation.md))
- ✅ AZD-Authentifizierung mit `azd auth login` abgeschlossen
- ✅ Git auf Ihrem System installiert
- ✅ Node.js 22 LTS (oder eine von der Vorlage unterstützte Version)
- ✅ Visual Studio Code (empfohlen)

Bevor Sie fortfahren, führen Sie den Setup-Validator aus dem Repository-Stammverzeichnis aus:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Überprüfen Sie Ihre Einrichtung
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Optionale Azure CLI Authentifizierung überprüfen

```bash
az account show
```

### Node.js Version überprüfen
```bash
node --version
```

## Schritt 1: Vorlage auswählen und initialisieren

Beginnen wir mit einer beliebten Todo-Anwendungs-Vorlage, die ein React-Frontend und einen Node.js API-Backend enthält.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Was gerade passiert ist?
- Die Vorlage wurde in Ihr lokales Verzeichnis heruntergeladen
- Eine `azure.yaml` Datei mit Dienstdefinitionen wurde erstellt
- Infrastrukturcode wurde im `infra/` Verzeichnis eingerichtet
- Eine Umgebungskonfiguration wurde erstellt

## Schritt 2: Projektstruktur erkunden

Sehen wir uns an, was azd für uns erstellt hat:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Sie sollten Folgendes sehen:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Wichtige Dateien zum Verstehen

**azure.yaml** - Das Herzstück Ihres azd Projekts:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Infrastrukturdefinition:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Schritt 3: Projekt anpassen (Optional)

Vor der Bereitstellung können Sie die Anwendung anpassen:

### Frontend modifizieren
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Nehmen Sie eine einfache Änderung vor:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Umgebungsvariablen konfigurieren
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Diese zwei benutzerdefinierten Werte demonstrieren nur lokale Speicherung. Die Standardvorlage verwendet weder `WEBSITE_TITLE` noch `API_VERSION`, daher ändern sie die App nicht. Die explizite Quelländerung oben ändert den angezeigten Titel.

## Schritt 4: Auf Azure bereitstellen

Jetzt zum spannenden Teil – stellen Sie alles auf Azure bereit!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Was passiert während der Bereitstellung?

Der Workflow stellt Infrastruktur bereit und paketiert/bereitstellt Code. Die genaue Reihenfolge kann durch `workflows.up` in `azure.yaml` angepasst werden; diese Vorlage spezifiziert erst Provisionierung, dann Bereitstellung. Verlassen Sie sich nicht auf eine universelle Phasenreihenfolge für jede Vorlage.

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

### Zugang zu Ihrer Anwendung
Klicken Sie auf die in der Bereitstellungsausgabe angegebene URL oder rufen Sie sie jederzeit ab:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Todo-App testen
1. **Todo-Element hinzufügen** - Klicken Sie auf "Add Todo" und geben Sie eine Aufgabe ein
2. **Als erledigt markieren** - Markieren Sie abgeschlossene Einträge
3. **Elemente löschen** - Entfernen Sie nicht mehr benötigte Todos

### Ihre Anwendung überwachen
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Überprüfen Sie Ihre Bereitstellung

Gehen Sie diese kurze Checkliste durch, um sicherzustellen, dass alles tatsächlich funktioniert – gehen Sie nicht davon aus, dass "Bereitstellung erfolgreich" bedeutet "App funktioniert":

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**Die Bereitstellung ist bestätigt, wenn:**
- ✅ `azd show` eine erreichbare Endpunkt-URL auflistet
- ✅ Die URL im Browser ohne Fehler geöffnet wird
- ✅ Kernfunktionen funktionieren (todo hinzufügen/abscheiden/löschen)
- ✅ `azd monitor --logs` zeigt eingehende Anfragen ohne unerwartete Fehler

Wenn eine Überprüfung fehlschlägt, springen Sie zu [Kapitel 7: Fehlerbehebung](../chapter-07-troubleshooting/README.md).

## Schritt 6: Änderungen vornehmen und erneut bereitstellen

Nehmen wir eine Änderung vor und sehen, wie einfach es ist zu aktualisieren:

### API modifizieren
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Fügen Sie einen benutzerdefinierten Antwort-Header hinzu:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Nur Code-Änderungen bereitstellen
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Schritt 7: Mehrere Umgebungen verwalten

Erstellen Sie eine Staging-Umgebung, um Änderungen vor der Produktion zu testen:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### Umgebungsvergleich
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Schritt 8: Ressourcen bereinigen

Wenn Sie fertig sind, bereinigen Sie, um laufende Kosten zu vermeiden:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Klassische App vs. KI-gestützte App: Gleicher Workflow

Sie haben gerade eine traditionelle Webanwendung bereitgestellt. Aber was, wenn Sie stattdessen eine KI-gestützte App bereitstellen wollten – etwa eine Chat-Anwendung, die von Microsoft Foundry Models unterstützt wird?

Die gute Nachricht: **der Workflow ist identisch.**

| Schritt | Klassische Todo App | KI Chat App |
|------|-----------------|-------------|
| Initialisieren (leeres Verzeichnis) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Authentifizieren | `azd auth login` | `azd auth login` |
| Bereitstellen | `azd up` | `azd up` |
| Überwachen | `azd monitor` | `azd monitor` |
| Bereinigen | `azd down --force --purge` | `azd down --force --purge` |

Die Lebenszyklusbefehle sind gleich, aber die Voraussetzungen unterscheiden sich. Eine KI-Vorlage kann Modellzugang, regionale Kontingente, Datenaufnahme und zusätzliche Konfiguration erfordern. Lesen Sie die README vor der Bereitstellung; `azd up` kann fehlende Berechtigungen oder Kontingente nicht bereitstellen.

Das ist das Kernprinzip von azd: **ein Workflow, jede Arbeitslast.** Die in diesem Tutorial geübten Fähigkeiten — Initialisierung, Bereitstellung, Überwachung, Wiederbereitstellung und Bereinigung — gelten gleichermaßen für KI-Anwendungen und Agenten.

---

## Was Sie gelernt haben

Herzlichen Glückwunsch! Sie haben erfolgreich:
- ✅ Ein azd Projekt von einer Vorlage initialisiert
- ✅ Die Projektstruktur und wichtige Dateien erkundet
- ✅ Eine Full-Stack-Anwendung in Azure bereitgestellt
- ✅ Codeänderungen vorgenommen und erneut bereitgestellt
- ✅ Mehrere Umgebungen verwaltet
- ✅ Ressourcen bereinigt

## 🎯 Fähigkeits-Validierungs-Übungen

### Übung 1: Eine andere Vorlage bereitstellen (15 Minuten)
**Ziel**: Beherrschung von azd init und Bereitstellungs-Workflow demonstrieren

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**Erfolgskriterien:**
- [ ] Anwendung fehlerfrei bereitstellen
- [ ] Auf die Anwendungs-URL im Browser zugreifen können
- [ ] Anwendung funktioniert korrekt (Todos hinzufügen/entfernen)
- [ ] Alle Ressourcen erfolgreich bereinigt

### Übung 2: Konfiguration anpassen (20 Minuten)
**Ziel**: Üben von lokaler Umgebungswertspeicherung ohne Verwechslung mit Laufzeitkonfiguration

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**Erfolgskriterien:**
- [ ] Eigene Umgebung erfolgreich erstellt
- [ ] Umgebungsvariablen gesetzt und abrufbar
- [ ] `azd env get-value APP_TITLE` gibt `My Custom Todo App` aus
- [ ] Erklären können, warum diese Werte die Standard-App nicht ändern, es sei denn, Code/Infrastruktur konsumieren sie

### Übung 3: Multi-Umgebungs-Workflow (25 Minuten)
**Ziel**: Verwaltung von Umgebungen und Bereitstellungsstrategien meistern

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
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
- ✅ Projektinitialisierung basierend auf Vorlagen
- ✅ Azure Ressourcenbereitstellung
- ✅ Anwendungsbereitstellungs-Workflows
- ✅ Umweltverwaltung
- ✅ Konfigurationsmanagement
- ✅ Ressourcenbereinigung und Kostenmanagement

**Nächste Stufe**: Sie sind bereit für den [Konfigurationsleitfaden](../chapter-03-configuration/configuration.md), um fortgeschrittene Konfigurationsmuster zu lernen!

## Fehlerbehebung bei häufigen Problemen

### Authentifizierungsfehler
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Bereitstellungsfehler
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Namenskonflikte bei Ressourcen
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Port-/Netzwerkprobleme
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Nächste Schritte

Jetzt, da Sie Ihr erstes Projekt abgeschlossen haben, erkunden Sie diese fortgeschrittenen Themen:

### 1. Infrastruktur anpassen
- [Infrastruktur als Code](../chapter-04-infrastructure/provisioning.md)
- [Datenbankinfrastruktur hinzufügen](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. CI/CD einrichten
- [Bereitstellungsleitfaden](../chapter-04-infrastructure/deployment-guide.md) - Vollständige CI/CD Workflows
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline-Konfiguration

### 3. Best Practices für Produktion
- [Bereitstellungsleitfaden](../chapter-04-infrastructure/deployment-guide.md) - Sicherheit, Performance und Überwachung

### 4. Weitere Vorlagen erkunden
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## Zusätzliche Ressourcen

### Lernmaterialien
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Community & Support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Entwickler-Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Vorlagen & Beispiele
- [Offizielle Vorlagengalerie](https://azure.github.io/awesome-azd/)
- [Community-Vorlagenbeiträge](https://github.com/Azure/awesome-azd)
- [Todo Vorlagenquelle](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Gratulation zum Abschluss Ihres ersten azd Projekts!** Sie sind nun bereit, mit Zuversicht großartige Anwendungen auf Azure zu erstellen und bereitzustellen.

---

**Kapitel Navigation:**
- **📚 Kurs Startseite**: [AZD Für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 1 - Grundlagen & Schneller Start
- **⬅️ Vorheriges**: [Installation & Einrichtung](installation.md)
- **➡️ Nächstes**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Nächstes Kapitel**: [Kapitel 2: AI-First Entwicklung](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
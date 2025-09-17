<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "67ffbcceec008228c4d22c1b3585844c",
  "translation_date": "2025-09-17T16:08:09+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "de"
}
-->
# Ihr erstes Projekt - Praktisches Tutorial

**Kapitel Navigation:**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 1 - Grundlagen & Schnellstart
- **⬅️ Vorheriges**: [Installation & Einrichtung](installation.md)
- **➡️ Nächstes**: [Konfiguration](configuration.md)
- **🚀 Nächstes Kapitel**: [Kapitel 2: AI-First Entwicklung](../ai-foundry/azure-ai-foundry-integration.md)

## Einführung

Willkommen zu Ihrem ersten Azure Developer CLI Projekt! Dieses umfassende praktische Tutorial bietet eine vollständige Anleitung zur Erstellung, Bereitstellung und Verwaltung einer Full-Stack-Anwendung auf Azure mit azd. Sie arbeiten mit einer echten Todo-Anwendung, die ein React-Frontend, ein Node.js-API-Backend und eine MongoDB-Datenbank umfasst.

## Lernziele

Durch den Abschluss dieses Tutorials werden Sie:
- Den Workflow zur Initialisierung eines azd-Projekts mit Vorlagen meistern
- Die Struktur und Konfigurationsdateien eines Azure Developer CLI Projekts verstehen
- Eine vollständige Anwendung mit Infrastrukturbereitstellung auf Azure bereitstellen
- Strategien für Anwendungsupdates und erneute Bereitstellung umsetzen
- Mehrere Umgebungen für Entwicklung und Staging verwalten
- Praktiken zur Ressourcensäuberung und Kostenmanagement anwenden

## Lernergebnisse

Nach Abschluss werden Sie in der Lage sein:
- azd-Projekte eigenständig aus Vorlagen zu initialisieren und zu konfigurieren
- azd-Projektstrukturen effektiv zu navigieren und zu ändern
- Full-Stack-Anwendungen mit einfachen Befehlen auf Azure bereitzustellen
- Häufige Bereitstellungsprobleme und Authentifizierungsfehler zu beheben
- Mehrere Azure-Umgebungen für verschiedene Bereitstellungsstufen zu verwalten
- Kontinuierliche Bereitstellungs-Workflows für Anwendungsupdates umzusetzen

## Erste Schritte

### Checkliste der Voraussetzungen
- ✅ Azure Developer CLI installiert ([Installationsanleitung](installation.md))
- ✅ Azure CLI installiert und authentifiziert
- ✅ Git auf Ihrem System installiert
- ✅ Node.js 16+ (für dieses Tutorial)
- ✅ Visual Studio Code (empfohlen)

### Überprüfen Sie Ihre Einrichtung
```bash
# Check azd installation
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

Beginnen wir mit einer beliebten Todo-Anwendungsvorlage, die ein React-Frontend und ein Node.js-API-Backend umfasst.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Was ist gerade passiert?
- Der Vorlagencode wurde in Ihr lokales Verzeichnis heruntergeladen
- Eine `azure.yaml`-Datei mit Dienstdefinitionen wurde erstellt
- Infrastrukturcode wurde im Verzeichnis `infra/` eingerichtet
- Eine Umgebungs-Konfiguration wurde erstellt

## Schritt 2: Projektstruktur erkunden

Schauen wir uns an, was azd für uns erstellt hat:

```bash
# View the project structure
tree /f   # Windows
# or
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
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Infrastrukturdefinition:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Schritt 3: Projekt anpassen (optional)

Vor der Bereitstellung können Sie die Anwendung anpassen:

### Frontend ändern
```bash
# Open the React app component
code src/web/src/App.tsx
```

Nehmen Sie eine einfache Änderung vor:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Umgebungsvariablen konfigurieren
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Schritt 4: Bereitstellung auf Azure

Jetzt kommt der spannende Teil - alles auf Azure bereitstellen!

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

Der Befehl `azd up` führt folgende Schritte aus:
1. **Bereitstellen** (`azd provision`) - Erstellt Azure-Ressourcen
2. **Paketieren** - Baut Ihren Anwendungscode
3. **Bereitstellen** (`azd deploy`) - Stellt Code auf Azure-Ressourcen bereit

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

### Zugriff auf Ihre Anwendung
Klicken Sie auf die URL, die in der Bereitstellungsausgabe bereitgestellt wird, oder rufen Sie sie jederzeit ab:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo-App testen
1. **Todo-Element hinzufügen** - Klicken Sie auf "Add Todo" und geben Sie eine Aufgabe ein
2. **Als erledigt markieren** - Haken Sie erledigte Elemente ab
3. **Elemente löschen** - Entfernen Sie Todos, die Sie nicht mehr benötigen

### Anwendung überwachen
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Schritt 6: Änderungen vornehmen und erneut bereitstellen

Nehmen wir eine Änderung vor und sehen, wie einfach es ist, ein Update durchzuführen:

### API ändern
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Fügen Sie einen benutzerdefinierten Antwort-Header hinzu:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Nur die Codeänderungen bereitstellen
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

### Vergleich der Umgebungen
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Schritt 8: Ressourcen bereinigen

Wenn Sie mit dem Experimentieren fertig sind, bereinigen Sie, um laufende Kosten zu vermeiden:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Was Sie gelernt haben

Herzlichen Glückwunsch! Sie haben erfolgreich:
- Ein azd-Projekt aus einer Vorlage initialisiert
- Die Projektstruktur und wichtige Dateien erkundet
- Eine Full-Stack-Anwendung auf Azure bereitgestellt
- Codeänderungen vorgenommen und erneut bereitgestellt
- Mehrere Umgebungen verwaltet
- Ressourcen bereinigt

## Häufige Probleme beheben

### Authentifizierungsfehler
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Bereitstellungsfehler
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Ressourcennamenskonflikte
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
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
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
- **🚀 Nächstes Kapitel**: [Kapitel 2: AI-First Entwicklung](../ai-foundry/azure-ai-foundry-integration.md)
- **Nächste Lektion**: [Bereitstellungsanleitung](../deployment/deployment-guide.md)

---

**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.
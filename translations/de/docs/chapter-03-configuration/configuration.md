# Konfigurationsanleitung

**Kapitelnavigation:**
- **📚 Kursstartseite**: [AZD Für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 3 – Konfiguration & Authentifizierung
- **⬅️ Zurück**: [Dein erstes Projekt](../chapter-01-foundation/first-project.md)
- **➡️ Weiter**: [Bereitstellungsanleitung](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Nächstes Kapitel**: [Kapitel 4: Infrastruktur als Code](../chapter-04-infrastructure/deployment-guide.md)

## Einführung

> Überprüft anhand von `azd 1.37.2` (November 2026). Bash-Befehle setzen ein initialisiertes azd-Projekt voraus. Sofern nicht ausdrücklich als vollständige Datei beschrieben, sind YAML/Bicep-Schnipsel Fragmente zum Einfügen in entsprechende Projektdateien und keine eigenständigen ausführbaren Projekte.

Diese umfassende Anleitung behandelt alle Aspekte der Konfiguration der Azure Developer CLI für optimale Entwicklungs- und Bereitstellungs-Workflows. Sie lernen die Konfigurationshierarchie, das Umweltmanagement, Authentifizierungsmethoden und fortgeschrittene Konfigurationsmuster kennen, die effiziente und sichere Azure-Bereitstellungen ermöglichen.

## Lernziele

Am Ende dieser Lektion werden Sie:
- Die azd-Konfigurationshierarchie meistern und verstehen, wie Einstellungen priorisiert werden
- Globale und projektspezifische Einstellungen effektiv konfigurieren
- Mehrere Umgebungen mit unterschiedlichen Konfigurationen verwalten
- Sichere Authentifizierungs- und Autorisierungsmuster implementieren
- Fortgeschrittene Konfigurationsmuster für komplexe Szenarien verstehen

## Lernergebnisse

Nach Abschluss dieser Lektion können Sie:
- azd für optimale Entwicklungsworkflows konfigurieren
- Mehrere Bereitstellungsumgebungen einrichten und verwalten
- Sichere Konfigurationsmanagementpraktiken umsetzen
- Konfigurationsbedingte Probleme beheben
- azd-Verhalten für spezifische organisatorische Anforderungen anpassen

Diese umfassende Anleitung behandelt alle Aspekte der Konfiguration der Azure Developer CLI für optimale Entwicklungs- und Bereitstellungs-Workflows.

## Verstehen von KI-Agenten in einem azd-Projekt

Wenn Sie neu bei KI-Agenten sind, hier eine einfache Art, sie innerhalb der azd-Welt zu verstehen.

### Was ist ein Agent?

Ein Agent ist ein Softwarebestandteil, der eine Anfrage erhalten, darüber nachdenken und Aktionen ausführen kann – häufig durch Aufruf eines KI-Modells, Abruf von Daten oder Aufruf anderer Dienste. In einem azd-Projekt ist ein Agent einfach ein weiterer **Dienst** neben Ihrem Web-Frontend oder API-Backend.

### Wie Agenten in die azd-Projektstruktur passen

Ein azd-Projekt besteht aus drei Schichten: **Infrastruktur**, **Code** und **Konfiguration**. Agenten verbinden sich mit diesen Schichten auf dieselbe Weise wie jeder andere Dienst:

| Schicht | Funktion für eine traditionelle App | Funktion für einen Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastruktur** (`infra/`) | Stellt eine Web-App und Datenbank bereit | Stellt einen KI-Modell-Endpunkt, Suchindex oder Agent-Host bereit |
| **Code** (`src/`) | Enthält Ihren Frontend- und API-Quellcode | Enthält Ihre Agent-Logik und Prompt-Definitionen |
| **Konfiguration** (`azure.yaml`) | Listet Ihre Dienste und ihre Hosting-Ziele auf | Listet Ihren Agent als Dienst, verweist auf Code und Host |

### Die Rolle von `azure.yaml`

Sie müssen die Syntax jetzt nicht auswendig lernen. Konzeptuell ist `azure.yaml` die Datei, in der Sie azd mitteilen: *„Hier sind die Dienste, die meine Anwendung bilden, und hier ist der jeweilige Quellcode.“*

Wenn Ihr Projekt einen KI-Agenten enthält, listet `azure.yaml` diesen einfach als einen der Dienste auf. azd weiß dann, die passende Infrastruktur bereitzustellen (wie Microsoft Foundry Models-Endpunkt oder Container-App zur Agenten-Hostung) und Ihren Agenten-Code zu deployen – wie es bei einer Web-App oder API der Fall ist.

Das bedeutet, dass es nichts grundsätzlich Neues zu lernen gibt. Wenn Sie verstehen, wie azd einen Webdienst verwaltet, verstehen Sie bereits, wie es einen Agenten verwaltet.

## Konfigurationshierarchie

azd hat verschiedene Konfigurationsbereiche, keine universelle Überlagerung:
- **Globale Benutzervoreinstellungen**: `~/.azd/config.json`, verwaltet von `azd config`.
- **Projektdefinition**: `azure.yaml` spezifiziert Dienste, Infrastruktur und Hooks.
- **Lokale Umgebungswahl**: `.azure/config.json`.
- **Werte pro Umgebung**: `.azure/<name>/.env`, verwaltet von `azd env`; zusätzliche Einstellungen befinden sich in jener Umgebung im `config.json`.
- **Flags und Prozessvariablen**: überschreiben nur Einstellungen, die von einem bestimmten Befehl/Provider unterstützt werden.

Ein beliebiger `azd env set`-Wert wird nicht automatisch zu einem Infrastrukturparameter oder einem bereitgestellten Anwendungseinstellung. Verweisen Sie ihn ausdrücklich in der Parameterdatei, unterstützten Dienstkonfiguration oder einem Hook.

## Globale Konfiguration

### Globale Standardwerte festlegen
```bash
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# View all global configuration
azd config show

# Remove a configuration
azd config unset defaults.location
```

### Gängige globale Einstellungen
```bash
# Discover supported settings instead of inventing configuration keys
azd config options
azd config list-alpha

# Explicit opt-in only: use Azure CLI credentials rather than azd's default login
azd config set auth.useAzCliAuth true
# Restore azd's default credential behavior
azd config unset auth.useAzCliAuth

# Use per-command flags for supported behavior
azd show --output json
azd deploy --timeout 1800   # seconds; stops waiting, not the Azure-side deployment
```

## 🏗️ Projektkonfiguration

### azure.yaml-Struktur
Die `azure.yaml`-Datei ist das Herzstück Ihres azd-Projekts:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0

# Service definitions
services:
  # Frontend service
  web:
    project: ./src/web              # Source code location
    language: js                    # Programming language
    host: appservice               # Azure service type
    dist: dist                     # Build output directory
    
  # Backend API service  
  api:
    project: ./src/api
    language: python
    host: containerapp
    docker:
      context: .
      path: Dockerfile
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location

# Deployment hooks
hooks:
  preprovision:                    # Before infrastructure deployment
    shell: sh
    run: |
      echo "Preparing infrastructure..."
      ./scripts/validate-config.sh
      
  postprovision:                   # After infrastructure deployment
    shell: pwsh
    run: |
      Write-Host "Infrastructure deployed successfully"
      ./scripts/setup-database.ps1
      
  predeploy:                       # Before application deployment
    shell: sh
    run: |
      echo "Building application..."
      npm run build
      
  postdeploy:                      # After application deployment
    shell: sh
    run: |
      echo "Running post-deployment tests..."
      npm run test:integration

# Pipeline configuration
pipeline:
  provider: github                 # CI/CD provider
  variables:
    - AZURE_CLIENT_ID
    - AZURE_TENANT_ID
  secrets:
    - AZURE_CLIENT_SECRET
```

Dies ist ein **Projektdefinitionsbeispiel**, kein mitgeliefertes Starterprojekt. Erstellen Sie die referenzierten Quellverzeichnisse, Hook-Skripte, Paketskripte sowie passende `infra/main.bicep`/`main.parameters.json`, bevor Sie es ausführen. Datenbanken gehören zur Infrastruktur; `postgres` ist kein eingebauter Diensthost. Infrastrukturparameter gehören in die Parameterdatei des Providers, nicht in `infra.parameters`.

### Optionen zur Dienstkonfiguration

#### Hosttypen
```yaml
services:
  web-static:
    host: staticwebapp           # Azure Static Web Apps
    
  web-dynamic:
    host: appservice            # Azure App Service
    
  api-containers:
    host: containerapp          # Azure Container Apps
    
  api-functions:
    host: function              # Azure Functions
    
  api-spring:
    host: springapp             # Azure Spring Apps
```

#### Sprachspezifische Build-Hooks

Die folgenden Dienstfragmente veranschaulichen Hooks; fügen Sie sie in die echte `project` und `host` jedes Dienstes ein. `buildCommand` und `startCommand` sind keine generischen azd-Diensteigenschaften. Konfigurieren Sie den Startup in der Anwendung, Dockerfile oder Host-Infrastruktur.

```yaml
services:
  node-app:
    project: ./src/node
    host: appservice
    language: js
    hooks:
      prepackage:
        shell: sh
        run: npm run build
    
  python-app:
    project: ./src/python
    host: appservice
    language: python
    
  dotnet-app:
    project: ./src/dotnet
    host: appservice
    language: csharp
    
  java-app:
    project: ./src/java
    host: appservice
    language: java
```

## 🌟 Umweltmanagement

### Erstellen von Umgebungen
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Umweltkonfiguration
Kernwerte der Umgebung liegen in `.azure/<env-name>/.env`, inklusive `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID` und `AZURE_LOCATION`. Für zusätzliche JSON-Umgebungseinstellungen verwenden Sie `azd env config get/set`. Das folgende JSON ist **konzeptioneller Anwendungszustand**, kein azd-Konfigurationsschema; kopieren Sie es nicht in azd-Dateien:

```json
{
  "version": 1,
  "environmentName": "development",
  "subscriptionId": "12345678-1234-1234-1234-123456789abc",
  "location": "eastus2",
  "resourceGroupName": "rg-myapp-dev-eastus2",
  "services": {
    "web": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.Web/sites/web-abc123",
      "endpoints": ["https://web-abc123.azurewebsites.net"]
    },
    "api": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.App/containerApps/api-def456",
      "endpoints": ["https://api-def456.azurecontainerapps.io"]
    }
  }
}
```

### Umgebungsvariablen

**Nur zur Demonstration als Klartext.** Gewöhnliche `azd env set`-Werte werden in `.azure/<name>/.env` geschrieben und können von Lesebefehlen ausgegeben werden. Verwenden Sie den Beispiel-API-Schlüssel nicht als echtes Credential. Für Geheimnisse nutzen Sie `azd env set-secret` und explizite Laufzeit-Verknüpfung.

```bash
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Expected output:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Remove environment variable
azd env unset DEBUG

# Verify removal
azd env get-values | grep DEBUG
# (should return nothing)
```

### Umweltvorlagen
Erstellen Sie eine **nicht geheime, manuell gepflegte** `.env.example` im Projektstamm für konsistente Einrichtung. azd lädt nicht automatisch eine Datei namens `env.template`:
```bash
# Required variables
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Application settings
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Optional development settings
DEBUG=false
LOG_LEVEL=info
```

### Umgebungen über ein Team teilen

Wenn mehr als eine Person an einem Projekt arbeitet, müssen Sie sich einigen, **was mit dem Repo mitreist und was lokal bleibt**. azd hält jede Umgebung unter einem `.azure/`-Ordner, und nicht alles davon sollte committet werden.

**Was in `.azure/` liegt:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**Was man gitignoret.** Die Standard-`.gitignore` von azd schließt bereits `.azure/` aus. Behalten Sie es dabei – die Dateien in `.env` können Geheimnisse enthalten, und Ressourcen-IDs sind spezifisch für den Bereitsteller. Jeder Teamkollege erstellt seine **eigene** Umgebung lokal:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**Zwischen Umgebungen wechseln.** Ein Entwickler, der mehrere Umgebungen verwaltet, wählt vor Befehlsausführung die aktive aus:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**Nicht geheime Standardwerte für das Team bereitstellen.** Comitten Sie `.env.example` außerhalb des ignorierten `.azure/`-Verzeichnisses. Neue Teammitglieder kopieren es auf eine lokal ignorierte Datei, füllen Werte aus und importieren es explizit mit `azd env set --file <local-file>`. Importieren Sie niemals leere Platzhalter über eine funktionierende Umgebung.

**Umgebungen in CI/CD.** Pipelines lesen Ihren lokalen `.azure/`-Ordner nicht. Stattdessen stellen Sie die Umgebungswerte als Pipeline-Variablen/Geheimnisse bereit und azd liest sie aus der Prozessumgebung:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Faustregel:** Infrastrukturcode (`infra/`, `azure.yaml`) wird in Git geteilt; Umwelt-*Status und Geheimnisse* (`.azure/`) sind pro Entwickler und Pipeline. `azd pipeline config` richtet die Pipeline-Variablen automatisch für Sie ein.

## 🔐 Authentifizierungskonfiguration

### Azure CLI-Integration
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Service Principal Authentifizierung
Für CI/CD-Pipelines:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### Managed Identity
Für Azure-gehostete Umgebungen:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ Infrastrukturkonfiguration

### Bicep-Parameter
Konfigurieren Sie Infrastrukturparameter in `infra/main.parameters.json`:
```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSkuName": {
      "value": "B1"
    },
    "databaseSkuName": {
      "value": "Standard_B1ms"
    }
  }
}
```

### Terraform-Konfiguration
Für Terraform-Projekte ersetzt azd Platzhalter in `infra/main.tfvars.json`. Diese Namen müssen mit den deklarierten Terraform-Eingabevariablen übereinstimmen:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 Bereitstellungskonfiguration

### Build-Konfiguration
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    host: appservice
    language: js
    dist: build
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          NODE_ENV=production REACT_APP_API_URL="$API_URL" npm run build:prod
    
  api:
    project: ./src/api
    host: appservice
    language: python
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          python -m pip install -r requirements.txt
          PYTHONPATH=src python -m pytest tests/
```

### Docker-Konfiguration
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - NODE_ENV=production
        - API_VERSION=v1.0.0
```
Pfad sind relativ zum Dienstprojekt. Die Dockerfile muss alle konsumierten `ARG`-Werte deklarieren. Für Multi-Stufen-Build legen Sie die bereitstellbare Stufe zuletzt oder verwenden einen benutzerdefinierten Verpackungsworkflow; `docker.target` ist keine unterstützte Eigenschaft im geprüften Schema.

## 🔧 Erweiterte Konfiguration

### Benutzerdefinierte Ressourcenbenennung
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Definieren Sie tatsächliche Ressourcennamen in Bicep/Terraform und halten Sie die Ressourcengruppenerstellung konsistent mit dieser Einstellung. Es gibt keine generischen `naming.storageAccount` oder `naming.keyVault` Konfigurationsschlüssel.

### Netzwerkkonfiguration
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Fügen Sie diese **illustrativen Parametereinträge** in `infra/main.parameters.json` unter `parameters` ein und deklarieren sowie konsumieren Sie die passenden Parameter in Bicep. Sie bewirken allein nichts.

### Überwachungskonfiguration
Stellen Sie Application Insights und Log Analytics in Bicep/Terraform bereit und konfigurieren Sie die Anwendungs-Telemetrie in Ihrem SDK. Es gibt keinen generischen Top-Level-`monitoring`-Block in `azure.yaml`, der diese Ressourcen erstellt. Siehe [Überwachungsinfrastruktur](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 Umgebungsbezogene Konfigurationen

### Entwicklungsumgebung
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Staging-Umgebung
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Produktionsumgebung
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Konfigurationsvalidierung

### Konfiguration validieren
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### Konfigurationsskripte
Erstellen Sie Validierungsskripte in `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check required environment variables
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Ask azd to load the project (not full schema or infrastructure validation)
if ! azd show --output json; then
  echo "Error: Could not load the azd project"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Best Practices

### 1. Verwenden Sie Umgebungsvariablen
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

Vermeiden Sie das Hardcoden sensitiver Werte (separat illustrativ konfiguriert, kein zweiter `database`-Schlüssel in derselben Datei):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organisieren Sie Konfigurationsdateien
```
.azure/
├── config.json              # Global project config
├── development/
│   ├── config.json         # Dev environment config
│   └── .env                # Dev environment variables
├── staging/
│   ├── config.json         # Staging environment config
│   └── .env                # Staging environment variables
└── production/
    ├── config.json         # Production environment config
    └── .env                # Production environment variables
```

### 3. Überlegungen zur Versionskontrolle
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Konfigurationsdokumentation
Dokumentieren Sie Ihre Konfiguration in `CONFIG.md`:
```markdown
# Configuration Guide

## Required Environment Variables
- `DATABASE_CONNECTION_STRING`: Connection string for the database
- `API_KEY`: API key for external service
- `STORAGE_ACCOUNT_KEY`: Azure Storage account key

## Environment-Specific Settings
- Development: Uses local database, debug logging enabled
- Staging: Uses staging database, info logging
- Production: Uses production database, error logging only
```

## 🎯 Praktische Übungen

### Übung 1: Multi-Umgebungskonfiguration (15 Minuten)

**Ziel**: Erstellen und konfigurieren Sie drei lokale Umgebungen mit unterschiedlichen Werten. Beginnen Sie in einem initialisierten Projekt; verwenden Sie ungenutzte Namen, wenn diese bereits existieren. Diese anwendungsspezifischen Werte ändern Telemetrie-/Laufzeiteinstellungen erst, wenn Ihre Vorlage sie konsumiert.

```bash
# Create development environment
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Create staging environment
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Create production environment
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verify each environment
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Erfolgskriterien:**
- [ ] Drei Umgebungen erfolgreich erstellt
- [ ] Jede Umgebung hat eine einzigartige Konfiguration
- [ ] Wechseln zwischen Umgebungen ohne Fehler möglich
- [ ] `azd env list` zeigt alle drei Umgebungen

### Übung 2: Key Vault Geheimnisverweise (10-20 Minuten)

**Ziel**: Speichern Sie eine Key Vault-Referenz statt als Klartext. **Ausgangspunkt:** eine initialisierte Umgebung, Azure-Anmeldung und Zugriff auf einen Key Vault mit Berechtigungen, ein Dummy-Geheimnis zu erstellen/lesen. Vault-Operationen können Kosten verursachen.

```bash
# Follow the interactive prompts; use a dummy training value, not a production key
azd env set-secret TRAINING_API_KEY

# Set non-secret config
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Inspect .azure/<environment>/.env locally: TRAINING_API_KEY should
# contain an azd Key Vault reference, not the dummy secret text.
# Do not print resolved values in CI or shared terminal logs.
```

**Erfolgskriterien:**
- [ ] Interaktiver Befehl berichtet den ausgewählten Vault und Geheimnisverweis
- [ ] Lokales `.env` enthält eine Referenz anstelle des Dummy-Geheimnisses
- [ ] Kann erklären, dass Laufzeit-Identität/RBAC und Nutzung noch konfiguriert werden müssen

**Häufige Probleme:** Ein 403 benötigt die korrekte Vault-Datenebenenrolle und Propagationszeit; `azd env set ... --secret` ist kein gültiger Befehl. Gewöhnliche `get-values`/`get-value`-Ausgabe darf nicht als redigiert angenommen werden. Entfernen Sie die Trainingsreferenz mit `azd env unset TRAINING_API_KEY`; dies löscht nicht das Vault-Geheimnis, das Sie gegebenenfalls separat bereinigen müssen, wenn Sie es erstellt haben.

## Nächste Schritte

- [Dein erstes Projekt](../chapter-01-foundation/first-project.md) – Konfiguration in der Praxis anwenden
- [Bereitstellungsanleitung](../chapter-04-infrastructure/deployment-guide.md) – Konfiguration für die Bereitstellung verwenden
- [Ressourcen bereitstellen](../chapter-04-infrastructure/provisioning.md) – Produktionsreife Konfigurationen

## Referenzen

- [azd-Konfigurationsreferenz](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml-Schema](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Umgebungsvariablen](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**Kapitelnavigation:**
- **📚 Kurs Startseite**: [AZD Für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 3 - Konfiguration & Authentifizierung
- **⬅️ Vorheriges**: [Dein Erstes Projekt](../chapter-01-foundation/first-project.md)
- **➡️ Nächstes Kapitel**: [Kapitel 4: Infrastruktur als Code](../chapter-04-infrastructure/deployment-guide.md)
- **Nächste Lektion**: [Authentifizierung & Sicherheit](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
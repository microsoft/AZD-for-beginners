# Konfigurationsanleitung

**Chapter Navigation:**
- **📚 Course Home**: [AZD für Anfänger](../../README.md)
- **📖 Current Chapter**: Kapitel 3 - Konfiguration & Authentifizierung
- **⬅️ Previous**: [Ihr erstes Projekt](first-project.md)
- **➡️ Next**: [Bereitstellungsanleitung](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [Kapitel 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## Einführung

Dieses umfassende Handbuch behandelt alle Aspekte der Konfiguration der Azure Developer CLI für optimale Entwicklungs- und Bereitstellungs-Workflows. Sie erfahren mehr über die Konfigurationshierarchie, das Management von Umgebungen, Authentifizierungsmethoden und erweiterte Konfigurationsmuster, die effiziente und sichere Azure-Bereitstellungen ermöglichen.

## Lernziele

Am Ende dieser Lektion werden Sie:
- Die azd-Konfigurationshierarchie meistern und verstehen, wie Einstellungen priorisiert werden
- Globale und projektspezifische Einstellungen effektiv konfigurieren
- Mehrere Umgebungen mit unterschiedlichen Konfigurationen verwalten
- Sichere Authentifizierungs- und Autorisierungsmuster implementieren
- Erweiterte Konfigurationsmuster für komplexe Szenarien verstehen

## Lernergebnisse

Nach Abschluss dieser Lektion sind Sie in der Lage:
- azd für optimale Entwicklungs-Workflows zu konfigurieren
- Mehrere Bereitstellungsumgebungen einzurichten und zu verwalten
- Sichere Praktiken für das Konfigurationsmanagement umzusetzen
- Konfigurationsbezogene Probleme zu beheben
- azd-Verhalten für spezifische organisatorische Anforderungen anzupassen

Dieses umfassende Handbuch behandelt alle Aspekte der Konfiguration der Azure Developer CLI für optimale Entwicklungs- und Bereitstellungs-Workflows.

## Verständnis von KI-Agenten in einem azd-Projekt

Wenn Sie neu bei KI-Agenten sind, hier eine einfache Vorgehensweise, um sie im azd-Kontext zu betrachten.

### Was ist ein Agent?

Ein Agent ist eine Softwarekomponente, die eine Anfrage empfangen, darüber nachdenken und Aktionen ausführen kann – oft durch Aufruf eines KI-Modells, Abfrage von Daten oder Aufrufen anderer Dienste. In einem azd-Projekt ist ein Agent einfach ein weiterer **Service** neben Ihrem Web-Frontend oder API-Backend.

### Wie Agenten in die azd-Projektstruktur passen

Ein azd-Projekt besteht aus drei Ebenen: **infrastructure**, **code** und **configuration**. Agenten fügen sich in diese Ebenen auf dieselbe Weise ein wie jeder andere Dienst:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Stellt eine Webanwendung und Datenbank bereit | Stellt einen Microsoft Foundry Models Endpoint, einen Suchindex oder einen Agent-Host bereit |
| **Code** (`src/`) | Enthält Ihren Frontend- und API-Quellcode | Enthält Ihre Agentenlogik und Prompt-Definitionen |
| **Configuration** (`azure.yaml`) | Listet Ihre Services und deren Hosting-Ziele auf | Listet Ihren Agenten als Service auf und verweist auf dessen Code und Host |

### Die Rolle von `azure.yaml`

Sie müssen die Syntax jetzt nicht auswendig lernen. Konzeptionell ist `azure.yaml` die Datei, in der Sie azd mitteilen: „Hier sind die Dienste, die meine Anwendung ausmachen, und hier ist der Ort, an dem ihr Code zu finden ist.“

Wenn Ihr Projekt einen KI-Agenten enthält, listet `azure.yaml` diesen einfach als einen der Dienste auf. azd weiß dann, die passende Infrastruktur bereitzustellen (wie beispielsweise einen Microsoft Foundry Models Endpoint oder eine Container App zum Hosten des Agenten) und Ihren Agentencode bereitzustellen – genauso wie bei einer Webanwendung oder API.

Das bedeutet, es gibt nichts grundlegend Neues zu lernen. Wenn Sie verstehen, wie azd einen Webdienst verwaltet, verstehen Sie bereits, wie es einen Agenten verwaltet.

## Konfigurationshierarchie

azd verwendet ein hierarchisches Konfigurationssystem:
1. **Command-line flags** (höchste Priorität)
2. **Environment variables**
3. **Local project configuration** (`.azd/config.json`)
4. **Global user configuration** (`~/.azd/config.json`)
5. **Default values** (niedrigste Priorität)

## Globale Konfiguration

### Globale Standardwerte festlegen
```bash
# Standardabonnement festlegen
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Standardstandort festlegen
azd config set defaults.location "eastus2"

# Standard-Namenskonvention für Ressourcengruppen festlegen
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Alle globalen Konfigurationen anzeigen
azd config show

# Eine Konfiguration entfernen
azd config unset defaults.location
```

### Häufige globale Einstellungen
```bash
# Entwicklungspräferenzen
azd config set alpha.enable true                    # Alpha-Funktionen aktivieren
azd config set telemetry.enabled false             # Telemetrie deaktivieren
azd config set output.format json                  # Ausgabeformat festlegen

# Sicherheitseinstellungen
azd config set auth.useAzureCliCredential true     # Azure CLI zur Authentifizierung verwenden
azd config set tls.insecure false                  # TLS-Überprüfung erzwingen

# Leistungsoptimierung
azd config set provision.parallelism 5             # Parallele Ressourcenerstellung
azd config set deploy.timeout 30m                  # Bereitstellungszeitlimit
```

## 🏗️ Projektkonfiguration

### Aufbau von azure.yaml
Die `azure.yaml`-Datei ist das Herz Ihres azd-Projekts:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0
  templateBranch: main

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
      context: ./src/api
      dockerfile: Dockerfile
    
  # Database service
  database:
    project: ./src/db
    host: postgres
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location
  parameters:
    environmentName: ${AZURE_ENV_NAME}
    location: ${AZURE_LOCATION}

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

### Servicekonfigurationsoptionen

#### Host-Typen
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

#### Sprachspezifische Einstellungen
```yaml
services:
  node-app:
    language: js
    buildCommand: npm run build
    startCommand: npm start
    
  python-app:
    language: python
    buildCommand: pip install -r requirements.txt
    startCommand: gunicorn app:app
    
  dotnet-app:
    language: csharp
    buildCommand: dotnet build
    startCommand: dotnet run
    
  java-app:
    language: java
    buildCommand: mvn clean package
    startCommand: java -jar target/app.jar
```

## 🌟 Umgebungsverwaltung

### Erstellen von Umgebungen
```bash
# Neue Umgebung erstellen
azd env new development

# Mit bestimmtem Ort erstellen
azd env new staging --location "westus2"

# Aus Vorlage erstellen
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Umgebungs-Konfiguration
Jede Umgebung hat ihre eigene Konfiguration in `.azure/<env-name>/config.json`:

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
```bash
# Umgebungsspezifische Variablen setzen
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Umgebungsvariablen anzeigen
azd env get-values

# Erwartete Ausgabe:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Umgebungsvariable entfernen
azd env unset DEBUG

# Entfernung überprüfen
azd env get-values | grep DEBUG
# (sollte nichts zurückgeben)
```

### Umgebungsvorlagen
Erstellen Sie `.azure/env.template` für eine einheitliche Umgebungseinrichtung:
```bash
# Erforderliche Variablen
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Anwendungseinstellungen
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Optionale Entwicklungseinstellungen
DEBUG=false
LOG_LEVEL=info
```

### Umgebungen im Team teilen

Wenn mehr als eine Person an einem Projekt arbeitet, müssen Sie sich darauf einigen, **was mit dem Repo mitgereist wird und was lokal bleibt**. azd legt jede Umgebung unter einem `.azure/`-Ordner ab, und nicht alles davon sollte committet werden.

**Was sich in `.azure/` befindet:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**Was in die .gitignore gehört.** azd's Standard-`.gitignore` schließt `.azure/` bereits aus. Behalten Sie das bei—die `.env`-Dateien können Geheimnisse enthalten, und Ressourcen-IDs sind spezifisch für die Person, die sie bereitgestellt hat. Jeder Teamkollege erstellt seine **eigene** Umgebung lokal:

```bash
# Jeder Entwickler führt dies einmal aus, um seine eigene isolierte Umgebung zu erhalten.
azd env new dev-alice
azd up
```

**Wechseln zwischen Umgebungen.** Ein Entwickler, der mehrere Umgebungen verwaltet, wählt die aktive Umgebung aus, bevor er Befehle ausführt:

```bash
azd env list                 # alle lokalen Umgebungen und welche die Standardumgebung ist anzeigen
azd env select staging       # die Umgebung 'staging' zur aktiven Umgebung machen
azd env get-values           # bestätigen, dass auf die richtige Umgebung gezeigt wird
```

**Nicht-geheime Standardwerte dem Team bereitstellen.** Committen Sie eine Vorlage (wie die `.azure/env.template` oben), damit jeder weiß, welche Variablen gesetzt werden müssen—aber committen Sie niemals die ausgefüllten Werte. Neue Teammitglieder kopieren die Vorlage und füllen ihre eigenen Werte aus.

**Umgebungen in CI/CD.** Pipelines lesen Ihren lokalen `.azure/`-Ordner nicht. Stattdessen stellen Sie die Umgebungswerte als Pipeline-Variablen/Geheimnisse bereit, und azd liest sie aus der Prozessumgebung:

```bash
# In CI liest azd diese aus der Umgebung, nicht aus .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **Faustregel:** Infrastruktur-Code (`infra/`, `azure.yaml`) wird in Git geteilt; Umgebungs*zustand und -geheimnisse* (`.azure/`) sind pro Entwickler und pro Pipeline. `azd pipeline config` richtet die Pipeline-Variablen automatisch für Sie ein.

## 🔐 Authentifizierungs-Konfiguration

### Azure CLI-Integration
```bash
# Azure CLI-Anmeldeinformationen verwenden (Standard)
azd config set auth.useAzureCliCredential true

# Mit bestimmtem Mandanten anmelden
az login --tenant <tenant-id>

# Standardabonnement festlegen
az account set --subscription <subscription-id>
```

### Authentifizierung mit Service Principal
Für CI/CD-Pipelines:
```bash
# Umgebungsvariablen setzen
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Oder direkt konfigurieren
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
Für in Azure gehostete Umgebungen:
```bash
# Authentifizierung mit verwalteter Identität aktivieren
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
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
Für Terraform-Projekte konfigurieren Sie in `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Bereitstellungskonfiguration

### Build-Konfiguration
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    language: js
    buildCommand: npm run build:prod
    buildEnvironment:
      NODE_ENV: production
      REACT_APP_API_URL: ${API_URL}
    dist: build
    
  api:
    project: ./src/api
    language: python
    buildCommand: |
      pip install -r requirements.txt
      python -m pytest tests/
    buildEnvironment:
      PYTHONPATH: src
```

### Docker-Konfiguration
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        NODE_ENV: production
        API_VERSION: v1.0.0
```
Beispiel `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Erweiterte Konfiguration

### Benutzerdefinierte Ressourcennamensgebung
```bash
# Namenskonventionen festlegen
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Netzwerkkonfiguration
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Überwachungskonfiguration
```yaml
# In azure.yaml
monitoring:
  applicationInsights:
    enabled: true
    samplingPercentage: 100
  logAnalytics:
    enabled: true
    retentionDays: 30
```

## 🎯 Umgebungsspezifische Konfigurationen

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
# .azure/produktion/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Konfigurationsvalidierung

### Konfiguration validieren
```bash
# Konfigurationssyntax prüfen
azd config validate

# Umgebungsvariablen testen
azd env get-values

# Infrastruktur validieren
azd provision --dry-run
```

### Konfigurationsskripte
Erstellen Sie Validierungsskripte in `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Erforderliche Umgebungsvariablen überprüfen
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Syntax von azure.yaml validieren
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Bewährte Vorgehensweisen

### 1. Verwenden Sie Umgebungsvariablen
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organisieren Sie Konfigurationsdateien
```
.azure/
├── config.json              # Global project config
├── env.template             # Environment template
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

### 3. Aspekte der Versionskontrolle
```bash
# .gitignore
.azure/*/config.json         # Umgebungskonfigurationen (enthalten Ressourcen-IDs)
.azure/*/.env               # Umgebungsvariablen (können Geheimnisse enthalten)
.env                        # Lokale Umgebungsdatei
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

## 🎯 Praktische Übungsaufgaben

### Übung 1: Mehrere Umgebungen konfigurieren (15 Minuten)

**Ziel**: Erstellen und Konfigurieren von drei Umgebungen mit unterschiedlichen Einstellungen

```bash
# Entwicklungsumgebung erstellen
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Staging-Umgebung erstellen
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Produktionsumgebung erstellen
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Jede Umgebung überprüfen
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Erfolgskriterien:**
- [ ] Drei Umgebungen erfolgreich erstellt
- [ ] Jede Umgebung hat eine eindeutige Konfiguration
- [ ] Kann ohne Fehler zwischen Umgebungen wechseln
- [ ] `azd env list` zeigt alle drei Umgebungen an

### Übung 2: Geheimnisverwaltung (10 Minuten)

**Ziel**: Sicheres Konfigurieren mit sensiblen Daten üben

```bash
# Geheimnisse setzen (nicht in der Ausgabe angezeigt)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Nicht-geheime Konfiguration festlegen
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Umgebung anzeigen (Geheimnisse sollten geschwärzt werden)
azd env get-values

# Überprüfen, dass Geheimnisse gespeichert sind
azd env get DB_PASSWORD  # Soll den tatsächlichen Wert anzeigen
```

**Erfolgskriterien:**
- [ ] Geheimnisse werden gespeichert, ohne im Terminal angezeigt zu werden
- [ ] `azd env get-values` zeigt redigierte Geheimnisse an
- [ ] Einzelner `azd env get <SECRET_NAME>` ruft den tatsächlichen Wert ab

## Nächste Schritte

- [Ihr erstes Projekt](first-project.md) - Wenden Sie Konfiguration in der Praxis an
- [Bereitstellungsanleitung](../chapter-04-infrastructure/deployment-guide.md) - Verwenden Sie Konfiguration für die Bereitstellung
- [Ressourcen bereitstellen](../chapter-04-infrastructure/provisioning.md) - Produktionsreife Konfigurationen

## Referenzen

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD für Anfänger](../../README.md)
- **📖 Current Chapter**: Kapitel 3 - Konfiguration & Authentifizierung
- **⬅️ Previous**: [Ihr erstes Projekt](first-project.md)
- **➡️ Next Chapter**: [Kapitel 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [Ihr erstes Projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
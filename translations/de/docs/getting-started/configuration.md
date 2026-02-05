# Konfigurationsleitfaden

**Kapitelübersicht:**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 3 - Konfiguration & Authentifizierung
- **⬅️ Vorheriges**: [Ihr erstes Projekt](first-project.md)
- **➡️ Nächstes**: [Bereitstellungsleitfaden](../deployment/deployment-guide.md)
- **🚀 Nächstes Kapitel**: [Kapitel 4: Infrastruktur als Code](../deployment/deployment-guide.md)

## Einführung

Dieser umfassende Leitfaden behandelt alle Aspekte der Konfiguration des Azure Developer CLI für optimale Entwicklungs- und Bereitstellungsabläufe. Sie lernen die Konfigurationshierarchie, das Management von Umgebungen, Authentifizierungsmethoden und fortgeschrittene Konfigurationsmuster kennen, die effiziente und sichere Azure-Bereitstellungen ermöglichen.

## Lernziele

Am Ende dieser Lektion werden Sie:
- Die azd-Konfigurationshierarchie beherrschen und verstehen, wie Einstellungen priorisiert werden
- Globale und projektspezifische Einstellungen effektiv konfigurieren
- Mehrere Umgebungen mit unterschiedlichen Konfigurationen verwalten
- Sichere Authentifizierungs- und Autorisierungsmuster implementieren
- Fortgeschrittene Konfigurationsmuster für komplexe Szenarien verstehen

## Lernergebnisse

Nach Abschluss dieser Lektion werden Sie in der Lage sein:
- azd für optimale Entwicklungsabläufe zu konfigurieren
- Mehrere Bereitstellungsumgebungen einzurichten und zu verwalten
- Sichere Konfigurationsmanagementpraktiken umzusetzen
- Konfigurationsbezogene Probleme zu beheben
- azd-Verhalten für spezifische organisatorische Anforderungen anzupassen

Dieser umfassende Leitfaden behandelt alle Aspekte der Konfiguration des Azure Developer CLI für optimale Entwicklungs- und Bereitstellungsabläufe.

## Konfigurationshierarchie

azd verwendet ein hierarchisches Konfigurationssystem:
1. **Befehlszeilen-Flags** (höchste Priorität)
2. **Umgebungsvariablen**
3. **Lokale Projektkonfiguration** (`.azd/config.json`)
4. **Globale Benutzerkonfiguration** (`~/.azd/config.json`)
5. **Standardwerte** (niedrigste Priorität)

## Globale Konfiguration

### Globale Standards festlegen
```bash
# Standardabonnement festlegen
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Standardstandort festlegen
azd config set defaults.location "eastus2"

# Standardbenennungsrichtlinie für Ressourcengruppen festlegen
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Alle globalen Konfigurationen anzeigen
azd config list

# Eine Konfiguration entfernen
azd config unset defaults.location
```

### Häufige globale Einstellungen
```bash
# Entwicklungseinstellungen
azd config set alpha.enable true                    # Alpha-Funktionen aktivieren
azd config set telemetry.enabled false             # Telemetrie deaktivieren
azd config set output.format json                  # Ausgabeformat festlegen

# Sicherheitseinstellungen
azd config set auth.useAzureCliCredential true     # Azure CLI für Authentifizierung verwenden
azd config set tls.insecure false                  # TLS-Überprüfung erzwingen

# Leistung optimieren
azd config set provision.parallelism 5             # Parallele Ressourcenerstellung
azd config set deploy.timeout 30m                  # Bereitstellungszeitlimit
```

## 🏗️ Projektkonfiguration

### Struktur von azure.yaml
Die Datei `azure.yaml` ist das Herzstück Ihres azd-Projekts:

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

### Optionen für die Dienstkonfiguration

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

## 🌟 Umweltmanagement

### Umgebungen erstellen
```bash
# Erstellen Sie eine neue Umgebung
azd env new development

# Erstellen mit spezifischem Standort
azd env new staging --location "westus2"

# Aus Vorlage erstellen
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Umgebungskonfiguration
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
# Umgebungsspezifische Variablen festlegen
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Umgebungsvariablen anzeigen
azd env get-values

# Erwartete Ausgabe:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=geheimer-api-schlüssel
# DEBUG=true

# Umgebungsvariable entfernen
azd env unset DEBUG

# Entfernung überprüfen
azd env get-values | grep DEBUG
# (sollte nichts zurückgeben)
```

### Umgebungsvorlagen
Erstellen Sie `.azure/env.template` für eine konsistente Einrichtung der Umgebung:
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

## 🔐 Authentifizierungskonfiguration

### Integration des Azure CLI
```bash
# Verwenden Sie Azure CLI-Anmeldeinformationen (Standard)
azd config set auth.useAzureCliCredential true

# Anmeldung mit spezifischem Mandanten
az login --tenant <tenant-id>

# Standardabonnement festlegen
az account set --subscription <subscription-id>
```

### Authentifizierung mit Service Principal
Für CI/CD-Pipelines:
```bash
# Umgebungsvariablen festlegen
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Oder direkt konfigurieren
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Verwaltete Identität
Für Azure-gehostete Umgebungen:
```bash
# Aktivieren Sie die Authentifizierung mit verwalteter Identität
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

### Benutzerdefinierte Ressourcennamen
```bash
# Benennungsrichtlinien festlegen
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
# .azure/entwicklung/.env
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
# Überprüfen Sie die Konfigurationssyntax
azd config validate

# Testen Sie Umgebungsvariablen
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

# Überprüfen Sie die erforderlichen Umgebungsvariablen
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Überprüfen Sie die Syntax von azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Best Practices

### 1. Umgebungsvariablen verwenden
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Konfigurationsdateien organisieren
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

### 3. Versionskontrollüberlegungen
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

## 🎯 Praktische Übungen

### Übung 1: Multi-Umgebungskonfiguration (15 Minuten)

**Ziel**: Erstellen und konfigurieren Sie drei Umgebungen mit unterschiedlichen Einstellungen

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
- [ ] Jede Umgebung hat eine einzigartige Konfiguration
- [ ] Wechsel zwischen Umgebungen ohne Fehler möglich
- [ ] `azd env list` zeigt alle drei Umgebungen an

### Übung 2: Geheimnismanagement (10 Minuten)

**Ziel**: Üben Sie die sichere Konfiguration mit sensiblen Daten

```bash
# Geheimnisse festlegen (nicht in der Ausgabe angezeigt)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Nicht-geheime Konfiguration festlegen
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Umgebung anzeigen (Geheimnisse sollten ausgeblendet sein)
azd env get-values

# Überprüfen, ob Geheimnisse gespeichert sind
azd env get DB_PASSWORD  # Sollte den tatsächlichen Wert anzeigen
```

**Erfolgskriterien:**
- [ ] Geheimnisse werden gespeichert, ohne im Terminal angezeigt zu werden
- [ ] `azd env get-values` zeigt geschwärzte Geheimnisse
- [ ] Einzelne `azd env get <SECRET_NAME>` ruft den tatsächlichen Wert ab

## Nächste Schritte

- [Ihr erstes Projekt](first-project.md) - Konfiguration in der Praxis anwenden
- [Bereitstellungsleitfaden](../deployment/deployment-guide.md) - Konfiguration für die Bereitstellung nutzen
- [Ressourcen bereitstellen](../deployment/provisioning.md) - Produktionsreife Konfigurationen

## Referenzen

- [azd Konfigurationsreferenz](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Umgebungsvariablen](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Kapitelübersicht:**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 3 - Konfiguration & Authentifizierung
- **⬅️ Vorheriges**: [Ihr erstes Projekt](first-project.md)
- **➡️ Nächstes Kapitel**: [Kapitel 4: Infrastruktur als Code](../deployment/deployment-guide.md)
- **Nächste Lektion**: [Ihr erstes Projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-17T17:13:16+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "de"
}
-->
# Einzelhandels-Multi-Agent-Lösung - ARM-Template-Bereitstellung

**Kapitel 5: Produktionsbereitstellungspaket**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Verwandtes Kapitel**: [Kapitel 5: Multi-Agent KI-Lösungen](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Szenario-Leitfaden**: [Komplette Implementierung](../retail-scenario.md)
- **🎯 Schnellbereitstellung**: [Ein-Klick-Bereitstellung](../../../../examples/retail-multiagent-arm-template)

Dieses Verzeichnis enthält ein vollständiges Azure Resource Manager (ARM)-Template zur Bereitstellung der Einzelhandels-Multi-Agent-Kundensupport-Lösung und bietet Infrastruktur als Code für die gesamte Architektur.

## 🎯 Was wird bereitgestellt?

### Kerninfrastruktur
- **Azure OpenAI Services** (Multi-Region für hohe Verfügbarkeit)
  - Primäre Region: GPT-4o für Kundenagenten
  - Sekundäre Region: GPT-4o-mini für Inventaragenten  
  - Tertiäre Region: Text-Embedding-Modell
  - Evaluationsregion: GPT-4o Bewertungsmodell
- **Azure AI Search** mit Vektorsuchfunktionen
- **Azure Storage Account** mit Blob-Containern für Dokumente und Uploads
- **Azure Container Apps Environment** mit automatischer Skalierung
- **Container Apps** für Agenten-Router und Frontend
- **Azure Cosmos DB** für die Speicherung von Chatverläufen
- **Azure Key Vault** für die Verwaltung von Geheimnissen (optional)
- **Application Insights** und Log Analytics für Überwachung (optional)
- **Document Intelligence** für die Dokumentenverarbeitung
- **Bing Search API** für Echtzeitinformationen

### Bereitstellungsmodi

| Modus | Beschreibung | Anwendungsfall | Ressourcen |
|-------|--------------|----------------|------------|
| **Minimal** | Kostenoptimierte Basisbereitstellung | Entwicklung, Test | Basis-SKUs, Einzelregion, reduzierte Kapazität |
| **Standard** | Ausgewogene Bereitstellung für Produktionslasten | Produktion, moderater Maßstab | Standard-SKUs, Multi-Region, Standardkapazität |
| **Premium** | Hochleistungsfähige, unternehmensgerechte Bereitstellung | Unternehmen, hoher Maßstab | Premium-SKUs, Multi-Region, hohe Kapazität |

## 📋 Voraussetzungen

1. **Azure CLI** installiert und konfiguriert
2. **Aktives Azure-Abonnement** mit ausreichenden Kontingenten
3. **Entsprechende Berechtigungen**, um Ressourcen im Zielabonnement zu erstellen
4. **Ressourcenkontingente** für:
   - Azure OpenAI (regionale Verfügbarkeit prüfen)
   - Container Apps (variiert je nach Region)
   - AI Search (Standard-Tarif oder höher empfohlen)

## 🚀 Schnellbereitstellung

### Option 1: Mit Azure CLI

```bash
# Clone or download the template files
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Make the deployment script executable
chmod +x deploy.sh

# Deploy with default settings
./deploy.sh -g myResourceGroup

# Deploy for production with premium features
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Option 2: Mit Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Option 3: Direkt mit Azure CLI

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Konfigurationsoptionen

### Template-Parameter

| Parameter | Typ | Standardwert | Beschreibung |
|-----------|-----|--------------|--------------|
| `projectName` | string | "retail" | Präfix für alle Ressourcennamen |
| `location` | string | Standort der Ressourcengruppe | Primäre Bereitstellungsregion |
| `secondaryLocation` | string | "westus2" | Sekundäre Region für Multi-Region-Bereitstellung |
| `tertiaryLocation` | string | "francecentral" | Region für Embedding-Modell |
| `environmentName` | string | "dev" | Umgebungsbezeichnung (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Bereitstellungskonfiguration (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Aktivieren der Multi-Region-Bereitstellung |
| `enableMonitoring` | bool | true | Aktivieren von Application Insights und Logging |
| `enableSecurity` | bool | true | Aktivieren von Key Vault und erweiterter Sicherheit |

### Parameter anpassen

Bearbeiten Sie `azuredeploy.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ Architekturübersicht

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 Verwendung des Bereitstellungsskripts

Das `deploy.sh`-Skript bietet eine interaktive Bereitstellungserfahrung:

```bash
# Show help
./deploy.sh --help

# Basic deployment
./deploy.sh -g myResourceGroup

# Advanced deployment with custom settings
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Development deployment without multi-region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Skriptfunktionen

- ✅ **Validierung der Voraussetzungen** (Azure CLI, Anmeldestatus, Template-Dateien)
- ✅ **Verwaltung der Ressourcengruppe** (erstellt, falls nicht vorhanden)
- ✅ **Template-Validierung** vor der Bereitstellung
- ✅ **Fortschrittsüberwachung** mit farbiger Ausgabe
- ✅ **Anzeige der Bereitstellungsergebnisse**
- ✅ **Anleitung nach der Bereitstellung**

## 📊 Überwachung der Bereitstellung

### Bereitstellungsstatus prüfen

```bash
# List deployments
az deployment group list --resource-group myResourceGroup --output table

# Get deployment details
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Watch deployment progress
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Bereitstellungsergebnisse

Nach erfolgreicher Bereitstellung sind folgende Ergebnisse verfügbar:

- **Frontend-URL**: Öffentlicher Endpunkt für die Weboberfläche
- **Router-URL**: API-Endpunkt für den Agenten-Router
- **OpenAI-Endpunkte**: Primäre und sekundäre OpenAI-Service-Endpunkte
- **Search Service**: Azure AI Search-Service-Endpunkt
- **Storage Account**: Name des Storage Accounts für Dokumente
- **Key Vault**: Name des Key Vault (falls aktiviert)
- **Application Insights**: Name des Überwachungsdienstes (falls aktiviert)

## 🔧 Konfiguration nach der Bereitstellung

### 1. Suchindex konfigurieren

```bash
# Set environment variables from deployment outputs
export SEARCH_SERVICE_NAME="<search-service-name>"
export SEARCH_ADMIN_KEY="<search-admin-key>"

# Create search index (customize schema as needed)
curl -X POST "https://${SEARCH_SERVICE_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_ADMIN_KEY}" \
  -d @../data/search-schema.json
```

### 2. Anfangsdaten hochladen

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Agenten-Endpunkte testen

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Container-Apps konfigurieren

Das ARM-Template stellt Platzhalter-Container-Images bereit. Um den tatsächlichen Agenten-Code bereitzustellen:

```bash
# Build and push agent images
docker build -t myregistry.azurecr.io/agent-router:latest ./src/router
docker build -t myregistry.azurecr.io/frontend:latest ./src/frontend

# Update container apps
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:latest
```

## 🛠️ Fehlerbehebung

### Häufige Probleme

#### 1. Azure OpenAI-Kontingent überschritten

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Container-Apps-Bereitstellung fehlgeschlagen

```bash
# Check container app logs
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Restart container app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Initialisierung des Suchdienstes

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validierung der Bereitstellung

```bash
# Validate all resources are created
az resource list \
  --resource-group myResourceGroup \
  --output table

# Check resource health
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Sicherheitsüberlegungen

### Schlüsselverwaltung
- Alle Geheimnisse werden im Azure Key Vault gespeichert (falls aktiviert)
- Container-Apps verwenden Managed Identity für die Authentifizierung
- Storage Accounts haben sichere Standardeinstellungen (nur HTTPS, kein öffentlicher Blob-Zugriff)

### Netzwerksicherheit
- Container-Apps verwenden, soweit möglich, interne Netzwerke
- Suchdienst ist mit der Option für private Endpunkte konfiguriert
- Cosmos DB ist mit minimal notwendigen Berechtigungen konfiguriert

### RBAC-Konfiguration
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Kostenoptimierung

### Kostenschätzungen (monatlich, USD)

| Modus | OpenAI | Container Apps | Search | Storage | Gesamtschätzung |
|-------|--------|----------------|--------|---------|-----------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Kostenüberwachung

```bash
# Set up budget alerts
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Updates und Wartung

### Template-Updates
- ARM-Template-Dateien versionieren
- Änderungen zuerst in der Entwicklungsumgebung testen
- Für Updates den inkrementellen Bereitstellungsmodus verwenden

### Ressourcen-Updates
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Backup und Wiederherstellung
- Automatische Sicherung für Cosmos DB aktiviert
- Soft Delete für Key Vault aktiviert
- Container-App-Revisions für Rollbacks beibehalten

## 📞 Support

- **Template-Probleme**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure-Support**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Community**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Bereit, Ihre Multi-Agent-Lösung zu starten?**

Starten Sie mit: `./deploy.sh -g myResourceGroup`

---

**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.
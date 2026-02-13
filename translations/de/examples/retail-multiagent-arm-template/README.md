# Einzelhandels-Multi-Agenten-Lösung - Infrastrukturvorlage

**Kapitel 5: Produktionsbereitstellungspaket**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Verwandtes Kapitel**: [Kapitel 5: Multi-Agenten-KI-Lösungen](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Szenario-Leitfaden**: [Komplette Architektur](../retail-scenario.md)
- **🎯 Schnellbereitstellung**: [Ein-Klick-Bereitstellung](../../../../examples/retail-multiagent-arm-template)

> **⚠️ NUR INFRASTRUKTURVORLAGE**  
> Diese ARM-Vorlage stellt **Azure-Ressourcen** für ein Multi-Agenten-System bereit.  
>  
> **Was bereitgestellt wird (15-25 Minuten):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, Embeddings in 3 Regionen)
> - ✅ KI-Suchdienst (leer, bereit zur Indexerstellung)
> - ✅ Container-Apps (Platzhalter-Images, bereit für Ihren Code)
> - ✅ Speicher, Cosmos DB, Key Vault, Application Insights
>  
> **Was NICHT enthalten ist (erfordert Entwicklung):**
> - ❌ Agenten-Implementierungscode (Kundenagent, Inventaragent)
> - ❌ Routing-Logik und API-Endpunkte
> - ❌ Frontend-Chat-UI
> - ❌ Suchindex-Schemata und Datenpipelines
> - ❌ **Geschätzter Entwicklungsaufwand: 80-120 Stunden**
>  
> **Verwenden Sie diese Vorlage, wenn:**
> - ✅ Sie Azure-Infrastruktur für ein Multi-Agenten-Projekt bereitstellen möchten
> - ✅ Sie die Agenten-Implementierung separat entwickeln möchten
> - ✅ Sie eine produktionsreife Infrastruktur-Basis benötigen
>  
> **Nicht verwenden, wenn:**
> - ❌ Sie sofort eine funktionierende Multi-Agenten-Demo erwarten
> - ❌ Sie vollständige Anwendungsbeispiele für Code suchen

## Überblick

Dieses Verzeichnis enthält eine umfassende Azure Resource Manager (ARM)-Vorlage zur Bereitstellung der **Infrastrukturgrundlage** eines Multi-Agenten-Kundensupportsystems. Die Vorlage stellt alle erforderlichen Azure-Dienste bereit, die ordnungsgemäß konfiguriert und miteinander verbunden sind, und ist bereit für Ihre Anwendungsentwicklung.

**Nach der Bereitstellung haben Sie:** Produktionsreife Azure-Infrastruktur  
**Um das System zu vervollständigen, benötigen Sie:** Agenten-Code, Frontend-UI und Datenkonfiguration (siehe [Architekturleitfaden](../retail-scenario.md))

## 🎯 Was wird bereitgestellt

### Kerninfrastruktur (Status nach Bereitstellung)

✅ **Azure OpenAI-Dienste** (Bereit für API-Aufrufe)
  - Primärregion: GPT-4o-Bereitstellung (20K TPM-Kapazität)
  - Sekundärregion: GPT-4o-mini-Bereitstellung (10K TPM-Kapazität)
  - Tertiärregion: Text-Embeddings-Modell (30K TPM-Kapazität)
  - Evaluierungsregion: GPT-4o-Bewertungsmodell (15K TPM-Kapazität)
  - **Status:** Voll funktionsfähig - kann sofort API-Aufrufe ausführen

✅ **Azure AI Search** (Leer - bereit zur Konfiguration)
  - Vektorsuchfunktionen aktiviert
  - Standard-Tier mit 1 Partition, 1 Replikat
  - **Status:** Dienst läuft, erfordert jedoch Indexerstellung
  - **Erforderliche Aktion:** Suchindex mit Ihrem Schema erstellen

✅ **Azure Storage Account** (Leer - bereit für Uploads)
  - Blob-Container: `documents`, `uploads`
  - Sichere Konfiguration (nur HTTPS, kein öffentlicher Zugriff)
  - **Status:** Bereit, Dateien zu empfangen
  - **Erforderliche Aktion:** Laden Sie Ihre Produktdaten und Dokumente hoch

⚠️ **Container-Apps-Umgebung** (Platzhalter-Images bereitgestellt)
  - Agenten-Router-App (nginx-Standard-Image)
  - Frontend-App (nginx-Standard-Image)
  - Auto-Scaling konfiguriert (0-10 Instanzen)
  - **Status:** Platzhalter-Container laufen
  - **Erforderliche Aktion:** Bauen und bereitstellen Sie Ihre Agenten-Anwendungen

✅ **Azure Cosmos DB** (Leer - bereit für Daten)
  - Datenbank und Container vorkonfiguriert
  - Optimiert für latenzarme Operationen
  - TTL aktiviert für automatische Bereinigung
  - **Status:** Bereit, Chatverläufe zu speichern

✅ **Azure Key Vault** (Optional - bereit für Geheimnisse)
  - Soft Delete aktiviert
  - RBAC für verwaltete Identitäten konfiguriert
  - **Status:** Bereit, API-Schlüssel und Verbindungszeichenfolgen zu speichern

✅ **Application Insights** (Optional - Überwachung aktiv)
  - Verbunden mit Log Analytics-Arbeitsbereich
  - Benutzerdefinierte Metriken und Warnungen konfiguriert
  - **Status:** Bereit, Telemetrie von Ihren Apps zu empfangen

✅ **Document Intelligence** (Bereit für API-Aufrufe)
  - S0-Tier für Produktions-Workloads
  - **Status:** Bereit, hochgeladene Dokumente zu verarbeiten

✅ **Bing Search API** (Bereit für API-Aufrufe)
  - S1-Tier für Echtzeitsuchen
  - **Status:** Bereit für Websuchanfragen

### Bereitstellungsmodi

| Modus | OpenAI-Kapazität | Container-Instanzen | Such-Tier | Speicher-Redundanz | Am besten geeignet für |
|-------|------------------|---------------------|-----------|---------------------|-------------------------|
| **Minimal** | 10K-20K TPM | 0-2 Replikate | Basic | LRS (Lokal) | Entwicklung/Test, Lernen, Proof-of-Concept |
| **Standard** | 30K-60K TPM | 2-5 Replikate | Standard | ZRS (Zone) | Produktion, moderater Traffic (<10K Nutzer) |
| **Premium** | 80K-150K TPM | 5-10 Replikate, zonenredundant | Premium | GRS (Geo) | Unternehmen, hoher Traffic (>10K Nutzer), 99,99% SLA |

**Kostenwirkung:**
- **Minimal → Standard:** ~4x Kostensteigerung ($100-370/Monat → $420-1.450/Monat)
- **Standard → Premium:** ~3x Kostensteigerung ($420-1.450/Monat → $1.150-3.500/Monat)
- **Wählen Sie basierend auf:** Erwarteter Last, SLA-Anforderungen, Budgetbeschränkungen

**Kapazitätsplanung:**
- **TPM (Tokens pro Minute):** Gesamt über alle Modellbereitstellungen
- **Container-Instanzen:** Auto-Scaling-Bereich (min-max Replikate)
- **Such-Tier:** Beeinflusst Abfrageleistung und Indexgrößenlimits

## 📋 Voraussetzungen

### Erforderliche Tools
1. **Azure CLI** (Version 2.50.0 oder höher)
   ```bash
   az --version  # Version überprüfen
   az login      # Authentifizieren
   ```

2. **Aktives Azure-Abonnement** mit Besitzer- oder Mitwirkendenzugriff
   ```bash
   az account show  # Abonnement überprüfen
   ```

### Erforderliche Azure-Kontingente

Überprüfen Sie vor der Bereitstellung, ob ausreichende Kontingente in Ihren Zielregionen verfügbar sind:

```bash
# Überprüfen Sie die Verfügbarkeit von Azure OpenAI in Ihrer Region
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Überprüfen Sie das OpenAI-Kontingent (Beispiel für gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Überprüfen Sie das Container-Apps-Kontingent
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Mindestanforderungen an Kontingente:**
- **Azure OpenAI:** 3-4 Modellbereitstellungen über Regionen hinweg
  - GPT-4o: 20K TPM (Tokens pro Minute)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Hinweis:** GPT-4o kann in einigen Regionen auf der Warteliste stehen - überprüfen Sie die [Modellverfügbarkeit](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Container-Apps:** Verwaltete Umgebung + 2-10 Container-Instanzen
- **AI Search:** Standard-Tier (Basic unzureichend für Vektorsuche)
- **Cosmos DB:** Standardbereitgestellte Durchsatzleistung

**Wenn Kontingent unzureichend:**
1. Gehen Sie zum Azure-Portal → Kontingente → Erhöhung anfordern
2. Oder verwenden Sie Azure CLI:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Ziehen Sie alternative Regionen mit Verfügbarkeit in Betracht

## 🚀 Schnellbereitstellung

### Option 1: Mit Azure CLI

```bash
# Klonen oder Herunterladen der Vorlagendateien
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Das Bereitstellungsskript ausführbar machen
chmod +x deploy.sh

# Mit Standardeinstellungen bereitstellen
./deploy.sh -g myResourceGroup

# Für die Produktion mit Premium-Funktionen bereitstellen
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Option 2: Mit Azure-Portal

[![In Azure bereitstellen](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Option 3: Direkt mit Azure CLI

```bash
# Ressourcengruppe erstellen
az group create --name myResourceGroup --location eastus2

# Vorlage bereitstellen
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Bereitstellungszeitplan

### Was Sie erwarten können

| Phase | Dauer | Was passiert |
|-------|-------|--------------|
| **Vorlagenvalidierung** | 30-60 Sekunden | Azure validiert die Syntax und Parameter der ARM-Vorlage |
| **Einrichtung der Ressourcengruppe** | 10-20 Sekunden | Erstellt Ressourcengruppe (falls erforderlich) |
| **OpenAI-Bereitstellung** | 5-8 Minuten | Erstellt 3-4 OpenAI-Konten und stellt Modelle bereit |
| **Container-Apps** | 3-5 Minuten | Erstellt Umgebung und stellt Platzhalter-Container bereit |
| **Suche & Speicher** | 2-4 Minuten | Stellt KI-Suchdienst und Speicherkonten bereit |
| **Cosmos DB** | 2-3 Minuten | Erstellt Datenbank und konfiguriert Container |
| **Überwachungseinrichtung** | 2-3 Minuten | Richtet Application Insights und Log Analytics ein |
| **RBAC-Konfiguration** | 1-2 Minuten | Konfiguriert verwaltete Identitäten und Berechtigungen |
| **Gesamte Bereitstellung** | **15-25 Minuten** | Vollständige Infrastruktur bereit |

**Nach der Bereitstellung:**
- ✅ **Infrastruktur bereit:** Alle Azure-Dienste bereitgestellt und laufen
- ⏱️ **Anwendungsentwicklung:** 80-120 Stunden (Ihre Verantwortung)
- ⏱️ **Indexkonfiguration:** 15-30 Minuten (erfordert Ihr Schema)
- ⏱️ **Daten-Upload:** Variiert je nach Datensatzgröße
- ⏱️ **Testen & Validieren:** 2-4 Stunden

---

## ✅ Bereitstellungserfolg überprüfen

### Schritt 1: Ressourcenbereitstellung überprüfen (2 Minuten)

```bash
# Überprüfen Sie, ob alle Ressourcen erfolgreich bereitgestellt wurden
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Erwartet:** Leere Tabelle (alle Ressourcen zeigen den Status "Erfolgreich" an)

### Schritt 2: Azure OpenAI-Bereitstellungen überprüfen (3 Minuten)

```bash
# Liste alle OpenAI-Konten auf
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Überprüfen Sie die Modellbereitstellungen für die primäre Region
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Erwartet:** 
- 3-4 OpenAI-Konten (Primär-, Sekundär-, Tertiär-, Evaluierungsregionen)
- 1-2 Modellbereitstellungen pro Konto (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### Schritt 3: Infrastrukturendpunkte testen (5 Minuten)

```bash
# Abrufen der Container-App-URLs
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Router-Endpunkt testen (Platzhalterbild wird antworten)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Erwartet:** 
- Container-Apps zeigen den Status "Läuft" an
- Platzhalter-nginx antwortet mit HTTP 200 oder 404 (noch kein Anwendungscode)

### Schritt 4: Azure OpenAI-API-Zugriff überprüfen (3 Minuten)

```bash
# Abrufen des OpenAI-Endpunkts und Schlüssels
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Testen der GPT-4o-Bereitstellung
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Erwartet:** JSON-Antwort mit Chat-Abschluss (bestätigt, dass OpenAI funktionsfähig ist)

### Was funktioniert und was nicht

**✅ Funktioniert nach der Bereitstellung:**
- Azure OpenAI-Modelle bereitgestellt und akzeptieren API-Aufrufe
- KI-Suchdienst läuft (leer, noch keine Indizes)
- Container-Apps laufen (Platzhalter-nginx-Images)
- Speicherkonten zugänglich und bereit für Uploads
- Cosmos DB bereit für Datenoperationen
- Application Insights sammelt Infrastruktur-Telemetrie
- Key Vault bereit für die Speicherung von Geheimnissen

**❌ Funktioniert noch nicht (erfordert Entwicklung):**
- Agenten-Endpunkte (kein Anwendungscode bereitgestellt)
- Chat-Funktionalität (erfordert Frontend + Backend-Implementierung)
- Suchabfragen (noch kein Suchindex erstellt)
- Dokumentenverarbeitungspipeline (keine Daten hochgeladen)
- Benutzerdefinierte Telemetrie (erfordert Anwendungsinstrumentierung)

**Nächste Schritte:** Siehe [Nachbereitstellungskonfiguration](../../../../examples/retail-multiagent-arm-template), um Ihre Anwendung zu entwickeln und bereitzustellen

---

## ⚙️ Konfigurationsoptionen

### Vorlagenparameter

| Parameter | Typ | Standard | Beschreibung |
|-----------|------|----------|--------------|
| `projectName` | string | "retail" | Präfix für alle Ressourcennamen |
| `location` | string | Standort der Ressourcengruppe | Primäre Bereitstellungsregion |
| `secondaryLocation` | string | "westus2" | Sekundärregion für Multi-Region-Bereitstellung |
| `tertiaryLocation` | string | "francecentral" | Region für Embeddings-Modell |
| `environmentName` | string | "dev" | Umgebungsbezeichnung (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Bereitstellungskonfiguration (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Multi-Region-Bereitstellung aktivieren |
| `enableMonitoring` | bool | true | Application Insights und Protokollierung aktivieren |
| `enableSecurity` | bool | true | Key Vault und erweiterte Sicherheit aktivieren |

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
# Hilfe anzeigen
./deploy.sh --help

# Grundlegende Bereitstellung
./deploy.sh -g myResourceGroup

# Erweiterte Bereitstellung mit benutzerdefinierten Einstellungen
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Entwicklungsbereitstellung ohne Multi-Region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Skriptfunktionen

- ✅ **Validierung der Voraussetzungen** (Azure CLI, Anmeldestatus, Vorlagendateien)
- ✅ **Ressourcengruppenverwaltung** (erstellt, falls nicht vorhanden)
- ✅ **Vorlagenvalidierung** vor der Bereitstellung
- ✅ **Fortschrittsüberwachung** mit farbiger Ausgabe
- ✅ **Bereitstellungsausgaben** anzeigen
- ✅ **Anleitung nach der Bereitstellung**

## 📊 Bereitstellung überwachen

### Bereitstellungsstatus überprüfen

```bash
# Auflistung der Bereitstellungen
az deployment group list --resource-group myResourceGroup --output table

# Abrufen von Bereitstellungsdetails
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Überwachung des Bereitstellungsfortschritts
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Bereitstellungsausgaben

Nach erfolgreicher Bereitstellung sind folgende Ausgaben verfügbar:

- **Frontend-URL**: Öffentlicher Endpunkt für die Weboberfläche
- **Router-URL**: API-Endpunkt für den Agenten-Router
- **OpenAI-Endpunkte**: Primäre und sekundäre OpenAI-Dienstendpunkte
- **Suchdienst**: Azure AI-Suchdienst-Endpunkt
- **Speicherkonto**: Name des Speicherkontos für Dokumente
- **Key Vault**: Name des Key Vault (falls aktiviert)
- **Application Insights**: Name des Überwachungsdienstes (falls aktiviert)

## 🔧 Nach der Bereitstellung: Nächste Schritte
> **📝 Wichtig:** Die Infrastruktur ist bereitgestellt, aber Sie müssen Anwendungs-Code entwickeln und bereitstellen.

### Phase 1: Entwicklung von Agenten-Anwendungen (Ihre Verantwortung)

Die ARM-Vorlage erstellt **leere Container-Apps** mit Platzhalter-Nginx-Bildern. Sie müssen:

**Erforderliche Entwicklung:**
1. **Agenten-Implementierung** (30-40 Stunden)
   - Kundenservice-Agent mit GPT-4o-Integration
   - Inventar-Agent mit GPT-4o-mini-Integration
   - Logik für Agenten-Routing

2. **Frontend-Entwicklung** (20-30 Stunden)
   - Chat-Oberfläche UI (React/Vue/Angular)
   - Funktionalität für Datei-Uploads
   - Darstellung und Formatierung von Antworten

3. **Backend-Dienste** (12-16 Stunden)
   - FastAPI oder Express-Router
   - Authentifizierungs-Middleware
   - Telemetrie-Integration

**Siehe:** [Architektur-Leitfaden](../retail-scenario.md) für detaillierte Implementierungsmuster und Codebeispiele

### Phase 2: KI-Suchindex konfigurieren (15-30 Minuten)

Erstellen Sie einen Suchindex, der Ihrem Datenmodell entspricht:

```bash
# Abrufen der Suchdienst-Details
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Index mit Ihrem Schema erstellen (Beispiel)
curl -X POST "https://${SEARCH_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_KEY}" \
  -d '{
    "name": "products",
    "fields": [
      {"name": "id", "type": "Edm.String", "key": true},
      {"name": "title", "type": "Edm.String", "searchable": true},
      {"name": "content", "type": "Edm.String", "searchable": true},
      {"name": "category", "type": "Edm.String", "filterable": true},
      {"name": "content_vector", "type": "Collection(Edm.Single)", 
       "searchable": true, "dimensions": 1536, "vectorSearchProfile": "default"}
    ],
    "vectorSearch": {
      "algorithms": [{"name": "default", "kind": "hnsw"}],
      "profiles": [{"name": "default", "algorithm": "default"}]
    }
  }'
```

**Ressourcen:**
- [Schema-Design für KI-Suchindex](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Konfiguration für Vektor-Suche](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Phase 3: Ihre Daten hochladen (Zeit variiert)

Sobald Sie Produktdaten und Dokumente haben:

```bash
# Abrufen der Speicherkontodetails
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Laden Sie Ihre Dokumente hoch
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Beispiel: Einzelne Datei hochladen
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Phase 4: Anwendungen entwickeln und bereitstellen (8-12 Stunden)

Sobald Sie Ihren Agenten-Code entwickelt haben:

```bash
# 1. Erstellen Sie ein Azure Container Registry (falls erforderlich)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Erstellen und pushen Sie das Agent-Router-Image
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Erstellen und pushen Sie das Frontend-Image
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Aktualisieren Sie Container-Apps mit Ihren Images
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Konfigurieren Sie Umgebungsvariablen
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### Phase 5: Ihre Anwendung testen (2-4 Stunden)

```bash
# Holen Sie sich Ihre Anwendungs-URL
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Testen Sie den Agenten-Endpunkt (sobald Ihr Code bereitgestellt ist)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Überprüfen Sie die Anwendungsprotokolle
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Implementierungsressourcen

**Architektur & Design:**
- 📖 [Kompletter Architektur-Leitfaden](../retail-scenario.md) - Detaillierte Implementierungsmuster
- 📖 [Designmuster für Multi-Agenten-Systeme](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Codebeispiele:**
- 🔗 [Azure OpenAI Chat Beispiel](https://github.com/Azure-Samples/azure-search-openai-demo) - RAG-Muster
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Agenten-Framework (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Agenten-Orchestrierung (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Multi-Agenten-Gespräche

**Geschätzter Gesamtaufwand:**
- Infrastruktur-Bereitstellung: 15-25 Minuten (✅ Abgeschlossen)
- Anwendungsentwicklung: 80-120 Stunden (🔨 Ihre Arbeit)
- Testen und Optimierung: 15-25 Stunden (🔨 Ihre Arbeit)

## 🛠️ Fehlerbehebung

### Häufige Probleme

#### 1. Azure OpenAI-Kontingent überschritten

```bash
# Überprüfen Sie die aktuelle Quotenverwendung
az cognitiveservices usage list --location eastus2

# Quotenanhebung beantragen
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Bereitstellung von Container-Apps fehlgeschlagen

```bash
# Überprüfen Sie die Protokolle der Container-App
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Starten Sie die Container-App neu
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Initialisierung des Suchdienstes

```bash
# Überprüfen Sie den Status des Suchdienstes
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Testen Sie die Konnektivität des Suchdienstes
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validierung der Bereitstellung

```bash
# Überprüfen, ob alle Ressourcen erstellt wurden
az resource list \
  --resource-group myResourceGroup \
  --output table

# Überprüfen Sie den Zustand der Ressourcen
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Sicherheitsüberlegungen

### Schlüsselverwaltung
- Alle Geheimnisse werden in Azure Key Vault gespeichert (falls aktiviert)
- Container-Apps verwenden Managed Identity für die Authentifizierung
- Speicherkonten haben sichere Standardeinstellungen (nur HTTPS, kein öffentlicher Blob-Zugriff)

### Netzwerksicherheit
- Container-Apps verwenden, wenn möglich, internes Netzwerk
- Suchdienst ist mit der Option für private Endpunkte konfiguriert
- Cosmos DB ist mit minimal notwendigen Berechtigungen konfiguriert

### RBAC-Konfiguration
```bash
# Notwendige Rollen für verwaltete Identität zuweisen
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Kostenoptimierung

### Kostenschätzungen (Monatlich, USD)

| Modus     | OpenAI   | Container-Apps | Suche   | Speicher | Gesamt geschätzt |
|-----------|----------|----------------|---------|----------|------------------|
| Minimal   | $50-200  | $20-50         | $25-100 | $5-20    | $100-370         |
| Standard  | $200-800 | $100-300       | $100-300| $20-50   | $420-1450        |
| Premium   | $500-2000| $300-800       | $300-600| $50-100  | $1150-3500       |

### Kostenüberwachung

```bash
# Budgetwarnungen einrichten
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Updates und Wartung

### Vorlagen-Updates
- Versionieren Sie die ARM-Vorlagendateien
- Testen Sie Änderungen zuerst in der Entwicklungsumgebung
- Verwenden Sie den Modus für inkrementelle Bereitstellung für Updates

### Ressourcen-Updates
```bash
# Mit neuen Parametern aktualisieren
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Backup und Wiederherstellung
- Automatische Backups für Cosmos DB aktiviert
- Soft Delete für Key Vault aktiviert
- Container-App-Revisions werden für Rollbacks beibehalten

## 📞 Support

- **Vorlagenprobleme**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure-Support**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Community**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Bereit, Ihre Multi-Agenten-Lösung bereitzustellen?**

Starten Sie mit: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Nutzung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
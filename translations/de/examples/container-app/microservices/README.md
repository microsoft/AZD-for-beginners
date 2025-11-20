<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22ea3f5148517a6012d3e2771584ef87",
  "translation_date": "2025-11-20T01:39:38+00:00",
  "source_file": "examples/container-app/microservices/README.md",
  "language_code": "de"
}
-->
# Microservices-Architektur - Beispiel für Container-App

⏱️ **Geschätzte Zeit**: 25-35 Minuten | 💰 **Geschätzte Kosten**: ~50-100 $/Monat | ⭐ **Komplexität**: Fortgeschritten

Eine **vereinfachte, aber funktionale** Microservices-Architektur, die mit dem AZD CLI in Azure Container Apps bereitgestellt wird. Dieses Beispiel zeigt die Kommunikation zwischen Diensten, Container-Orchestrierung und Überwachung mit einer praktischen 2-Dienste-Konfiguration.

> **📚 Lernansatz**: Dieses Beispiel beginnt mit einer minimalen 2-Dienste-Architektur (API-Gateway + Backend-Dienst), die Sie tatsächlich bereitstellen und verstehen können. Nachdem Sie diese Grundlage gemeistert haben, bieten wir Anleitungen zur Erweiterung auf ein vollständiges Microservices-Ökosystem.

## Was Sie lernen werden

Durch den Abschluss dieses Beispiels werden Sie:
- Mehrere Container in Azure Container Apps bereitstellen
- Dienst-zu-Dienst-Kommunikation mit internem Netzwerk implementieren
- Skalierung und Gesundheitsprüfungen basierend auf der Umgebung konfigurieren
- Verteilte Anwendungen mit Application Insights überwachen
- Microservices-Bereitstellungsmuster und Best Practices verstehen
- Schrittweise Erweiterung von einfachen zu komplexen Architekturen lernen

## Architektur

### Phase 1: Was wir bauen (in diesem Beispiel enthalten)

```
                    ┌─────────────────────────────┐
                    │         Internet            │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTPS
                                   │
                    ┌──────────────▼──────────────┐
                    │      API Gateway            │
                    │   (Node.js Container)       │
                    │   - Routes requests         │
                    │   - Health checks           │
                    │   - Request logging         │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTP (internal)
                                   │
                    ┌──────────────▼──────────────┐
                    │    Product Service          │
                    │   (Python Container)        │
                    │   - Product CRUD            │
                    │   - In-memory data store    │
                    │   - REST API                │
                    └──────────────┬──────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   Application Insights      │
                    │   (Monitoring & Logs)       │
                    └─────────────────────────────┘
```

**Warum einfach anfangen?**
- ✅ Schnell bereitstellen und verstehen (25-35 Minuten)
- ✅ Kernmuster von Microservices ohne Komplexität lernen
- ✅ Funktionierender Code, den Sie anpassen und ausprobieren können
- ✅ Geringere Lernkosten (~50-100 $/Monat vs. 300-1400 $/Monat)
- ✅ Vertrauen aufbauen, bevor Datenbanken und Nachrichtenwarteschlangen hinzugefügt werden

**Analogie**: Denken Sie daran wie das Autofahren lernen. Sie beginnen auf einem leeren Parkplatz (2 Dienste), beherrschen die Grundlagen und wagen sich dann in den Stadtverkehr (5+ Dienste mit Datenbanken).

### Phase 2: Zukünftige Erweiterung (Referenzarchitektur)

Sobald Sie die 2-Dienste-Architektur beherrschen, können Sie erweitern auf:

```
Full Architecture (Not Included - For Reference)
├── API Gateway (✅ Included)
├── Product Service (✅ Included)
├── Order Service (🔜 Add next)
├── User Service (🔜 Add next)
├── Notification Service (🔜 Add last)
├── Azure Service Bus (🔜 For async communication)
├── Cosmos DB (🔜 For product persistence)
├── Azure SQL (🔜 For order management)
└── Azure Storage (🔜 For file storage)
```

Siehe Abschnitt "Erweiterungsanleitung" am Ende für schrittweise Anweisungen.

## Enthaltene Funktionen

✅ **Dienstentdeckung**: Automatische DNS-basierte Erkennung zwischen Containern  
✅ **Lastverteilung**: Eingebaute Lastverteilung über Replikate  
✅ **Auto-Skalierung**: Unabhängige Skalierung pro Dienst basierend auf HTTP-Anfragen  
✅ **Gesundheitsüberwachung**: Liveness- und Readiness-Probes für beide Dienste  
✅ **Verteiltes Logging**: Zentrales Logging mit Application Insights  
✅ **Internes Netzwerk**: Sichere Dienst-zu-Dienst-Kommunikation  
✅ **Container-Orchestrierung**: Automatische Bereitstellung und Skalierung  
✅ **Updates ohne Ausfallzeit**: Rolling Updates mit Revisionsmanagement  

## Voraussetzungen

### Erforderliche Tools

Bevor Sie beginnen, stellen Sie sicher, dass Sie diese Tools installiert haben:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (Version 1.0.0 oder höher)  
   ```bash
   azd version
   # Erwartete Ausgabe: azd Version 1.0.0 oder höher
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (Version 2.50.0 oder höher)  
   ```bash
   az --version
   # Erwartete Ausgabe: azure-cli 2.50.0 oder höher
   ```

3. **[Docker](https://www.docker.com/get-started)** (für lokale Entwicklung/Tests - optional)  
   ```bash
   docker --version
   # Erwartete Ausgabe: Docker-Version 20.10 oder höher
   ```

### Azure-Anforderungen

- Ein aktives **Azure-Abonnement** ([kostenloses Konto erstellen](https://azure.microsoft.com/free/))
- Berechtigungen zum Erstellen von Ressourcen in Ihrem Abonnement
- **Mitwirkender**-Rolle im Abonnement oder in der Ressourcengruppe

### Wissensvoraussetzungen

Dies ist ein Beispiel auf **fortgeschrittenem Niveau**. Sie sollten:
- Das [Simple Flask API Beispiel](../../../../../examples/container-app/simple-flask-api) abgeschlossen haben
- Grundlegendes Verständnis der Microservices-Architektur besitzen
- Vertrautheit mit REST-APIs und HTTP haben
- Verständnis für Container-Konzepte haben

**Neu bei Container-Apps?** Beginnen Sie zuerst mit dem [Simple Flask API Beispiel](../../../../../examples/container-app/simple-flask-api), um die Grundlagen zu lernen.

## Schnellstart (Schritt-für-Schritt)

### Schritt 1: Klonen und Navigieren

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Erfolgskontrolle**: Überprüfen Sie, ob `azure.yaml` angezeigt wird:
```bash
ls
# Erwartet: README.md, azure.yaml, infra/, src/
```

### Schritt 2: Authentifizieren mit Azure

```bash
azd auth login
```

Dies öffnet Ihren Browser zur Azure-Authentifizierung. Melden Sie sich mit Ihren Azure-Anmeldedaten an.

**✓ Erfolgskontrolle**: Sie sollten Folgendes sehen:
```
Logged in to Azure.
```

### Schritt 3: Umgebung initialisieren

```bash
azd init
```

**Eingabeaufforderungen, die Sie sehen werden**:
- **Umgebungsname**: Geben Sie einen kurzen Namen ein (z. B. `microservices-dev`)
- **Azure-Abonnement**: Wählen Sie Ihr Abonnement aus
- **Azure-Standort**: Wählen Sie eine Region (z. B. `eastus`, `westeurope`)

**✓ Erfolgskontrolle**: Sie sollten Folgendes sehen:
```
SUCCESS: New project initialized!
```

### Schritt 4: Infrastruktur und Dienste bereitstellen

```bash
azd up
```

**Was passiert** (dauert 8-12 Minuten):
1. Erstellt Container-Apps-Umgebung
2. Erstellt Application Insights zur Überwachung
3. Baut API-Gateway-Container (Node.js)
4. Baut Produktdienst-Container (Python)
5. Stellt beide Container in Azure bereit
6. Konfiguriert Netzwerk und Gesundheitsprüfungen
7. Richtet Überwachung und Logging ein

**✓ Erfolgskontrolle**: Sie sollten Folgendes sehen:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Zeit**: 8-12 Minuten

### Schritt 5: Bereitstellung testen

```bash
# Abrufen des Gateway-Endpunkts
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Testen der API-Gateway-Gesundheit
curl $GATEWAY_URL/health

# Erwartete Ausgabe:
# {"status":"gesund","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Produktdienst über Gateway testen**:
```bash
# Produkte auflisten
curl $GATEWAY_URL/api/products

# Erwartete Ausgabe:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Maus","price":29.99,"stock":200},
#   {"id":3,"name":"Tastatur","price":79.99,"stock":150}
# ]
```

**✓ Erfolgskontrolle**: Beide Endpunkte geben JSON-Daten ohne Fehler zurück.

---

**🎉 Glückwunsch!** Sie haben eine Microservices-Architektur in Azure bereitgestellt!

## Projektstruktur

Alle Implementierungsdateien sind enthalten – dies ist ein vollständiges, funktionierendes Beispiel:

```
microservices/
│
├── README.md                         # This file
├── azure.yaml                        # AZD configuration
├── .gitignore                        # Git ignore patterns
│
├── infra/                           # Infrastructure as Code (Bicep)
│   ├── main.bicep                   # Main orchestration
│   ├── abbreviations.json           # Naming conventions
│   ├── core/                        # Shared infrastructure
│   │   ├── container-apps-environment.bicep  # Container environment + registry
│   │   └── monitor.bicep            # Application Insights + Log Analytics
│   └── app/                         # Service definitions
│       ├── api-gateway.bicep        # API Gateway container app
│       └── product-service.bicep    # Product Service container app
│
└── src/                             # Application source code
    ├── api-gateway/                 # Node.js API Gateway
    │   ├── app.js                   # Express server with routing
    │   ├── package.json             # Node dependencies
    │   └── Dockerfile               # Container definition
    └── product-service/             # Python Product Service
        ├── main.py                  # Flask API with product data
        ├── requirements.txt         # Python dependencies
        └── Dockerfile               # Container definition
```

**Was jede Komponente macht:**

**Infrastruktur (infra/)**:
- `main.bicep`: Orchestriert alle Azure-Ressourcen und deren Abhängigkeiten
- `core/container-apps-environment.bicep`: Erstellt die Container-Apps-Umgebung und Azure Container Registry
- `core/monitor.bicep`: Richtet Application Insights für verteiltes Logging ein
- `app/*.bicep`: Einzelne Container-App-Definitionen mit Skalierung und Gesundheitsprüfungen

**API-Gateway (src/api-gateway/)**:
- Öffentlich zugänglicher Dienst, der Anfragen an Backend-Dienste weiterleitet
- Implementiert Logging, Fehlerbehandlung und Anfragenweiterleitung
- Zeigt Dienst-zu-Dienst-HTTP-Kommunikation

**Produktdienst (src/product-service/)**:
- Interner Dienst mit Produktkatalog (in-memory zur Vereinfachung)
- REST-API mit Gesundheitsprüfungen
- Beispiel für ein Backend-Microservice-Muster

## Diensteübersicht

### API-Gateway (Node.js/Express)

**Port**: 8080  
**Zugriff**: Öffentlich (externer Ingress)  
**Zweck**: Leitet eingehende Anfragen an die entsprechenden Backend-Dienste weiter  

**Endpunkte**:
- `GET /` - Dienstinformationen
- `GET /health` - Gesundheitsprüfungs-Endpunkt
- `GET /api/products` - Weiterleitung an Produktdienst (alle auflisten)
- `GET /api/products/:id` - Weiterleitung an Produktdienst (nach ID abrufen)

**Hauptmerkmale**:
- Anfragenweiterleitung mit axios
- Zentrales Logging
- Fehlerbehandlung und Timeout-Management
- Dienstentdeckung über Umgebungsvariablen
- Integration von Application Insights

**Code-Highlight** (`src/api-gateway/app.js`):
```javascript
// Interne Dienstkommunikation
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Produktdienst (Python/Flask)

**Port**: 8000  
**Zugriff**: Nur intern (kein externer Ingress)  
**Zweck**: Verwalten des Produktkatalogs mit in-memory-Daten  

**Endpunkte**:
- `GET /` - Dienstinformationen
- `GET /health` - Gesundheitsprüfungs-Endpunkt
- `GET /products` - Alle Produkte auflisten
- `GET /products/<id>` - Produkt nach ID abrufen

**Hauptmerkmale**:
- RESTful API mit Flask
- In-memory-Produktstore (einfach, keine Datenbank erforderlich)
- Gesundheitsüberwachung mit Probes
- Strukturiertes Logging
- Integration von Application Insights

**Datenmodell**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Warum nur intern?**
Der Produktdienst ist nicht öffentlich zugänglich. Alle Anfragen müssen über das API-Gateway erfolgen, das Folgendes bietet:
- Sicherheit: Kontrollierter Zugangspunkt
- Flexibilität: Backend kann geändert werden, ohne Clients zu beeinflussen
- Überwachung: Zentrales Anfragen-Logging

## Verständnis der Dienstkommunikation

### Wie Dienste miteinander kommunizieren

In diesem Beispiel kommuniziert das API-Gateway mit dem Produktdienst über **interne HTTP-Aufrufe**:

```javascript
// API-Gateway (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Interne HTTP-Anfrage stellen
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Wichtige Punkte**:

1. **DNS-basierte Erkennung**: Container-Apps bieten automatisch DNS für interne Dienste
   - Produktdienst-FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Vereinfacht als: `http://product-service` (Container-Apps löst dies auf)

2. **Keine öffentliche Exposition**: Produktdienst hat `external: false` in Bicep
   - Nur innerhalb der Container-Apps-Umgebung zugänglich
   - Kann nicht aus dem Internet erreicht werden

3. **Umgebungsvariablen**: Dienst-URLs werden zur Bereitstellungszeit injiziert
   - Bicep übergibt den internen FQDN an das Gateway
   - Keine fest codierten URLs im Anwendungscode

**Analogie**: Stellen Sie sich dies wie Büroräume vor. Das API-Gateway ist der Empfang (öffentlich zugänglich), und der Produktdienst ist ein Büroraum (nur intern). Besucher müssen über den Empfang gehen, um ein Büro zu erreichen.

## Bereitstellungsoptionen

### Vollständige Bereitstellung (empfohlen)

```bash
# Infrastruktur und beide Dienste bereitstellen
azd up
```

Dies stellt bereit:
1. Container-Apps-Umgebung
2. Application Insights
3. Container Registry
4. API-Gateway-Container
5. Produktdienst-Container

**Zeit**: 8-12 Minuten

### Einzelnen Dienst bereitstellen

```bash
# Nur einen Dienst bereitstellen (nach dem ersten azd up)
azd deploy api-gateway

# Oder Produktdienst bereitstellen
azd deploy product-service
```

**Anwendungsfall**: Wenn Sie den Code in einem Dienst aktualisiert haben und nur diesen Dienst erneut bereitstellen möchten.

### Konfiguration aktualisieren

```bash
# Ändere Skalierungsparameter
azd env set GATEWAY_MAX_REPLICAS 30

# Erneut bereitstellen mit neuer Konfiguration
azd up
```

## Konfiguration

### Skalierungskonfiguration

Beide Dienste sind in ihren Bicep-Dateien mit HTTP-basierter Autoskalierung konfiguriert:

**API-Gateway**:
- Min. Replikate: 2 (immer mindestens 2 für Verfügbarkeit)
- Max. Replikate: 20
- Skalierungsauslöser: 50 gleichzeitige Anfragen pro Replikat

**Produktdienst**:
- Min. Replikate: 1 (kann bei Bedarf auf null skalieren)
- Max. Replikate: 10
- Skalierungsauslöser: 100 gleichzeitige Anfragen pro Replikat

**Skalierung anpassen** (in `infra/app/*.bicep`):
```bicep
scale: {
  minReplicas: 1
  maxReplicas: 10
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '100'  // Adjust this
        }
      }
    }
  ]
}
```

### Ressourcenallokation

**API-Gateway**:
- CPU: 1.0 vCPU
- Speicher: 2 GiB
- Grund: Verarbeitet den gesamten externen Traffic

**Produktdienst**:
- CPU: 0.5 vCPU
- Speicher: 1 GiB
- Grund: Leichte in-memory-Operationen

### Gesundheitsprüfungen

Beide Dienste enthalten Liveness- und Readiness-Probes:

```bicep
probes: [
  {
    type: 'Liveness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 10
    periodSeconds: 30
  }
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 5
    periodSeconds: 10
  }
]
```

**Was das bedeutet**:
- **Liveness**: Wenn die Gesundheitsprüfung fehlschlägt, startet Container-Apps den Container neu
- **Readiness**: Wenn nicht bereit, leitet Container-Apps keinen Traffic an dieses Replikat weiter

## Überwachung & Beobachtbarkeit

### Dienstprotokolle anzeigen

```bash
# Protokolle vom API-Gateway streamen
azd logs api-gateway --follow

# Kürzliche Protokolle des Produktdienstes anzeigen
azd logs product-service --tail 100

# Alle Protokolle von beiden Diensten anzeigen
azd logs --follow
```

**Erwartete Ausgabe**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights-Abfragen

Greifen Sie auf Application Insights im Azure-Portal zu und führen Sie diese Abfragen aus:

**Langsame Anfragen finden**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Dienst-zu-Dienst-Aufrufe verfolgen**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Fehlerrate nach Dienst**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Anfragevolumen über die Zeit**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Überwachungs-Dashboard aufrufen

```bash
# Abrufen von Application Insights-Details
azd env get-values | grep APPLICATIONINSIGHTS

# Azure-Portal-Überwachung öffnen
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Live-Metriken

1. Navigieren Sie zu Application Insights im Azure-Portal
2. Klicken Sie auf "Live-Metriken"
3. Sehen Sie Echtzeit-Anfragen, Fehler und Leistung
4. Testen Sie, indem Sie ausführen: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Praktische Übungen

[Hinweis: Siehe vollständige Übungen oben im Abschnitt "Praktische Übungen" für detaillierte Schritt-für-Schritt-Übungen, einschließlich Bereitstellungsverifizierung, Datenänderung, Autoskalierungstests, Fehlerbehandlung und Hinzufügen eines dritten Dienstes.]

## Kostenanalyse

### Geschätzte monatliche Kosten (für dieses 2-Dienste-Beispiel)

| Ressource | Konfiguration | Geschätzte Kosten |
|-----------|---------------|-------------------|
| API-Gateway | 2-20 Replikate, 1 vCPU, 2GB RAM | $30-150 |
| Produktdienst | 1-10 Replikate, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic-Tarif | $5 |
| Application Insights | 1-2 GB/Monat | $5-10 |
| Log Analytics | 1 GB/Monat | $3 |
| **Gesamt** | | **$58-243/Monat** |

**Kostenaufteilung nach Nutzung**:
- **Geringer Traffic** (Testen/Lernen): ~60 $/Monat
- **Moderater Traffic** (kleine Produktion): ~120 $/Monat
- **Hoher Traffic** (starke Auslastung): ~240 $/Monat

### Tipps zur Kostenoptimierung

1. **Für Entwicklung auf null skalieren**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Verwenden Sie den Verbrauchstarif für Cosmos DB** (wenn Sie ihn hinzufügen):
   - Zahlen Sie nur für das, was Sie nutzen
   - Keine Mindestgebühr

3. **Application Insights-Sampling einstellen**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Stichprobe von 50% der Anfragen
   ```

4. **Aufräumen, wenn nicht benötigt**:
   ```bash
   azd down
   ```

### Optionen für den kostenlosen Tarif
Für das Lernen/Testen, beachten Sie:
- Nutzen Sie Azure-Guthaben (erste 30 Tage)
- Halten Sie die Anzahl der Replikate minimal
- Löschen Sie nach dem Testen (keine laufenden Kosten)

---

## Bereinigung

Um laufende Kosten zu vermeiden, löschen Sie alle Ressourcen:

```bash
azd down --force --purge
```

**Bestätigungsaufforderung**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Geben Sie `y` ein, um zu bestätigen.

**Was wird gelöscht**:
- Container Apps Umgebung
- Beide Container Apps (Gateway & Produktservice)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Ressourcengruppe

**✓ Bereinigung überprüfen**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Sollte leer zurückgeben.

---

## Erweiterungsleitfaden: Von 2 zu 5+ Diensten

Sobald Sie diese 2-Dienste-Architektur beherrschen, können Sie wie folgt erweitern:

### Phase 1: Hinzufügen von Datenbankpersistenz (Nächster Schritt)

**Cosmos DB für den Produktservice hinzufügen**:

1. Erstellen Sie `infra/core/cosmos.bicep`:
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. Aktualisieren Sie den Produktservice, um Cosmos DB anstelle von In-Memory-Daten zu verwenden.

3. Geschätzte zusätzliche Kosten: ~25 $/Monat (serverlos)

### Phase 2: Hinzufügen eines dritten Dienstes (Bestellverwaltung)

**Bestellservice erstellen**:

1. Neuer Ordner: `src/order-service/` (Python/Node.js/C#)
2. Neues Bicep: `infra/app/order-service.bicep`
3. Aktualisieren Sie das API-Gateway, um `/api/orders` zu routen.
4. Fügen Sie eine Azure SQL-Datenbank für die Bestellpersistenz hinzu.

**Die Architektur wird**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Phase 3: Hinzufügen asynchroner Kommunikation (Service Bus)

**Ereignisgesteuerte Architektur implementieren**:

1. Fügen Sie Azure Service Bus hinzu: `infra/core/servicebus.bicep`
2. Der Produktservice veröffentlicht "ProductCreated"-Ereignisse.
3. Der Bestellservice abonniert Produktereignisse.
4. Fügen Sie einen Benachrichtigungsdienst hinzu, um Ereignisse zu verarbeiten.

**Muster**: Anfrage/Antwort (HTTP) + Ereignisgesteuert (Service Bus)

### Phase 4: Hinzufügen von Benutzer-Authentifizierung

**Benutzerdienst implementieren**:

1. Erstellen Sie `src/user-service/` (Go/Node.js)
2. Fügen Sie Azure AD B2C oder benutzerdefinierte JWT-Authentifizierung hinzu.
3. Das API-Gateway validiert Tokens.
4. Dienste überprüfen Benutzerberechtigungen.

### Phase 5: Produktionsreife

**Fügen Sie diese Komponenten hinzu**:
- Azure Front Door (globales Load Balancing)
- Azure Key Vault (Geheimnisverwaltung)
- Azure Monitor Workbooks (benutzerdefinierte Dashboards)
- CI/CD-Pipeline (GitHub Actions)
- Blue-Green-Deployments
- Verwaltete Identität für alle Dienste

**Kosten für vollständige Produktionsarchitektur**: ~300-1.400 $/Monat

---

## Mehr erfahren

### Verwandte Dokumentation
- [Azure Container Apps Dokumentation](https://learn.microsoft.com/azure/container-apps/)
- [Microservices Architekturleitfaden](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights für verteiltes Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Nächste Schritte in diesem Kurs
- ← Vorher: [Einfaches Flask API](../../../../../examples/container-app/simple-flask-api) - Beispiel für eine einfache Einzelcontainer-Anwendung
- → Weiter: [AI-Integrationsleitfaden](../../../../../examples/docs/ai-foundry) - KI-Funktionen hinzufügen
- 🏠 [Kursübersicht](../../README.md)

### Vergleich: Wann was verwenden

**Einzelne Container-App** (Beispiel: Einfaches Flask API):
- ✅ Einfache Anwendungen
- ✅ Monolithische Architektur
- ✅ Schnelle Bereitstellung
- ❌ Begrenzte Skalierbarkeit
- **Kosten**: ~15-50 $/Monat

**Microservices** (Dieses Beispiel):
- ✅ Komplexe Anwendungen
- ✅ Unabhängige Skalierung pro Dienst
- ✅ Teamautonomie (verschiedene Dienste, verschiedene Teams)
- ❌ Komplexer zu verwalten
- **Kosten**: ~60-250 $/Monat

**Kubernetes (AKS)**:
- ✅ Maximale Kontrolle und Flexibilität
- ✅ Multi-Cloud-Portabilität
- ✅ Fortschrittliches Networking
- ❌ Erfordert Kubernetes-Kenntnisse
- **Kosten**: ~150-500 $/Monat Minimum

**Empfehlung**: Beginnen Sie mit Container-Apps (dieses Beispiel) und wechseln Sie zu AKS, nur wenn Sie Kubernetes-spezifische Funktionen benötigen.

---

## Häufig gestellte Fragen

**F: Warum nur 2 Dienste statt 5+?**  
A: Pädagogische Progression. Beherrschen Sie die Grundlagen (Dienstkommunikation, Überwachung, Skalierung) mit einem einfachen Beispiel, bevor Sie die Komplexität erhöhen. Die hier erlernten Muster gelten auch für Architekturen mit 100 Diensten.

**F: Kann ich selbst weitere Dienste hinzufügen?**  
A: Absolut! Folgen Sie dem oben genannten Erweiterungsleitfaden. Jeder neue Dienst folgt demselben Muster: src-Ordner erstellen, Bicep-Datei erstellen, azure.yaml aktualisieren, bereitstellen.

**F: Ist das produktionsreif?**  
A: Es ist eine solide Grundlage. Für die Produktion fügen Sie hinzu: verwaltete Identität, Key Vault, persistente Datenbanken, CI/CD-Pipeline, Überwachungswarnungen und Backup-Strategie.

**F: Warum nicht Dapr oder ein anderes Service-Mesh verwenden?**  
A: Halten Sie es einfach zum Lernen. Sobald Sie das native Networking von Container-Apps verstehen, können Sie Dapr für fortgeschrittene Szenarien hinzufügen.

**F: Wie debugge ich lokal?**  
A: Führen Sie Dienste lokal mit Docker aus:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**F: Kann ich verschiedene Programmiersprachen verwenden?**  
A: Ja! Dieses Beispiel zeigt Node.js (Gateway) + Python (Produktservice). Sie können beliebige Sprachen mischen, die in Containern laufen.

**F: Was, wenn ich keine Azure-Guthaben habe?**  
A: Nutzen Sie die kostenlose Azure-Stufe (erste 30 Tage für neue Konten) oder führen Sie Tests nur kurz durch und löschen Sie die Ressourcen sofort.

---

> **🎓 Zusammenfassung des Lernpfads**: Sie haben gelernt, eine Multi-Service-Architektur mit automatischer Skalierung, internem Networking, zentralisierter Überwachung und produktionsreifen Mustern bereitzustellen. Diese Grundlage bereitet Sie auf komplexe verteilte Systeme und Unternehmens-Microservices-Architekturen vor.

**📚 Kursnavigation:**
- ← Vorher: [Einfaches Flask API](../../../../../examples/container-app/simple-flask-api)
- → Weiter: [Beispiel für Datenbankintegration](../../../../../examples/database-app)
- 🏠 [Kursübersicht](../../README.md)
- 📖 [Best Practices für Container-Apps](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Nutzung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
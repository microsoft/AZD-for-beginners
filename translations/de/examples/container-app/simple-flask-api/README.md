<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9e7f581a238c1bf7f9f31a2ba118a90c",
  "translation_date": "2025-11-20T01:47:16+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "de"
}
-->
# Einfache Flask-API - Beispiel für eine Container-App

**Lernpfad:** Anfänger ⭐ | **Zeit:** 25-35 Minuten | **Kosten:** $0-15/Monat

Eine vollständige, funktionierende Python Flask REST-API, die mit Azure Developer CLI (azd) in Azure Container Apps bereitgestellt wird. Dieses Beispiel zeigt die Grundlagen der Container-Bereitstellung, Auto-Skalierung und Überwachung.

## 🎯 Was Sie lernen werden

- Eine containerisierte Python-Anwendung in Azure bereitstellen
- Auto-Skalierung mit Scale-to-Zero konfigurieren
- Health Probes und Readiness-Checks implementieren
- Anwendungsprotokolle und Metriken überwachen
- Azure Developer CLI für schnelle Bereitstellung nutzen

## 📦 Was ist enthalten

✅ **Flask-Anwendung** - Vollständige REST-API mit CRUD-Operationen (`src/app.py`)  
✅ **Dockerfile** - Produktionsbereite Container-Konfiguration  
✅ **Bicep-Infrastruktur** - Container-Apps-Umgebung und API-Bereitstellung  
✅ **AZD-Konfiguration** - Ein-Kommando-Bereitstellungssetup  
✅ **Health Probes** - Liveness- und Readiness-Checks konfiguriert  
✅ **Auto-Skalierung** - 0-10 Replikate basierend auf HTTP-Last  

## Architektur

```
┌─────────────────────────────────────────┐
│   Azure Container Apps Environment      │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │   Flask API Container             │ │
│  │   - Health endpoints              │ │
│  │   - REST API                      │ │
│  │   - Auto-scaling (0-10 replicas)  │ │
│  └───────────────────────────────────┘ │
│                                         │
│  Application Insights ────────────────┐ │
└────────────────────────────────────────┘
```

## Voraussetzungen

### Erforderlich
- **Azure Developer CLI (azd)** - [Installationsanleitung](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure-Abonnement** - [Kostenloses Konto](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Docker installieren](https://www.docker.com/products/docker-desktop/) (für lokale Tests)

### Voraussetzungen überprüfen

```bash
# Überprüfen Sie die azd-Version (mindestens 1.5.0 erforderlich)
azd version

# Azure-Anmeldung überprüfen
azd auth login

# Docker überprüfen (optional, für lokale Tests)
docker --version
```

## ⏱️ Bereitstellungszeitplan

| Phase | Dauer | Was passiert |
|-------|-------|--------------|
| Umgebung einrichten | 30 Sekunden | azd-Umgebung erstellen |
| Container bauen | 2-3 Minuten | Docker baut Flask-App |
| Infrastruktur bereitstellen | 3-5 Minuten | Container-Apps, Registry, Überwachung erstellen |
| Anwendung bereitstellen | 2-3 Minuten | Image pushen und in Container-Apps bereitstellen |
| **Gesamt** | **8-12 Minuten** | Bereitstellung abgeschlossen |

## Schnellstart

```bash
# Navigieren Sie zum Beispiel
cd examples/container-app/simple-flask-api

# Umgebung initialisieren (einen eindeutigen Namen wählen)
azd env new myflaskapi

# Alles bereitstellen (Infrastruktur + Anwendung)
azd up
# Sie werden aufgefordert:
# 1. Azure-Abonnement auswählen
# 2. Standort wählen (z. B. eastus2)
# 3. 8-12 Minuten auf die Bereitstellung warten

# Holen Sie sich Ihren API-Endpunkt
azd env get-values

# Testen Sie die API
curl $(azd env get-value API_ENDPOINT)/health
```

**Erwartete Ausgabe:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Bereitstellung überprüfen

### Schritt 1: Bereitstellungsstatus prüfen

```bash
# Bereitgestellte Dienste anzeigen
azd show

# Erwartete Ausgabe zeigt:
# - Dienst: api
# - Endpunkt: https://ca-api-[env].xxx.azurecontainerapps.io
# - Status: Läuft
```

### Schritt 2: API-Endpunkte testen

```bash
# API-Endpunkt abrufen
API_URL=$(azd env get-value API_ENDPOINT)

# Gesundheit testen
curl $API_URL/health

# Root-Endpunkt testen
curl $API_URL/

# Ein Element erstellen
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Alle Elemente abrufen
curl $API_URL/api/items
```

**Erfolgskriterien:**
- ✅ Health-Endpunkt gibt HTTP 200 zurück
- ✅ Root-Endpunkt zeigt API-Informationen
- ✅ POST erstellt ein Element und gibt HTTP 201 zurück
- ✅ GET gibt erstellte Elemente zurück

### Schritt 3: Protokolle anzeigen

```bash
# Live-Protokolle streamen
azd logs api --follow

# Sie sollten sehen:
# - Gunicorn-Startmeldungen
# - HTTP-Anforderungsprotokolle
# - Anwendungsinformationsprotokolle
```

## Projektstruktur

```
simple-flask-api/
├── azure.yaml              # AZD configuration
├── infra/
│   ├── main.bicep         # Main infrastructure
│   ├── main.parameters.json
│   └── app/
│       ├── container-env.bicep
│       └── api.bicep
└── src/
    ├── app.py             # Flask application
    ├── requirements.txt
    └── Dockerfile
```

## API-Endpunkte

| Endpunkt | Methode | Beschreibung |
|----------|---------|--------------|
| `/health` | GET | Health-Check |
| `/api/items` | GET | Alle Elemente auflisten |
| `/api/items` | POST | Neues Element erstellen |
| `/api/items/{id}` | GET | Spezifisches Element abrufen |
| `/api/items/{id}` | PUT | Element aktualisieren |
| `/api/items/{id}` | DELETE | Element löschen |

## Konfiguration

### Umgebungsvariablen

```bash
# Benutzerdefinierte Konfiguration festlegen
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Skalierungskonfiguration

Die API skaliert automatisch basierend auf HTTP-Traffic:
- **Minimale Replikate**: 0 (skaliert auf Null, wenn inaktiv)
- **Maximale Replikate**: 10
- **Gleichzeitige Anfragen pro Replikat**: 50

## Entwicklung

### Lokal ausführen

```bash
# Abhängigkeiten installieren
cd src
pip install -r requirements.txt

# Die App ausführen
python app.py

# Lokal testen
curl http://localhost:8000/health
```

### Container bauen und testen

```bash
# Docker-Image erstellen
docker build -t flask-api:local ./src

# Container lokal ausführen
docker run -p 8000:8000 flask-api:local

# Container testen
curl http://localhost:8000/health
```

## Bereitstellung

### Vollständige Bereitstellung

```bash
# Infrastruktur und Anwendung bereitstellen
azd up
```

### Nur Code-Bereitstellung

```bash
# Nur Anwendungscode bereitstellen (Infrastruktur unverändert)
azd deploy api
```

### Konfiguration aktualisieren

```bash
# Aktualisiere Umgebungsvariablen
azd env set API_KEY "new-api-key"

# Erneut bereitstellen mit neuer Konfiguration
azd deploy api
```

## Überwachung

### Protokolle anzeigen

```bash
# Live-Protokolle streamen
azd logs api --follow

# Letzte 100 Zeilen anzeigen
azd logs api --tail 100
```

### Metriken überwachen

```bash
# Azure Monitor-Dashboard öffnen
azd monitor --overview

# Bestimmte Metriken anzeigen
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Tests

### Health-Check

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Erwartete Antwort:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Element erstellen

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Alle Elemente abrufen

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Kostenoptimierung

Diese Bereitstellung verwendet Scale-to-Zero, sodass Sie nur zahlen, wenn die API Anfragen verarbeitet:

- **Leerlaufkosten**: ~$0/Monat (auf Null skaliert)
- **Aktive Kosten**: ~$0.000024/Sekunde pro Replikat
- **Erwartete monatliche Kosten** (leichte Nutzung): $5-15

### Kosten weiter senken

```bash
# Maximale Replikate für Entwicklung reduzieren
azd env set MAX_REPLICAS 3

# Kürzere Leerlaufzeit verwenden
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 Minuten
```

## Fehlerbehebung

### Container startet nicht

```bash
# Überprüfen Sie Container-Logs
azd logs api --tail 100

# Überprüfen Sie, ob Docker-Images lokal gebaut werden
docker build -t test ./src
```

### API nicht erreichbar

```bash
# Überprüfen Sie, ob der Eingriff extern ist
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Hohe Antwortzeiten

```bash
# Überprüfen Sie die CPU-/Speichernutzung
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Ressourcen bei Bedarf hochskalieren
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Bereinigung

```bash
# Alle Ressourcen löschen
azd down --force --purge
```

## Nächste Schritte

### Dieses Beispiel erweitern

1. **Datenbank hinzufügen** - Azure Cosmos DB oder SQL-Datenbank integrieren  
   ```bash
   # Fügen Sie das Cosmos DB-Modul zu infra/main.bicep hinzu
   # Aktualisieren Sie app.py mit der Datenbankverbindung
   ```

2. **Authentifizierung hinzufügen** - Azure AD oder API-Schlüssel implementieren  
   ```python
   # Fügen Sie Authentifizierungs-Middleware zu app.py hinzu
   from functools import wraps
   ```

3. **CI/CD einrichten** - GitHub Actions Workflow  
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Managed Identity hinzufügen** - Zugriff auf Azure-Dienste absichern  
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Verwandte Beispiele

- **[Datenbank-App](../../../../../examples/database-app)** - Vollständiges Beispiel mit SQL-Datenbank
- **[Microservices](../../../../../examples/container-app/microservices)** - Architektur mit mehreren Diensten
- **[Container Apps Master Guide](../README.md)** - Alle Container-Muster

### Lernressourcen

- 📚 [AZD für Anfänger Kurs](../../../README.md) - Hauptkursübersicht
- 📚 [Container Apps Muster](../README.md) - Weitere Bereitstellungsmuster
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - Community-Vorlagen

## Zusätzliche Ressourcen

### Dokumentation
- **[Flask-Dokumentation](https://flask.palletsprojects.com/)** - Leitfaden zum Flask-Framework
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Offizielle Azure-Dokumentation
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd-Befehlsreferenz

### Tutorials
- **[Container Apps Schnellstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Ihre erste App bereitstellen
- **[Python auf Azure](https://learn.microsoft.com/azure/developer/python/)** - Leitfaden zur Python-Entwicklung
- **[Bicep-Sprache](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktur als Code

### Tools
- **[Azure-Portal](https://portal.azure.com)** - Ressourcen visuell verwalten
- **[VS Code Azure-Erweiterung](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE-Integration

---

**🎉 Glückwunsch!** Sie haben eine produktionsreife Flask-API mit Auto-Skalierung und Überwachung in Azure Container Apps bereitgestellt.

**Fragen?** [Ein Issue eröffnen](https://github.com/microsoft/AZD-for-beginners/issues) oder die [FAQ](../../../resources/faq.md) prüfen

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
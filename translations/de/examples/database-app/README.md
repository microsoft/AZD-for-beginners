<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "10bf998e2d70c35d713fbe6905841b95",
  "translation_date": "2025-11-20T01:55:03+00:00",
  "source_file": "examples/database-app/README.md",
  "language_code": "de"
}
-->
# Bereitstellung einer Microsoft SQL-Datenbank und Web-App mit AZD

⏱️ **Geschätzte Zeit**: 20-30 Minuten | 💰 **Geschätzte Kosten**: ~15-25 €/Monat | ⭐ **Komplexität**: Mittel

Dieses **vollständige, funktionierende Beispiel** zeigt, wie Sie mit der [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) eine Python Flask-Webanwendung mit einer Microsoft SQL-Datenbank in Azure bereitstellen. Der gesamte Code ist enthalten und getestet – keine externen Abhängigkeiten erforderlich.

## Was Sie lernen werden

Durch die Durchführung dieses Beispiels lernen Sie:
- Bereitstellung einer mehrschichtigen Anwendung (Web-App + Datenbank) mit Infrastructure-as-Code
- Sichere Datenbankverbindungen konfigurieren, ohne Geheimnisse fest zu codieren
- Überwachung der Anwendungsintegrität mit Application Insights
- Effizientes Verwalten von Azure-Ressourcen mit der AZD CLI
- Befolgen von Azure Best Practices für Sicherheit, Kostenoptimierung und Beobachtbarkeit

## Szenarioübersicht
- **Web-App**: Python Flask REST API mit Datenbankanbindung
- **Datenbank**: Azure SQL-Datenbank mit Beispieldaten
- **Infrastruktur**: Bereitgestellt mit Bicep (modulare, wiederverwendbare Vorlagen)
- **Bereitstellung**: Vollständig automatisiert mit `azd`-Befehlen
- **Überwachung**: Application Insights für Protokolle und Telemetrie

## Voraussetzungen

### Erforderliche Tools

Überprüfen Sie vor Beginn, ob diese Tools installiert sind:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (Version 2.50.0 oder höher)
   ```sh
   az --version
   # Erwartete Ausgabe: azure-cli 2.50.0 oder höher
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (Version 1.0.0 oder höher)
   ```sh
   azd version
   # Erwartete Ausgabe: azd Version 1.0.0 oder höher
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (für lokale Entwicklung)
   ```sh
   python --version
   # Erwartete Ausgabe: Python 3.8 oder höher
   ```

4. **[Docker](https://www.docker.com/get-started)** (optional, für lokale containerisierte Entwicklung)
   ```sh
   docker --version
   # Erwartete Ausgabe: Docker-Version 20.10 oder höher
   ```

### Azure-Anforderungen

- Ein aktives **Azure-Abonnement** ([kostenloses Konto erstellen](https://azure.microsoft.com/free/))
- Berechtigungen zum Erstellen von Ressourcen in Ihrem Abonnement
- **Besitzer**- oder **Mitwirkender**-Rolle im Abonnement oder Ressourcengruppe

### Wissensvoraussetzungen

Dies ist ein Beispiel auf **mittlerem Niveau**. Sie sollten vertraut sein mit:
- Grundlegenden Befehlszeilenoperationen
- Grundlegenden Cloud-Konzepten (Ressourcen, Ressourcengruppen)
- Grundlegendes Verständnis von Webanwendungen und Datenbanken

**Neu bei AZD?** Beginnen Sie zuerst mit der [Einführung](../../docs/getting-started/azd-basics.md).

## Architektur

Dieses Beispiel stellt eine zweischichtige Architektur mit einer Webanwendung und SQL-Datenbank bereit:

```
┌─────────────────┐        ┌──────────────────────┐
│  User Browser   │◄──────►│   Azure Web App      │
└─────────────────┘        │   (Flask API)        │
                           │   - /health          │
                           │   - /products        │
                           └──────────┬───────────┘
                                      │
                                      │ Secure Connection
                                      │ (Encrypted)
                                      │
                           ┌──────────▼───────────┐
                           │ Azure SQL Database   │
                           │   - Products table   │
                           │   - Sample data      │
                           └──────────────────────┘
```

**Ressourcenbereitstellung:**
- **Ressourcengruppe**: Container für alle Ressourcen
- **App Service Plan**: Linux-basiertes Hosting (B1-Tarif für Kosteneffizienz)
- **Web-App**: Python 3.11-Laufzeit mit Flask-Anwendung
- **SQL-Server**: Verwalteter Datenbankserver mit mindestens TLS 1.2
- **SQL-Datenbank**: Basistarif (2 GB, geeignet für Entwicklung/Tests)
- **Application Insights**: Überwachung und Protokollierung
- **Log Analytics Workspace**: Zentralisierte Protokollspeicherung

**Analogie**: Stellen Sie sich das wie ein Restaurant (Web-App) mit einem Kühlraum (Datenbank) vor. Kunden bestellen von der Speisekarte (API-Endpunkte), und die Küche (Flask-App) holt Zutaten (Daten) aus dem Kühlraum. Der Restaurantmanager (Application Insights) verfolgt alles, was passiert.

## Ordnerstruktur

Alle Dateien sind in diesem Beispiel enthalten – keine externen Abhängigkeiten erforderlich:

```
examples/database-app/
│
├── README.md                    # This file
├── azure.yaml                   # AZD configuration file
├── .env.sample                  # Sample environment variables
├── .gitignore                   # Git ignore patterns
│
├── infra/                       # Infrastructure as Code (Bicep)
│   ├── main.bicep              # Main orchestration template
│   ├── abbreviations.json      # Azure naming conventions
│   └── resources/              # Modular resource templates
│       ├── sql-server.bicep    # SQL Server configuration
│       ├── sql-database.bicep  # Database configuration
│       ├── app-service-plan.bicep  # Hosting plan
│       ├── app-insights.bicep  # Monitoring setup
│       └── web-app.bicep       # Web application
│
└── src/
    └── web/                    # Application source code
        ├── app.py              # Flask REST API
        ├── requirements.txt    # Python dependencies
        └── Dockerfile          # Container definition
```

**Was jede Datei macht:**
- **azure.yaml**: Gibt AZD an, was bereitgestellt werden soll und wo
- **infra/main.bicep**: Orchestriert alle Azure-Ressourcen
- **infra/resources/*.bicep**: Einzelne Ressourcendefinitionen (modular für Wiederverwendung)
- **src/web/app.py**: Flask-Anwendung mit Datenbanklogik
- **requirements.txt**: Python-Paketabhängigkeiten
- **Dockerfile**: Containerisierungsanweisungen für die Bereitstellung

## Schnellstart (Schritt-für-Schritt)

### Schritt 1: Klonen und Navigieren

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Erfolgskontrolle**: Überprüfen Sie, ob Sie `azure.yaml` und den `infra/`-Ordner sehen:
```sh
ls
# Erwartet: README.md, azure.yaml, infra/, src/
```

### Schritt 2: Authentifizieren mit Azure

```sh
azd auth login
```

Dies öffnet Ihren Browser zur Azure-Authentifizierung. Melden Sie sich mit Ihren Azure-Anmeldedaten an.

**✓ Erfolgskontrolle**: Sie sollten Folgendes sehen:
```
Logged in to Azure.
```

### Schritt 3: Umgebung initialisieren

```sh
azd init
```

**Was passiert**: AZD erstellt eine lokale Konfiguration für Ihre Bereitstellung.

**Eingabeaufforderungen, die Sie sehen werden**:
- **Umgebungsname**: Geben Sie einen kurzen Namen ein (z. B. `dev`, `myapp`)
- **Azure-Abonnement**: Wählen Sie Ihr Abonnement aus der Liste aus
- **Azure-Standort**: Wählen Sie eine Region (z. B. `eastus`, `westeurope`)

**✓ Erfolgskontrolle**: Sie sollten Folgendes sehen:
```
SUCCESS: New project initialized!
```

### Schritt 4: Azure-Ressourcen bereitstellen

```sh
azd provision
```

**Was passiert**: AZD stellt die gesamte Infrastruktur bereit (dauert 5-8 Minuten):
1. Erstellt Ressourcengruppe
2. Erstellt SQL-Server und Datenbank
3. Erstellt App Service Plan
4. Erstellt Web-App
5. Erstellt Application Insights
6. Konfiguriert Netzwerk und Sicherheit

**Sie werden aufgefordert**:
- **SQL-Admin-Benutzername**: Geben Sie einen Benutzernamen ein (z. B. `sqladmin`)
- **SQL-Admin-Passwort**: Geben Sie ein starkes Passwort ein (speichern Sie dies!)

**✓ Erfolgskontrolle**: Sie sollten Folgendes sehen:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Zeit**: 5-8 Minuten

### Schritt 5: Anwendung bereitstellen

```sh
azd deploy
```

**Was passiert**: AZD erstellt und stellt Ihre Flask-Anwendung bereit:
1. Paketiert die Python-Anwendung
2. Erstellt den Docker-Container
3. Überträgt auf Azure Web-App
4. Initialisiert die Datenbank mit Beispieldaten
5. Startet die Anwendung

**✓ Erfolgskontrolle**: Sie sollten Folgendes sehen:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Zeit**: 3-5 Minuten

### Schritt 6: Anwendung durchsuchen

```sh
azd browse
```

Dies öffnet Ihre bereitgestellte Web-App im Browser unter `https://app-<unique-id>.azurewebsites.net`

**✓ Erfolgskontrolle**: Sie sollten JSON-Ausgabe sehen:
```json
{
  "message": "Welcome to the Database App API",
  "endpoints": {
    "/": "This help message",
    "/health": "Health check endpoint",
    "/products": "List all products",
    "/products/<id>": "Get product by ID"
  }
}
```

### Schritt 7: API-Endpunkte testen

**Integritätsprüfung** (Datenbankverbindung überprüfen):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Erwartete Antwort**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Produkte auflisten** (Beispieldaten):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Erwartete Antwort**:
```json
[
  {
    "id": 1,
    "name": "Laptop",
    "description": "High-performance laptop",
    "price": 1299.99,
    "created_at": "2025-11-19T10:30:00"
  },
  ...
]
```

**Einzelnes Produkt abrufen**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Erfolgskontrolle**: Alle Endpunkte geben JSON-Daten ohne Fehler zurück.

---

**🎉 Herzlichen Glückwunsch!** Sie haben erfolgreich eine Webanwendung mit einer Datenbank in Azure mit AZD bereitgestellt.

## Konfigurationsdetails

### Umgebungsvariablen

Geheimnisse werden sicher über die Azure App Service-Konfiguration verwaltet – **niemals fest im Quellcode codiert**.

**Automatisch von AZD konfiguriert**:
- `SQL_CONNECTION_STRING`: Datenbankverbindung mit verschlüsselten Anmeldeinformationen
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Telemetrie-Endpunkt für Überwachung
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Aktiviert automatische Abhängigkeitsinstallation

**Wo Geheimnisse gespeichert werden**:
1. Während `azd provision` geben Sie SQL-Anmeldeinformationen über sichere Eingabeaufforderungen ein
2. AZD speichert diese in Ihrer lokalen `.azure/<env-name>/.env`-Datei (git-ignoriert)
3. AZD injiziert sie in die Azure App Service-Konfiguration (verschlüsselt im Ruhezustand)
4. Die Anwendung liest sie zur Laufzeit über `os.getenv()`

### Lokale Entwicklung

Für lokale Tests erstellen Sie eine `.env`-Datei aus der Vorlage:

```sh
cp .env.sample .env
# Bearbeiten Sie .env mit Ihrer lokalen Datenbankverbindung
```

**Lokaler Entwicklungsworkflow**:
```sh
# Abhängigkeiten installieren
cd src/web
pip install -r requirements.txt

# Umgebungsvariablen festlegen
export SQL_CONNECTION_STRING="your-local-connection-string"

# Anwendung ausführen
python app.py
```

**Lokal testen**:
```sh
curl http://localhost:8000/health
# Erwartet: {"status": "gesund", "datenbank": "verbunden"}
```

### Infrastructure as Code

Alle Azure-Ressourcen sind in **Bicep-Vorlagen** (`infra/`-Ordner) definiert:

- **Modulares Design**: Jeder Ressourcentyp hat seine eigene Datei für Wiederverwendbarkeit
- **Parametrisiert**: Anpassung von SKUs, Regionen, Namenskonventionen
- **Best Practices**: Befolgt Azure-Namensstandards und Sicherheitsvorgaben
- **Versionskontrolle**: Infrastrukturänderungen werden in Git verfolgt

**Anpassungsbeispiel**:
Um den Datenbanktarif zu ändern, bearbeiten Sie `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Sicherheitsbest Practices

Dieses Beispiel folgt den Sicherheitsbest Practices von Azure:

### 1. **Keine Geheimnisse im Quellcode**
- ✅ Anmeldeinformationen in Azure App Service-Konfiguration gespeichert (verschlüsselt)
- ✅ `.env`-Dateien über `.gitignore` von Git ausgeschlossen
- ✅ Geheimnisse über sichere Parameter während der Bereitstellung übergeben

### 2. **Verschlüsselte Verbindungen**
- ✅ Mindestens TLS 1.2 für SQL-Server
- ✅ HTTPS-only für Web-App erzwungen
- ✅ Datenbankverbindungen nutzen verschlüsselte Kanäle

### 3. **Netzwerksicherheit**
- ✅ SQL-Server-Firewall so konfiguriert, dass nur Azure-Dienste zugelassen werden
- ✅ Öffentlicher Netzwerkzugriff eingeschränkt (kann weiter mit Private Endpoints gesichert werden)
- ✅ FTPS auf Web-App deaktiviert

### 4. **Authentifizierung & Autorisierung**
- ⚠️ **Aktuell**: SQL-Authentifizierung (Benutzername/Passwort)
- ✅ **Empfehlung für Produktion**: Verwenden Sie Azure Managed Identity für passwortlose Authentifizierung

**Umstellung auf Managed Identity** (für Produktion):
1. Aktivieren Sie die Managed Identity auf der Web-App
2. Gewähren Sie der Identität SQL-Berechtigungen
3. Aktualisieren Sie die Verbindungszeichenfolge, um Managed Identity zu verwenden
4. Entfernen Sie die passwortbasierte Authentifizierung

### 5. **Auditing & Compliance**
- ✅ Application Insights protokolliert alle Anfragen und Fehler
- ✅ SQL-Datenbank-Auditing aktiviert (kann für Compliance konfiguriert werden)
- ✅ Alle Ressourcen mit Tags für Governance versehen

**Sicherheitscheckliste vor der Produktion**:
- [ ] Aktivieren Sie Azure Defender für SQL
- [ ] Konfigurieren Sie Private Endpoints für SQL-Datenbank
- [ ] Aktivieren Sie die Web Application Firewall (WAF)
- [ ] Implementieren Sie Azure Key Vault für Geheimnisrotation
- [ ] Konfigurieren Sie Azure AD-Authentifizierung
- [ ] Aktivieren Sie Diagnoseprotokollierung für alle Ressourcen

## Kostenoptimierung

**Geschätzte monatliche Kosten** (Stand November 2025):

| Ressource | SKU/Tarif | Geschätzte Kosten |
|-----------|-----------|-------------------|
| App Service Plan | B1 (Basic) | ~13 €/Monat |
| SQL-Datenbank | Basic (2 GB) | ~5 €/Monat |
| Application Insights | Pay-as-you-go | ~2 €/Monat (geringer Traffic) |
| **Gesamt** | | **~20 €/Monat** |

**💡 Tipps zur Kosteneinsparung**:

1. **Kostenlose Tarife für Lernzwecke nutzen**:
   - App Service: F1-Tarif (kostenlos, begrenzte Stunden)
   - SQL-Datenbank: Verwenden Sie Azure SQL-Datenbank serverless
   - Application Insights: 5 GB/Monat kostenloser Datenverkehr

2. **Ressourcen stoppen, wenn sie nicht verwendet werden**:
   ```sh
   # Stoppen Sie die Web-App (Datenbank berechnet weiterhin)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Neustarten, wenn nötig
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Alles nach dem Testen löschen**:
   ```sh
   azd down
   ```
   Dies entfernt ALLE Ressourcen und stoppt die Kosten.

4. **Entwicklungs- vs. Produktions-SKUs**:
   - **Entwicklung**: Basistarif (in diesem Beispiel verwendet)
   - **Produktion**: Standard-/Premium-Tarif mit Redundanz

**Kostenüberwachung**:
- Kosten anzeigen in [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Kostenwarnungen einrichten, um Überraschungen zu vermeiden
- Alle Ressourcen mit `azd-env-name` für die Nachverfolgung taggen

**Alternative für kostenlose Tarife**:
Für Lernzwecke können Sie `infra/resources/app-service-plan.bicep` ändern:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Hinweis**: Der kostenlose Tarif hat Einschränkungen (60 Min./Tag CPU, kein Always-On).

## Überwachung & Beobachtbarkeit

### Application Insights-Integration

Dieses Beispiel enthält **Application Insights** für umfassende Überwachung:

**Was überwacht wird**:
- ✅ HTTP-Anfragen (Latenz, Statuscodes, Endpunkte)
- ✅ Anwendungsfehler und Ausnahmen
- ✅ Benutzerdefinierte Protokollierung aus der Flask-App
- ✅ Datenbankverbindungsintegrität
- ✅ Leistungskennzahlen (CPU, Speicher)

**Zugriff auf Application Insights**:
1. Öffnen Sie [Azure Portal](https://portal.azure.com)
2. Navigieren Sie zu Ihrer Ressourcengruppe (`rg-<env-name>`)
3. Klicken Sie auf die Application Insights-Ressource (`appi-<unique-id>`)

**Nützliche Abfragen** (Application Insights → Protokolle):

**Alle Anfragen anzeigen**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Fehler finden**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Integritätsendpunkt überprüfen**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL-Datenbank-Auditing

**SQL-Datenbank-Auditing ist aktiviert**, um Folgendes zu verfolgen:
- Datenbankzugriffsmuster
- Fehlgeschlagene Anmeldeversuche
- Schemaänderungen
- Datenzugriff (für Compliance)

**Zugriff auf Audit-Protokolle**:
1. Azure Portal → SQL-Datenbank → Auditing
2. Protokolle im Log Analytics Workspace anzeigen

### Echtzeitüberwachung

**Live-Metriken anzeigen**:
1. Application Insights → Live-Metriken
2. Sehen Sie Anfragen, Fehler und Leistung in Echtzeit

**Warnungen einrichten**:
Erstellen Sie Warnungen für kritische Ereignisse:
- HTTP 500-Fehler > 5 in 5 Minuten
- Datenbankverbindungsfehler
- Hohe Antwortzeiten (>2 Sekunden)

**Beispiel für die Erstellung einer Warnung**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Fehlerbehebung

### Häufige Probleme und Lösungen

#### 1. `azd provision` schlägt fehl mit "Location not available"

**Symptom**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Lösung**:
Wählen Sie eine andere Azure-Region oder registrieren Sie den Ressourcenanbieter:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. SQL-Verbindung schlägt während der Bereitstellung fehl

**Symptom**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Lösung**:
- Überprüfen Sie, ob die SQL Server-Firewall Azure-Dienste zulässt (automatisch konfiguriert)
- Stellen Sie sicher, dass das SQL-Admin-Passwort während `azd provision` korrekt eingegeben wurde
- Vergewissern Sie sich, dass der SQL Server vollständig bereitgestellt ist (kann 2-3 Minuten dauern)

**Verbindung überprüfen**:
```sh
# Gehen Sie im Azure-Portal zu SQL-Datenbank → Abfrage-Editor
# Versuchen Sie, sich mit Ihren Anmeldedaten zu verbinden
```

#### 3. Web-App zeigt "Application Error"

**Symptom**:
Der Browser zeigt eine generische Fehlerseite.

**Lösung**:
Überprüfen Sie die Anwendungsprotokolle:
```sh
# Zeige aktuelle Protokolle
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Häufige Ursachen**:
- Fehlende Umgebungsvariablen (App Service → Konfiguration überprüfen)
- Fehler bei der Installation von Python-Paketen (Bereitstellungsprotokolle überprüfen)
- Datenbankinitialisierungsfehler (SQL-Konnektivität überprüfen)

#### 4. `azd deploy` schlägt fehl mit "Build Error"

**Symptom**:
```
Error: Failed to build project
```

**Lösung**:
- Stellen Sie sicher, dass `requirements.txt` keine Syntaxfehler enthält
- Überprüfen Sie, ob Python 3.11 in `infra/resources/web-app.bicep` angegeben ist
- Vergewissern Sie sich, dass die Dockerfile das richtige Basis-Image verwendet

**Lokal debuggen**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" bei der Ausführung von AZD-Befehlen

**Symptom**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Lösung**:
Authentifizieren Sie sich erneut bei Azure:
```sh
azd auth login
az login
```

Überprüfen Sie, ob Sie die richtigen Berechtigungen (Contributor-Rolle) für das Abonnement haben.

#### 6. Hohe Datenbankkosten

**Symptom**:
Unerwartete Azure-Rechnung.

**Lösung**:
- Überprüfen Sie, ob Sie `azd down` nach dem Testen vergessen haben
- Stellen Sie sicher, dass die SQL-Datenbank die Basic-Stufe verwendet (nicht Premium)
- Überprüfen Sie die Kosten in Azure Cost Management
- Richten Sie Kostenwarnungen ein

### Hilfe erhalten

**Alle AZD-Umgebungsvariablen anzeigen**:
```sh
azd env get-values
```

**Bereitstellungsstatus überprüfen**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Anwendungsprotokolle abrufen**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Brauchen Sie weitere Hilfe?**
- [AZD Fehlerbehebungsleitfaden](../../docs/troubleshooting/common-issues.md)
- [Azure App Service Fehlerbehebung](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL Fehlerbehebung](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Praktische Übungen

### Übung 1: Überprüfen Sie Ihre Bereitstellung (Anfänger)

**Ziel**: Bestätigen Sie, dass alle Ressourcen bereitgestellt sind und die Anwendung funktioniert.

**Schritte**:
1. Listen Sie alle Ressourcen in Ihrer Ressourcengruppe auf:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Erwartet**: 6-7 Ressourcen (Web-App, SQL Server, SQL-Datenbank, App Service Plan, Application Insights, Log Analytics)

2. Testen Sie alle API-Endpunkte:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Erwartet**: Alle geben gültiges JSON ohne Fehler zurück

3. Überprüfen Sie Application Insights:
   - Navigieren Sie zu Application Insights im Azure-Portal
   - Gehen Sie zu "Live Metrics"
   - Aktualisieren Sie Ihren Browser auf der Web-App
   **Erwartet**: Sie sehen Anfragen in Echtzeit

**Erfolgskriterien**: Alle 6-7 Ressourcen existieren, alle Endpunkte geben Daten zurück, Live Metrics zeigt Aktivität.

---

### Übung 2: Fügen Sie einen neuen API-Endpunkt hinzu (Fortgeschritten)

**Ziel**: Erweitern Sie die Flask-Anwendung mit einem neuen Endpunkt.

**Starter-Code**: Aktuelle Endpunkte in `src/web/app.py`

**Schritte**:
1. Bearbeiten Sie `src/web/app.py` und fügen Sie nach der Funktion `get_product()` einen neuen Endpunkt hinzu:
   ```python
   @app.route('/products/search/<keyword>')
   def search_products(keyword):
       """Search products by name or description."""
       try:
           conn = get_db_connection()
           cursor = conn.cursor()
           cursor.execute(
               "SELECT id, name, description, price, created_at FROM products WHERE name LIKE ? OR description LIKE ?",
               (f'%{keyword}%', f'%{keyword}%')
           )
           
           products = []
           for row in cursor.fetchall():
               products.append({
                   'id': row[0],
                   'name': row[1],
                   'description': row[2],
                   'price': float(row[3]) if row[3] else None,
                   'created_at': row[4].isoformat() if row[4] else None
               })
           
           cursor.close()
           conn.close()
           
           logger.info(f"Search for '{keyword}' returned {len(products)} results")
           return jsonify(products), 200
           
       except Exception as e:
           logger.error(f"Error searching products: {str(e)}")
           return jsonify({'error': str(e)}), 500
   ```

2. Stellen Sie die aktualisierte Anwendung bereit:
   ```sh
   azd deploy
   ```

3. Testen Sie den neuen Endpunkt:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Erwartet**: Gibt Produkte zurück, die "laptop" entsprechen

**Erfolgskriterien**: Neuer Endpunkt funktioniert, gibt gefilterte Ergebnisse zurück, erscheint in den Application Insights-Protokollen.

---

### Übung 3: Überwachung und Warnungen hinzufügen (Fortgeschritten)

**Ziel**: Richten Sie proaktive Überwachung mit Warnungen ein.

**Schritte**:
1. Erstellen Sie eine Warnung für HTTP 500-Fehler:
   ```sh
   # Abrufen der Ressourcen-ID von Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Alarm erstellen
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Lösen Sie die Warnung aus, indem Sie Fehler verursachen:
   ```sh
   # Fordere ein nicht existierendes Produkt an
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Überprüfen Sie, ob die Warnung ausgelöst wurde:
   - Azure-Portal → Warnungen → Warnregeln
   - Überprüfen Sie Ihre E-Mail (falls konfiguriert)

**Erfolgskriterien**: Warnregel ist erstellt, wird bei Fehlern ausgelöst, Benachrichtigungen werden empfangen.

---

### Übung 4: Änderungen am Datenbankschema (Fortgeschritten)

**Ziel**: Fügen Sie eine neue Tabelle hinzu und ändern Sie die Anwendung, um sie zu verwenden.

**Schritte**:
1. Verbinden Sie sich mit der SQL-Datenbank über den Azure-Portal-Abfrage-Editor

2. Erstellen Sie eine neue `categories`-Tabelle:
   ```sql
   CREATE TABLE categories (
       id INT PRIMARY KEY IDENTITY(1,1),
       name NVARCHAR(50) NOT NULL,
       description NVARCHAR(200)
   );
   
   INSERT INTO categories (name, description) VALUES
   ('Electronics', 'Electronic devices and accessories'),
   ('Office Supplies', 'Office equipment and supplies');
   
   -- Add category to products table
   ALTER TABLE products ADD category_id INT;
   UPDATE products SET category_id = 1; -- Set all to Electronics
   ```

3. Aktualisieren Sie `src/web/app.py`, um Kategorieninformationen in Antworten einzuschließen

4. Bereitstellen und testen

**Erfolgskriterien**: Neue Tabelle existiert, Produkte zeigen Kategorieninformationen, Anwendung funktioniert weiterhin.

---

### Übung 5: Implementieren Sie Caching (Experte)

**Ziel**: Fügen Sie Azure Redis Cache hinzu, um die Leistung zu verbessern.

**Schritte**:
1. Fügen Sie Redis Cache zu `infra/main.bicep` hinzu
2. Aktualisieren Sie `src/web/app.py`, um Produktabfragen zu cachen
3. Messen Sie die Leistungsverbesserung mit Application Insights
4. Vergleichen Sie die Antwortzeiten vor/nach dem Caching

**Erfolgskriterien**: Redis ist bereitgestellt, Caching funktioniert, Antwortzeiten verbessern sich um >50%.

**Tipp**: Beginnen Sie mit der [Azure Cache for Redis-Dokumentation](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Bereinigung

Um laufende Kosten zu vermeiden, löschen Sie alle Ressourcen nach Abschluss:

```sh
azd down
```

**Bestätigungsaufforderung**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Geben Sie `y` ein, um zu bestätigen.

**✓ Erfolgskontrolle**: 
- Alle Ressourcen sind aus dem Azure-Portal gelöscht
- Keine laufenden Kosten
- Lokaler `.azure/<env-name>`-Ordner kann gelöscht werden

**Alternative** (Infrastruktur behalten, Daten löschen):
```sh
# Löschen Sie nur die Ressourcengruppe (behalten Sie die AZD-Konfiguration)
az group delete --name rg-<env-name> --yes
```
## Mehr erfahren

### Verwandte Dokumentation
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL-Datenbank Dokumentation](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service Dokumentation](https://learn.microsoft.com/azure/app-service/)
- [Application Insights Dokumentation](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep Sprachreferenz](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Nächste Schritte in diesem Kurs
- **[Container Apps Beispiel](../../../../examples/container-app)**: Microservices mit Azure Container Apps bereitstellen
- **[AI-Integrationsleitfaden](../../../../docs/ai-foundry)**: KI-Funktionen zu Ihrer App hinzufügen
- **[Bereitstellungs-Best Practices](../../docs/deployment/deployment-guide.md)**: Produktionsbereitstellungsmuster

### Fortgeschrittene Themen
- **Managed Identity**: Passwörter entfernen und Azure AD-Authentifizierung verwenden
- **Private Endpoints**: Datenbankverbindungen innerhalb eines virtuellen Netzwerks sichern
- **CI/CD-Integration**: Bereitstellungen mit GitHub Actions oder Azure DevOps automatisieren
- **Multi-Umgebung**: Entwicklungs-, Staging- und Produktionsumgebungen einrichten
- **Datenbankmigrationen**: Alembic oder Entity Framework für Schema-Versionierung verwenden

### Vergleich zu anderen Ansätzen

**AZD vs. ARM Templates**:
- ✅ AZD: Höhere Abstraktionsebene, einfachere Befehle
- ⚠️ ARM: Ausführlicher, granulare Kontrolle

**AZD vs. Terraform**:
- ✅ AZD: Azure-nativ, integriert mit Azure-Diensten
- ⚠️ Terraform: Multi-Cloud-Unterstützung, größere Community

**AZD vs. Azure-Portal**:
- ✅ AZD: Wiederholbar, versionskontrolliert, automatisierbar
- ⚠️ Portal: Manuelle Klicks, schwer reproduzierbar

**Denken Sie an AZD als**: Docker Compose für Azure—vereinfachte Konfiguration für komplexe Bereitstellungen.

---

## Häufig gestellte Fragen

**F: Kann ich eine andere Programmiersprache verwenden?**  
A: Ja! Ersetzen Sie `src/web/` durch Node.js, C#, Go oder eine andere Sprache. Aktualisieren Sie `azure.yaml` und Bicep entsprechend.

**F: Wie füge ich weitere Datenbanken hinzu?**  
A: Fügen Sie ein weiteres SQL-Datenbankmodul in `infra/main.bicep` hinzu oder verwenden Sie PostgreSQL/MySQL aus den Azure-Datenbankdiensten.

**F: Kann ich dies für die Produktion verwenden?**  
A: Dies ist ein Ausgangspunkt. Für die Produktion fügen Sie hinzu: Managed Identity, Private Endpoints, Redundanz, Backup-Strategie, WAF und erweitertes Monitoring.

**F: Was, wenn ich Container anstelle von Codebereitstellung verwenden möchte?**  
A: Sehen Sie sich das [Container Apps Beispiel](../../../../examples/container-app) an, das durchgehend Docker-Container verwendet.

**F: Wie verbinde ich mich von meinem lokalen Rechner mit der Datenbank?**  
A: Fügen Sie Ihre IP der SQL Server-Firewall hinzu:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**F: Kann ich eine vorhandene Datenbank anstelle einer neuen verwenden?**  
A: Ja, ändern Sie `infra/main.bicep`, um auf einen vorhandenen SQL Server zu verweisen, und aktualisieren Sie die Parameter der Verbindungszeichenfolge.

---

> **Hinweis:** Dieses Beispiel zeigt Best Practices für die Bereitstellung einer Web-App mit einer Datenbank unter Verwendung von AZD. Es enthält funktionierenden Code, umfassende Dokumentation und praktische Übungen zur Vertiefung des Lernens. Für Produktionsbereitstellungen überprüfen Sie Sicherheits-, Skalierungs-, Compliance- und Kostenanforderungen, die für Ihre Organisation spezifisch sind.

**📚 Kursnavigation:**
- ← Vorherige: [Container Apps Beispiel](../../../../examples/container-app)
- → Nächste: [AI-Integrationsleitfaden](../../../../docs/ai-foundry)
- 🏠 [Kursübersicht](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
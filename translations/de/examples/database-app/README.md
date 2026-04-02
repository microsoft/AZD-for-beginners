# Bereitstellen einer Microsoft SQL-Datenbank und einer Web-App mit AZD

⏱️ **Geschätzte Zeit**: 20-30 Minuten | 💰 **Geschätzte Kosten**: ~$15-25/Monat | ⭐ **Komplexität**: Mittel

Dieses **vollständige, funktionierende Beispiel** zeigt, wie man die [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) verwendet, um eine Python-Flask-Webanwendung mit einer Microsoft SQL-Datenbank in Azure bereitzustellen. Der gesamte Code ist enthalten und getestet — keine externen Abhängigkeiten erforderlich.

## Was Sie lernen werden

Durch das Abschließen dieses Beispiels werden Sie:
- Eine mehrschichtige Anwendung (Web-App + Datenbank) mit Infrastructure-as-Code bereitstellen
- Sichere Datenbankverbindungen konfigurieren, ohne Geheimnisse im Code zu hinterlegen
- Die Gesundheit der Anwendung mit Application Insights überwachen
- Azure-Ressourcen effizient mit der AZD-CLI verwalten
- Azure-Best Practices für Sicherheit, Kostenoptimierung und Beobachtbarkeit befolgen

## Szenarioüberblick
- **Web App**: Python-Flask-REST-API mit Datenbankanbindung
- **Database**: Azure SQL-Datenbank mit Beispieldaten
- **Infrastructure**: Bereitgestellt mit Bicep (modulare, wiederverwendbare Vorlagen)
- **Deployment**: Vollautomatisiert mit `azd`-Befehlen
- **Monitoring**: Application Insights für Protokolle und Telemetrie

## Voraussetzungen

### Erforderliche Tools

Überprüfen Sie vor Beginn, ob Sie diese Tools installiert haben:

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
- **Owner** oder **Contributor** Rolle auf dem Abonnement oder der Ressourcengruppe

### Kenntnisse

Dies ist ein **Beispiel auf mittlerem Niveau**. Sie sollten vertraut sein mit:
- Grundlegende Kommandozeilenoperationen
- Grundlegende Cloud-Konzepte (Ressourcen, Ressourcengruppen)
- Grundlegendes Verständnis von Webanwendungen und Datenbanken

**Neu bei AZD?** Beginnen Sie zuerst mit dem [Getting Started guide](../../docs/chapter-01-foundation/azd-basics.md).

## Architektur

Dieses Beispiel stellt eine Zwei-Schichten-Architektur mit einer Webanwendung und einer SQL-Datenbank bereit:

```mermaid
graph TD
    Browser[Benutzerbrowser] <--> WebApp[Azure Web-App<br/>Flask-API<br/>/health<br/>/products]
    WebApp -- Sichere Verbindung<br/>Verschlüsselt --> SQL[Azure SQL-Datenbank<br/>Products-Tabelle<br/>Beispieldaten]
```
**Bereitstellung von Ressourcen:**
- **Ressourcengruppe**: Container für alle Ressourcen
- **App Service-Plan**: Linux-basierte Hosting-Umgebung (B1-Tier für Kosteneffizienz)
- **Web App**: Python 3.11-Laufzeit mit Flask-Anwendung
- **SQL Server**: Verwalteter Datenbankserver mit mindestens TLS 1.2
- **SQL Database**: Basic-Tier (2GB, geeignet für Entwicklung/Tests)
- **Application Insights**: Überwachung und Protokollierung
- **Log Analytics Workspace**: Zentralisierte Protokollspeicherung

**Analogie**: Stellen Sie sich das wie ein Restaurant (Web-App) mit einem begehbaren Kühlraum (Datenbank) vor. Kunden bestellen vom Menü (API-Endpunkte), und die Küche (Flask-App) holt die Zutaten (Daten) aus dem Kühlraum. Der Restaurantmanager (Application Insights) überwacht alles, was passiert.

## Ordnerstruktur

Alle Dateien sind in diesem Beispiel enthalten—keine externen Abhängigkeiten erforderlich:

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

**Funktion jeder Datei:**
- **azure.yaml**: Teilt AZD mit, was und wo bereitgestellt werden soll
- **infra/main.bicep**: Orchestriert alle Azure-Ressourcen
- **infra/resources/*.bicep**: Einzelne Ressourcendefinitionen (modular zur Wiederverwendung)
- **src/web/app.py**: Flask-Anwendung mit Datenbanklogik
- **requirements.txt**: Python-Paketabhängigkeiten
- **Dockerfile**: Containerisierungsanweisungen für die Bereitstellung

## Schnellstart (Schritt-für-Schritt)

### Schritt 1: Klonen und navigieren

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Erfolgskontrolle**: Überprüfen Sie, ob Sie die Datei `azure.yaml` und den Ordner `infra/` sehen:
```sh
ls
# Erwartet: README.md, azure.yaml, infra/, src/
```

### Schritt 2: Bei Azure authentifizieren

```sh
azd auth login
```

Dies öffnet Ihren Browser für die Azure-Authentifizierung. Melden Sie sich mit Ihren Azure-Anmeldedaten an.

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
- **Azure subscription**: Wählen Sie Ihr Abonnement aus der Liste
- **Azure location**: Wählen Sie eine Region (z. B. `eastus`, `westeurope`)

**✓ Erfolgskontrolle**: Sie sollten Folgendes sehen:
```
SUCCESS: New project initialized!
```

### Schritt 4: Azure-Ressourcen bereitstellen

```sh
azd provision
```

**Was passiert**: AZD stellt die gesamte Infrastruktur bereit (dauert 5–8 Minuten):
1. Erstellt eine Ressourcengruppe
2. Erstellt SQL Server und Datenbank
3. Erstellt App Service-Plan
4. Erstellt Web-App
5. Erstellt Application Insights
6. Konfiguriert Netzwerk und Sicherheit

**Sie werden nach Folgendem gefragt**:
- **SQL admin username**: Geben Sie einen Benutzernamen ein (z. B. `sqladmin`)
- **SQL admin password**: Geben Sie ein starkes Passwort ein (speichern Sie dieses!)

**✓ Erfolgskontrolle**: Sie sollten Folgendes sehen:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Zeit**: 5–8 Minuten

### Schritt 5: Anwendung bereitstellen

```sh
azd deploy
```

**Was passiert**: AZD baut und stellt Ihre Flask-Anwendung bereit:
1. Paketiert die Python-Anwendung
2. Erstellt den Docker-Container
3. Überträgt in die Azure Web App
4. Initialisiert die Datenbank mit Beispieldaten
5. Startet die Anwendung

**✓ Erfolgskontrolle**: Sie sollten Folgendes sehen:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Zeit**: 3–5 Minuten

### Schritt 6: Anwendung im Browser öffnen

```sh
azd browse
```

Dadurch wird Ihre bereitgestellte Web-App im Browser unter `https://app-<unique-id>.azurewebsites.net` geöffnet

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

**Health-Check** (Datenbankverbindung überprüfen):
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

**✓ Erfolgskontrolle**: Alle Endpunkte liefern JSON-Daten ohne Fehler.

---

**🎉 Herzlichen Glückwunsch!** Sie haben erfolgreich eine Webanwendung mit einer Datenbank in Azure mithilfe von AZD bereitgestellt.

## Detaillierte Konfiguration

### Umgebungsvariablen

Geheimnisse werden sicher über die Azure App Service-Konfiguration verwaltet — **niemals im Quellcode hartkodiert**.

**Von AZD automatisch konfiguriert**:
- `SQL_CONNECTION_STRING`: Datenbankverbindung mit verschlüsselten Zugangsdaten
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Überwachungs-Telemetrie-Endpunkt
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Ermöglicht automatische Installation von Abhängigkeiten

**Wo Geheimnisse gespeichert werden**:
1. Während `azd provision` geben Sie SQL-Zugangsdaten über sichere Eingabeaufforderungen ein
2. AZD speichert diese in Ihrer lokalen `.azure/<env-name>/.env`-Datei (git-ignoriert)
3. AZD injiziert sie in die Azure App Service-Konfiguration (verschlüsselt gespeichert)
4. Die Anwendung liest sie zur Laufzeit über `os.getenv()`

### Lokale Entwicklung

Für lokale Tests erstellen Sie eine `.env`-Datei aus der Vorlage:

```sh
cp .env.sample .env
# Bearbeite die .env-Datei mit deiner lokalen Datenbankverbindung.
```

**Workflow für lokale Entwicklung**:
```sh
# Abhängigkeiten installieren
cd src/web
pip install -r requirements.txt

# Umgebungsvariablen setzen
export SQL_CONNECTION_STRING="your-local-connection-string"

# Anwendung ausführen
python app.py
```

**Lokal testen**:
```sh
curl http://localhost:8000/health
# Erwartet: {"status": "gesund", "database": "verbunden"}
```

### Infrastruktur als Code

Alle Azure-Ressourcen sind in **Bicep-Vorlagen** (`infra/`-Ordner) definiert:

- **Modulares Design**: Jeder Ressourcentyp hat seine eigene Datei für die Wiederverwendbarkeit
- **Parametrisiert**: Passen Sie SKUs, Regionen, Namenskonventionen an
- **Best Practices**: Entspricht den Azure-Namensstandards und Sicherheitsstandards
- **Versioniert**: Infrastrukturänderungen werden in Git nachverfolgt

**Beispiel zur Anpassung**:
Um das Datenbank-Tier zu ändern, bearbeiten Sie `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Sicherheits-Best-Practices

Dieses Beispiel folgt den Azure-Sicherheits-Best-Practices:

### 1. **Keine Geheimnisse im Quellcode**
- ✅ Anmeldeinformationen in der Azure App Service-Konfiguration gespeichert (verschlüsselt)
- ✅ `.env`-Dateien per `.gitignore` von Git ausgeschlossen
- ✅ Geheimnisse werden während der Bereitstellung über sichere Parameter übergeben

### 2. **Verschlüsselte Verbindungen**
- ✅ TLS 1.2 oder höher für SQL Server
- ✅ Nur HTTPS für Web-App erzwungen
- ✅ Datenbankverbindungen nutzen verschlüsselte Kanäle

### 3. **Netzwerksicherheit**
- ✅ SQL Server-Firewall so konfiguriert, dass nur Azure-Dienste zugelassen sind
- ✅ Öffentlicher Netzwerkzugriff eingeschränkt (kann weiter mit Private Endpoints gesichert werden)
- ✅ FTPS in der Web-App deaktiviert

### 4. **Authentifizierung & Autorisierung**
- ⚠️ **Aktuell**: SQL-Authentifizierung (Benutzername/Passwort)
- ✅ **Empfehlung für die Produktion**: Verwenden Sie Azure Managed Identity für passwortlose Authentifizierung

**Um auf Managed Identity umzusteigen** (für die Produktion):
1. Aktivieren Sie die verwaltete Identität in der Web-App
2. Geben Sie der Identität SQL-Berechtigungen
3. Aktualisieren Sie die Verbindungszeichenfolge, um Managed Identity zu verwenden
4. Entfernen Sie die passwortbasierte Authentifizierung

### 5. **Prüfung & Compliance**
- ✅ Application Insights protokolliert alle Anfragen und Fehler
- ✅ SQL Database-Auditing aktiviert (kann für Compliance konfiguriert werden)
- ✅ Alle Ressourcen zur Governance getaggt

**Sicherheits-Checkliste vor dem Einsatz in Produktion**:
- [ ] Azure Defender für SQL aktivieren
- [ ] Private Endpoints für SQL-Datenbank konfigurieren
- [ ] Web Application Firewall (WAF) aktivieren
- [ ] Azure Key Vault zur Geheimnisrotation implementieren
- [ ] Azure AD-Authentifizierung konfigurieren
- [ ] Diagnostische Protokollierung für alle Ressourcen aktivieren

## Kostenoptimierung

**Geschätzte monatliche Kosten** (Stand November 2025):

| Ressource | SKU/Tier | Geschätzte Kosten |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/Monat |
| SQL Database | Basic (2GB) | ~$5/Monat |
| Application Insights | Pay-as-you-go | ~$2/Monat (geringer Traffic) |
| **Total** | | **~$20/Monat** |

**💡 Tipps zur Kosteneinsparung**:

1. **Kostenlose Stufe zum Lernen verwenden**:
   - App Service: F1-Tier (kostenlos, begrenzte Stunden)
   - SQL Database: Azure SQL Database serverless verwenden
   - Application Insights: 5GB/Monat kostenlose Ingestion

2. **Ressourcen bei Nichtgebrauch stoppen**:
   ```sh
   # Web-App stoppen (Datenbank wird weiterhin abgerechnet)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Bei Bedarf neu starten
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Alles nach dem Testen löschen**:
   ```sh
   azd down
   ```
   Dies entfernt ALLE Ressourcen und stoppt die Kosten.

4. **Entwicklungs- vs. Produktions-SKUs**:
   - **Entwicklung**: Basic-Tier (in diesem Beispiel verwendet)
   - **Produktion**: Standard-/Premium-Tier mit Redundanz

**Kostenüberwachung**:
- Anzeigen der Kosten in [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Richten Sie Kostenwarnungen ein, um Überraschungen zu vermeiden
- Markieren Sie alle Ressourcen mit `azd-env-name` zur Nachverfolgung

**Alternative: Kostenloser Tarif**:
Für Lernzwecke können Sie `infra/resources/app-service-plan.bicep` anpassen:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Hinweis**: Der kostenlose Tarif hat Einschränkungen (60 min/Tag CPU, kein Always-On).

## Überwachung & Beobachtbarkeit

### Integration von Application Insights

Dieses Beispiel beinhaltet **Application Insights** für umfassendes Monitoring:

**Was überwacht wird**:
- ✅ HTTP-Anfragen (Latenz, Statuscodes, Endpunkte)
- ✅ Anwendungsfehler und Ausnahmen
- ✅ Benutzerdefinierte Protokollierung aus der Flask-App
- ✅ Zustand der Datenbankverbindung
- ✅ Performance-Metriken (CPU, Arbeitsspeicher)

**Application Insights aufrufen**:
1. Öffnen Sie das [Azure-Portal](https://portal.azure.com)
2. Navigieren Sie zu Ihrer Ressourcengruppe (`rg-<env-name>`)
3. Klicken Sie auf die Application Insights-Ressource (`appi-<unique-id>`)

**Nützliche Abfragen** (Application Insights → Logs):

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

**Health-Endpunkt prüfen**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL-Datenbank-Auditing

**SQL Database-Auditing ist aktiviert**, um zu verfolgen:
- Zugriffsmuster auf die Datenbank
- Fehlgeschlagene Anmeldeversuche
- Schemaänderungen
- Datenzugriffe (für Compliance)

**Auf Audit-Protokolle zugreifen**:
1. Azure-Portal → SQL Database → Auditing
2. Protokolle im Log Analytics-Arbeitsbereich anzeigen

### Echtzeitüberwachung

**Live-Metriken anzeigen**:
1. Application Insights → Live Metrics
2. Sehen Sie Anfragen, Ausfälle und Performance in Echtzeit

**Alarme einrichten**:
Erstellen Sie Alarme für kritische Ereignisse:
- HTTP 500-Fehler > 5 in 5 Minuten
- Datenbankverbindungsfehler
- Hohe Antwortzeiten (>2 Sekunden)

**Beispiel: Alarm erstellen**:
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
Wählen Sie eine andere Azure-Region oder registrieren Sie den Resource Provider:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. SQL-Verbindung schlägt während der Bereitstellung fehl

**Symptom**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Lösung**:
- Überprüfen Sie, ob die SQL Server-Firewall Azure-Dienste zulässt (wird automatisch konfiguriert)
- Prüfen Sie, ob das SQL-Administratorpasswort während `azd provision` korrekt eingegeben wurde
- Stellen Sie sicher, dass der SQL Server vollständig bereitgestellt ist (kann 2–3 Minuten dauern)

**Verbindung überprüfen**:
```sh
# Gehen Sie im Azure-Portal zu SQL-Datenbank → Abfrage-Editor
# Versuchen Sie, sich mit Ihren Anmeldeinformationen zu verbinden
```

#### 3. Web App zeigt "Application Error"

**Symptom**:
Der Browser zeigt eine generische Fehlermeldungsseite.

**Lösung**:
Prüfen Sie die Anwendungsprotokolle:
```sh
# Neueste Protokolle anzeigen
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Häufige Ursachen**:
- Fehlende Umgebungsvariablen (prüfen Sie App Service → Configuration)
- Installation von Python-Paketen fehlgeschlagen (prüfen Sie die Bereitstellungsprotokolle)
- Fehler bei der Datenbankinitialisierung (prüfen Sie die SQL-Konnektivität)

#### 4. `azd deploy` schlägt fehl mit "Build Error"

**Symptom**:
```
Error: Failed to build project
```

**Lösung**:
- Stellen Sie sicher, dass `requirements.txt` keine Syntaxfehler enthält
- Prüfen Sie, dass Python 3.11 in `infra/resources/web-app.bicep` angegeben ist
- Vergewissern Sie sich, dass das Dockerfile das korrekte Basis-Image verwendet

**Lokal debuggen**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" beim Ausführen von AZD-Befehlen

**Symptom**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Lösung**:
Authentifizieren Sie sich erneut bei Azure:
```sh
# Erforderlich für AZD-Workflows
azd auth login

# Optional, wenn Sie auch Azure CLI-Befehle direkt verwenden
az login
```

Vergewissern Sie sich, dass Sie die richtigen Berechtigungen (Contributor-Rolle) für die Subscription haben.

#### 6. Hohe Datenbankkosten

**Symptom**:
Unerwartete Azure-Rechnung.

**Lösung**:
- Prüfen Sie, ob Sie vergessen haben, `azd down` nach dem Testen auszuführen
- Stellen Sie sicher, dass die SQL-Datenbank die Basic-Stufe verwendet (nicht Premium)
- Überprüfen Sie die Kosten in Azure Cost Management
- Richten Sie Kostenwarnungen ein

### Hilfe erhalten

**Alle AZD-Umgebungsvariablen anzeigen**:
```sh
azd env get-values
```

**Bereitstellungsstatus prüfen**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Auf Anwendungsprotokolle zugreifen**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Weitere Hilfe benötigt?**
- [AZD-Fehlerbehebungsanleitung](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Service-Fehlerbehebung](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL-Fehlerbehebung](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Praktische Übungen

### Übung 1: Überprüfen Sie Ihre Bereitstellung (Anfänger)

**Ziel**: Bestätigen, dass alle Ressourcen bereitgestellt sind und die Anwendung funktioniert.

**Schritte**:
1. Listen Sie alle Ressourcen in Ihrer Resource Group auf:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Erwartet**: 6-7 Ressourcen (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Testen Sie alle API-Endpunkte:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Erwartet**: Alle geben gültiges JSON ohne Fehler zurück

3. Prüfen Sie Application Insights:
   - Navigieren Sie zu Application Insights im Azure-Portal
   - Gehen Sie zu "Live Metrics"
   - Aktualisieren Sie Ihren Browser in der Web-App
   **Erwartet**: Sie sehen Anfragen in Echtzeit

**Erfolgskriterien**: Alle 6-7 Ressourcen existieren, alle Endpunkte liefern Daten, Live Metrics zeigt Aktivität.

---

### Übung 2: Fügen Sie einen neuen API-Endpunkt hinzu (Intermediate)

**Ziel**: Die Flask-Anwendung um einen neuen Endpunkt erweitern.

**Startcode**: Aktuelle Endpunkte in `src/web/app.py`

**Schritte**:
1. Bearbeiten Sie `src/web/app.py` und fügen Sie einen neuen Endpunkt nach der Funktion `get_product()` hinzu:
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

2. Deployen Sie die aktualisierte Anwendung:
   ```sh
   azd deploy
   ```

3. Testen Sie den neuen Endpunkt:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Erwartet**: Gibt Produkte zurück, die "laptop" entsprechen

**Erfolgskriterien**: Der neue Endpunkt funktioniert, liefert gefilterte Ergebnisse und erscheint in den Application Insights-Protokollen.

---

### Übung 3: Monitoring und Alerts hinzufügen (Advanced)

**Ziel**: Proaktives Monitoring mit Alerts einrichten.

**Schritte**:
1. Erstellen Sie eine Alert-Regel für HTTP 500-Fehler:
   ```sh
   # Application Insights-Ressourcen-ID abrufen
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Warnung erstellen
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Lösen Sie den Alert aus, indem Sie Fehler verursachen:
   ```sh
   # Anfrage nach einem nicht vorhandenen Produkt
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Prüfen Sie, ob der Alert ausgelöst wurde:
   - Azure-Portal → Alerts → Alert Rules
   - Prüfen Sie Ihre E-Mails (falls konfiguriert)

**Erfolgskriterien**: Alert-Regel ist erstellt, löst bei Fehlern aus, Benachrichtigungen werden empfangen.

---

### Übung 4: Änderungen am Datenbankschema (Advanced)

**Ziel**: Neue Tabelle hinzufügen und die Anwendung anpassen.

**Schritte**:
1. Verbinden Sie sich über den Query Editor im Azure-Portal mit der SQL-Datenbank

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

3. Aktualisieren Sie `src/web/app.py`, um Kategorieinformationen in den Antworten zu integrieren

4. Deployen und testen

**Erfolgskriterien**: Neue Tabelle existiert, Produkte zeigen Kategorieinformationen, Anwendung funktioniert weiterhin.

---

### Übung 5: Caching implementieren (Expert)

**Ziel**: Azure Redis Cache hinzufügen, um die Leistung zu verbessern.

**Schritte**:
1. Fügen Sie Redis Cache zu `infra/main.bicep` hinzu
2. Aktualisieren Sie `src/web/app.py`, um Produktabfragen zu cachen
3. Messen Sie die Leistungsverbesserung mit Application Insights
4. Vergleichen Sie die Antwortzeiten vor/nach dem Caching

**Erfolgskriterien**: Redis ist bereitgestellt, Caching funktioniert, Antwortzeiten verbessern sich um >50%.

**Tipp**: Beginnen Sie mit der [Azure Cache for Redis documentation](https://learn.microsoft.com/azure/azure-cache-for-redis/).

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

Type `y` to confirm.

**✓ Erfolgskontrolle**: 
- Alle Ressourcen sind im Azure-Portal gelöscht
- Keine laufenden Kosten
- Lokaler `.azure/<env-name>`-Ordner kann gelöscht werden

**Alternative** (Infrastruktur beibehalten, Daten löschen):
```sh
# Nur die Ressourcengruppe löschen (AZD-Konfiguration beibehalten)
az group delete --name rg-<env-name> --yes
```
## Mehr erfahren

### Verwandte Dokumentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database Documentation](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service Documentation](https://learn.microsoft.com/azure/app-service/)
- [Application Insights Documentation](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep Language Reference](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Nächste Schritte in diesem Kurs
- **[Container Apps Example](../../../../examples/container-app)**: Mikroservices mit Azure Container Apps bereitstellen
- **[AI Integration Guide](../../../../docs/ai-foundry)**: Fügen Sie Ihrer App KI-Funktionen hinzu
- **[Deployment Best Practices](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Produktionsbereitstellungs-Muster

### Erweiterte Themen
- **Managed Identity**: Entfernen Sie Passwörter und nutzen Sie Azure AD-Authentifizierung
- **Private Endpoints**: Sichern Sie Datenbankverbindungen innerhalb eines virtuellen Netzwerks
- **CI/CD-Integration**: Automatisieren Sie Bereitstellungen mit GitHub Actions oder Azure DevOps
- **Multi-Environment**: Richten Sie Dev-, Staging- und Produktionsumgebungen ein
- **Datenbankmigrationen**: Verwenden Sie Alembic oder Entity Framework für Schema-Versionierung

### Vergleich mit anderen Ansätzen

**AZD vs. ARM Templates**:
- ✅ AZD: Höhere Abstraktionsebene, einfachere Befehle
- ⚠️ ARM: Umfangreicher, granulare Kontrolle

**AZD vs. Terraform**:
- ✅ AZD: Azure-nativ, integriert mit Azure-Diensten
- ⚠️ Terraform: Multi-Cloud-Unterstützung, größeres Ökosystem

**AZD vs. Azure Portal**:
- ✅ AZD: Wiederholbar, versionierbar, automatisierbar
- ⚠️ Portal: Manuelle Klicks, schwer reproduzierbar

Betrachten Sie AZD als: Docker Compose für Azure—vereinfachte Konfiguration für komplexe Bereitstellungen.

---

## Häufig gestellte Fragen

**F: Kann ich eine andere Programmiersprache verwenden?**  
A: Ja! Ersetzen Sie `src/web/` durch Node.js, C#, Go oder jede andere Sprache. Aktualisieren Sie `azure.yaml` und Bicep entsprechend.

**F: Wie füge ich weitere Datenbanken hinzu?**  
A: Fügen Sie ein weiteres SQL Database-Modul in `infra/main.bicep` hinzu oder nutzen Sie PostgreSQL/MySQL von den Azure Database-Diensten.

**F: Kann ich das für die Produktion verwenden?**  
A: Dies ist ein Ausgangspunkt. Für die Produktion fügen Sie hinzu: Managed Identity, Private Endpoints, Redundanz, Backup-Strategie, WAF und erweiterte Überwachung.

**F: Was, wenn ich Container statt Code-Bereitstellung verwenden möchte?**  
A: Schauen Sie sich das [Container Apps Example](../../../../examples/container-app) an, das durchgehend Docker-Container verwendet.

**F: Wie verbinde ich mich von meinem lokalen Rechner mit der Datenbank?**  
A: Fügen Sie Ihre IP zur SQL Server-Firewall hinzu:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**F: Kann ich eine vorhandene Datenbank statt einer neuen verwenden?**  
A: Ja, ändern Sie `infra/main.bicep`, um auf einen vorhandenen SQL Server zu verweisen, und aktualisieren Sie die Verbindungszeichenfolgenparameter.

---

> **Hinweis:** Dieses Beispiel demonstriert Best Practices für die Bereitstellung einer Webanwendung mit einer Datenbank unter Verwendung von AZD. Es enthält funktionierenden Code, umfassende Dokumentation und praktische Übungen zur Vertiefung des Lernens. Für Produktionsbereitstellungen prüfen Sie Sicherheit, Skalierung, Compliance und Kostenanforderungen, die für Ihre Organisation gelten.

**📚 Kursnavigation:**
- ← Vorherige: [Container Apps Example](../../../../examples/container-app)
- → Nächste: [AI Integration Guide](../../../../docs/ai-foundry)
- 🏠 [Kursstartseite](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache ist als maßgebliche Quelle zu betrachten. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir haften nicht für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
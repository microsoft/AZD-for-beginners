# Häufige Probleme und Lösungen

**Kapitelübersicht:**
- **📚 Kursübersicht**: [AZD für Einsteiger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 7 - Fehlerbehebung & Debugging
- **⬅️ Vorheriges Kapitel**: [Kapitel 6: Vorab-Checks](../pre-deployment/preflight-checks.md)
- **➡️ Weiter**: [Debugging-Leitfaden](debugging.md)
- **🚀 Nächstes Kapitel**: [Kapitel 8: Produktions- & Unternehmensmuster](../microsoft-foundry/production-ai-practices.md)

## Einführung

Dieser umfassende Leitfaden zur Fehlerbehebung behandelt die am häufigsten auftretenden Probleme bei der Nutzung der Azure Developer CLI. Lernen Sie, wie Sie Authentifizierungsprobleme, Bereitstellungsfehler, Infrastrukturprobleme und Konfigurationsprobleme diagnostizieren, beheben und lösen können. Jedes Problem enthält detaillierte Symptome, Ursachen und schrittweise Lösungsanleitungen.

## Lernziele

Nach Abschluss dieses Leitfadens werden Sie:
- Diagnosetechniken für Probleme mit der Azure Developer CLI beherrschen
- Häufige Authentifizierungs- und Berechtigungsprobleme verstehen und lösen können
- Bereitstellungsfehler, Infrastrukturprobleme und Konfigurationsprobleme beheben
- Proaktive Überwachungs- und Debugging-Strategien implementieren
- Systematische Methoden zur Fehlerbehebung bei komplexen Problemen anwenden
- Richtiges Logging und Monitoring einrichten, um zukünftige Probleme zu vermeiden

## Lernergebnisse

Nach Abschluss werden Sie in der Lage sein:
- Probleme mit der Azure Developer CLI mithilfe integrierter Diagnosetools zu analysieren
- Authentifizierungs-, Abonnement- und Berechtigungsprobleme eigenständig zu lösen
- Bereitstellungsfehler und Infrastrukturprobleme effektiv zu beheben
- Konfigurationsprobleme und umgebungsspezifische Probleme zu debuggen
- Überwachung und Alarme einzurichten, um potenzielle Probleme frühzeitig zu erkennen
- Best Practices für Logging, Debugging und Workflows zur Problemlösung anzuwenden

## Schnelldiagnose

Bevor Sie sich mit spezifischen Problemen befassen, führen Sie diese Befehle aus, um Diagnosedaten zu sammeln:

```bash
# Überprüfen Sie die azd-Version und den Status
azd version
azd config list

# Azure-Authentifizierung überprüfen
az account show
az account list

# Aktuelle Umgebung überprüfen
azd env show
azd env get-values

# Debug-Logging aktivieren
export AZD_DEBUG=true
azd <command> --debug
```

## Authentifizierungsprobleme

### Problem: "Zugriffstoken konnte nicht abgerufen werden"
**Symptome:**
- `azd up` schlägt mit Authentifizierungsfehlern fehl
- Befehle geben "unauthorized" oder "access denied" zurück

**Lösungen:**
```bash
# 1. Erneut mit Azure CLI authentifizieren
az login
az account show

# 2. Zwischengespeicherte Anmeldeinformationen löschen
az account clear
az login

# 3. Gerätecode-Fluss verwenden (für kopflose Systeme)
az login --use-device-code

# 4. Explizites Abonnement festlegen
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problem: "Unzureichende Berechtigungen" während der Bereitstellung
**Symptome:**
- Bereitstellung schlägt mit Berechtigungsfehlern fehl
- Bestimmte Azure-Ressourcen können nicht erstellt werden

**Lösungen:**
```bash
# 1. Überprüfen Sie Ihre Azure-Rollen-Zuweisungen
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Stellen Sie sicher, dass Sie die erforderlichen Rollen haben
# - Mitwirkender (für die Ressourcenerstellung)
# - Benutzerzugriffsadministrator (für Rollenzuweisungen)

# 3. Kontaktieren Sie Ihren Azure-Administrator für die richtigen Berechtigungen
```

### Problem: Probleme mit Multi-Tenant-Authentifizierung
**Lösungen:**
```bash
# 1. Mit spezifischem Mandanten anmelden
az login --tenant "your-tenant-id"

# 2. Mandanten in der Konfiguration festlegen
azd config set auth.tenantId "your-tenant-id"

# 3. Mandanten-Cache leeren, wenn Mandanten gewechselt werden
az account clear
```

## 🏗️ Fehler bei der Infrastrukturbereitstellung

### Problem: Ressourcennamen-Konflikte
**Symptome:**
- Fehler "Der Ressourcenname existiert bereits"
- Bereitstellung schlägt bei der Ressourcenerstellung fehl

**Lösungen:**
```bash
# 1. Verwenden Sie eindeutige Ressourcennamen mit Tokens
# In Ihrer Bicep-Vorlage:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Ändern Sie den Umgebungsnamen
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Bereinigen Sie vorhandene Ressourcen
azd down --force --purge
```

### Problem: Standort/Region nicht verfügbar
**Symptome:**
- "Der Standort 'xyz' ist für den Ressourcentyp nicht verfügbar"
- Bestimmte SKUs sind in der ausgewählten Region nicht verfügbar

**Lösungen:**
```bash
# 1. Verfügbare Standorte für Ressourcentypen überprüfen
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Häufig verfügbare Regionen verwenden
azd config set defaults.location eastus2
# oder
azd env set AZURE_LOCATION eastus2

# 3. Verfügbarkeit des Dienstes nach Region überprüfen
# Besuchen Sie: https://azure.microsoft.com/global-infrastructure/services/
```

### Problem: Fehler wegen überschrittener Quoten
**Symptome:**
- "Quota exceeded for resource type"
- "Maximale Anzahl von Ressourcen erreicht"

**Lösungen:**
```bash
# 1. Überprüfen Sie die aktuelle Kontingentnutzung
az vm list-usage --location eastus2 -o table

# 2. Beantragen Sie eine Kontingenterhöhung über das Azure-Portal
# Gehen Sie zu: Abonnements > Nutzung + Kontingente

# 3. Verwenden Sie kleinere SKUs für die Entwicklung
# In main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Bereinigen Sie ungenutzte Ressourcen
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problem: Fehler in Bicep-Vorlagen
**Symptome:**
- Validierungsfehler bei Vorlagen
- Syntaxfehler in Bicep-Dateien

**Lösungen:**
```bash
# 1. Bicep-Syntax validieren
az bicep build --file infra/main.bicep

# 2. Bicep-Linter verwenden
az bicep lint --file infra/main.bicep

# 3. Syntax der Parameterdatei überprüfen
cat infra/main.parameters.json | jq '.'

# 4. Bereitstellungsänderungen anzeigen
azd provision --preview
```

## 🚀 Bereitstellungsfehler

### Problem: Build-Fehler
**Symptome:**
- Anwendung schlägt beim Build während der Bereitstellung fehl
- Fehler bei der Paketinstallation

**Lösungen:**
```bash
# 1. Überprüfen Sie die Build-Logs
azd logs --service web
azd deploy --service web --debug

# 2. Build lokal testen
cd src/web
npm install
npm run build

# 3. Überprüfen Sie die Node.js/Python-Version-Kompatibilität
node --version  # Sollte mit den azure.yaml-Einstellungen übereinstimmen
python --version

# 4. Build-Cache leeren
rm -rf node_modules package-lock.json
npm install

# 5. Überprüfen Sie die Dockerfile, wenn Container verwendet werden
docker build -t test-image .
docker run --rm test-image
```

### Problem: Fehler bei der Container-Bereitstellung
**Symptome:**
- Container-Apps starten nicht
- Fehler beim Abrufen von Images

**Lösungen:**
```bash
# 1. Testen Sie den Docker-Build lokal
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Überprüfen Sie die Container-Logs
azd logs --service api --follow

# 3. Überprüfen Sie den Zugriff auf das Container-Registry
az acr login --name myregistry

# 4. Überprüfen Sie die Container-App-Konfiguration
az containerapp show --name my-app --resource-group my-rg
```

### Problem: Datenbankverbindungsfehler
**Symptome:**
- Anwendung kann keine Verbindung zur Datenbank herstellen
- Verbindungszeitüberschreitungen

**Lösungen:**
```bash
# 1. Überprüfen Sie die Firewall-Regeln der Datenbank
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Testen Sie die Konnektivität von der Anwendung
# Fügen Sie vorübergehend zu Ihrer App hinzu:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Überprüfen Sie das Format der Verbindungszeichenfolge
azd env get-values | grep DATABASE

# 4. Überprüfen Sie den Status des Datenbankservers
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Konfigurationsprobleme

### Problem: Umgebungsvariablen funktionieren nicht
**Symptome:**
- App kann Konfigurationswerte nicht lesen
- Umgebungsvariablen erscheinen leer

**Lösungen:**
```bash
# 1. Überprüfen Sie, ob Umgebungsvariablen gesetzt sind
azd env get-values
azd env get DATABASE_URL

# 2. Überprüfen Sie die Variablennamen in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Starten Sie die Anwendung neu
azd deploy --service web

# 4. Überprüfen Sie die App-Service-Konfiguration
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problem: SSL/TLS-Zertifikatsprobleme
**Symptome:**
- HTTPS funktioniert nicht
- Fehler bei der Zertifikatsvalidierung

**Lösungen:**
```bash
# 1. Überprüfen Sie den Status des SSL-Zertifikats
az webapp config ssl list --resource-group myrg

# 2. Aktivieren Sie nur HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Fügen Sie eine benutzerdefinierte Domain hinzu (falls erforderlich)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problem: Probleme mit der CORS-Konfiguration
**Symptome:**
- Frontend kann API nicht aufrufen
- Cross-Origin-Anfrage blockiert

**Lösungen:**
```bash
# 1. Konfigurieren Sie CORS für App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Aktualisieren Sie die API, um CORS zu handhaben
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Überprüfen Sie, ob die richtigen URLs verwendet werden
azd show
```

## 🌍 Probleme mit dem Umweltmanagement

### Problem: Probleme beim Wechseln der Umgebung
**Symptome:**
- Falsche Umgebung wird verwendet
- Konfiguration wechselt nicht richtig

**Lösungen:**
```bash
# 1. Alle Umgebungen auflisten
azd env list

# 2. Umgebung explizit auswählen
azd env select production

# 3. Aktuelle Umgebung überprüfen
azd env show

# 4. Neue Umgebung erstellen, falls beschädigt
azd env new production-new
azd env select production-new
```

### Problem: Beschädigte Umgebung
**Symptome:**
- Umgebung zeigt ungültigen Zustand
- Ressourcen stimmen nicht mit der Konfiguration überein

**Lösungen:**
```bash
# 1. Aktualisiere den Zustand der Umgebung
azd env refresh

# 2. Setze die Umgebungskonfiguration zurück
azd env new production-reset
# Kopiere die erforderlichen Umgebungsvariablen
azd env set DATABASE_URL "your-value"

# 3. Importiere vorhandene Ressourcen (falls möglich)
# Aktualisiere manuell .azure/production/config.json mit Ressourcen-IDs
```

## 🔍 Leistungsprobleme

### Problem: Lange Bereitstellungszeiten
**Symptome:**
- Bereitstellungen dauern zu lange
- Zeitüberschreitungen während der Bereitstellung

**Lösungen:**
```bash
# 1. Parallele Bereitstellung aktivieren
azd config set deploy.parallelism 5

# 2. Inkrementelle Bereitstellungen verwenden
azd deploy --incremental

# 3. Build-Prozess optimieren
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Ressourcenstandorte überprüfen (gleiche Region verwenden)
azd config set defaults.location eastus2
```

### Problem: Leistungsprobleme der Anwendung
**Symptome:**
- Langsame Antwortzeiten
- Hoher Ressourcenverbrauch

**Lösungen:**
```bash
# 1. Ressourcen skalieren
# Aktualisieren Sie SKU in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Aktivieren Sie die Überwachung von Application Insights
azd monitor

# 3. Überprüfen Sie Anwendungsprotokolle auf Engpässe
azd logs --service api --follow

# 4. Implementieren Sie Caching
# Fügen Sie Redis-Cache zu Ihrer Infrastruktur hinzu
```

## 🛠️ Tools und Befehle zur Fehlerbehebung

### Debugging-Befehle
```bash
# Umfassendes Debugging
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Systeminformationen überprüfen
azd info

# Konfiguration validieren
azd config validate

# Konnektivität testen
curl -v https://myapp.azurewebsites.net/health
```

### Log-Analyse
```bash
# Anwendungsprotokolle
azd logs --service web --follow
azd logs --service api --since 1h

# Azure-Ressourcenprotokolle
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Containerprotokolle (für Container-Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Ressourcenuntersuchung
```bash
# Alle Ressourcen auflisten
az resource list --resource-group myrg -o table

# Ressourcenstatus überprüfen
az webapp show --name myapp --resource-group myrg --query state

# Netzwerkdiagnose
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Zusätzliche Hilfe erhalten

### Wann eskalieren?
- Authentifizierungsprobleme bestehen nach allen Lösungsversuchen weiterhin
- Infrastrukturprobleme mit Azure-Diensten
- Probleme im Zusammenhang mit Abrechnung oder Abonnements
- Sicherheitsbedenken oder Vorfälle

### Support-Kanäle
```bash
# 1. Überprüfen Sie den Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Erstellen Sie ein Azure-Support-Ticket
# Gehen Sie zu: https://portal.azure.com -> Hilfe + Support

# 3. Community-Ressourcen
# - Stack Overflow: azure-developer-cli Tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informationen, die gesammelt werden sollten
Bevor Sie den Support kontaktieren, sammeln Sie:
- Ausgabe von `azd version`
- Ausgabe von `azd info`
- Fehlermeldungen (vollständiger Text)
- Schritte zur Reproduktion des Problems
- Umgebungsdetails (`azd env show`)
- Zeitrahmen, wann das Problem auftrat

### Skript zur Log-Sammlung
```bash
#!/bin/bash
# sammle-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Problemprävention

### Checkliste vor der Bereitstellung
```bash
# 1. Authentifizierung validieren
az account show

# 2. Quoten und Limits überprüfen
az vm list-usage --location eastus2

# 3. Vorlagen validieren
az bicep build --file infra/main.bicep

# 4. Zuerst lokal testen
npm run build
npm run test

# 5. Testbereitstellungen verwenden
azd provision --preview
```

### Überwachungssetup
```bash
# Aktivieren Sie Application Insights
# Zu main.bicep hinzufügen:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Warnungen einrichten
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Regelmäßige Wartung
```bash
# Wöchentliche Gesundheitsüberprüfungen
./scripts/health-check.sh

# Monatliche Kostenüberprüfung
az consumption usage list --billing-period-name 202401

# Vierteljährliche Sicherheitsüberprüfung
az security assessment list --resource-group myrg
```

## Verwandte Ressourcen

- [Debugging-Leitfaden](debugging.md) - Fortgeschrittene Debugging-Techniken
- [Ressourcenbereitstellung](../deployment/provisioning.md) - Fehlerbehebung bei der Infrastruktur
- [Kapazitätsplanung](../pre-deployment/capacity-planning.md) - Leitfaden zur Ressourcenplanung
- [SKU-Auswahl](../pre-deployment/sku-selection.md) - Empfehlungen zu Servicestufen

---

**Tipp**: Speichern Sie diesen Leitfaden als Lesezeichen und greifen Sie darauf zurück, wann immer Sie auf Probleme stoßen. Die meisten Probleme sind bereits bekannt und haben bewährte Lösungen!

---

**Navigation**
- **Vorherige Lektion**: [Ressourcenbereitstellung](../deployment/provisioning.md)
- **Nächste Lektion**: [Debugging-Leitfaden](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
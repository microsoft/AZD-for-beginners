# Häufige Probleme und Lösungen

**Chapter Navigation:**
- **📚 Kursübersicht**: [AZD für Einsteiger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 7 - Fehlerbehebung & Debugging
- **⬅️ Previous Chapter**: [Kapitel 6: Vorabprüfungen](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Next**: [Debugging-Leitfaden](debugging.md)
- **🚀 Nächstes Kapitel**: [Kapitel 8: Produktions- & Unternehmensmuster](../chapter-08-production/production-ai-practices.md)

## Einführung

Dieser umfassende Leitfaden zur Fehlerbehebung behandelt die am häufigsten auftretenden Probleme bei der Verwendung der Azure Developer CLI. Lernen Sie, Probleme mit Authentifizierung, Bereitstellung, Infrastrukturprovisionierung und Anwendungs‑Konfiguration zu diagnostizieren, zu beheben und zu lösen. Jedes Problem enthält detaillierte Symptome, Ursachen und schrittweise Lösungsverfahren.

## Lernziele

Durch das Abschließen dieses Leitfadens werden Sie:
- Diagnosetechniken für Probleme mit der Azure Developer CLI beherrschen
- Häufige Authentifizierungs- und Berechtigungsprobleme und deren Lösungen verstehen
- Bereitstellungsfehler, Fehler bei der Infrastrukturprovisionierung und Konfigurationsprobleme beheben können
- Proaktive Überwachungs- und Debugging-Strategien implementieren
- Systematische Fehlerbehebungsmethoden für komplexe Probleme anwenden
- Eine angemessene Protokollierung und Überwachung konfigurieren, um zukünftige Probleme zu verhindern

## Lernergebnisse

Nach Abschluss werden Sie in der Lage sein:
- Probleme mit der Azure Developer CLI mit eingebauten Diagnosewerkzeugen zu diagnostizieren
- Authentifizierungs-, Abonnement- und Berechtigungsprobleme selbstständig zu lösen
- Bereitstellungsfehler und Fehler bei der Infrastrukturprovisionierung effektiv zu beheben
- Konfigurationsprobleme der Anwendung und umgebungsspezifische Probleme zu debuggen
- Monitoring und Alerting zu implementieren, um potenzielle Probleme proaktiv zu erkennen
- Best Practices für Protokollierung, Debugging und Problemlösungs-Workflows anzuwenden

## Schnelldiagnose

Bevor Sie in spezifische Probleme eintauchen, führen Sie diese Befehle aus, um Diagnoseinformationen zu sammeln:

```bash
# azd-Version und Status prüfen
azd version
azd config show

# Azure-Authentifizierung überprüfen
az account show
az account list

# Aktuelle Umgebung prüfen
azd env list
azd env get-values

# Debug-Protokollierung aktivieren
export AZD_DEBUG=true
azd <command> --debug
```

## Authentifizierungsprobleme

### Problem: "Failed to get access token"
**Symptome:**
- `azd up` schlägt mit Authentifizierungsfehlern fehl
- Befehle geben "unauthorized" oder "access denied" zurück

**Lösungen:**
```bash
# 1. Mit Azure CLI erneut authentifizieren
az login
az account show

# 2. Zwischengespeicherte Anmeldeinformationen löschen
az account clear
az login

# 3. Gerätecode-Flow verwenden (für kopflose Systeme)
az login --use-device-code

# 4. Explizites Abonnement festlegen
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problem: "Insufficient privileges" während der Bereitstellung
**Symptome:**
- Die Bereitstellung schlägt mit Berechtigungsfehlern fehl
- Bestimmte Azure-Ressourcen können nicht erstellt werden

**Lösungen:**
```bash
# 1. Überprüfen Sie Ihre Azure-Rollen-Zuweisungen
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Stellen Sie sicher, dass Sie die erforderlichen Rollen haben
# - Contributor (für die Erstellung von Ressourcen)
# - User Access Administrator (für Rollenzuweisungen)

# 3. Kontaktieren Sie Ihren Azure-Administrator für die entsprechenden Berechtigungen
```

### Problem: Multi-Tenant-Authentifizierungsprobleme
**Lösungen:**
```bash
# 1. Mit einem bestimmten Mandanten anmelden
az login --tenant "your-tenant-id"

# 2. Den Mandanten in der Konfiguration festlegen
azd config set auth.tenantId "your-tenant-id"

# 3. Mandanten-Cache löschen, wenn zu einem anderen Mandanten gewechselt wird
az account clear
```

## 🏗️ Fehler bei der Infrastrukturprovisionierung

### Problem: Ressourcennamen-Konflikte
**Symptome:**
- Fehler "The resource name already exists"
- Die Bereitstellung schlägt während der Ressourcenerstellung fehl

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
- "The location 'xyz' is not available for resource type"
- Bestimmte SKUs sind in der ausgewählten Region nicht verfügbar

**Lösungen:**
```bash
# 1. Überprüfen Sie verfügbare Standorte für Ressourcentypen
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Verwenden Sie häufig verfügbare Regionen
azd config set defaults.location eastus2
# oder
azd env set AZURE_LOCATION eastus2

# 3. Prüfen Sie die Dienstverfügbarkeit nach Region
# Besuchen Sie: https://azure.microsoft.com/global-infrastructure/services/
```

### Problem: Quotenüberschreitungen
**Symptome:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Lösungen:**
```bash
# 1. Aktuelle Kontingentnutzung prüfen
az vm list-usage --location eastus2 -o table

# 2. Kontingenterhöhung über das Azure-Portal anfordern
# Gehen Sie zu: Abonnements > Nutzung + Kontingente

# 3. Für die Entwicklung kleinere SKUs verwenden
# In main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Unbenutzte Ressourcen bereinigen
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problem: Fehler in Bicep-Templates
**Symptome:**
- Fehler bei der Template-Validierung
- Syntaxfehler in Bicep-Dateien

**Lösungen:**
```bash
# 1. Bicep-Syntax validieren
az bicep build --file infra/main.bicep

# 2. Bicep-Linter verwenden
az bicep lint --file infra/main.bicep

# 3. Syntax der Parameterdatei prüfen
cat infra/main.parameters.json | jq '.'

# 4. Bereitstellungsänderungen anzeigen
azd provision --preview
```

## 🚀 Bereitstellungsfehler

### Problem: Build-Fehler
**Symptome:**
- Die Anwendung kann während der Bereitstellung nicht gebaut werden
- Fehler bei der Paketinstallation

**Lösungen:**
```bash
# 1. Build-Ausgabe mit Debug-Flag prüfen
azd deploy --service web --debug

# 2. Status des bereitgestellten Dienstes anzeigen
azd show

# 3. Build lokal testen
cd src/web
npm install
npm run build

# 3. Kompatibilität der Node.js-/Python-Versionen prüfen
node --version  # Sollte mit den Einstellungen in azure.yaml übereinstimmen
python --version

# 4. Build-Cache leeren
rm -rf node_modules package-lock.json
npm install

# 5. Dockerfile prüfen, wenn Container verwendet werden
docker build -t test-image .
docker run --rm test-image
```

### Problem: Fehler bei der Containereinführung
**Symptome:**
- Container-Apps starten nicht
- Fehler beim Abrufen von Images

**Lösungen:**
```bash
# 1. Docker-Build lokal testen
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Container-Logs mit der Azure CLI prüfen
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Anwendung über azd überwachen
azd monitor --logs

# 3. Zugriff auf die Container-Registry überprüfen
az acr login --name myregistry

# 4. Container-App-Konfiguration prüfen
az containerapp show --name my-app --resource-group my-rg
```

### Problem: Datenbankverbindungsfehler
**Symptome:**
- Die Anwendung kann keine Verbindung zur Datenbank herstellen
- Verbindungs-Timeouts

**Lösungen:**
```bash
# 1. Überprüfen Sie die Firewall-Regeln der Datenbank
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Testen Sie die Verbindung aus der Anwendung
# Fügen Sie es Ihrer App vorübergehend hinzu:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Überprüfen Sie das Format der Verbindungszeichenfolge
azd env get-values | grep DATABASE

# 4. Überprüfen Sie den Status des Datenbankservers
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Konfigurationsprobleme

### Problem: Umgebungsvariablen funktionieren nicht
**Symptome:**
- Die App kann Konfigurationswerte nicht lesen
- Umgebungsvariablen erscheinen leer

**Lösungen:**
```bash
# 1. Überprüfen Sie, ob die Umgebungsvariablen gesetzt sind
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
# 1. SSL-Zertifikatstatus prüfen
az webapp config ssl list --resource-group myrg

# 2. Nur HTTPS aktivieren
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Eigene Domain hinzufügen (falls erforderlich)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problem: CORS-Konfigurationsprobleme
**Symptome:**
- Frontend kann die API nicht aufrufen
- Cross-Origin-Anfrage blockiert

**Lösungen:**
```bash
# 1. CORS für den App Service konfigurieren
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. API aktualisieren, damit sie CORS unterstützt
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Prüfen, ob es auf den richtigen URLs läuft
azd show
```

## 🌍 Probleme bei der Umgebungsverwaltung

### Problem: Probleme beim Wechseln der Umgebung
**Symptome:**
- Es wird die falsche Umgebung verwendet
- Konfiguration wechselt nicht korrekt

**Lösungen:**
```bash
# 1. Alle Umgebungen auflisten
azd env list

# 2. Umgebung explizit auswählen
azd env select production

# 3. Aktuelle Umgebung überprüfen
azd env list

# 4. Neue Umgebung erstellen, falls beschädigt
azd env new production-new
azd env select production-new
```

### Problem: Beschädigte Umgebung
**Symptome:**
- Die Umgebung zeigt einen ungültigen Zustand
- Ressourcen stimmen nicht mit der Konfiguration überein

**Lösungen:**
```bash
# 1. Umgebungzustand aktualisieren
azd env refresh

# 2. Umgebungskonfiguration zurücksetzen
azd env new production-reset
# Erforderliche Umgebungsvariablen kopieren
azd env set DATABASE_URL "your-value"

# 3. Vorhandene Ressourcen importieren (falls möglich)
# Aktualisiere manuell .azure/production/config.json mit Ressourcen-IDs
```

## 🔍 Leistungsprobleme

### Problem: Langsame Bereitstellungszeiten
**Symptome:**
- Bereitstellungen dauern zu lange
- Timeouts während der Bereitstellung

**Lösungen:**
```bash
# 1. Bestimmte Dienste bereitstellen, um schneller iterieren zu können
azd deploy --service web
azd deploy --service api

# 2. Nur-Code-Bereitstellung verwenden, wenn die Infrastruktur unverändert ist
azd deploy  # Schneller als azd up

# 3. Build-Prozess optimieren
# In der package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Ressourcenstandorte prüfen (gleiche Region verwenden)
azd config set defaults.location eastus2
```

### Problem: Leistungsprobleme der Anwendung
**Symptome:**
- Langsame Reaktionszeiten
- Hohe Ressourcenauslastung

**Lösungen:**
```bash
# 1. Ressourcen hochskalieren
# SKU in main.parameters.json aktualisieren:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insights-Überwachung aktivieren
azd monitor --overview

# 3. Anwendungsprotokolle in Azure überprüfen
az webapp log tail --name myapp --resource-group myrg
# oder für Container-Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Caching implementieren
# Fügen Sie Ihrer Infrastruktur einen Redis-Cache hinzu
```

## 🛠️ Tools und Befehle zur Fehlerbehebung

### Debug-Befehle
```bash
# Umfassendes Debugging
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# azd-Version prüfen
azd version

# Aktuelle Konfiguration anzeigen
azd config show

# Konnektivität testen
curl -v https://myapp.azurewebsites.net/health
```

### Protokollanalyse
```bash
# Anwendungsprotokolle über die Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Anwendung mit azd überwachen
azd monitor --logs
azd monitor --live

# Azure-Ressourcenprotokolle
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Containerprotokolle (für Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Ressourcenuntersuchung
```bash
# Alle Ressourcen auflisten
az resource list --resource-group myrg -o table

# Ressourcenstatus prüfen
az webapp show --name myapp --resource-group myrg --query state

# Netzwerkdiagnose
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Zusätzliche Hilfe erhalten

### Wann eskalieren
- Authentifizierungsprobleme bestehen, nachdem alle Lösungen ausprobiert wurden
- Infrastrukturprobleme mit Azure-Diensten
- Abrechnungs- oder abonnementbezogene Probleme
- Sicherheitsbedenken oder Vorfälle

### Support-Kanäle
```bash
# 1. Azure Service Health prüfen
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Erstellen Sie ein Azure-Support-Ticket
# Gehen Sie zu: https://portal.azure.com -> Hilfe + Support

# 3. Community-Ressourcen
# - Stack Overflow: Tag 'azure-developer-cli'
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informationen, die Sie sammeln sollten
Bevor Sie den Support kontaktieren, sammeln Sie:
- `azd version` Ausgabe
- `azd config show` Ausgabe
- `azd show` Ausgabe (aktueller Bereitstellungsstatus)
- Fehlermeldungen (vollständiger Text)
- Schritte zur Reproduzierung des Problems
- Umgebungsdetails (`azd env get-values`)
- Zeitachse, wann das Problem begonnen hat

### Skript zur Protokollsammlung
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Vorbeugung von Problemen

### Checkliste vor der Bereitstellung
```bash
# 1. Authentifizierung validieren
az account show

# 2. Kontingente und Grenzwerte prüfen
az vm list-usage --location eastus2

# 3. Vorlagen validieren
az bicep build --file infra/main.bicep

# 4. Zuerst lokal testen
npm run build
npm run test

# 5. Trockendurchläufe für Bereitstellungen verwenden
azd provision --preview
```

### Monitoring-Konfiguration
```bash
# Application Insights aktivieren
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
# Wöchentliche Gesundheitschecks
./scripts/health-check.sh

# Monatliche Kostenüberprüfung
az consumption usage list --billing-period-name 202401

# Vierteljährliche Sicherheitsüberprüfung
az security assessment list --resource-group myrg
```

## Verwandte Ressourcen

- [Debugging Guide](debugging.md) - Erweiterte Debugging-Techniken
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Fehlerbehebung bei der Infrastruktur
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - Leitfaden zur Ressourcenplanung
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Empfehlungen zu Service-Tiers

---

**Tipp**: Lesezeichen für diesen Leitfaden setzen und ihn bei Problemen konsultieren. Die meisten Probleme sind bereits aufgetreten und haben etablierte Lösungen!

---

**Navigation**
- **Previous Lesson**: [Bereitstellung von Ressourcen](../chapter-04-infrastructure/provisioning.md)
- **Next Lesson**: [Debugging-Leitfaden](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Originalsprache ist als maßgebliche Quelle zu betrachten. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
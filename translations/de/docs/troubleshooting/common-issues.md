<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9788ca3a01099b5a07db01554f915e27",
  "translation_date": "2025-09-09T17:08:18+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "de"
}
-->
# Häufige Probleme & Lösungen

## Einführung

Dieser umfassende Leitfaden zur Fehlerbehebung behandelt die am häufigsten auftretenden Probleme bei der Verwendung von Azure Developer CLI. Lernen Sie, wie Sie Authentifizierungs-, Bereitstellungs-, Infrastruktur- und Anwendungskonfigurationsprobleme diagnostizieren, beheben und lösen können. Jedes Problem enthält detaillierte Symptome, Ursachen und schrittweise Lösungsverfahren.

## Lernziele

Nach Abschluss dieses Leitfadens werden Sie:
- Diagnosetechniken für Probleme mit Azure Developer CLI beherrschen
- Häufige Authentifizierungs- und Berechtigungsprobleme verstehen und lösen können
- Bereitstellungsfehler, Infrastrukturprobleme und Konfigurationsprobleme beheben
- Proaktive Überwachungs- und Debugging-Strategien implementieren
- Systematische Methoden zur Fehlerbehebung bei komplexen Problemen anwenden
- Richtiges Logging und Monitoring konfigurieren, um zukünftige Probleme zu vermeiden

## Lernergebnisse

Nach Abschluss werden Sie in der Lage sein:
- Probleme mit Azure Developer CLI mithilfe integrierter Diagnosetools zu erkennen
- Authentifizierungs-, Abonnement- und Berechtigungsprobleme eigenständig zu lösen
- Bereitstellungsfehler und Infrastrukturprobleme effektiv zu beheben
- Konfigurationsprobleme und umgebungsspezifische Fehler zu debuggen
- Überwachung und Alarmierung implementieren, um potenzielle Probleme frühzeitig zu erkennen
- Best Practices für Logging, Debugging und Workflows zur Problemlösung anwenden

## Schnelle Diagnose

Bevor Sie sich mit spezifischen Problemen befassen, führen Sie diese Befehle aus, um Diagnosedaten zu sammeln:

```bash
# Check azd version and health
azd version
azd config list

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env show
azd env get-values

# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug
```

## Authentifizierungsprobleme

### Problem: "Fehler beim Abrufen des Zugriffstokens"
**Symptome:**
- `azd up` schlägt mit Authentifizierungsfehlern fehl
- Befehle geben "unauthorized" oder "access denied" zurück

**Lösungen:**
```bash
# 1. Re-authenticate with Azure CLI
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problem: "Unzureichende Berechtigungen" während der Bereitstellung
**Symptome:**
- Bereitstellung schlägt mit Berechtigungsfehlern fehl
- Bestimmte Azure-Ressourcen können nicht erstellt werden

**Lösungen:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Problem: Multi-Tenant-Authentifizierungsprobleme
**Lösungen:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Fehler bei der Infrastrukturbereitstellung

### Problem: Ressourcennamenskonflikte
**Symptome:**
- Fehler "Der Ressourcenname existiert bereits"
- Bereitstellung schlägt bei der Ressourcenerstellung fehl

**Lösungen:**
```bash
# 1. Use unique resource names with tokens
# In your Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Clean up existing resources
azd down --force --purge
```

### Problem: Standort/Region nicht verfügbar
**Symptome:**
- Fehler "Der Standort 'xyz' ist für diesen Ressourcentyp nicht verfügbar"
- Bestimmte SKUs sind in der ausgewählten Region nicht verfügbar

**Lösungen:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Use commonly available regions
azd config set defaults.location eastus2
# or
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

### Problem: Kontingentüberschreitungsfehler
**Symptome:**
- Fehler "Kontingent für Ressourcentyp überschritten"
- "Maximale Anzahl von Ressourcen erreicht"

**Lösungen:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

# 3. Use smaller SKUs for development
# In main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problem: Fehler in Bicep-Vorlagen
**Symptome:**
- Validierungsfehler in Vorlagen
- Syntaxfehler in Bicep-Dateien

**Lösungen:**
```bash
# 1. Validate Bicep syntax
az bicep build --file infra/main.bicep

# 2. Use Bicep linter
az bicep lint --file infra/main.bicep

# 3. Check parameter file syntax
cat infra/main.parameters.json | jq '.'

# 4. Preview deployment changes
azd provision --preview
```

## 🚀 Bereitstellungsfehler

### Problem: Build-Fehler
**Symptome:**
- Anwendung schlägt beim Build während der Bereitstellung fehl
- Fehler bei der Paketinstallation

**Lösungen:**
```bash
# 1. Check build logs
azd logs --service web
azd deploy --service web --debug

# 2. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
rm -rf node_modules package-lock.json
npm install

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Problem: Fehler bei der Container-Bereitstellung
**Symptome:**
- Container-Apps starten nicht
- Fehler beim Abrufen von Images

**Lösungen:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs
azd logs --service api --follow

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Problem: Datenbankverbindungsfehler
**Symptome:**
- Anwendung kann keine Verbindung zur Datenbank herstellen
- Fehler bei der Verbindungszeitüberschreitung

**Lösungen:**
```bash
# 1. Check database firewall rules
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test connectivity from application
# Add to your app temporarily:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verify connection string format
azd env get-values | grep DATABASE

# 4. Check database server status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Konfigurationsprobleme

### Problem: Umgebungsvariablen funktionieren nicht
**Symptome:**
- App kann Konfigurationswerte nicht lesen
- Umgebungsvariablen erscheinen leer

**Lösungen:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get DATABASE_URL

# 2. Check variable names in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restart the application
azd deploy --service web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problem: SSL/TLS-Zertifikatsprobleme
**Symptome:**
- HTTPS funktioniert nicht
- Fehler bei der Zertifikatsvalidierung

**Lösungen:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problem: CORS-Konfigurationsprobleme
**Symptome:**
- Frontend kann API nicht aufrufen
- Cross-Origin-Anfrage blockiert

**Lösungen:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Update API to handle CORS
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Check if running on correct URLs
azd show
```

## 🌍 Probleme mit der Umgebung

### Problem: Probleme beim Wechseln der Umgebung
**Symptome:**
- Falsche Umgebung wird verwendet
- Konfiguration wechselt nicht richtig

**Lösungen:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env show

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### Problem: Beschädigte Umgebung
**Symptome:**
- Umgebung zeigt einen ungültigen Zustand
- Ressourcen stimmen nicht mit der Konfiguration überein

**Lösungen:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. Import existing resources (if possible)
# Manually update .azure/production/config.json with resource IDs
```

## 🔍 Leistungsprobleme

### Problem: Langsame Bereitstellungszeiten
**Symptome:**
- Bereitstellungen dauern zu lange
- Zeitüberschreitungen während der Bereitstellung

**Lösungen:**
```bash
# 1. Enable parallel deployment
azd config set deploy.parallelism 5

# 2. Use incremental deployments
azd deploy --incremental

# 3. Optimize build process
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Check resource locations (use same region)
azd config set defaults.location eastus2
```

### Problem: Leistungsprobleme der Anwendung
**Symptome:**
- Langsame Antwortzeiten
- Hoher Ressourcenverbrauch

**Lösungen:**
```bash
# 1. Scale up resources
# Update SKU in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Enable Application Insights monitoring
azd monitor

# 3. Check application logs for bottlenecks
azd logs --service api --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Tools und Befehle zur Fehlerbehebung

### Debugging-Befehle
```bash
# Comprehensive debugging
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Check system info
azd info

# Validate configuration
azd config validate

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Log-Analyse
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Ressourcenuntersuchung
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Zusätzliche Hilfe erhalten

### Wann eskalieren?
- Authentifizierungsprobleme bestehen nach allen Lösungsversuchen weiterhin
- Infrastrukturprobleme mit Azure-Diensten
- Probleme im Zusammenhang mit Abrechnung oder Abonnement
- Sicherheitsbedenken oder Vorfälle

### Support-Kanäle
```bash
# 1. Check Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Create Azure support ticket
# Go to: https://portal.azure.com -> Help + support

# 3. Community resources
# - Stack Overflow: azure-developer-cli tag
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
- Zeitachse, wann das Problem begann

### Skript zur Log-Sammlung
```bash
#!/bin/bash
# collect-debug-info.sh

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

## 📊 Prävention von Problemen

### Checkliste vor der Bereitstellung
```bash
# 1. Validate authentication
az account show

# 2. Check quotas and limits
az vm list-usage --location eastus2

# 3. Validate templates
az bicep build --file infra/main.bicep

# 4. Test locally first
npm run build
npm run test

# 5. Use dry-run deployments
azd provision --preview
```

### Überwachungssetup
```bash
# Enable Application Insights
# Add to main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Set up alerts
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Regelmäßige Wartung
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Verwandte Ressourcen

- [Debugging-Leitfaden](debugging.md) - Fortgeschrittene Debugging-Techniken
- [Ressourcenbereitstellung](../deployment/provisioning.md) - Fehlerbehebung bei Infrastruktur
- [Kapazitätsplanung](../pre-deployment/capacity-planning.md) - Leitfaden zur Ressourcenplanung
- [SKU-Auswahl](../pre-deployment/sku-selection.md) - Empfehlungen zu Servicestufen

---

**Tipp**: Speichern Sie diesen Leitfaden als Lesezeichen und greifen Sie darauf zurück, wann immer Sie auf Probleme stoßen. Die meisten Probleme sind bereits bekannt und haben bewährte Lösungen!

---

**Navigation**
- **Vorherige Lektion**: [Ressourcenbereitstellung](../deployment/provisioning.md)
- **Nächste Lektion**: [Debugging-Leitfaden](debugging.md)

---

**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.
# Häufige Probleme und Lösungen

**Kapitel-Navigation:**
- **📚 Kurs-Startseite**: [AZD Für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 7 - Fehlerbehebung & Debugging
- **⬅️ Vorheriges Kapitel**: [Kapitel 6: Vorab-Prüfungen](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Nächstes**: [Debugging-Anleitung](debugging.md)
- **🚀 Nächstes Kapitel**: [Kapitel 8: Produktion & Enterprise-Muster](../chapter-08-production/production-ai-practices.md)

## Einführung

Dieser umfassende Leitfaden zur Fehlerbehebung behandelt die am häufigsten vorkommenden Probleme bei der Verwendung der Azure Developer CLI. Lernen Sie, häufige Probleme mit Authentifizierung, Bereitstellung, Infrastruktur-Provisionierung und Anwendungs-Konfiguration zu diagnostizieren, zu beheben und zu lösen. Jedes Problem beinhaltet detaillierte Symptome, Ursachen und schrittweise Lösungsvorgänge.

## Lernziele

Nach Abschluss dieses Leitfadens werden Sie:
- Diagnosetechniken für Azure Developer CLI-Probleme beherrschen
- Häufige Probleme mit Authentifizierung und Berechtigungen sowie deren Lösungen verstehen
- Bereitstellungsfehler, Infrastruktur-Provisionierungsfehler und Konfigurationsprobleme beheben können
- Proaktives Monitoring und Debugging-Strategien umsetzen
- Systematische Methoden der Fehlerbehebung für komplexe Probleme anwenden
- Richtiges Logging und Monitoring konfigurieren, um zukünftige Probleme zu verhindern

## Lernresultate

Nach Abschluss werden Sie in der Lage sein:
- Azure Developer CLI-Probleme mithilfe integrierter Diagnosewerkzeuge zu identifizieren
- Authentifizierungs-, Abonnement- und Berechtigungsprobleme eigenständig zu lösen
- Bereitstellungsfehler und Infrastruktur-Provisionierungsfehler effektiv zu beheben
- Probleme mit Anwendungs-Konfiguration und environmentspezifische Fehler zu debuggen
- Monitoring und Alarmierung zu implementieren, um potenzielle Probleme frühzeitig zu erkennen
- Best Practices für Logging, Debugging und Problemlösungsprozesse anzuwenden

## Schnell-Diagnosen

> Ersetzen Sie Beispielnamen/-IDs durch Ihre Umgebungswerte. Bash-, Bicep-, JavaScript- und Parameterdatei-Fragmente sind unten getrennt gekennzeichnet; sie sind kein ausführbares Skript. Prüfen Sie destruktive Operationen und schwärzen Sie Geheimnisse, bevor Sie Diagnosen teilen. `azd monitor --logs` öffnet einen Browser; es werden keine Terminal-Logs gestreamt.

Bevor Sie spezifische Probleme angehen, führen Sie diese Befehle aus, um Diagnoseinformationen zu sammeln:

```bash
# Check azd version and health
azd version
azd config show

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env list
azd env get-values

# Enable debug logging for the command being investigated
azd <command> --debug
```

## Authentifizierungsprobleme

### Problem: "Zugriffstoken konnte nicht abgerufen werden"
**Symptome:**
- `azd up` schlägt mit Authentifizierungsfehlern fehl
- Befehle geben "nicht autorisiert" oder "Zugriff verweigert" zurück

**Lösungen:**
```bash
# 1. Authenticate azd separately (Azure CLI login alone may not authenticate azd)
azd auth login
azd auth login --check-status --output json

# 2. Authenticate Azure CLI when using az commands
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd env set AZURE_SUBSCRIPTION_ID "your-subscription-id"
```

### Problem: "Unzureichende Berechtigungen" während der Bereitstellung
**Symptome:**
- Bereitstellung schlägt mit Berechtigungsfehlern fehl
- Kann bestimmte Azure-Ressourcen nicht erstellen

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

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Infrastruktur-Provisionierungsfehler

### Problem: Ressourcennamen-Konflikte
**Symptome:**
- Fehler "Der Ressourcenname existiert bereits"
- Bereitstellung schlägt bei Ressourcenerstellung fehl

**Lösungen:**
```bicep
// 1. Fragment inside your Bicep template
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
// Inside a resource declaration:
name: '${applicationName}-${resourceToken}'
```

```bash
# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Delete ONLY a disposable environment after inspecting it and backing up data
azd down
```

### Problem: Standort/Region nicht verfügbar
**Symptome:**
- "Der Standort 'xyz' ist für Ressourcentyp nicht verfügbar"
- Bestimmte SKUs sind in der ausgewählten Region nicht verfügbar

**Lösungen:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Das Ändern der Standortvariablen migriert keine bestehenden Ressourcen. Ein vorhandener Ressourcen- oder Ressourcengruppenname kann einen Standortwechsel ablehnen; verwenden Sie eine separate Umgebung für eine regionale Neubereitstellung.

### Problem: Quotenüberschreitungen
**Symptome:**
- "Quota für Ressourcentyp überschritten"
- "Maximale Anzahl von Ressourcen erreicht"

**Lösungen:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Für die Entwicklung wählen Sie eine unterstützte kleinere SKU in `infra/main.parameters.json`:

```json
{
  "appServiceSku": {
    "value": "B1"
  }
}
```

```bash
# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problem: Bicep-Vorlagenfehler
**Symptome:**
- Vorlagenvalidierungsfehler
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
- Anwendung kann während der Bereitstellung nicht gebaut werden
- Paketinstallationsfehler

**Lösungen:**
```bash
# 1. Check build output with debug flag
azd deploy web --debug

# 2. View deployed service status
azd show

# 3. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
# Preserve the committed dependency lock for reproducibility
npm ci

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Problem: Container-Bereitstellungsfehler
**Symptome:**
- Container-Anwendungen starten nicht
- Fehler beim Ziehen von Images

**Lösungen:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs using Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitor application through azd
azd monitor --logs

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Problem: Datenbank-Verbindungsfehler
**Symptome:**
- Anwendung kann keine Verbindung zur Datenbank herstellen
- Zeitüberschreitungen bei Verbindungsversuchen

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
- Anwendung kann Konfigurationswerte nicht lesen
- Umgebungsvariablen sind leer

**Lösungen:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get-value DATABASE_URL

# 2. Check how your Bicep/template maps values into the deployed app.
# azd env set updates local environment values; it does not directly update runtime settings.

# 3. Restart the application
azd deploy web

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

```

2. Aktualisieren Sie Ihre bestehende Express-Anwendung (mit `cors` importiert):

```javascript
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));
```

```bash
# 3. Check if running on correct URLs
azd show
```

## 🌍 Probleme bei der Umweltverwaltung

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
azd env list

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### Problem: Umgebungsbeschädigung
**Symptome:**
- Umgebung zeigt einen ungültigen Zustand an
- Ressourcen stimmen nicht mit der Konfiguration überein

**Lösungen:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 Leistungsprobleme

### Problem: Lange Bereitstellungszeiten
**Symptome:**
- Bereitstellungen dauern zu lange
- Zeitüberschreitungen während der Bereitstellung

**Lösungen:**
```bash
# 1. Deploy specific services for faster iteration
azd deploy web
azd deploy api

# 2. Use code-only deployment when infrastructure unchanged
azd deploy  # Faster than azd up

# 3. Optimize the project's actual build script and image layers.

# 4. Check resource locations (use same region)
# Do not change AZURE_LOCATION to fix the latency of an existing deployment.
```

### Problem: Leistungsprobleme der Anwendung
**Symptome:**
- Langsame Reaktionszeiten
- Hohe Ressourcenauslastung

**Lösungen:**
```bash
# 1. Scale up resources
# Update the SKU parameter in infra/main.parameters.json, then review and
# provision infrastructure changes. azd deploy alone does not apply SKU changes.
azd provision --preview

# 2. Enable Application Insights monitoring
azd monitor --overview

# 3. Check application logs in Azure
az webapp log tail --name myapp --resource-group myrg
# or for Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Fehlerbehebungswerkzeuge und Befehle

### Debug-Befehle
```bash
# Comprehensive debugging
# Only rerun a mutating command when retrying is appropriate.
azd show --debug

# Check azd version
azd version

# View current configuration
azd config show

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Log-Analyse
```bash
# Application logs via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitor application with azd
azd monitor --logs
azd monitor --live

# Azure resource logs
az monitor activity-log list --resource-group myrg --offset 1h --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Ressourcen-Untersuchung
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Zusätzliche Hilfe erhalten

### Wann sollte eskaliert werden
- Authentifizierungsprobleme bestehen weiterhin nach Ausprobieren aller Lösungen
- Infrastrukturprobleme mit Azure-Diensten
- Abrechnungs- oder abonnementsbezogene Probleme
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

### Informationen sammeln
Bevor Sie den Support kontaktieren, sammeln Sie:
- Ausgabe von `azd version`
- Ausgabe von `azd config show`
- Ausgabe von `azd show` (aktueller Bereitstellungsstatus)
- Fehlermeldungen (vollständiger Text)
- Schritte zur Reproduzierung des Problems
- Geschwärzte Umgebungsdetails (teilen Sie niemals rohe `azd env get-values`, die Geheimnisse enthalten können)
- Zeitlinie, wann das Problem begonnen hat

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
# Do not collect environment values automatically: they can contain credentials.

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Fehlerprävention

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

### Monitoring-Einrichtung
```bicep
// Illustrative fragment, not a complete resource definition:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}
```

```bash
# Example App Service PLAN CPU alert (not a site metric)
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/serverfarms/myplan \
  --condition "avg CpuPercentage > 80"
```

### Regelmäßige Wartung
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Verwandte Ressourcen

- [Debugging-Anleitung](debugging.md) - Erweiterte Debugging-Techniken
- [Ressourcenbereitstellung](../chapter-04-infrastructure/provisioning.md) - Infrastruktur-Fehlerbehebung
- [Kapazitätsplanung](../chapter-06-pre-deployment/capacity-planning.md) - Ressourcenplanungsanleitungen
- [SKU-Auswahl](../chapter-06-pre-deployment/sku-selection.md) - Empfehlungen für Service-Stufen

---

**Tipp**: Behalten Sie diesen Leitfaden als Lesezeichen und konsultieren Sie ihn, wenn Sie auf Probleme stoßen. Die meisten Probleme sind bereits bekannt und haben etablierte Lösungen!

---

**Navigation**
- **Vorherige Lektion**: [Ressourcenbereitstellung](../chapter-04-infrastructure/provisioning.md)
- **Nächste Lektion**: [Debugging-Anleitung](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
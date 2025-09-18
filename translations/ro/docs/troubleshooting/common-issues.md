<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e3b1c94a2da4a497e880ebe7b89c2bb1",
  "translation_date": "2025-09-18T11:02:33+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "ro"
}
-->
# Probleme Comune și Soluții

**Navigare Capitole:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitol Curent**: Capitolul 7 - Depanare și Debugging
- **⬅️ Capitol Anterior**: [Capitolul 6: Verificări Preliminare](../pre-deployment/preflight-checks.md)
- **➡️ Următor**: [Ghid de Debugging](debugging.md)
- **🚀 Capitol Următor**: [Capitolul 8: Modele de Producție și Enterprise](../ai-foundry/production-ai-practices.md)

## Introducere

Acest ghid cuprinzător de depanare acoperă cele mai frecvente probleme întâlnite în utilizarea Azure Developer CLI. Învață să diagnostichezi, să depanezi și să rezolvi probleme comune legate de autentificare, implementare, provizionarea infrastructurii și configurarea aplicațiilor. Fiecare problemă include simptome detaliate, cauze principale și proceduri pas cu pas pentru rezolvare.

## Obiective de Învățare

Parcurgând acest ghid, vei:
- Stăpâni tehnici de diagnosticare pentru problemele Azure Developer CLI
- Înțelege problemele comune de autentificare și permisiuni și soluțiile acestora
- Rezolva erori de implementare, probleme de provizionare a infrastructurii și probleme de configurare
- Implementa strategii proactive de monitorizare și debugging
- Aplica metodologii sistematice de depanare pentru probleme complexe
- Configura logare și monitorizare adecvate pentru a preveni problemele viitoare

## Rezultate de Învățare

După finalizare, vei putea:
- Diagnostica problemele Azure Developer CLI folosind instrumentele de diagnosticare încorporate
- Rezolva independent problemele legate de autentificare, abonamente și permisiuni
- Depana eficient erorile de implementare și problemele de provizionare a infrastructurii
- Debugga problemele de configurare ale aplicațiilor și problemele specifice mediului
- Implementa monitorizare și alerte pentru a identifica proactiv problemele potențiale
- Aplica cele mai bune practici pentru logare, debugging și fluxuri de rezolvare a problemelor

## Diagnosticare Rapidă

Înainte de a intra în detalii despre probleme specifice, rulează aceste comenzi pentru a colecta informații de diagnosticare:

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

## Probleme de Autentificare

### Problemă: "Nu s-a putut obține token-ul de acces"
**Simptome:**
- `azd up` eșuează cu erori de autentificare
- Comenzile returnează "neautorizat" sau "acces refuzat"

**Soluții:**
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

### Problemă: "Privilegii insuficiente" în timpul implementării
**Simptome:**
- Implementarea eșuează cu erori de permisiuni
- Nu se pot crea anumite resurse Azure

**Soluții:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Problemă: Probleme de autentificare multi-tenant
**Soluții:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Erori de Provizionare a Infrastructurii

### Problemă: Conflicte de nume ale resurselor
**Simptome:**
- Erori "Numele resursei există deja"
- Implementarea eșuează în timpul creării resurselor

**Soluții:**
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

### Problemă: Locația/Regiunea nu este disponibilă
**Simptome:**
- "Locația 'xyz' nu este disponibilă pentru tipul de resursă"
- Anumite SKUs nu sunt disponibile în regiunea selectată

**Soluții:**
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

### Problemă: Erori de depășire a cotei
**Simptome:**
- "Cota depășită pentru tipul de resursă"
- "Numărul maxim de resurse atins"

**Soluții:**
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

### Problemă: Erori în template-urile Bicep
**Simptome:**
- Eșecuri de validare a template-urilor
- Erori de sintaxă în fișierele Bicep

**Soluții:**
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

## 🚀 Eșecuri de Implementare

### Problemă: Eșecuri de build
**Simptome:**
- Aplicația eșuează la build în timpul implementării
- Erori la instalarea pachetelor

**Soluții:**
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

### Problemă: Eșecuri la implementarea containerelor
**Simptome:**
- Aplicațiile container nu pornesc
- Erori la extragerea imaginilor

**Soluții:**
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

### Problemă: Probleme de conectare la baza de date
**Simptome:**
- Aplicația nu se poate conecta la baza de date
- Erori de timeout la conectare

**Soluții:**
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

## 🔧 Probleme de Configurare

### Problemă: Variabilele de mediu nu funcționează
**Simptome:**
- Aplicația nu poate citi valorile de configurare
- Variabilele de mediu apar goale

**Soluții:**
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

### Problemă: Probleme cu certificatele SSL/TLS
**Simptome:**
- HTTPS nu funcționează
- Erori de validare a certificatelor

**Soluții:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problemă: Probleme de configurare CORS
**Simptome:**
- Frontend-ul nu poate apela API-ul
- Cerere cross-origin blocată

**Soluții:**
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

## 🌍 Probleme de Management al Mediului

### Problemă: Probleme la schimbarea mediului
**Simptome:**
- Se folosește mediul greșit
- Configurația nu se schimbă corect

**Soluții:**
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

### Problemă: Coruperea mediului
**Simptome:**
- Mediul afișează o stare invalidă
- Resursele nu se potrivesc cu configurația

**Soluții:**
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

## 🔍 Probleme de Performanță

### Problemă: Timpuri de implementare lente
**Simptome:**
- Implementările durează prea mult
- Timeout-uri în timpul implementării

**Soluții:**
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

### Problemă: Probleme de performanță ale aplicației
**Simptome:**
- Timpuri de răspuns lente
- Utilizare ridicată a resurselor

**Soluții:**
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

## 🛠️ Instrumente și Comenzi de Depanare

### Comenzi de Debugging
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

### Analiza Logurilor
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Investigarea Resurselor
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Obținerea Ajutorului Suplimentar

### Când să Escalezi
- Problemele de autentificare persistă după încercarea tuturor soluțiilor
- Probleme de infrastructură cu serviciile Azure
- Probleme legate de facturare sau abonamente
- Probleme de securitate sau incidente

### Canale de Suport
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

### Informații de Colectat
Înainte de a contacta suportul, colectează:
- Output-ul `azd version`
- Output-ul `azd info`
- Mesajele de eroare (text complet)
- Pașii pentru reproducerea problemei
- Detalii despre mediu (`azd env show`)
- Cronologia când problema a început

### Script de Colectare a Logurilor
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

## 📊 Prevenirea Problemelor

### Lista de Verificare Pre-implementare
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

### Configurarea Monitorizării
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

### Mentenanță Regulată
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Resurse Conexe

- [Ghid de Debugging](debugging.md) - Tehnici avansate de debugging
- [Provizionarea Resurselor](../deployment/provisioning.md) - Depanarea infrastructurii
- [Planificarea Capacității](../pre-deployment/capacity-planning.md) - Ghid pentru planificarea resurselor
- [Selecția SKU](../pre-deployment/sku-selection.md) - Recomandări pentru nivelurile de servicii

---

**Sfat**: Păstrează acest ghid la îndemână și consultă-l ori de câte ori întâmpini probleme. Majoritatea problemelor au fost întâlnite anterior și au soluții stabilite!

---

**Navigare**
- **Lecția Anterioară**: [Provizionarea Resurselor](../deployment/provisioning.md)
- **Lecția Următoare**: [Ghid de Debugging](debugging.md)

---

**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa natală ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.
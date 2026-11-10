# Probleme Comune și Soluții

**Navigarea capitolelor:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul Curent**: Capitolul 7 - Depanare și Debugging
- **⬅️ Capitolul Anterior**: [Capitolul 6: Verificări Pre-zbor](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Următorul**: [Ghid Debugging](debugging.md)
- **🚀 Capitolul Următor**: [Capitolul 8: Modele de Producție și Enterprise](../chapter-08-production/production-ai-practices.md)

## Introducere

Acest ghid cuprinzător de depanare acoperă cele mai frecvente probleme întâlnite în utilizarea Azure Developer CLI. Învață să diagnostichezi, să depanezi și să rezolvi probleme comune legate de autentificare, implementare, aprovizionare infrastructură și configurare aplicații. Fiecare problemă include simptome detaliate, cauze principale și proceduri pas cu pas pentru rezolvare.

## Obiective de Învățare

Parcurgând acest ghid, vei:
- Stăpâni tehnicile de diagnostic pentru problemele Azure Developer CLI
- Înțelege problemele comune de autentificare și permisiuni și soluțiile lor
- Rezolva eșecurile de implementare, erorile de aprovizionare infrastructură și problemele de configurare
- Implementa strategii proactive de monitorizare și depanare
- Aplica metodologii sistematice de depanare pentru probleme complexe
- Configura înregistrarea și monitorizarea adecvată pentru a preveni probleme viitoare

## Rezultate așteptate

La final, vei putea să:
- Diagnostichezi probleme Azure Developer CLI folosind uneltele încorporate
- Rezolvi probleme legate de autentificare, abonamente și permisiuni independent
- Depanezi eficient eșecurile de implementare și erorile aprovizionării infrastructurii
- Debughezi problemele de configurare a aplicațiilor și cele specifice mediului
- Implementa monitorizarea și alertarea pentru identificarea proactivă a potențialelor probleme
- Aplica cele mai bune practici pentru înregistrare, depanare și fluxurile de rezolvare a problemelor

## Diagnostic Rapid

> Înlocuiește numele/ID-urile exemplu cu valorile mediului tău. Fragmente Bash, Bicep, JavaScript și fișier parametri sunt etichetate separat mai jos; ele nu reprezintă un singur script executabil. Verifică operațiunile distructive și redactează secretele înainte de a partaja diagnosticările. `azd monitor --logs` deschide un browser; nu transmit logurile terminalului.

Înainte de a intra în probleme specifice, execută aceste comenzi pentru a colecta informații de diagnostic:

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

## Probleme de Autentificare

### Problemă: "Nu s-a putut obține token-ul de acces"
**Simptome:**
- `azd up` eșuează cu erori de autentificare
- Comenzile returnează "neautorizat" sau "acces interzis"

**Soluții:**
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

### Problemă: "Privilegii insuficiente" în timpul implementării
**Simptome:**
- Implementarea eșuează cu erori de permisiune
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

### Problemă: Probleme de autentificare multi-chiriaș
**Soluții:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Erori de Aprovizionare Infrastructură

### Problemă: Conflicte de nume pentru resurse
**Simptome:**
- Erori "Numele resursei există deja"
- Implementarea eșuează în timpul creării resursei

**Soluții:**
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

### Problemă: Locația/Regiunea nefiind disponibilă
**Simptome:**
- "Locația 'xyz' nu este disponibilă pentru tipul de resursă"
- Anumite SKU-uri nu sunt disponibile în regiunea selectată

**Soluții:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Modificarea variabilei locație nu mută resursele existente. Un grup de resurse sau resursă existentă poate respinge o schimbare de locație; folosește un mediu separat pentru o redeployare regională.

### Problemă: Erori de depășire a cotelor
**Simptome:**
- "Cotă depășită pentru tipul de resursă"
- "Număr maxim de resurse atins"

**Soluții:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Pentru dezvoltare, alege un SKU mai mic, acceptat, în `infra/main.parameters.json`:

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

### Problemă: Erori în template-ul Bicep
**Simptome:**
- Nereguli la validarea template-ului
- Erori de sintaxă în fișiere Bicep

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

## 🚀 Eșecuri la Implementare

### Problemă: Eșecuri de build
**Simptome:**
- Aplicația nu se construiește în timpul implementării
- Erori la instalarea pachetelor

**Soluții:**
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

### Problemă: Eșecuri la implementarea containerelor
**Simptome:**
- Aplicațiile container nu pornesc
- Erori la preluarea imaginii

**Soluții:**
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

### Problemă: Eșecuri de conectare la baza de date
**Simptome:**
- Aplicația nu poate să se conecteze la baza de date
- Erori de timeout la conexiune

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
- Variabilele de mediu par goale

**Soluții:**
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

### Problemă: Probleme cu certificatele SSL/TLS
**Simptome:**
- HTTPS nu funcționează
- Erori de validare a certificatului

**Soluții:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problemă: Probleme la configurarea CORS
**Simptome:**
- Frontend-ul nu poate apela API-ul
- Cerere cross-origin blocată

**Soluții:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Actualizează aplicația Express existentă (cu `cors` importat):

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

## 🌍 Probleme de Gestionare a Mediului

### Problemă: Probleme la schimbarea mediului
**Simptome:**
- Se folosește mediul greșit
- Configurarea nu se schimbă corect

**Soluții:**
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

### Problemă: Coruperea mediului
**Simptome:**
- Mediul afișează stare invalidă
- Resursele nu corespund configurării

**Soluții:**
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

## 🔍 Probleme de Performanță

### Problemă: Timp de implementare lent
**Simptome:**
- Implementările durează prea mult
- Timeout-uri în timpul implementării

**Soluții:**
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

### Problemă: Probleme de performanță ale aplicației
**Simptome:**
- Timpi de răspuns lenți
- Utilizare ridicată a resurselor

**Soluții:**
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

## 🛠️ Unelte și Comenzi de Depanare

### Comenzi Debug
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

### Analiza de Loguri
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

### Când să escaladezi
- Problemele de autentificare persistă după încercarea tuturor soluțiilor
- Problemele de infrastructură cu serviciile Azure
- Probleme legate de facturare sau abonament
- Îngrijorări sau incidente de securitate

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
- Output-ul `azd config show`
- Output-ul `azd show` (starea curentă a implementării)
- Mesajele de eroare (text complet)
- Pașii pentru reproducerea problemei
- Detalii redactate ale mediului (nu partaja niciodată `azd env get-values` brut, care poate conține secrete)
- Cronologia începutului problemei

### Script de colectare a logurilor
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

## 📊 Prevenirea problemelor

### Lista de verificare pre-implementare
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

### Configurarea monitorizării
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

### Mentenanță regulată
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Resurse conexe

- [Ghid Debugging](debugging.md) - Tehnici avansate de debugging
- [Provisionare Resurse](../chapter-04-infrastructure/provisioning.md) - Depanare infrastructură
- [Planificare Capacitate](../chapter-06-pre-deployment/capacity-planning.md) - Ghid de planificare resurse
- [Selectarea SKU-ului](../chapter-06-pre-deployment/sku-selection.md) - Recomandări nivel serviciu

---

**Sfat**: Păstrează acest ghid la favorite și consultă-l ori de câte ori întâmpini probleme. Majoritatea problemelor au fost deja întâlnite și au soluții stabilite!

---

**Navigare**
- **Lecția Anterioară**: [Provisionare Resurse](../chapter-04-infrastructure/provisioning.md)
- **Lecția Următoare**: [Ghid Debugging](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
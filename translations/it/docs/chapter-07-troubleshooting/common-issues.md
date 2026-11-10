# Problemi Comuni e Soluzioni

**Navigazione del Capitolo:**
- **📚 Home Corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 7 - Risoluzione dei Problemi e Debugging
- **⬅️ Capitolo Precedente**: [Capitolo 6: Controlli Preliminari](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Prossimo**: [Guida al Debugging](debugging.md)
- **🚀 Capitolo Successivo**: [Capitolo 8: Modelli di Produzione e Enterprise](../chapter-08-production/production-ai-practices.md)

## Introduzione

Questa guida completa alla risoluzione dei problemi copre le problematiche più frequentemente incontrate durante l’utilizzo di Azure Developer CLI. Impara a diagnosticare, risolvere e correggere problemi comuni relativi a autenticazione, deployment, provisioning dell’infrastruttura e configurazione delle applicazioni. Ogni problema include sintomi dettagliati, cause radice e procedure di risoluzione passo dopo passo.

## Obiettivi di Apprendimento

Completando questa guida, sarai in grado di:
- Padroneggiare tecniche di diagnosi per problemi di Azure Developer CLI
- Comprendere problemi comuni di autenticazione e permessi e le relative soluzioni
- Risolvere fallimenti di deployment, errori di provisioning infrastrutturale e problematiche di configurazione
- Implementare strategie proattive di monitoraggio e debugging
- Applicare metodologie sistematiche di risoluzione problemi per casi complessi
- Configurare correttamente logging e monitoraggio per prevenire problemi futuri

## Risultati di Apprendimento

Al termine, sarai capace di:
- Diagnosticare problemi di Azure Developer CLI usando strumenti diagnostici integrati
- Risolvere in autonomia problemi relativi ad autenticazione, abbonamenti e permessi
- Gestire efficacemente i fallimenti di deployment e gli errori di provisioning infrastrutturale
- Debuggare problemi di configurazione applicativa e ambienti specifici
- Implementare monitoraggio e allarmi per identificare proattivamente potenziali problemi
- Applicare best practice per logging, debugging e flussi di lavoro di risoluzione problemi

## Diagnostica Rapida

> Sostituisci nomi/ID di esempio con i valori del tuo ambiente. I frammenti Bash, Bicep, JavaScript e file di parametri sono etichettati separatamente qui sotto; non formano uno script eseguibile unico. Verifica operazioni distruttive e redigi i segreti prima di condividere diagnostiche. `azd monitor --logs` apre un browser; non trasmette i log del terminale.

Prima di entrare nei problemi specifici, esegui questi comandi per raccogliere informazioni diagnostiche:

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

## Problemi di Autenticazione

### Problema: "Impossibile ottenere token di accesso"
**Sintomi:**
- `azd up` fallisce con errori di autenticazione
- I comandi rispondono con "non autorizzato" o "accesso negato"

**Soluzioni:**
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

### Problema: "Privilegi insufficienti" durante il deployment
**Sintomi:**
- Il deployment fallisce con errori di permessi
- Impossibile creare alcune risorse Azure

**Soluzioni:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Problema: Problemi di autenticazione multi-tenant
**Soluzioni:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Errori di Provisioning Infrastrutturale

### Problema: Conflitti di nome risorsa
**Sintomi:**
- Errori "Il nome risorsa esiste già"
- Il deployment fallisce durante la creazione della risorsa

**Soluzioni:**
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

### Problema: Posizione/regione non disponibile
**Sintomi:**
- "La posizione 'xyz' non è disponibile per il tipo di risorsa"
- Alcuni SKU non disponibili nella regione selezionata

**Soluzioni:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Cambiare la variabile location non migra le risorse esistenti. Un gruppo di risorse o una risorsa esistente può rifiutare un cambio di location; usa un ambiente separato per un ridispiegamento regionale.

### Problema: Errori di superamento quota
**Sintomi:**
- "Quota superata per tipo di risorsa"
- "Numero massimo di risorse raggiunto"

**Soluzioni:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Per lo sviluppo, scegli uno SKU più piccolo supportato in `infra/main.parameters.json`:

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

### Problema: Errori nei template Bicep
**Sintomi:**
- Fallimenti di validazione del template
- Errori di sintassi nei file Bicep

**Soluzioni:**
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

## 🚀 Fallimenti del Deployment

### Problema: Fallimenti di build
**Sintomi:**
- L’applicazione fallisce in fase di build durante il deployment
- Errori di installazione pacchetti

**Soluzioni:**
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

### Problema: Fallimenti nel deployment di container
**Sintomi:**
- Container app falliscono all’avvio
- Errori di pull dell’immagine

**Soluzioni:**
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

### Problema: Fallimenti di connessione al database
**Sintomi:**
- L’applicazione non riesce a connettersi al database
- Errori di timeout di connessione

**Soluzioni:**
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

## 🔧 Problemi di Configurazione

### Problema: Le variabili d’ambiente non funzionano
**Sintomi:**
- L’app non riesce a leggere i valori di configurazione
- Le variabili d’ambiente appaiono vuote

**Soluzioni:**
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

### Problema: Problemi con certificati SSL/TLS
**Sintomi:**
- HTTPS non funziona
- Errori di validazione certificati

**Soluzioni:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problema: Problemi di configurazione CORS
**Sintomi:**
- Frontend non riesce a chiamare l’API
- Richiesta cross-origin bloccata

**Soluzioni:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Aggiorna la tua applicazione Express esistente (con `cors` importato):

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

## 🌍 Problemi di Gestione dell’Ambiente

### Problema: Problemi di cambio ambiente
**Sintomi:**
- Ambiente sbagliato utilizzato
- La configurazione non cambia correttamente

**Soluzioni:**
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

### Problema: Corruzione ambiente
**Sintomi:**
- L’ambiente mostra uno stato non valido
- Le risorse non corrispondono alla configurazione

**Soluzioni:**
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

## 🔍 Problemi di Prestazioni

### Problema: Tempi di deployment lenti
**Sintomi:**
- I deployment richiedono troppo tempo
- Timeout durante il deployment

**Soluzioni:**
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

### Problema: Problemi di prestazioni applicative
**Sintomi:**
- Tempi di risposta lenti
- Uso elevato delle risorse

**Soluzioni:**
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

## 🛠️ Strumenti e Comandi per la Risoluzione Problemi

### Comandi di Debug
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

### Analisi dei Log
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

### Investigazione delle Risorse
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Ottenere Aiuto Aggiuntivo

### Quando Escalare
- Problemi di autenticazione persistono dopo aver provato tutte le soluzioni
- Problemi infrastrutturali con i servizi Azure
- Problemi relativi a fatturazione o abbonamento
- Preoccupazioni o incidenti di sicurezza

### Canali di Supporto
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

### Informazioni da Raccogliere
Prima di contattare il supporto, raccogli:
- Output di `azd version`
- Output di `azd config show`
- Output di `azd show` (stato corrente del deployment)
- Messaggi di errore (testo completo)
- Passi per riprodurre il problema
- Dettagli ambiente redatti (non condividere mai i file `azd env get-values` grezzi, che possono contenere segreti)
- Cronologia di quando il problema è iniziato

### Script di Raccolta Log
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

## 📊 Prevenzione dei Problemi

### Checklist Pre-deployment
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

### Configurazione del Monitoraggio
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

### Manutenzione Regolare
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Risorse Correlate

- [Guida al Debugging](debugging.md) - Tecniche di debugging avanzate
- [Provisioning Risorse](../chapter-04-infrastructure/provisioning.md) - Risoluzione problemi infrastrutturali
- [Pianificazione Capacità](../chapter-06-pre-deployment/capacity-planning.md) - Guida alla pianificazione delle risorse
- [Selezione SKU](../chapter-06-pre-deployment/sku-selection.md) - Raccomandazioni sui livelli di servizio

---

**Suggerimento**: Tieni questa guida nei preferiti e consultala ogni volta che incontri problemi. La maggior parte dei problemi è già stata affrontata in precedenza e ha soluzioni consolidate!

---

**Navigazione**
- **Lezione Precedente**: [Provisioning Risorse](../chapter-04-infrastructure/provisioning.md)
- **Lezione Successiva**: [Guida al Debugging](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
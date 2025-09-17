<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e3b1c94a2da4a497e880ebe7b89c2bb1",
  "translation_date": "2025-09-17T21:40:57+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "it"
}
-->
# Problemi Comuni e Soluzioni

**Navigazione Capitolo:**
- **📚 Home del Corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 7 - Risoluzione dei Problemi e Debugging
- **⬅️ Capitolo Precedente**: [Capitolo 6: Controlli Preliminari](../pre-deployment/preflight-checks.md)
- **➡️ Successivo**: [Guida al Debugging](debugging.md)
- **🚀 Capitolo Successivo**: [Capitolo 8: Modelli per Produzione ed Enterprise](../ai-foundry/production-ai-practices.md)

## Introduzione

Questa guida completa alla risoluzione dei problemi copre le problematiche più frequenti nell'uso di Azure Developer CLI. Impara a diagnosticare, risolvere e affrontare problemi comuni relativi ad autenticazione, distribuzione, provisioning dell'infrastruttura e configurazione delle applicazioni. Ogni problema include sintomi dettagliati, cause principali e procedure passo-passo per la risoluzione.

## Obiettivi di Apprendimento

Completando questa guida, sarai in grado di:
- Padroneggiare tecniche diagnostiche per problemi con Azure Developer CLI
- Comprendere i problemi comuni di autenticazione e permessi e le loro soluzioni
- Risolvere errori di distribuzione, problemi di provisioning dell'infrastruttura e di configurazione
- Implementare strategie di monitoraggio e debugging proattive
- Applicare metodologie sistematiche per la risoluzione di problemi complessi
- Configurare correttamente logging e monitoraggio per prevenire problemi futuri

## Risultati di Apprendimento

Al termine, sarai in grado di:
- Diagnosticare problemi di Azure Developer CLI utilizzando strumenti diagnostici integrati
- Risolvere autonomamente problemi di autenticazione, sottoscrizione e permessi
- Affrontare efficacemente errori di distribuzione e problemi di provisioning dell'infrastruttura
- Debuggare problemi di configurazione delle applicazioni e problemi specifici dell'ambiente
- Implementare monitoraggio e avvisi per identificare proattivamente potenziali problemi
- Applicare le migliori pratiche per logging, debugging e flussi di lavoro per la risoluzione dei problemi

## Diagnostica Rapida

Prima di affrontare problemi specifici, esegui questi comandi per raccogliere informazioni diagnostiche:

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

## Problemi di Autenticazione

### Problema: "Impossibile ottenere il token di accesso"
**Sintomi:**
- `azd up` fallisce con errori di autenticazione
- I comandi restituiscono "non autorizzato" o "accesso negato"

**Soluzioni:**
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

### Problema: "Privilegi insufficienti" durante la distribuzione
**Sintomi:**
- La distribuzione fallisce con errori di permessi
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

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Errori di Provisioning dell'Infrastruttura

### Problema: Conflitti nei nomi delle risorse
**Sintomi:**
- Errori "Il nome della risorsa esiste già"
- La distribuzione fallisce durante la creazione delle risorse

**Soluzioni:**
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

### Problema: Posizione/Regione non disponibile
**Sintomi:**
- "La posizione 'xyz' non è disponibile per il tipo di risorsa"
- Alcuni SKU non disponibili nella regione selezionata

**Soluzioni:**
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

### Problema: Errori di superamento delle quote
**Sintomi:**
- "Quota superata per il tipo di risorsa"
- "Numero massimo di risorse raggiunto"

**Soluzioni:**
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

### Problema: Errori nei template Bicep
**Sintomi:**
- Fallimenti nella validazione del template
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

## 🚀 Fallimenti di Distribuzione

### Problema: Fallimenti nella build
**Sintomi:**
- L'applicazione non riesce a essere compilata durante la distribuzione
- Errori nell'installazione dei pacchetti

**Soluzioni:**
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

### Problema: Fallimenti nella distribuzione dei container
**Sintomi:**
- Le app container non si avviano
- Errori nel pull delle immagini

**Soluzioni:**
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

### Problema: Fallimenti nella connessione al database
**Sintomi:**
- L'applicazione non riesce a connettersi al database
- Errori di timeout della connessione

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

### Problema: Variabili d'ambiente non funzionanti
**Sintomi:**
- L'app non riesce a leggere i valori di configurazione
- Le variabili d'ambiente risultano vuote

**Soluzioni:**
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

### Problema: Problemi con i certificati SSL/TLS
**Sintomi:**
- HTTPS non funziona
- Errori di validazione del certificato

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
- Il frontend non riesce a chiamare l'API
- Richiesta cross-origin bloccata

**Soluzioni:**
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

## 🌍 Problemi di Gestione degli Ambienti

### Problema: Problemi nel cambio di ambiente
**Sintomi:**
- Viene utilizzato l'ambiente sbagliato
- La configurazione non cambia correttamente

**Soluzioni:**
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

### Problema: Corruzione dell'ambiente
**Sintomi:**
- L'ambiente mostra uno stato non valido
- Le risorse non corrispondono alla configurazione

**Soluzioni:**
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

## 🔍 Problemi di Prestazioni

### Problema: Tempi di distribuzione lenti
**Sintomi:**
- Le distribuzioni richiedono troppo tempo
- Timeout durante la distribuzione

**Soluzioni:**
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

### Problema: Problemi di prestazioni dell'applicazione
**Sintomi:**
- Tempi di risposta lenti
- Alto utilizzo delle risorse

**Soluzioni:**
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

## 🛠️ Strumenti e Comandi per la Risoluzione dei Problemi

### Comandi di Debug
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

### Analisi dei Log
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

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

## 🆘 Ottenere Ulteriore Aiuto

### Quando Escalare
- I problemi di autenticazione persistono dopo aver provato tutte le soluzioni
- Problemi di infrastruttura con i servizi Azure
- Problemi relativi a fatturazione o sottoscrizione
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
- Output di `azd info`
- Messaggi di errore (testo completo)
- Passaggi per riprodurre il problema
- Dettagli dell'ambiente (`azd env show`)
- Cronologia di quando il problema è iniziato

### Script per la Raccolta dei Log
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

## 📊 Prevenzione dei Problemi

### Checklist Pre-distribuzione
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

### Manutenzione Regolare
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Risorse Correlate

- [Guida al Debugging](debugging.md) - Tecniche avanzate di debugging
- [Provisioning delle Risorse](../deployment/provisioning.md) - Risoluzione dei problemi di infrastruttura
- [Pianificazione della Capacità](../pre-deployment/capacity-planning.md) - Guida alla pianificazione delle risorse
- [Selezione degli SKU](../pre-deployment/sku-selection.md) - Raccomandazioni sui livelli di servizio

---

**Suggerimento**: Tieni questa guida tra i preferiti e consultala ogni volta che incontri problemi. La maggior parte dei problemi è già stata affrontata e ha soluzioni consolidate!

---

**Navigazione**
- **Lezione Precedente**: [Provisioning delle Risorse](../deployment/provisioning.md)
- **Lezione Successiva**: [Guida al Debugging](debugging.md)

---

**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
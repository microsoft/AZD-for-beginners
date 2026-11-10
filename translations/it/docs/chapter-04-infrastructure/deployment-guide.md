# Guida al Deployment - Padroneggiare i Deploy di AZD

**Navigazione Capitoli:**
- **📚 Home del Corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 4 - Infrastructure as Code & Deployment
- **⬅️ Capitolo Precedente**: [Capitolo 3: Configurazione](../chapter-03-configuration/configuration.md)
- **➡️ Successivo**: [Provisioning delle Risorse](provisioning.md)
- **🧩 Sempre in questo capitolo**: [Creare il Proprio Template](custom-templates.md)
- **🚀 Capitolo Successivo**: [Capitolo 5: Soluzioni AI Multi-Agente](../../examples/retail-scenario.md)

## Introduzione

> Revisionato rispetto a `azd 1.37.2` (novembre 2026). I comandi usano Bash; gli esempi JSON richiedono `jq`. Ad eccezione dell’esercizio todo inizializzato esplicitamente, gli esempi avanzati sono **frammenti di integrazione**: fornisci il tuo codice sorgente, infrastruttura, test e script. Nessun deployment Azure è stato eseguito in questa revisione.

Questa guida completa copre tutto ciò che devi sapere sul deployment di applicazioni usando Azure Developer CLI, dai deploy base con un solo comando agli scenari di produzione avanzati con hook personalizzati, ambienti multipli e integrazione CI/CD. Padroneggia l’intero ciclo di vita del deployment con esempi pratici e best practice.

## Obiettivi di Apprendimento

Completando questa guida, sarai in grado di:
- Padroneggiare tutti i comandi e i flussi di lavoro di deployment di Azure Developer CLI
- Comprendere l’intero ciclo di vita del deployment dalla provisioning al monitoraggio
- Implementare hook di deployment personalizzati per automazioni pre e post-deployment
- Configurare più ambienti con parametri specifici per ambiente
- Impostare strategie di deployment avanzate, inclusi blue-green e canary deployment
- Integrare i deployment azd con pipeline CI/CD e flussi di lavoro DevOps

## Risultati di Apprendimento

Al termine, sarai in grado di:
- Eseguire e risolvere problemi di tutti i flussi di lavoro di deployment azd in autonomia
- Progettare e implementare automazioni di deployment personalizzate usando hook
- Configurare deployment pronti per la produzione con sicurezza e monitoraggio appropriato
- Gestire scenari complessi di deployment multi-ambiente
- Ottimizzare le prestazioni di deployment e implementare strategie di rollback
- Integrare i deployment azd nelle pratiche DevOps aziendali

## Panoramica del Deployment

Azure Developer CLI offre diversi comandi di deployment:
- `azd up` - Flusso completo (provision + deploy)
- `azd provision` - Crea/aggiorna solo le risorse Azure
- `azd deploy` - Distribuisci solo il codice applicativo
- `azd package` - Costruisci e pacchetta applicazioni

## Flussi di Lavoro di Deployment Base

### Deployment Completo (azd up)
Il flusso più comune per nuovi progetti:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Configure a location for the selected environment before first provisioning
azd env set AZURE_LOCATION westus2
# SKU changes must be wired into your template's parameter file/Bicep.
azd up
```

### Deployment Solo Infrastruttura
Quando devi aggiornare solo le risorse Azure:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Deployment Solo Codice
Per aggiornamenti rapidi dell’applicazione:
```bash
# Deploy all services
azd deploy

# Expected output:
# Deploying services (azd deploy)
# - web: Deploying... Done
# - api: Deploying... Done
# SUCCESS: Your deployment completed in 2 minutes 15 seconds

# Deploy specific service
azd deploy web
azd deploy api

# Docker build arguments belong in azure.yaml: services.api.docker.buildArgs
# They are not an azd deploy --build-arg flag.

# Verify deployment
azd show --output json | jq '.services'
```

### ✅ Verifica del Deployment

Dopo ogni deployment, verifica il successo:

```bash
# Inspect configured service targets and ingress URLs (not a health check)
azd show

# Test health endpoints
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

curl -f "$WEB_URL" || { echo "❌ Web request failed"; exit 1; }
# For the todo-nodejs-mongo template, /lists exists; /health does not.
curl -f "$API_URL/lists" || { echo "❌ API request failed"; exit 1; }

# Monitor for errors (opens in browser by default)
azd monitor --logs
```

**Criteri di Successo:**
- ✅ `azd show` risolve gli URL/servizi previsti
- ✅ Le richieste alle rotte applicative effettive restituiscono stato e corpo attesi
- ✅ Nessun log di errore negli ultimi 5 minuti
- ✅ L’applicazione risponde alle richieste di test

## 🏗️ Comprendere il Processo di Deployment

### Nuovo agli hook? Inizia qui

Un **hook** è un comando che azd esegue automaticamente in un momento specifico del processo di deploy—prima o dopo il provisioning, e prima o dopo il deploy del codice. Permettono di automatizzare piccoli compiti che sempre circondano un deployment: popolamento di un database, esecuzione di migrazioni, costruzione delle risorse, o smoke-test dell’app live.

| Hook | Viene eseguito… | Uso comune |
|------|--------------|------------|
| `preprovision` | Prima che le risorse siano create | Verifica prerequisiti, login su registry |
| `postprovision` | Dopo che esistono le risorse | Configura risorse, imposta il database |
| `predeploy` | Prima che il codice venga distribuito | Costruisci asset frontend, esegui test unitari |
| `postdeploy` | Dopo che il codice è live | Esegui migrazioni DB, smoke-test endpoint |

Gli hook vivono nel tuo `azure.yaml`. Ecco l’esempio minimo possibile—stampa semplicemente un messaggio dopo il deployment:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Questo è tutto—la prossima volta che esegui `azd up`, il messaggio viene stampato automaticamente. Puoi anche eseguire un hook da solo, senza un deploy completo, ottimo per test:

```bash
azd hooks run postdeploy
```

Le fasi seguenti mostrano hook reali (migrazioni, test, validazione) per ogni stadio.

### Fase 1: Hook Pre-Provisioning
```yaml
# azure.yaml
hooks:
  preprovision:
    shell: sh
    run: |
      echo "Validating configuration..."
      ./scripts/validate-prereqs.sh
      
      echo "Setting up secrets..."
      ./scripts/setup-secrets.sh
```

### Fase 2: Provisioning Infrastruttura
- Legge i template infrastrutturali (Bicep/Terraform)
- Crea o aggiorna risorse Azure
- Configura rete e sicurezza
- Imposta monitoraggio e logging

### Fase 3: Hook Post-Provisioning
```yaml
hooks:
  postprovision:
    shell: pwsh
    run: |
      Write-Host "Infrastructure ready, setting up databases..."
      ./scripts/setup-database.ps1
      
      Write-Host "Configuring application settings..."
      ./scripts/configure-app-settings.ps1
```

### Fase 4: Packaging Applicativo
- Costruisce il codice applicativo
- Crea artefatti di deployment
- Pacchetta per piattaforma target (container, file ZIP, ecc.)

### Fase 5: Hook Pre-Deploy
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      echo "Running pre-deployment tests..."
      npm run test:unit
      
      echo "Database migrations..."
      npm run db:migrate
```

### Fase 6: Deployment Applicativo
- Distribuisce applicazioni pacchettizzate ai servizi Azure
- Aggiorna le configurazioni
- Avvia/riavvia i servizi

### Fase 7: Hook Post-Deploy
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl --fail "$WEB_URL/health"
```

### Gestione Errori negli Hook

Per default, **se un comando hook termina con codice non zero, azd interrompe tutta l’operazione.** Questo è di solito quello che vuoi—una migrazione fallita deve fermare il deploy, non spedire un’app rotta. Ma significa che gli hook devono essere scritti con cura.

**1. Fai che i fallimenti siano espliciti e intenzionali.** Un hook fallisce quando il suo ultimo comando ritorna codice di uscita non zero. Negli script shell, aggiungi `set -e` così che l’hook si fermi al primo comando fallito invece di continuare silenziosamente:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Permetti a un hook di fallire senza interrompere azd.** Per passi non critici (un warm-up cache opzionale, una notifica best-effort), imposta `continueOnError: true`. azd registra il fallimento ma prosegue:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Testa gli hook in isolamento prima di una corsa completa.** Non devi eseguire `azd up` per eseguire il debug di un hook—eseguilo da solo e iterati rapidamente:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Fai attenzione alle shell specifiche OS.** Un hook che usa `shell: pwsh` richiede PowerShell installato sulla macchina che lo esegue (inclusi gli agent CI). Usa `shell: sh` per la massima portabilità, o fornisci entrambe le varianti `windows` e `posix`:

```yaml
hooks:
  postprovision:
    posix:
      shell: sh
      run: ./scripts/setup.sh
    windows:
      shell: pwsh
      run: ./scripts/setup.ps1
```

> **Suggerimento per il debug:** esegui qualsiasi comando azd con `--debug` per vedere la linea di comando esatta dell’hook e la sua intera uscita—inestimabile quando un hook funziona localmente ma fallisce in CI.

## 🎛️ Configurazione del Deployment

### Impostazioni di Deployment Specifiche per Servizio
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    language: js
    dist: dist
    
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
    env:
      NODE_ENV: production
      API_VERSION: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    language: js
```

### Configurazioni Specifiche per Ambiente

Questi sono valori locali azd soltanto. Mappali esplicitamente alla configurazione infrastrutturale/runtime. `NODE_ENV` è normalmente `production` per un’app Node distribuita, inclusa un deploy di staging; usa una variabile specifica per app separata per distinguere le fasi di deployment.

```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Scenari di Deployment Avanzati

### Applicazioni Multi-Servizio
```yaml
# Complex application with multiple services
services:
  # Frontend applications
  web-app:
    project: ./src/web
    host: staticwebapp
  
  admin-portal:
    project: ./src/admin
    host: appservice
    
  # Backend services
  user-api:
    project: ./src/services/users
    host: containerapp
    
  order-api:
    project: ./src/services/orders
    host: containerapp
    
  payment-api:
    project: ./src/services/payments
    host: function
    
  # Background processing
  notification-worker:
    project: ./src/workers/notifications
    host: containerapp
    
  report-worker:
    project: ./src/workers/reports
    host: function
```

### Blue-Green Deployment

**Schizzo operativo illustrativo:** devi fornire entrambi gli ambienti, uno strato condiviso per il routing del traffico, e gli script seguenti. azd non esegue il cambio di traffico o valida automaticamente la prontezza al rollback. Mantieni il verde fino a quando il blu ha superato i test e il rollback non è più necessario.

```bash
# Create blue environment
azd env new production-blue
azd up --environment production-blue

# Test blue environment
./scripts/test-environment.sh production-blue

# Switch traffic to blue (manual DNS/load balancer update)
./scripts/switch-traffic.sh production-blue

# Clean up green environment
azd env select production-green
azd down --force
```

### Canary Deployments
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

La suddivisione del traffico appartiene alla configurazione di Container Apps (Bicep o Azure CLI), non a una proprietà `azure.yaml` `trafficSplit`. Le preview/provisioning e i deploy successivi devono preservare la modalità di revisione scelta e le regole di routing.

### Deployment a Fasi
```bash
#!/bin/bash
# deploy-staged.sh
set -e

echo "Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 Deployment su Container

### Deployment Container App
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - BUILD_VERSION=${BUILD_VERSION}
        - NODE_ENV=production
    env:
      NODE_ENV: production
```

Configura i segreti di runtime con `configuration.secrets`/`secretRef` (o riferimenti Key Vault) e la scalabilità con `template.scale` nell’infrastruttura Container App. Non inventare proprietà `secrets` o `scale` a livello di servizio in `azure.yaml`.

### Ottimizzazione Multi-Stadio del Dockerfile
```dockerfile
# Dockerfile
FROM node:22-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci
COPY . .
RUN npm run build
RUN npm prune --omit=dev

FROM node:22-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ Ottimizzazione delle Prestazioni

### Deployment Specifici per Servizio
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Caching della Build
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Il flusso standard Node usa script di pacchetto; gli hook `prepackage` del servizio possono aggiungere passi richiesti. Il caching dei layer Docker è separato dalla definizione di un comando build di servizio.

### Deployment del Codice Efficiente
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Monitoraggio del Deployment

### Monitoraggio del Deployment in Tempo Reale
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Controlli di Salute
```bicep
// Partial Container App container definition:
// merge into properties.template.containers[] in your Bicep resource.
probes: [
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 3000
      scheme: 'HTTP'
    }
    initialDelaySeconds: 10
    periodSeconds: 30
    timeoutSeconds: 10
    failureThreshold: 3
  }
]
```

La tua app deve implementare `/health`; non è fornita automaticamente da azd. Non esiste una proprietà di servizio generica `azure.yaml` `healthCheck`.

### Validazione Post-Deployment
```bash
#!/bin/bash
# scripts/validate-deployment.sh
set -e

echo "Validating deployment..."

# Check application health
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

echo "Testing web application..."
if curl -f "$WEB_URL"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/lists"; then
    echo "✅ API is healthy"
else
    echo "❌ API health check failed"
    exit 1
fi

echo "Running integration tests..."
npm run test:integration

echo "✅ Deployment validation completed successfully"
```

## 🔐 Considerazioni sulla Sicurezza

### Gestione dei Segreti
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` non è valido. I valori ordinari di ambiente sono in chiaro locali; non presumere che i comandi di lettura li omettano. I comandi sopra salvano riferimenti a Key Vault, ma la tua infrastruttura/app deve comunque consumare i segreti e concedere accesso all’identità di runtime.

### Sicurezza di Rete
Dichiara e consuma i parametri di rete in Bicep, e mappali in `infra/main.parameters.json`. Non esiste un overlay generico `infra.parameters` in `azure.yaml`. Gli esempi di documentazione degli intervalli `203.0.113.0/24` e `198.51.100.0/24` non sono reti ufficio/VPN reali; sostituiscili con intervalli autorizzati.

### Gestione di Identità e Accessi
Abilita l’`identity` della Container App in Bicep e assegna il ruolo necessario di data-plane Key Vault nell’ambito del vault. Configura segreti nominati backed da Key Vault e riferimenti di runtime in quella risorsa; `identity` e `keyVault` non sono proprietà generiche di servizio azd. Vedi [Authentication & Managed Identity](../chapter-03-configuration/authsecurity.md).

## 🚨 Strategie di Rollback

### Rollback Veloce
```bash
# AZD doesn't have built-in rollback. Recommended approaches:

# Option 1: Redeploy from Git (recommended)
git revert HEAD  # Revert the problematic commit
git push
azd deploy

# Option 2: Redeploy specific commit
git checkout "<previous-commit-hash>"
azd deploy
git checkout main
```

### Rollback dell’Infrastruttura
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### Rollback Migrazione Database
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metriche del Deployment

### Tieni Traccia delle Prestazioni di Deployment
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
azd monitor --live
```

### Raccolta Metriche Personalizzate
```yaml
# azure.yaml - Configure custom metrics
hooks:
  postdeploy:
    shell: sh
    run: |
      # Record deployment metrics
      DEPLOY_TIME=$(date +%s)
      SERVICE_COUNT=$(azd show --output json | jq '.services | length')
      
      # Send to monitoring system
      curl -X POST "https://metrics.company.com/deployments" \
        -H "Content-Type: application/json" \
        -d "{\"timestamp\": $DEPLOY_TIME, \"service_count\": $SERVICE_COUNT}"
```

## 🎯 Best Practice

### 1. Coerenza degli Ambienti
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Validazione dell’Infrastruttura
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
```

### 3. Integrazione dei Test
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      # Unit tests
      npm run test:unit
      
      # Security scanning
      npm audit
      
      # Code quality checks
      npm run lint
      npm run type-check
      
  postdeploy:
    shell: sh
    run: |
      # Integration tests
      npm run test:integration
      
      # Performance tests
      npm run test:performance
      
      # Smoke tests
      npm run test:smoke
```

### 4. Documentazione e Logging
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Passi Successivi

- [Provisioning delle Risorse](provisioning.md) - Approfondimento nella gestione dell’infrastruttura
- [Pianificazione Pre-Deploy](../chapter-06-pre-deployment/capacity-planning.md) - Pianifica la tua strategia di deployment
- [Problemi Comuni](../chapter-07-troubleshooting/common-issues.md) - Risolvi i problemi di deployment
- [Best Practice](../chapter-07-troubleshooting/debugging.md) - Strategie di deployment pronte per la produzione

## 🎯 Esercizi Pratici di Deployment

### Esercizio 1: Flusso di Deployment Incrementale (20 minuti)
**Obiettivo**: Padroneggiare la differenza tra deploy completo e incrementale

**Punto di partenza:** Bash, Node.js 22, Git, accesso azd, e un abbonamento Azure con permessi di deploy. Esegui in una nuova cartella; aspetta risorse App Service/Cosmos DB a pagamento. Il tempo dipende da regione e template.

```bash
# Initial deployment
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo .
time azd up

# Record initial deployment time
echo "Full deployment: $(date)" > deployment-log.txt

# Make a code change
echo "// Updated $(date)" >> src/api/src/index.ts

# Deploy only code (fast)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Compare times
cat deployment-log.txt

# Clean up
azd down --force --purge
```

**Criteri di Successo:**
- [ ] Registra il tempo trascorso per entrambi i comandi (non c’è durata garantita)
- [ ] Entrambi i comandi completano con successo
- [ ] L’API rimane funzionale; la modifica solo commento non è un cambiamento UI visibile
- [ ] Infrastruttura invariata dopo `azd deploy`

**Risultato di Apprendimento**: `azd deploy` salta la provisioning infrastrutturale. Confronta i tempi misurati invece di assumere un’accelerazione percentuale fissa.

### Esercizio 2: Hook di Deployment Personalizzati (30 minuti)
**Obiettivo**: Implementare automazioni pre e post-deployment

**Punto di partenza:** il progetto `deployment-practice` inizializzato sopra. Se lo hai ripulito, esegui di nuovo `azd up` prima di testare il deployment solo codice. La validazione sotto usa lo script di build reale dell’API, non uno script root `test:unit` inesistente. I test API del template necessitano accesso database configurato; non sono test unitari isolati.

```bash
# Create pre-deploy validation script
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
set -e
echo "⚠️ Running pre-deployment checks..."

# Install API dependencies and check its actual lint/TypeScript build
npm --prefix src/api ci
if ! npm --prefix src/api run build; then
    echo "❌ Build validation failed! Aborting deployment."
    exit 1
fi

# Check for uncommitted changes
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Create post-deploy smoke test
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
set -e
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')

if curl -f "$WEB_URL"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# Merge the following into the EXISTING azure.yaml using your editor.
# If hooks already exists, merge its children; never append a duplicate YAML key.
```

```yaml

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
```

```bash
# Test deployment with hooks
azd deploy
```

**Criteri di Successo:**
- [ ] Lo script pre-deploy viene eseguito prima del deployment
- [ ] Il deployment si interrompe se la validazione build fallisce
- [ ] Il test smoke post-deploy valida la salute
- [ ] Gli hook vengono eseguiti nell’ordine corretto

### Esercizio 3: Strategia di Deployment Multi-Ambiente (45 minuti)
**Obiettivo**: Implementare flusso di lavoro di deployment a fasi (dev → staging → produzione)

**Punto di partenza:** lo stesso progetto todo inizializzato con `jq`. Crea gli ambienti sottostanti con valori reali di subscription/posizione (o imposta `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` in ciascuno) **prima** di invocare il flusso di lavoro senza prompt. Fallisce intenzionalmente piuttosto che inventare valori mancanti. Usa solo ambienti di formazione usa e getta, non una subscription di produzione reale.

```bash
# Create deployment script
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Step 1: Deploy to dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 2: Deploy to staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 3: Manual approval for production
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Create environments
# Reuse existing dev if you completed Exercise 1; create unused environments
azd env select dev
azd env new staging --subscription "<subscription-id>" --location eastus2
azd env new production --subscription "<subscription-id>" --location eastus2

# Run staged deployment
./deploy-staged.sh

# After verification, delete each disposable deployment (review prompts)
azd down --environment dev
azd down --environment staging
azd down --environment production
```

**Criteri di Successo:**
- [ ] L'ambiente di sviluppo si distribuisce con successo
- [ ] L'ambiente di staging si distribuisce con successo
- [ ] Approvazione manuale richiesta per la produzione
- [ ] Tutti gli ambienti hanno controlli di integrità funzionanti
- [ ] Può eseguire rollback se necessario

### Esercizio 4: Strategia di Rollback (25 minuti)
**Obiettivo**: Implementare e testare il rollback della distribuzione usando Git

**Punto di partenza:** un checkout isolato del template todo con tutto il codice base impegnato, un albero di lavoro Git pulito e un ambiente configurato usa e getta. Non introdurre mai fallimenti deliberati in un progetto di produzione reale. `APP_VERSION` sotto è solo per la contabilità a meno che non lo colleghi esplicitamente all'app.

```bash
# Deploy v1
azd env set APP_VERSION "1.0.0"
azd up

# Save v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Deploy v2 with breaking change
echo "throw new Error('Intentional break');" >> src/api/src/index.ts
git add src/api/src/index.ts
git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
DEPLOY_FAILED=false
azd deploy api || DEPLOY_FAILED=true

# Detect failure and rollback
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
if [ "$DEPLOY_FAILED" = true ] || ! curl -f "$API_URL/lists"; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback using git
    git revert HEAD --no-edit
    
    # Rollback environment
    azd env set APP_VERSION "1.0.0"
    
    # Redeploy v1
    azd deploy api
    curl --fail "$API_URL/lists"
    
    echo "✅ Rolled back to v1.0.0"
fi

# Clean up the disposable deployment when finished
azd down
```

**Criteri di Successo:**
- [ ] Può rilevare fallimenti nella distribuzione
- [ ] Lo script di rollback si esegue automaticamente
- [ ] L'applicazione torna allo stato funzionante
- [ ] Controlli di integrità superati dopo il rollback

## 📊 Monitoraggio delle Metriche di Distribuzione

### Monitora le tue prestazioni di distribuzione

```bash
# Create deployment metrics script
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"
DEPLOY_STATUS=$?

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Log to file
echo "$(date +%Y-%m-%dT%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
exit "$DEPLOY_STATUS"
EOF

chmod +x track-deployment.sh

# Use it
./track-deployment.sh
```

**Analizza le tue metriche:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Risorse Aggiuntive

- [Riferimento Distribuzione Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Distribuzione Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Distribuzione Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Distribuzione Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigazione**
- **Lezione Precedente**: [Il Tuo Primo Progetto](../chapter-01-foundation/first-project.md)
- **Lezione Successiva**: [Provisioning delle Risorse](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Guida al Deployment - Padroneggiare le distribuzioni AZD

**Navigazione del Capitolo:**
- **📚 Home del corso**: [AZD per principianti](../../README.md)
- **📖 Capitolo corrente**: Capitolo 4 - Infrastructure as Code e distribuzione
- **⬅️ Capitolo precedente**: [Capitolo 3: Configurazione](../chapter-03-configuration/configuration.md)
- **➡️ Successivo**: [Provisioning delle risorse](provisioning.md)
- **🚀 Capitolo successivo**: [Capitolo 5: Soluzioni AI multi-agente](../../examples/retail-scenario.md)

## Introduzione

Questa guida completa copre tutto ciò che devi sapere sul deploy delle applicazioni usando Azure Developer CLI, dai semplici deployment con un solo comando agli scenari di produzione avanzati con hook personalizzati, più ambienti e integrazione CI/CD. Padroneggia l'intero ciclo di vita del deployment con esempi pratici e best practice.

## Obiettivi di apprendimento

Completando questa guida, potrai:
- Padroneggiare tutti i comandi e i workflow di deployment di Azure Developer CLI
- Comprendere l'intero ciclo di vita del deployment dal provisioning al monitoraggio
- Implementare hook di deployment personalizzati per l'automazione pre e post-deployment
- Configurare più ambienti con parametri specifici per ambiente
- Impostare strategie di deployment avanzate, incluse blue-green e canary
- Integrare le distribuzioni azd con pipeline CI/CD e workflow DevOps

## Risultati di apprendimento

Al termine, sarai in grado di:
- Eseguire e risolvere problemi di tutti i workflow di deployment azd in autonomia
- Progettare e implementare automazioni di deployment personalizzate usando hook
- Configurare deployment pronti per la produzione con adeguata sicurezza e monitoraggio
- Gestire scenari di deployment complessi multi-ambiente
- Ottimizzare le prestazioni del deployment e implementare strategie di rollback
- Integrare le distribuzioni azd nelle pratiche DevOps aziendali

## Panoramica sul Deployment

Azure Developer CLI fornisce diversi comandi di deployment:
- `azd up` - Complete workflow (provision + deploy)
- `azd provision` - Create/update Azure resources only
- `azd deploy` - Deploy application code only
- `azd package` - Build and package applications

## Flussi di deployment di base

### Deployment completo (azd up)
Il flusso di lavoro più comune per i nuovi progetti:
```bash
# Distribuire tutto da zero
azd up

# Distribuire in un ambiente specifico
azd up --environment production

# Distribuire con parametri personalizzati
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Deployment solo infrastruttura
Quando è necessario aggiornare solo le risorse Azure:
```bash
# Provisionare/aggiornare l'infrastruttura
azd provision

# Provisionare con dry-run per visualizzare in anteprima le modifiche
azd provision --preview

# Provisionare servizi specifici
azd provision --service database
```

### Deployment solo codice
Per aggiornamenti rapidi dell'applicazione:
```bash
# Distribuisci tutti i servizi
azd deploy

# Output previsto:
# Distribuzione dei servizi (azd deploy)
# - web: Distribuzione... Fatto
# - api: Distribuzione... Fatto
# SUCCESSO: La tua distribuzione è stata completata in 2 minuti e 15 secondi

# Distribuisci un servizio specifico
azd deploy --service web
azd deploy --service api

# Distribuisci con argomenti di build personalizzati
azd deploy --service api --build-arg NODE_ENV=production

# Verifica la distribuzione
azd show --output json | jq '.services'
```

### ✅ Verifica del deployment

Dopo ogni deployment, verifica il successo:

```bash
# Controllare che tutti i servizi siano in esecuzione
azd show

# Testare gli endpoint di integrità
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Monitorare eventuali errori (si apre nel browser per impostazione predefinita)
azd monitor --logs
```

**Criteri di successo:**
- ✅ Tutti i servizi mostrano stato "Running"
- ✅ Gli endpoint di health restituiscono HTTP 200
- ✅ Nessun log di errore negli ultimi 5 minuti
- ✅ L'applicazione risponde alle richieste di test

## 🏗️ Comprendere il processo di deployment

### Fase 1: Hook pre-provision
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

### Fase 2: Provisioning dell'infrastruttura
- Legge i template di infrastruttura (Bicep/Terraform)
- Crea o aggiorna le risorse Azure
- Configura rete e sicurezza
- Configura monitoraggio e logging

### Fase 3: Hook post-provision
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

### Fase 4: Packaging dell'applicazione
- Compila il codice dell'applicazione
- Crea gli artefatti di deployment
- Impacchetta per la piattaforma di destinazione (container, file ZIP, ecc.)

### Fase 5: Hook pre-deploy
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

### Fase 6: Deployment dell'applicazione
- Distribuisce le applicazioni impacchettate sui servizi Azure
- Aggiorna le impostazioni di configurazione
- Avvia/riavvia i servizi

### Fase 7: Hook post-deploy
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl https://${WEB_URL}/health
```

## 🎛️ Configurazione del deployment

### Impostazioni di deployment specifiche per servizio
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    buildCommand: npm run build
    outputPath: dist
    
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
    env:
      - name: NODE_ENV
        value: production
      - name: API_VERSION
        value: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    runtime: node
    buildCommand: npm install --production
```

### Configurazioni specifiche per ambiente
```bash
# Ambiente di sviluppo
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Ambiente di staging
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Ambiente di produzione
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Scenari di deployment avanzati

### Applicazioni multi-servizio
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

### Blue-Green Deployments
```bash
# Crea l'ambiente blu
azd env new production-blue
azd up --environment production-blue

# Testa l'ambiente blu
./scripts/test-environment.sh production-blue

# Sposta il traffico sull'ambiente blu (aggiornamento manuale di DNS/bilanciatore di carico)
./scripts/switch-traffic.sh production-blue

# Pulisci l'ambiente verde
azd env select production-green
azd down --force
```

### Canary Deployments
```yaml
# azure.yaml - Configure traffic splitting
services:
  api:
    project: ./src/api
    host: containerapp
    trafficSplit:
      - revision: stable
        percentage: 90
      - revision: canary
        percentage: 10
```

### Staged Deployments
```bash
#!/bin/bash
# deploy-staged.sh

echo "Deploying to development..."
azd env select dev
azd up --confirm-with-no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --confirm-with-no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --confirm-with-no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 Deployment con container

### Deployment di Container App
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        BUILD_VERSION: ${BUILD_VERSION}
        NODE_ENV: production
    env:
      - name: DATABASE_URL
        value: ${DATABASE_URL}
    secrets:
      - name: jwt-secret
        value: ${JWT_SECRET}
    scale:
      minReplicas: 1
      maxReplicas: 10
```

### Ottimizzazione di Dockerfile multi-stage
```dockerfile
# Dockerfile
FROM node:18-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci --only=production
COPY . .
RUN npm run build

FROM node:18-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ Ottimizzazione delle prestazioni

### Deployment specifici per servizio
```bash
# Distribuire un servizio specifico per iterazioni più rapide
azd deploy --service web
azd deploy --service api

# Distribuire tutti i servizi
azd deploy
```

### Caching della build
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Deploy di codice efficienti
```bash
# Usa azd deploy (non azd up) per modifiche esclusivamente al codice
# Questo evita il provisioning dell'infrastruttura ed è molto più veloce
azd deploy

# Distribuisci un servizio specifico per l'iterazione più veloce
azd deploy --service api
```

## 🔍 Monitoraggio del deployment

### Monitoraggio del deployment in tempo reale
```bash
# Monitora l'applicazione in tempo reale
azd monitor --live

# Visualizza i log dell'applicazione
azd monitor --logs

# Verifica lo stato della distribuzione
azd show
```

### Health Checks
```yaml
# azure.yaml - Configure health checks
services:
  api:
    project: ./src/api
    host: containerapp
    healthCheck:
      path: /health
      interval: 30s
      timeout: 10s
      retries: 3
```

### Validazione post-deployment
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Verifica lo stato di salute dell'applicazione
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing web application..."
if curl -f "$WEB_URL/health"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/health"; then
    echo "✅ API is healthy"
else
    echo "❌ API health check failed"
    exit 1
fi

echo "Running integration tests..."
npm run test:integration

echo "✅ Deployment validation completed successfully"
```

## 🔐 Considerazioni sulla sicurezza

### Gestione dei segreti
```bash
# Conserva i segreti in modo sicuro
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Fai riferimento ai segreti in azure.yaml
```

```yaml
services:
  api:
    secrets:
      - name: database-password
        value: ${DATABASE_PASSWORD}
      - name: jwt-secret
        value: ${JWT_SECRET}
```

### Sicurezza di rete
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identità e gestione degli accessi
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    identity:
      type: systemAssigned
    keyVault:
      - name: app-secrets
        secrets:
          - database-connection
          - external-api-key
```

## 🚨 Strategie di rollback

### Rollback rapido
```bash
# AZD non dispone di rollback integrato. Approcci consigliati:

# Opzione 1: Ridistribuire da Git (consigliato)
git revert HEAD  # Annulla il commit problematico
git push
azd deploy

# Opzione 2: Ridistribuire un commit specifico
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Rollback dell'infrastruttura
```bash
# Visualizza in anteprima le modifiche all'infrastruttura prima di applicarle
azd provision --preview

# Per il rollback dell'infrastruttura, usa il controllo di versione:
git revert HEAD  # Ripristina le modifiche all'infrastruttura
azd provision    # Applica lo stato precedente dell'infrastruttura
```

### Rollback delle migrazioni del database
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metriche di deployment

### Tracciare le prestazioni del deployment
```bash
# Visualizza lo stato attuale della distribuzione
azd show

# Monitora l'applicazione con Application Insights
azd monitor --overview

# Visualizza metriche in tempo reale
azd monitor --live
```

### Raccolta di metriche personalizzate
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

## 🎯 Migliori pratiche

### 1. Coerenza degli ambienti
```bash
# Usare una nomenclatura coerente
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Mantenere la parità tra gli ambienti
./scripts/sync-environments.sh
```

### 2. Validazione dell'infrastruttura
```bash
# Visualizza in anteprima le modifiche all'infrastruttura prima della distribuzione
azd provision --preview

# Usa il linting per ARM/Bicep
az bicep lint --file infra/main.bicep

# Convalida la sintassi di Bicep
az bicep build --file infra/main.bicep
```

### 3. Integrazione dei test
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

### 4. Documentazione e logging
```bash
# Documentare le procedure di distribuzione
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Prossimi passi

- [Provisioning delle risorse](provisioning.md) - Approfondimento sulla gestione dell'infrastruttura
- [Pianificazione pre-deployment](../chapter-06-pre-deployment/capacity-planning.md) - Pianifica la tua strategia di deployment
- [Problemi comuni](../chapter-07-troubleshooting/common-issues.md) - Risolvi i problemi di deployment
- [Migliori pratiche](../chapter-07-troubleshooting/debugging.md) - Strategie di deployment pronte per la produzione

## 🎯 Esercizi pratici sul deployment

### Esercizio 1: Flusso di deployment incrementale (20 minuti)
**Obiettivo**: Padroneggiare la differenza tra deployment completi e incrementali

```bash
# Distribuzione iniziale
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Registra l'ora della distribuzione iniziale
echo "Full deployment: $(date)" > deployment-log.txt

# Apporta una modifica al codice
echo "// Updated $(date)" >> src/api/src/server.js

# Distribuisci solo il codice (veloce)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Confronta i tempi
cat deployment-log.txt

# Ripulisci
azd down --force --purge
```

**Criteri di successo:**
- [ ] Il deployment completo dura 5-15 minuti
- [ ] Il deployment solo codice dura 2-5 minuti
- [ ] Le modifiche al codice sono riflesse nell'app distribuita
- [ ] Infrastruttura invariata dopo `azd deploy`

**Risultato dell'apprendimento**: `azd deploy` è 50-70% più veloce di `azd up` per le modifiche al codice

### Esercizio 2: Hook di deployment personalizzati (30 minuti)
**Obiettivo**: Implementare automazioni pre e post-deployment

```bash
# Crea uno script di validazione pre-distribuzione
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Verifica se i test passano
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Verifica la presenza di modifiche non commesse
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Crea uno smoke test post-distribuzione
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')

if curl -f "$WEB_URL/health"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# Aggiungi gli hook in azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Testa la distribuzione con gli hook
azd deploy
```

**Criteri di successo:**
- [ ] Lo script pre-deploy viene eseguito prima del deployment
- [ ] Il deployment viene interrotto se i test falliscono
- [ ] Il test smoke post-deploy valida la salute
- [ ] Gli hook vengono eseguiti nell'ordine corretto

### Esercizio 3: Strategia di deployment multi-ambiente (45 minuti)
**Obiettivo**: Implementare un flusso di deployment a fasi (dev → staging → production)

```bash
# Crea script di distribuzione
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Passo 1: Distribuisci su dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Passo 2: Distribuisci su staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Passo 3: Approvazione manuale per la produzione
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Crea ambienti
azd env new dev
azd env new staging
azd env new production

# Esegui distribuzione a fasi
./deploy-staged.sh
```

**Criteri di successo:**
- [ ] L'ambiente Dev viene distribuito con successo
- [ ] L'ambiente Staging viene distribuito con successo
- [ ] Approvazione manuale richiesta per la produzione
- [ ] Tutti gli ambienti hanno health check funzionanti
- [ ] È possibile effettuare il rollback se necessario

### Esercizio 4: Strategia di rollback (25 minuti)
**Obiettivo**: Implementare e testare il rollback del deployment usando Git

```bash
# Distribuisci v1
azd env set APP_VERSION "1.0.0"
azd up

# Salva l'hash del commit di v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Distribuisci v2 con una modifica incompatibile
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Rileva il guasto e ripristina
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Ripristina usando git
    git revert HEAD --no-edit
    
    # Ripristina l'ambiente
    azd env set APP_VERSION "1.0.0"
    
    # Ridispiega v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Criteri di successo:**
- [ ] È possibile rilevare i fallimenti di deployment
- [ ] Lo script di rollback viene eseguito automaticamente
- [ ] L'applicazione ritorna a uno stato funzionante
- [ ] I controlli di integrità passano dopo il rollback

## 📊 Monitoraggio delle metriche di deployment

### Monitora le prestazioni del tuo deployment

```bash
# Crea uno script per le metriche di deployment
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Registra su file
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Usalo
./track-deployment.sh
```

**Analizza le tue metriche:**
```bash
# Visualizza la cronologia delle distribuzioni
cat deployment-metrics.csv

# Calcola il tempo medio di distribuzione
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Risorse aggiuntive

- [Riferimento al Deployment di Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Deployment di Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Deployment di Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Deployment di Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigazione**
- **Lezione precedente**: [Il tuo primo progetto](../chapter-01-foundation/first-project.md)
- **Prossima lezione**: [Provisioning delle risorse](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Dichiarazione di non responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o inesattezze. Il documento originale nella sua lingua d'origine deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda la traduzione professionale da parte di un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
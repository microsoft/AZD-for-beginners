<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6ae5503cd909d625f01efa4d9e99799e",
  "translation_date": "2025-11-20T22:11:40+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "it"
}
-->
# Guida al Deployment - Padroneggiare i Deployment con AZD

**Navigazione Capitolo:**
- **📚 Corso Home**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 4 - Infrastruttura come Codice & Deployment
- **⬅️ Capitolo Precedente**: [Capitolo 3: Configurazione](../getting-started/configuration.md)
- **➡️ Successivo**: [Provisioning delle Risorse](provisioning.md)
- **🚀 Capitolo Successivo**: [Capitolo 5: Soluzioni AI Multi-Agent](../../examples/retail-scenario.md)

## Introduzione

Questa guida completa copre tutto ciò che devi sapere per distribuire applicazioni utilizzando Azure Developer CLI, dai deployment base con un singolo comando a scenari avanzati di produzione con hook personalizzati, ambienti multipli e integrazione CI/CD. Padroneggia l'intero ciclo di vita del deployment con esempi pratici e best practice.

## Obiettivi di Apprendimento

Completando questa guida, sarai in grado di:
- Padroneggiare tutti i comandi e i flussi di lavoro di deployment di Azure Developer CLI
- Comprendere l'intero ciclo di vita del deployment, dal provisioning al monitoraggio
- Implementare hook personalizzati per l'automazione pre e post-deployment
- Configurare ambienti multipli con parametri specifici per ambiente
- Impostare strategie di deployment avanzate, inclusi deployment blue-green e canary
- Integrare i deployment azd con pipeline CI/CD e flussi di lavoro DevOps

## Risultati di Apprendimento

Al termine, sarai in grado di:
- Eseguire e risolvere problemi di tutti i flussi di lavoro di deployment azd in autonomia
- Progettare e implementare automazioni di deployment personalizzate utilizzando hook
- Configurare deployment pronti per la produzione con sicurezza e monitoraggio adeguati
- Gestire scenari complessi di deployment multi-ambiente
- Ottimizzare le prestazioni del deployment e implementare strategie di rollback
- Integrare i deployment azd nelle pratiche DevOps aziendali

## Panoramica del Deployment

Azure Developer CLI offre diversi comandi di deployment:
- `azd up` - Flusso completo (provision + deploy)
- `azd provision` - Crea/aggiorna solo le risorse Azure
- `azd deploy` - Distribuisce solo il codice dell'applicazione
- `azd package` - Compila e impacchetta le applicazioni

## Flussi di Lavoro Base per il Deployment

### Deployment Completo (azd up)
Il flusso più comune per nuovi progetti:
```bash
# Distribuisci tutto da zero
azd up

# Distribuisci con ambiente specifico
azd up --environment production

# Distribuisci con parametri personalizzati
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Deployment Solo Infrastruttura
Quando è necessario aggiornare solo le risorse Azure:
```bash
# Fornire/aggiornare l'infrastruttura
azd provision

# Fornire con dry-run per visualizzare le modifiche
azd provision --preview

# Fornire servizi specifici
azd provision --service database
```

### Deployment Solo Codice
Per aggiornamenti rapidi dell'applicazione:
```bash
# Distribuire tutti i servizi
azd deploy

# Output previsto:
# Distribuzione dei servizi (azd deploy)
# - web: Distribuzione... Completata
# - api: Distribuzione... Completata
# SUCCESSO: La distribuzione è stata completata in 2 minuti e 15 secondi

# Distribuire un servizio specifico
azd deploy --service web
azd deploy --service api

# Distribuire con argomenti di build personalizzati
azd deploy --service api --build-arg NODE_ENV=production

# Verificare la distribuzione
azd show --output json | jq '.services'
```

### ✅ Verifica del Deployment

Dopo ogni deployment, verifica il successo:

```bash
# Controlla che tutti i servizi siano in esecuzione
azd show

# Testa gli endpoint di salute
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Controlla i log per errori
azd logs --service api --since 5m | grep -i error
```

**Criteri di Successo:**
- ✅ Tutti i servizi mostrano lo stato "Running"
- ✅ Gli endpoint di salute restituiscono HTTP 200
- ✅ Nessun log di errore negli ultimi 5 minuti
- ✅ L'applicazione risponde alle richieste di test

## 🏗️ Comprendere il Processo di Deployment

### Fase 1: Hook Pre-Provision
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

### Fase 2: Provisioning dell'Infrastruttura
- Legge i template dell'infrastruttura (Bicep/Terraform)
- Crea o aggiorna le risorse Azure
- Configura rete e sicurezza
- Imposta monitoraggio e logging

### Fase 3: Hook Post-Provision
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

### Fase 4: Impacchettamento dell'Applicazione
- Compila il codice dell'applicazione
- Crea artefatti di deployment
- Impacchetta per la piattaforma di destinazione (container, file ZIP, ecc.)

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

### Fase 6: Deployment dell'Applicazione
- Distribuisce le applicazioni impacchettate ai servizi Azure
- Aggiorna le impostazioni di configurazione
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
      curl https://${WEB_URL}/health
```

## 🎛️ Configurazione del Deployment

### Impostazioni di Deployment Specifiche per Servizio
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

### Configurazioni Specifiche per Ambiente
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

## 🔧 Scenari Avanzati di Deployment

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

### Deployment Blue-Green
```bash
# Creare ambiente blu
azd env new production-blue
azd up --environment production-blue

# Testare ambiente blu
./scripts/test-environment.sh production-blue

# Spostare il traffico su blu (aggiornamento manuale DNS/bilanciatore di carico)
./scripts/switch-traffic.sh production-blue

# Pulire ambiente verde
azd env select production-green
azd down --force
```

### Deployment Canary
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

### Deployment a Fasi
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

## 🐳 Deployment di Container

### Deployment di App Containerizzate
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

### Ottimizzazione Multi-Stage Dockerfile
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

## ⚡ Ottimizzazione delle Prestazioni

### Deployment in Parallelo
```bash
# Configura il deployment parallelo
azd config set deploy.parallelism 5

# Distribuisci i servizi in parallelo
azd deploy --parallel
```

### Caching della Build
```yaml
# azure.yaml - Enable build caching
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    buildCache:
      enabled: true
      paths:
        - node_modules
        - .next/cache
```

### Deployment Incrementali
```bash
# Distribuisci solo i servizi modificati
azd deploy --incremental

# Distribuisci con rilevamento delle modifiche
azd deploy --detect-changes
```

## 🔍 Monitoraggio del Deployment

### Monitoraggio in Tempo Reale
```bash
# Monitora il progresso del deployment
azd deploy --follow

# Visualizza i log del deployment
azd logs --follow --service api

# Controlla lo stato del deployment
azd show --service api
```

### Controlli di Salute
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

### Validazione Post-Deployment
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Controlla lo stato di salute dell'applicazione
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

## 🔐 Considerazioni sulla Sicurezza

### Gestione dei Segreti
```bash
# Archivia i segreti in modo sicuro
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Riferisci i segreti in azure.yaml
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

### Sicurezza della Rete
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Gestione delle Identità e degli Accessi
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

## 🚨 Strategie di Rollback

### Rollback Rapido
```bash
# Ripristina alla distribuzione precedente
azd deploy --rollback

# Ripristina un servizio specifico
azd deploy --service api --rollback

# Ripristina a una versione specifica
azd deploy --service api --version v1.2.3
```

### Rollback dell'Infrastruttura
```bash
# Ripristina le modifiche all'infrastruttura
azd provision --rollback

# Anteprima delle modifiche di ripristino
azd provision --rollback --preview
```

### Rollback delle Migrazioni del Database
```bash
#!/bin/bash
# scripts/ripristina-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metriche di Deployment

### Monitorare le Prestazioni del Deployment
```bash
# Abilita metriche di distribuzione
azd config set telemetry.deployment.enabled true

# Visualizza la cronologia delle distribuzioni
azd history

# Ottieni statistiche di distribuzione
azd metrics --type deployment
```

### Raccolta di Metriche Personalizzate
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
# Usa una denominazione coerente
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Mantieni la parità dell'ambiente
./scripts/sync-environments.sh
```

### 2. Validazione dell'Infrastruttura
```bash
# Convalidare prima della distribuzione
azd provision --preview
azd provision --what-if

# Utilizzare il linting ARM/Bicep
az bicep lint --file infra/main.bicep
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
# Documentare le procedure di distribuzione
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Prossimi Passi

- [Provisioning delle Risorse](provisioning.md) - Approfondimento sulla gestione dell'infrastruttura
- [Pianificazione Pre-Deployment](../pre-deployment/capacity-planning.md) - Pianifica la tua strategia di deployment
- [Problemi Comuni](../troubleshooting/common-issues.md) - Risolvi i problemi di deployment
- [Best Practice](../troubleshooting/debugging.md) - Strategie di deployment pronte per la produzione

## 🎯 Esercizi Pratici di Deployment

### Esercizio 1: Flusso di Deployment Incrementale (20 minuti)
**Obiettivo**: Padroneggiare la differenza tra deployment completo e incrementale

```bash
# Distribuzione iniziale
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Registra il tempo di distribuzione iniziale
echo "Full deployment: $(date)" > deployment-log.txt

# Apporta una modifica al codice
echo "// Updated $(date)" >> src/api/src/server.js

# Distribuisci solo il codice (veloce)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Confronta i tempi
cat deployment-log.txt

# Pulisci
azd down --force --purge
```

**Criteri di Successo:**
- [ ] Il deployment completo richiede 5-15 minuti
- [ ] Il deployment solo codice richiede 2-5 minuti
- [ ] Le modifiche al codice sono riflesse nell'app distribuita
- [ ] L'infrastruttura rimane invariata dopo `azd deploy`

**Risultato di Apprendimento**: `azd deploy` è il 50-70% più veloce di `azd up` per le modifiche al codice

### Esercizio 2: Hook di Deployment Personalizzati (30 minuti)
**Obiettivo**: Implementare automazioni pre e post-deployment

```bash
# Creare script di convalida pre-deploy
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Verificare se i test superano
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Controllare le modifiche non impegnate
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Creare test di verifica post-deploy
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

# Aggiungere hook a azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Testare la distribuzione con hook
azd deploy
```

**Criteri di Successo:**
- [ ] Lo script pre-deploy viene eseguito prima del deployment
- [ ] Il deployment si interrompe se i test falliscono
- [ ] Il test di smoke post-deploy valida la salute
- [ ] Gli hook vengono eseguiti nell'ordine corretto

### Esercizio 3: Strategia di Deployment Multi-Ambiente (45 minuti)
**Obiettivo**: Implementare un flusso di deployment a fasi (dev → staging → produzione)

```bash
# Crea script di distribuzione
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Passaggio 1: Distribuisci su dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Passaggio 2: Distribuisci su staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Passaggio 3: Approvazione manuale per la produzione
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

**Criteri di Successo:**
- [ ] L'ambiente dev viene distribuito con successo
- [ ] L'ambiente staging viene distribuito con successo
- [ ] È richiesta un'approvazione manuale per la produzione
- [ ] Tutti gli ambienti hanno controlli di salute funzionanti
- [ ] È possibile effettuare un rollback se necessario

### Esercizio 4: Strategia di Rollback (25 minuti)
**Obiettivo**: Implementare e testare il rollback del deployment

```bash
# Distribuire v1
azd env set APP_VERSION "1.0.0"
azd up

# Salvare la configurazione v1
cp -r .azure/production .azure/production-v1-backup

# Distribuire v2 con modifica incompatibile
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Rilevare errore
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Ripristinare il codice
    git checkout src/api/src/server.js
    
    # Ripristinare l'ambiente
    azd env set APP_VERSION "1.0.0"
    
    # Ridistribuire v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Criteri di Successo:**
- [ ] È possibile rilevare i fallimenti del deployment
- [ ] Lo script di rollback viene eseguito automaticamente
- [ ] L'applicazione torna a uno stato funzionante
- [ ] I controlli di salute passano dopo il rollback

## 📊 Monitoraggio delle Metriche di Deployment

### Monitora le Prestazioni del Tuo Deployment

```bash
# Crea script di metriche di distribuzione
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
echo "Environment: $(azd env show --output json | jq -r '.name')"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Registra su file
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
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

## Risorse Aggiuntive

- [Riferimento Deployment Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Deployment Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Deployment Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Deployment Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigazione**
- **Lezione Precedente**: [Il Tuo Primo Progetto](../getting-started/first-project.md)
- **Lezione Successiva**: [Provisioning delle Risorse](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche potrebbero contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale umana. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
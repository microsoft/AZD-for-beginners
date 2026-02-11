# Ghid de implementare - Stăpânirea implementărilor AZD

**Chapter Navigation:**
- **📚 Pagina cursului**: [AZD pentru începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 4 - Infrastructură ca cod și implementare
- **⬅️ Capitolul anterior**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)
- **➡️ Următorul**: [Provisionarea resurselor](provisioning.md)
- **🚀 Capitolul următor**: [Capitolul 5: Soluții AI cu agenți multipli](../../examples/retail-scenario.md)

## Introduction

Acest## Understanding the Deployment Processcuprinzător ghid acoperă tot ce trebuie să știi despre implementarea aplicațiilor folosind Azure Developer CLI, de la implementări de bază cu o singură comandă până la scenarii avansate de producție cu hook-uri personalizate, medii multiple și integrare CI/CD. Stăpânește ciclul complet de viață al implementării cu exemple practice și bune practici.

## Learning Goals

La finalizarea acestui ghid, vei:
- Stăpâni toate comenzile și fluxurile de lucru de implementare ale Azure Developer CLI
- Înțelege întregul ciclu de viață al implementării, de la provisionare la monitorizare
- Implementa hook-uri de implementare personalizate pentru automatizarea înainte și după implementare
- Configura medii multiple cu parametri specifici fiecărui mediu
- Configura strategii avansate de implementare, inclusiv implementări blue-green și canary
- Integra implementările azd cu pipeline-uri CI/CD și fluxuri de lucru DevOps

## Learning Outcomes

La final, vei putea:
- Să execuți și să depanezi toate fluxurile de lucru de implementare azd în mod independent
- Să proiectezi și să implementezi automatizări de implementare personalizate folosind hook-uri
- Să configurezi implementări pregătite pentru producție cu securitate și monitorizare adecvate
- Să gestionezi scenarii complexe de implementare multi-mediu
- Să optimizezi performanța implementărilor și să implementezi strategii de rollback
- Să integrezi implementările azd în practicile DevOps ale întreprinderii

## Deployment Overview

Azure Developer CLI oferă mai multe comenzi de implementare:
- `azd up` - Flux complet de lucru (provisionare + implementare)
- `azd provision` - Creează/actualizează doar resurse Azure
- `azd deploy` - Implementă doar codul aplicației
- `azd package` - Construiește și pachetează aplicațiile

## Basic Deployment Workflows

### Complete Deployment (azd up)
The most common workflow for new projects:
```bash
# Implementa totul de la zero
azd up

# Implementa într-un mediu specific
azd up --environment production

# Implementa cu parametri personalizați
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Infrastructure-Only Deployment
When you only need to update Azure resources:
```bash
# Provisionare/actualizare a infrastructurii
azd provision

# Provisionare cu dry-run pentru previzualizarea modificărilor
azd provision --preview

# Provisionare de servicii specifice
azd provision --service database
```

### Code-Only Deployment
For quick application updates:
```bash
# Implementați toate serviciile
azd deploy

# Ieșire așteptată:
# Se implementează serviciile (azd deploy)
# - web: Se implementează... Gata
# - api: Se implementează... Gata
# SUCCES: Implementarea dvs. s-a finalizat în 2 minute și 15 secunde

# Implementați un serviciu specific
azd deploy --service web
azd deploy --service api

# Implementați cu argumente de construire personalizate
azd deploy --service api --build-arg NODE_ENV=production

# Verificați implementarea
azd show --output json | jq '.services'
```

### ✅ Deployment Verification

After any deployment, verify success:

```bash
# Verificați dacă toate serviciile rulează
azd show

# Testați endpoint-urile de sănătate
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Monitorizați erorile (se deschide în browser în mod implicit)
azd monitor --logs
```

**Criterii de succes:**
- ✅ Toate serviciile afișează starea "În execuție"
- ✅ Endpoint-urile de sănătate returnează HTTP 200
- ✅ Niciun jurnal de erori în ultimele 5 minute
- ✅ Aplicația răspunde la cereri de test

## 🏗️ Understanding the Deployment Process

### Faza 1: Hook-uri pre-provizionare
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

### Faza 2: Provisionarea infrastructurii
- Citește șabloane de infrastructură (Bicep/Terraform)
- Creează sau actualizează resursele Azure
- Configurează rețeaua și securitatea
- Configurează monitorizarea și jurnalizarea

### Faza 3: Hook-uri post-provizionare
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

### Faza 4: Ambalarea aplicației
- Construiește codul aplicației
- Creează artefacte de implementare
- Pachetează pentru platforma țintă (containere, fișiere ZIP, etc.)

### Faza 5: Hook-uri pre-implementare
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

### Faza 6: Implementarea aplicației
- Publică aplicațiile pachetate în serviciile Azure
- Actualizează setările de configurare
- Pornește/repornește serviciile

### Faza 7: Hook-uri post-implementare
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

## 🎛️ Deployment Configuration

### Setări de implementare specifice serviciilor
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

### Configurații specifice mediului
```bash
# Mediu de dezvoltare
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Mediu de preproducție
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Mediu de producție
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Advanced Deployment Scenarios

### Aplicații multi-serviciu
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

### Implementări blue-green
```bash
# Creează mediul albastru
azd env new production-blue
azd up --environment production-blue

# Testează mediul albastru
./scripts/test-environment.sh production-blue

# Redirecționează traficul către mediul albastru (actualizare manuală DNS/balansator de încărcare)
./scripts/switch-traffic.sh production-blue

# Curăță mediul verde
azd env select production-green
azd down --force
```

### Implementări canary
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

### Implementări etapizate
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

## 🐳 Container Deployments

### Implementări pentru aplicații în containere
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

### Optimizarea Dockerfile multi-etapă
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

## ⚡ Performance Optimization

### Implementări specifice serviciilor
```bash
# Desfășurați un serviciu specific pentru iterații mai rapide
azd deploy --service web
azd deploy --service api

# Desfășurați toate serviciile
azd deploy
```

### Cache de build
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Implementări eficiente ale codului
```bash
# Folosiți azd deploy (nu azd up) pentru modificări care țin doar de cod
# Acest lucru omite provisionarea infrastructurii și este mult mai rapid
azd deploy

# Desfășurați un serviciu specific pentru iterații cât mai rapide
azd deploy --service api
```

## 🔍 Deployment Monitoring

### Monitorizare a implementărilor în timp real
```bash
# Monitorizează aplicația în timp real
azd monitor --live

# Vizualizează jurnalele aplicației
azd monitor --logs

# Verifică starea implementării
azd show
```

### Verificări de sănătate
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

### Validare post-implementare
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Verifică starea aplicației
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

## 🔐 Security Considerations

### Managementul secretelor
```bash
# Stocați secretele în siguranță
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Faceți referire la secrete în azure.yaml
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

### Securitatea rețelei
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Managementul identității și accesului
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

## 🚨 Rollback Strategies

### Rollback rapid
```bash
# AZD nu are funcționalitate de rollback încorporată. Abordări recomandate:

# Opțiunea 1: Redesfășurare din Git (recomandat)
git revert HEAD  # Anulați commit-ul problematic
git push
azd deploy

# Opțiunea 2: Redesfășurare a unui commit specific
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Rollback infrastructură
```bash
# Previzualizați modificările infrastructurii înainte de a le aplica
azd provision --preview

# Pentru revenirea infrastructurii la o stare anterioară, folosiți controlul versiunilor:
git revert HEAD  # Anulați modificările infrastructurii
azd provision    # Aplicați starea anterioară a infrastructurii
```

### Rollback pentru migrarea bazei de date
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Deployment Metrics

### Monitorizează performanța implementărilor
```bash
# Vizualizați starea curentă a implementării
azd show

# Monitorizați aplicația cu Application Insights
azd monitor --overview

# Vizualizați metrici în timp real
azd monitor --live
```

### Colectare metrici personalizate
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

## 🎯 Best Practices

### 1. Consistența mediului
```bash
# Folosește denumiri consecvente
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Menține paritatea între medii
./scripts/sync-environments.sh
```

### 2. Validarea infrastructurii
```bash
# Previzualizați modificările infrastructurii înainte de implementare
azd provision --preview

# Folosiți linting pentru ARM/Bicep
az bicep lint --file infra/main.bicep

# Validați sintaxa Bicep
az bicep build --file infra/main.bicep
```

### 3. Integrarea testării
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

### 4. Documentare și jurnalizare
```bash
# Documentați procedurile de implementare
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Next Steps

- [Provisionarea resurselor](provisioning.md) - Analiză aprofundată a gestionării infrastructurii
- [Planificarea pre-implementării](../chapter-06-pre-deployment/capacity-planning.md) - Planifică strategia ta de implementare
- [Probleme comune](../chapter-07-troubleshooting/common-issues.md) - Rezolvă problemele de implementare
- [Bune practici](../chapter-07-troubleshooting/debugging.md) - Strategii de implementare pregătite pentru producție

## 🎯 Hands-On Deployment Exercises

### Exercițiul 1: Flux de implementare incrementală (20 minutes)
**Scop**: Stăpânește diferența între implementările complete și cele incrementale

```bash
# Implementare inițială
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Înregistrează timpul implementării inițiale
echo "Full deployment: $(date)" > deployment-log.txt

# Efectuează o modificare a codului
echo "// Updated $(date)" >> src/api/src/server.js

# Implementează doar codul (rapid)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Compară timpii
cat deployment-log.txt

# Curăță
azd down --force --purge
```

**Criterii de succes:**
- [ ] Implementarea completă durează 5-15 minute
- [ ] Implementarea doar a codului durează 2-5 minute
- [ ] Modificările de cod sunt reflectate în aplicația implementată
- [ ] Infrastructura neschimbată după `azd deploy`

**Rezultatul învățării**: `azd deploy` este cu 50-70% mai rapid decât `azd up` pentru modificările de cod

### Exercițiul 2: Hook-uri personalizate de implementare (30 minutes)
**Scop**: Implementează automatizarea înainte și după implementare

```bash
# Creează script de validare înainte de implementare
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Verifică dacă testele trec
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Verifică dacă există modificări necomise
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Creează un test smoke după implementare
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

# Adaugă hook-uri în azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Testează implementarea cu hook-uri
azd deploy
```

**Criterii de succes:**
- [ ] Scriptul pre-deploy se execută înainte de implementare
- [ ] Implementarea se oprește dacă testele eșuează
- [ ] Testul smoke post-deploy validează starea de sănătate
- [ ] Hook-urile se execută în ordinea corectă

### Exercițiul 3: Strategie de implementare multi-mediu (45 minutes)
**Scop**: Implementează fluxul de implementare în etape (dev → staging → production)

```bash
# Creați scriptul de implementare
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Pasul 1: Implementare în dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Pasul 2: Implementare în staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Pasul 3: Aprobare manuală pentru producție
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

# Creați medii
azd env new dev
azd env new staging
azd env new production

# Rulați implementarea etapizată
./deploy-staged.sh
```

**Criterii de succes:**
- [ ] Mediul dev se implementează cu succes
- [ ] Mediul staging se implementează cu succes
- [ ] Aprobare manuală necesară pentru producție
- [ ] Toate mediile au verificări de sănătate funcționale
- [ ] Se poate face rollback dacă este necesar

### Exercițiul 4: Strategie de rollback (25 minutes)
**Scop**: Implementează și testează rollback-ul implementării folosind Git

```bash
# Implementare v1
azd env set APP_VERSION "1.0.0"
azd up

# Salvează hash-ul commit-ului v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Implementare v2 cu schimbare incompatibilă
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Detectează eșecul și revine la versiunea anterioară
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Revenire la versiunea anterioară folosind git
    git revert HEAD --no-edit
    
    # Revenire a mediului
    azd env set APP_VERSION "1.0.0"
    
    # Reimplementare v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Criterii de succes:**
- [ ] Poate detecta eșecurile de implementare
- [ ] Scriptul de rollback se execută automat
- [ ] Aplicația revine la starea de funcționare
- [ ] Verificările de sănătate sunt trecute după rollback

## 📊 Deployment Metrics Tracking

### Monitorizează performanța implementărilor tale

```bash
# Creează scriptul de metrici pentru implementare
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

# Înregistrează în fișier
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Folosește-l
./track-deployment.sh
```

**Analizează metricile tale:**
```bash
# Vizualizați istoricul implementărilor
cat deployment-metrics.csv

# Calculați timpul mediu de implementare
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Resurse suplimentare

- [Referință Azure Developer CLI pentru implementare](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Implementare Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Implementare Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Implementare Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigare**
- **Lecția anterioară**: [Primul tău proiect](../chapter-01-foundation/first-project.md)
- **Lecția următoare**: [Provisionarea resurselor](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:
Acest document a fost tradus folosind serviciul de traducere automată AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original, în limba sa nativă, trebuie considerat sursa autorizată. Pentru informații critice, se recomandă o traducere profesională realizată de un traducător uman. Nu suntem responsabili pentru eventualele neînțelegeri sau interpretări greșite care rezultă din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
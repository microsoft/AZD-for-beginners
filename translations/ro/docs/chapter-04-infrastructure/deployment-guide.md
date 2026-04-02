# Ghid de implementare - Stăpânirea implementărilor AZD

**Chapter Navigation:**
- **📚 Pagina cursului**: [AZD pentru începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 4 - Infrastructură ca Cod & Implementare
- **⬅️ Capitolul anterior**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)
- **➡️ Următorul**: [Provisionarea resurselor](provisioning.md)
- **🚀 Capitolul următor**: [Capitolul 5: Soluții AI cu mai mulți agenți](../../examples/retail-scenario.md)

## Introducere

Acest ghid cuprinzător acoperă tot ce trebuie să știi despre implementarea aplicațiilor folosind Azure Developer CLI, de la implementări de bază cu o singură comandă până la scenarii avansate de producție cu hook-uri personalizate, multiple medii și integrare CI/CD. Stăpânește ciclul complet de viață al implementării cu exemple practice și bune practici.

## Obiective de învățare

După parcurgerea acestui ghid, vei:
- Stăpâni toate comenzile și fluxurile de lucru de implementare ale Azure Developer CLI
- Înțelege ciclul de viață complet al implementării, de la provisionare la monitorizare
- Implementa hook-uri de implementare personalizate pentru automatizare înainte și după implementare
- Configura mai multe medii cu parametri specifici fiecărui mediu
- Configura strategii avansate de implementare, inclusiv blue-green și canary
- Integra implementările azd cu pipeline-uri CI/CD și fluxuri de lucru DevOps

## Rezultate ale învățării

După finalizare, vei fi capabil să:
- Executi și depanezi toate fluxurile de implementare azd în mod independent
- Proiectezi și implementezi automatizări de implementare personalizate folosind hook-uri
- Configurezi implementări gata pentru producție cu securitate și monitorizare adecvate
- Gestionezi scenarii complexe de implementare multi-mediu
- Optimizezi performanța implementărilor și implementezi strategii de rollback
- Integrezi implementările azd în practicile DevOps ale întreprinderii

## Prezentare generală a implementării

Azure Developer CLI oferă mai multe comenzi de implementare:
- `azd up` - Flux complet (provisionare + implementare)
- `azd provision` - Creează/actualizează doar resursele Azure
- `azd deploy` - Implementează doar codul aplicației
- `azd package` - Compilează și pachetează aplicațiile

## Fluxuri de lucru de bază pentru implementare

### Implementare completă (azd up)
Cel mai comun flux de lucru pentru proiectele noi:
```bash
# Desfășoară totul de la zero
azd up

# Desfășoară într-un mediu specific
azd up --environment production

# Desfășoară cu parametri personalizați
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Implementare doar a infrastructurii
Când trebuie doar să actualizezi resursele Azure:
```bash
# Provisionare/actualizare a infrastructurii
azd provision

# Provisionare cu execuție simulată (dry-run) pentru a previzualiza modificările
azd provision --preview

# Provisionare a serviciilor specifice
azd provision --service database
```

### Implementare doar a codului
Pentru actualizări rapide ale aplicației:
```bash
# Implementați toate serviciile
azd deploy

# Rezultatul așteptat:
# Se implementează serviciile (azd deploy)
# - web: Se implementează... Gata
# - api: Se implementează... Gata
# SUCCES: Implementarea dvs. s-a finalizat în 2 minute și 15 secunde

# Implementați un serviciu specific
azd deploy --service web
azd deploy --service api

# Implementați cu argumente de compilare personalizate
azd deploy --service api --build-arg NODE_ENV=production

# Verificați implementarea
azd show --output json | jq '.services'
```

### ✅ Verificarea implementării

După orice implementare, verifică succesul:

```bash
# Verifică dacă toate serviciile rulează
azd show

# Testează endpoint-urile de sănătate
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Monitorizează erorile (se deschide implicit în browser)
azd monitor --logs
```

**Criterii de succes:**
- ✅ Toate serviciile afișează starea "Running"
- ✅ Endpoints de sănătate returnează HTTP 200
- ✅ Niciun jurnal de erori în ultimele 5 minute
- ✅ Aplicația răspunde la cereri de test

## 🏗️ Înțelegerea procesului de implementare

### Faza 1: Hook-uri pre-provisionare
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
- Citește șabloanele de infrastructură (Bicep/Terraform)
- Creează sau actualizează resursele Azure
- Configurează rețelistica și securitatea
- Configurează monitorizarea și înregistrarea jurnalelor

### Faza 3: Hook-uri post-provisionare
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
- Compilează codul aplicației
- Creează artefactele de implementare
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
- Implementează aplicațiile împachetate pe serviciile Azure
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

## 🎛️ Configurarea implementării

### Setări de implementare specifice serviciului
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

### Configurații specifice fiecărui mediu
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

## 🔧 Scenarii avansate de implementare

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

### Implementări Blue-Green
```bash
# Creează mediul albastru
azd env new production-blue
azd up --environment production-blue

# Testează mediul albastru
./scripts/test-environment.sh production-blue

# Redirecționează traficul către mediul albastru (actualizare manuală DNS/load-balancer)
./scripts/switch-traffic.sh production-blue

# Curăță mediul verde
azd env select production-green
azd down --force
```

### Implementări Canary
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

## 🐳 Implementări cu containere

### Implementări pentru Container App
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

### Optimizarea Dockerfile multi-stage
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

## ⚡ Optimizarea performanței

### Implementări specifice serviciilor
```bash
# Desfășoară un serviciu specific pentru iterații mai rapide
azd deploy --service web
azd deploy --service api

# Desfășoară toate serviciile
azd deploy
```

### Caching la build
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Implementări eficiente de cod
```bash
# Utilizați azd deploy (nu azd up) pentru modificări care țin doar de cod
# Acest lucru evită provisionarea infrastructurii și este mult mai rapid
azd deploy

# Implementați un serviciu specific pentru cea mai rapidă iterație
azd deploy --service api
```

## 🔍 Monitorizarea implementărilor

### Monitorizare în timp real a implementărilor
```bash
# Monitorizați aplicația în timp real
azd monitor --live

# Vizualizați jurnalele aplicației
azd monitor --logs

# Verificați starea implementării
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

## 🔐 Considerații de securitate

### Gestionarea secretelor
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

## 🚨 Strategii de rollback

### Rollback rapid
```bash
# AZD nu are rollback încorporat. Abordări recomandate:

# Opțiunea 1: Redeploy din Git (recomandat)
git revert HEAD  # Revertează commit-ul problematic
git push
azd deploy

# Opțiunea 2: Redeploy unui commit specific
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Rollback al infrastructurii
```bash
# Previzualizați modificările infrastructurii înainte de aplicare
azd provision --preview

# Pentru revenirea la versiunea anterioară a infrastructurii, folosiți controlul versiunilor:
git revert HEAD  # Anulează modificările infrastructurii
azd provision    # Aplică starea anterioară a infrastructurii
```

### Rollback al migrațiilor bazei de date
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metrice ale implementării

### Urmărește performanța implementărilor
```bash
# Vizualizați starea curentă a implementării
azd show

# Monitorizați aplicația cu Application Insights
azd monitor --overview

# Vizualizați metrici în timp real
azd monitor --live
```

### Colectare de metrici personalizate
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

## 🎯 Cele mai bune practici

### 1. Consistența mediilor
```bash
# Folosiți denumiri consistente
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Mențineți paritatea între medii
./scripts/sync-environments.sh
```

### 2. Validarea infrastructurii
```bash
# Previzualizați modificările infrastructurii înainte de implementare
azd provision --preview

# Utilizați linting pentru ARM/Bicep
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

### 4. Documentare și logare
```bash
# Documentați procedurile de implementare
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Pașii următori

- [Provisionarea resurselor](provisioning.md) - Analiză aprofundată a gestionării infrastructurii
- [Planificarea pre-implementării](../chapter-06-pre-deployment/capacity-planning.md) - Planifică strategia de implementare
- [Probleme comune](../chapter-07-troubleshooting/common-issues.md) - Rezolvă problemele de implementare
- [Cele mai bune practici](../chapter-07-troubleshooting/debugging.md) - Strategii de implementare pregătite pentru producție

## 🎯 Exerciții practice de implementare

### Exercițiul 1: Flux de implementare incremental (20 de minute)
**Scop**: Stăpânește diferența dintre implementările complete și cele incrementale

```bash
# Implementare inițială
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Înregistrează timpul implementării inițiale
echo "Full deployment: $(date)" > deployment-log.txt

# Fă o modificare a codului
echo "// Updated $(date)" >> src/api/src/server.js

# Implementare doar a codului (rapid)
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
- [ ] Infrastructura rămâne neschimbată după `azd deploy`

**Rezultat al învățării**: `azd deploy` este cu 50-70% mai rapid decât `azd up` pentru modificările de cod

### Exercițiul 2: Hook-uri de implementare personalizate (30 de minute)
**Scop**: Implementează automatizare înainte și după implementare

```bash
# Creează un script de validare înainte de implementare
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
- [ ] Scriptul pre-deploy rulează înainte de implementare
- [ ] Implementarea se oprește dacă testele eșuează
- [ ] Testul smoke post-deploy validează sănătatea
- [ ] Hook-urile se execută în ordinea corectă

### Exercițiul 3: Strategie de implementare multi-mediu (45 de minute)
**Scop**: Implementează un flux de implementare în etape (dev → staging → production)

```bash
# Creează scriptul de implementare
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Pasul 1: Implementare în mediul de dezvoltare
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Pasul 2: Implementare în mediul de staging
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

# Creează medii
azd env new dev
azd env new staging
azd env new production

# Rulează implementarea etapizată
./deploy-staged.sh
```

**Criterii de succes:**
- [ ] Mediul dev se implementează cu succes
- [ ] Mediul staging se implementează cu succes
- [ ] Este necesară aprobarea manuală pentru producție
- [ ] Toate mediile au verificări de sănătate funcționale
- [ ] Se poate reveni la versiunea anterioară dacă e necesar

### Exercițiul 4: Strategie de rollback (25 de minute)
**Scop**: Implementează și testează rollback-ul implementării folosind Git

```bash
# Implementează v1
azd env set APP_VERSION "1.0.0"
azd up

# Salvează hash-ul commit-ului v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Implementează v2 cu schimbare incompatibilă
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Detectează eșecul și revino la versiunea anterioară
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Revino la versiunea anterioară folosind git
    git revert HEAD --no-edit
    
    # Restabilește mediul
    azd env set APP_VERSION "1.0.0"
    
    # Reimplementează v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Criterii de succes:**
- [ ] Poți detecta eșecurile de implementare
- [ ] Scriptul de rollback se execută automat
- [ ] Aplicația revine la starea de funcționare
- [ ] Verificările de sănătate sunt trecute după rollback

## 📊 Monitorizarea metricilor implementării

### Monitorizează performanța implementărilor tale

```bash
# Creează script pentru metrici de implementare
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

# Înregistrează într-un fișier
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Folosește-l
./track-deployment.sh
```

**Analizează-ți metricile:**
```bash
# Vizualizați istoricul implementărilor
cat deployment-metrics.csv

# Calculați timpul mediu de implementare
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Resurse suplimentare

- [Referință de implementare Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Implementare Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Implementare Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Implementare Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigation**
- **Previous Lesson**: [Primul tău proiect](../chapter-01-foundation/first-project.md)
- **Next Lesson**: [Provisionarea resurselor](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original, în limba sa nativă, trebuie considerat sursa autorizată. Pentru informații critice, se recomandă o traducere profesională realizată de un traducător uman. Nu ne facem răspunzători pentru eventualele neînțelegeri sau interpretări greșite care rezultă din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
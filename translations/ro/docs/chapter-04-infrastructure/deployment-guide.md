# Ghid de Implementare - Stăpânirea Implementărilor AZD

**Navigare capitole:**
- **📚 Acasă curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 4 - Infrastructură ca Cod și Implementare
- **⬅️ Capitolul anterior**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)
- **➡️ Următorul**: [Provisionarea Resurselor](provisioning.md)
- **🚀 Capitolul următor**: [Capitolul 5: Soluții AI Multi-Agent](../../examples/retail-scenario.md)

## Introducere

Acest ghid cuprinzător acoperă tot ce trebuie să știi despre implementarea aplicațiilor folosind Azure Developer CLI, de la implementări simple cu o singură comandă până la scenarii avansate de producție cu hook-uri personalizate, medii multiple și integrare CI/CD. Stăpânește întregul ciclu de viață al implementării cu exemple practice și bune practici.

## Obiective de învățare

Completând acest ghid, vei:
- Stăpâni toate comenzile și fluxurile de lucru ale implementărilor din Azure Developer CLI
- Înțelege întregul ciclu de viață al implementării de la provisioning la monitorizare
- Implementa hook-uri personalizate pentru automatizarea pre și post-implementare
- Configura medii multiple cu parametri specifici fiecărui mediu
- Configura strategii avansate de implementare, inclusiv blue-green și canary
- Integra implementările azd cu pipeline-uri CI/CD și fluxuri de lucru DevOps

## Rezultate de învățare

La final, vei putea să:
- Rulezi și să depanezi independent toate fluxurile de implementare azd
- Proiectezi și implementezi automatizări personalizate cu hook-uri
- Configurezi implementări pregătite pentru producție cu securitate și monitorizare corespunzătoare
- Gestionezi scenarii complexe de implementare multi-mediu
- Optimizezi performanța implementărilor și implementezi strategii de rollback
- Integrezi implementările azd în practicile DevOps ale întreprinderii

## Prezentare generală a implementării

Azure Developer CLI oferă mai multe comenzi de implementare:
- `azd up` - Flux complet (provision + deploy)
- `azd provision` - Creează/actualizează doar resursele Azure
- `azd deploy` - Implementează doar codul aplicației
- `azd package` - Compilează și împachetează aplicațiile

## Fluxuri de lucru de bază pentru implementare

### Implementare completă (azd up)
Cel mai comun flux pentru proiectele noi:
```bash
# Distribuie totul de la zero
azd up

# Distribuie cu un mediu specific
azd up --environment production

# Distribuie cu parametri personalizați
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Implementare doar infrastructură
Când trebuie doar să actualizezi resursele Azure:
```bash
# Furnizarea/actualizarea infrastructurii
azd provision

# Furnizarea cu dry-run pentru a previzualiza modificările
azd provision --preview

# Furnizarea serviciilor specifice
azd provision --service database
```

### Implementare doar cod
Pentru actualizări rapide ale aplicației:
```bash
# Implementați toate serviciile
azd deploy

# Ieșire așteptată:
# Implementarea serviciilor (azd deploy)
# - web: Se implementează... Gata
# - api: Se implementează... Gata
# SUCCES: Implementarea dvs. s-a încheiat în 2 minute 15 secunde

# Implementați un serviciu specific
azd deploy --service web
azd deploy --service api

# Implementați cu argumente personalizate de construire
azd deploy --service api --build-arg NODE_ENV=production

# Verificați implementarea
azd show --output json | jq '.services'
```

### ✅ Verificarea implementării

După orice implementare, verifică succesul:

```bash
# Verifică dacă toate serviciile rulează
azd show

# Testează punctele finale de stare
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Monitorizează pentru erori (se deschide implicit în browser)
azd monitor --logs
```

**Criterii de succes:**
- ✅ Toate serviciile afișează status "Running"
- ✅ Endpoint-urile de sănătate returnează HTTP 200
- ✅ Nu există erori în jurnalele ultimele 5 minute
- ✅ Aplicația răspunde la cererile de test

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
- Citește template-uri de infrastructură (Bicep/Terraform)
- Creează sau actualizează resursele Azure
- Configurează rețeaua și securitatea
- Configurează monitorizarea și logarea

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

### Faza 4: Împachetarea aplicației
- Compilează codul aplicației
- Creează artefacte de implementare
- Împachetează pentru platforma țintă (containere, fișiere ZIP etc.)

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
- Implementează aplicațiile împachetate în serviciile Azure
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

### Configurări specifice mediului
```bash
# Mediu de dezvoltare
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Mediu de testare
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

# Comută traficul către albastru (actualizare manuală DNS/balansator de încărcare)
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

### Implementări în Container App
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

### Optimizare Dockerfile multi-etapă
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
# Implementați un serviciu specific pentru iterații mai rapide
azd deploy --service web
azd deploy --service api

# Implementați toate serviciile
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

### Implementări eficiente ale codului
```bash
# Folosiți azd deploy (nu azd up) pentru modificările doar în cod
# Aceasta sare peste aprovizionarea infrastructurii și este mult mai rapid
azd deploy

# Implementați serviciul specific pentru cea mai rapidă iterare
azd deploy --service api
```

## 🔍 Monitorizarea implementării

### Monitorizare a implementării în timp real
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

### Validarea post-implementare
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Verifică starea de sănătate a aplicației
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
# Stochează secretele în siguranță
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Referință secrete în azure.yaml
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

### Gestionarea identității și accesului
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

# Opțiunea 1: Reimplementare din Git (recomandat)
git revert HEAD  # Reveniți la commit-ul problematic
git push
azd deploy

# Opțiunea 2: Reimplementare commit specific
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Rollback infrastructură
```bash
# Previzualizează modificările infrastructurii înainte de aplicare
azd provision --preview

# Pentru revenirea infrastructurii, folosește controlul versiunilor:
git revert HEAD  # Revino asupra modificărilor infrastructurii
azd provision    # Aplică starea anterioară a infrastructurii
```

### Rollback migrații baze de date
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Măsurarea implementării

### Monitorizează performanța implementării
```bash
# Vizualizați starea actuală a implementării
azd show

# Monitorizați aplicația cu Application Insights
azd monitor --overview

# Vizualizați metrici în timp real
azd monitor --live
```

### Colectarea metricilor personalizate
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

## 🎯 Bune practici

### 1. Consistența mediului
```bash
# Folosește denumiri consecvente
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Menține paritatea mediului
./scripts/sync-environments.sh
```

### 2. Validarea infrastructurii
```bash
# Previzualizați modificările infrastructurii înainte de implementare
azd provision --preview

# Folosiți verificarea ARM/Bicep
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

### 4. Documentație și logare
```bash
# Documentați procedurile de implementare
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Pașii următori

- [Provisionarea Resurselor](provisioning.md) - Explorare detaliată a managementului infrastructurii
- [Planificarea pre-implementare](../chapter-06-pre-deployment/capacity-planning.md) - Planifică strategia ta de implementare
- [Probleme comune](../chapter-07-troubleshooting/common-issues.md) - Rezolvă problemele de implementare
- [Bune practici](../chapter-07-troubleshooting/debugging.md) - Strategii de implementare pregătite pentru producție

## 🎯 Exerciții practice de implementare

### Exercițiul 1: Flux incremental de implementare (20 minute)
**Obiectiv**: Stăpânește diferența dintre implementările complete și cele incrementale

```bash
# Implementare inițială
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Înregistrează ora implementării inițiale
echo "Full deployment: $(date)" > deployment-log.txt

# Fă o modificare a codului
echo "// Updated $(date)" >> src/api/src/server.js

# Distribuie doar codul (rapid)
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
- [ ] Modificările codului sunt reflectate în aplicația implementată
- [ ] Infrastructura rămâne neschimbată după `azd deploy`

**Rezultat așteptat**: `azd deploy` este cu 50-70% mai rapid decât `azd up` pentru schimbări ale codului

### Exercițiul 2: Hook-uri personalizate de implementare (30 minute)
**Obiectiv**: Implementarea automatizărilor pre și post-implementare

```bash
# Creează scriptul de validare pre-deploy
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

# Creează un test de tip smoke post-deploy
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

# Testează deployment-ul cu hook-uri
azd deploy
```

**Criterii de succes:**
- [ ] Scriptul pre-implementare rulează înainte de implementare
- [ ] Implementarea este anulată dacă testele eșuează
- [ ] Testul de fum post-implementare validează sănătatea
- [ ] Hook-urile se execută în ordinea corectă

### Exercițiul 3: Strategie de implementare multi-mediu (45 minute)
**Obiectiv**: Implementarea unui flux de implementare etapizat (dev → staging → producție)

```bash
# Creează scriptul de implementare
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
- [ ] Este necesară aprobare manuală pentru producție
- [ ] Toate mediile au verificări de sănătate funcționale
- [ ] Este posibilă revenirea înapoi, dacă este necesar

### Exercițiul 4: Strategie de rollback (25 minute)
**Obiectiv**: Implementarea și testarea rollback-ului de implementare folosind Git

```bash
# Implementare v1
azd env set APP_VERSION "1.0.0"
azd up

# Salvează hash-ul commitului v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Implementare v2 cu schimbare majoră
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Detectează eșecul și execută rollback
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback folosind git
    git revert HEAD --no-edit
    
    # Rollback mediu
    azd env set APP_VERSION "1.0.0"
    
    # Reimplementare v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Criterii de succes:**
- [ ] Se pot detecta eșecurile de implementare
- [ ] Scriptul de rollback rulează automat
- [ ] Aplicația revine într-o stare funcțională
- [ ] Verificările de sănătate trec după rollback

## 📊 Monitorizarea metricilor de implementare

### Monitorizează performanța implementării tale

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

- [Referință Azure Developer CLI Deployment](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Implementarea Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Implementarea Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Implementarea Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigare**
- **Lecția anterioară**: [Primul tău proiect](../chapter-01-foundation/first-project.md)
- **Lecția următoare**: [Provisionarea Resurselor](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertisment**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să luați în considerare că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea realizată de un profesionist uman. Nu ne asumăm responsabilitatea pentru eventuale neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6ae5503cd909d625f01efa4d9e99799e",
  "translation_date": "2025-11-23T16:51:37+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "ro"
}
-->
# Ghid de Implementare - Stăpânirea Implementărilor AZD

**Navigare Capitol:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitol Curent**: Capitolul 4 - Infrastructură ca Cod & Implementare
- **⬅️ Capitolul Precedent**: [Capitolul 3: Configurare](../getting-started/configuration.md)
- **➡️ Următor**: [Provisionarea Resurselor](provisioning.md)
- **🚀 Capitolul Următor**: [Capitolul 5: Soluții AI Multi-Agent](../../examples/retail-scenario.md)

## Introducere

Acest ghid cuprinzător acoperă tot ce trebuie să știți despre implementarea aplicațiilor folosind Azure Developer CLI, de la implementări de bază cu o singură comandă până la scenarii avansate de producție cu hook-uri personalizate, medii multiple și integrare CI/CD. Stăpâniți întregul ciclu de viață al implementării cu exemple practice și cele mai bune practici.

## Obiective de Învățare

Prin completarea acestui ghid, veți:
- Stăpâni toate comenzile și fluxurile de lucru de implementare ale Azure Developer CLI
- Înțelege întregul ciclu de viață al implementării, de la provisionare la monitorizare
- Implementa hook-uri personalizate pentru automatizarea pre și post-implementare
- Configura medii multiple cu parametri specifici mediului
- Configura strategii avansate de implementare, inclusiv implementări blue-green și canary
- Integra implementările azd cu pipeline-uri CI/CD și fluxuri de lucru DevOps

## Rezultate de Învățare

La finalizare, veți putea:
- Executa și depana independent toate fluxurile de lucru de implementare azd
- Proiecta și implementa automatizări personalizate de implementare folosind hook-uri
- Configura implementări pregătite pentru producție cu securitate și monitorizare adecvate
- Gestiona scenarii complexe de implementare multi-mediu
- Optimiza performanța implementării și implementa strategii de rollback
- Integra implementările azd în practicile DevOps ale întreprinderii

## Prezentare Generală a Implementării

Azure Developer CLI oferă mai multe comenzi de implementare:
- `azd up` - Flux complet (provisionare + implementare)
- `azd provision` - Creare/actualizare doar resurse Azure
- `azd deploy` - Implementare doar cod aplicație
- `azd package` - Construire și împachetare aplicații

## Fluxuri de Lucru de Implementare de Bază

### Implementare Completă (azd up)
Cel mai comun flux pentru proiecte noi:
```bash
# Implementați totul de la zero
azd up

# Implementați cu un mediu specific
azd up --environment production

# Implementați cu parametri personalizați
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Implementare Doar Infrastructură
Când trebuie să actualizați doar resursele Azure:
```bash
# Furnizare/actualizare infrastructură
azd provision

# Furnizare cu simulare pentru a previzualiza modificările
azd provision --preview

# Furnizare servicii specifice
azd provision --service database
```

### Implementare Doar Cod
Pentru actualizări rapide ale aplicației:
```bash
# Implementați toate serviciile
azd deploy

# Rezultatul așteptat:
# Implementarea serviciilor (azd deploy)
# - web: Se implementează... Finalizat
# - api: Se implementează... Finalizat
# SUCCES: Implementarea dvs. a fost finalizată în 2 minute și 15 secunde

# Implementați un serviciu specific
azd deploy --service web
azd deploy --service api

# Implementați cu argumente personalizate de construire
azd deploy --service api --build-arg NODE_ENV=production

# Verificați implementarea
azd show --output json | jq '.services'
```

### ✅ Verificarea Implementării

După orice implementare, verificați succesul:

```bash
# Verificați dacă toate serviciile sunt în funcțiune
azd show

# Testați punctele de sănătate
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Verificați jurnalele pentru erori
azd logs --service api --since 5m | grep -i error
```

**Criterii de Succes:**
- ✅ Toate serviciile afișează statusul "Running"
- ✅ Endpoint-urile de sănătate returnează HTTP 200
- ✅ Fără erori în loguri în ultimele 5 minute
- ✅ Aplicația răspunde la cereri de test

## 🏗️ Înțelegerea Procesului de Implementare

### Faza 1: Hook-uri Pre-Provisionare
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

### Faza 2: Provisionarea Infrastructurii
- Citește șabloane de infrastructură (Bicep/Terraform)
- Creează sau actualizează resursele Azure
- Configurează rețelele și securitatea
- Configurează monitorizarea și logarea

### Faza 3: Hook-uri Post-Provisionare
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

### Faza 4: Împachetarea Aplicației
- Construiește codul aplicației
- Creează artefacte de implementare
- Împachetează pentru platforma țintă (containere, fișiere ZIP etc.)

### Faza 5: Hook-uri Pre-Implementare
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

### Faza 6: Implementarea Aplicației
- Implementă aplicațiile împachetate în serviciile Azure
- Actualizează setările de configurare
- Pornește/repornește serviciile

### Faza 7: Hook-uri Post-Implementare
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

## 🎛️ Configurarea Implementării

### Setări de Implementare Specifice Serviciului
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

### Configurări Specifice Mediului
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

## 🔧 Scenarii Avansate de Implementare

### Aplicații Multi-Serviciu
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
# Creează mediu albastru
azd env new production-blue
azd up --environment production-blue

# Testează mediu albastru
./scripts/test-environment.sh production-blue

# Comută traficul către albastru (actualizare manuală DNS/load balancer)
./scripts/switch-traffic.sh production-blue

# Curăță mediu verde
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

### Implementări Etapizate
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

## 🐳 Implementări în Containere

### Implementări Aplicații Container
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

### Optimizarea Dockerfile Multi-Stagiu
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

## ⚡ Optimizarea Performanței

### Implementări Paralele
```bash
# Configurează implementarea paralelă
azd config set deploy.parallelism 5

# Implementează serviciile în paralel
azd deploy --parallel
```

### Cache-ul de Construire
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

### Implementări Incrementale
```bash
# Implementați doar serviciile modificate
azd deploy --incremental

# Implementați cu detectarea modificărilor
azd deploy --detect-changes
```

## 🔍 Monitorizarea Implementării

### Monitorizarea Implementării în Timp Real
```bash
# Monitorizați progresul implementării
azd deploy --follow

# Vizualizați jurnalele implementării
azd logs --follow --service api

# Verificați starea implementării
azd show --service api
```

### Verificări de Sănătate
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

### Validarea Post-Implementare
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Verifică sănătatea aplicației
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

## 🔐 Considerații de Securitate

### Gestionarea Secretelor
```bash
# Stocați secretele în siguranță
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Referiți secretele în azure.yaml
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

### Securitatea Rețelei
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identitate și Managementul Accesului
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

## 🚨 Strategii de Rollback

### Rollback Rapid
```bash
# Revenire la implementarea anterioară
azd deploy --rollback

# Revenire la un serviciu specific
azd deploy --service api --rollback

# Revenire la o versiune specifică
azd deploy --service api --version v1.2.3
```

### Rollback Infrastructură
```bash
# Revocare modificările infrastructurii
azd provision --rollback

# Previzualizare modificări de revocare
azd provision --rollback --preview
```

### Rollback Migrare Bază de Date
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metrice de Implementare

### Urmărirea Performanței Implementării
```bash
# Activează metricile de implementare
azd config set telemetry.deployment.enabled true

# Vizualizează istoricul implementărilor
azd history

# Obține statistici despre implementare
azd metrics --type deployment
```

### Colectarea Metricilor Personalizate
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

## 🎯 Cele Mai Bune Practici

### 1. Consistența Mediului
```bash
# Folosiți denumiri consistente
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Mențineți paritatea mediului
./scripts/sync-environments.sh
```

### 2. Validarea Infrastructurii
```bash
# Validați înainte de implementare
azd provision --preview
azd provision --what-if

# Utilizați linting ARM/Bicep
az bicep lint --file infra/main.bicep
```

### 3. Integrarea Testării
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

### 4. Documentare și Logare
```bash
# Documentați procedurile de implementare
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Pași Următori

- [Provisionarea Resurselor](provisioning.md) - Detalii despre gestionarea infrastructurii
- [Planificarea Pre-Implementare](../pre-deployment/capacity-planning.md) - Planificați strategia de implementare
- [Probleme Comune](../troubleshooting/common-issues.md) - Rezolvați problemele de implementare
- [Cele Mai Bune Practici](../troubleshooting/debugging.md) - Strategii de implementare pregătite pentru producție

## 🎯 Exerciții Practice de Implementare

### Exercițiul 1: Flux de Lucru de Implementare Incrementală (20 minute)
**Obiectiv**: Stăpâniți diferența dintre implementările complete și cele incrementale

```bash
# Implementare inițială
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Înregistrează timpul implementării inițiale
echo "Full deployment: $(date)" > deployment-log.txt

# Fă o modificare în cod
echo "// Updated $(date)" >> src/api/src/server.js

# Implementare doar a codului (rapid)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Compară timpii
cat deployment-log.txt

# Curăță
azd down --force --purge
```

**Criterii de Succes:**
- [ ] Implementarea completă durează 5-15 minute
- [ ] Implementarea doar cod durează 2-5 minute
- [ ] Modificările codului sunt reflectate în aplicația implementată
- [ ] Infrastructura rămâne neschimbată după `azd deploy`

**Rezultat de Învățare**: `azd deploy` este cu 50-70% mai rapid decât `azd up` pentru modificările codului

### Exercițiul 2: Hook-uri Personalizate de Implementare (30 minute)
**Obiectiv**: Implementați automatizări pre și post-implementare

```bash
# Creați scriptul de validare pre-deploy
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Verificați dacă testele trec
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Verificați modificările necomise
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Creați testul de verificare post-deploy
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

# Adăugați hooks în azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Testați implementarea cu hooks
azd deploy
```

**Criterii de Succes:**
- [ ] Scriptul pre-implementare rulează înainte de implementare
- [ ] Implementarea se oprește dacă testele eșuează
- [ ] Testul de sănătate post-implementare validează starea
- [ ] Hook-urile se execută în ordinea corectă

### Exercițiul 3: Strategie de Implementare Multi-Mediu (45 minute)
**Obiectiv**: Implementați un flux de implementare etapizat (dev → staging → producție)

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

**Criterii de Succes:**
- [ ] Mediul dev se implementează cu succes
- [ ] Mediul staging se implementează cu succes
- [ ] Aprobare manuală necesară pentru producție
- [ ] Toate mediile au verificări de sănătate funcționale
- [ ] Se poate face rollback dacă este necesar

### Exercițiul 4: Strategie de Rollback (25 minute)
**Obiectiv**: Implementați și testați rollback-ul implementării

```bash
# Implementați v1
azd env set APP_VERSION "1.0.0"
azd up

# Salvați configurația v1
cp -r .azure/production .azure/production-v1-backup

# Implementați v2 cu modificare majoră
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Detectați eșecul
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Reveniți la cod
    git checkout src/api/src/server.js
    
    # Reveniți la mediu
    azd env set APP_VERSION "1.0.0"
    
    # Reimplementați v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Criterii de Succes:**
- [ ] Se pot detecta eșecurile implementării
- [ ] Scriptul de rollback se execută automat
- [ ] Aplicația revine la starea funcțională
- [ ] Verificările de sănătate trec după rollback

## 📊 Urmărirea Metricilor de Implementare

### Urmăriți Performanța Implementării

```bash
# Creați scriptul pentru metricele de implementare
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

# Înregistrați în fișier
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Folosiți-l
./track-deployment.sh
```

**Analizați metricile:**
```bash
# Vizualizați istoricul implementării
cat deployment-metrics.csv

# Calculați timpul mediu de implementare
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Resurse Suplimentare

- [Referință Implementare Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Implementare Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Implementare Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Implementare Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigare**
- **Lecția Precedentă**: [Primul Proiect](../getting-started/first-project.md)
- **Lecția Următoare**: [Provisionarea Resurselor](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa maternă ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
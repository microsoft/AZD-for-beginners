# Diegimo vadovas - AZD diegimų įvaldymas

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 4 skyrius - Infrastruktūra kaip kodas ir diegimas
- **⬅️ Ankstesnis skyrius**: [3 skyrius: Konfigūracija](../getting-started/configuration.md)
- **➡️ Toliau**: [Išteklių paruošimas](provisioning.md)
- **🚀 Kitas skyrius**: [5 skyrius: Daugiaagentiniai AI sprendimai](../../examples/retail-scenario.md)

## Įvadas

Šis išsamus vadovas apima viską, ką reikia žinoti apie programų diegimą naudojant Azure Developer CLI – nuo paprastų vieno komandos diegimų iki sudėtingų gamybos scenarijų su pasirinktinais kabliukais, keliomis aplinkomis ir CI/CD integracija. Įvaldykite visą diegimo ciklą su praktiniais pavyzdžiais ir geriausiomis praktikomis.

## Mokymosi tikslai

Baigę šį vadovą, jūs:
- Įvaldysite visas Azure Developer CLI diegimo komandas ir darbo eigas
- Suprasite visą diegimo ciklą nuo paruošimo iki stebėjimo
- Įgyvendinsite pasirinktinius diegimo kabliukus automatizavimui prieš ir po diegimo
- Konfigūruosite kelias aplinkas su specifiniais parametrais
- Nustatysite pažangias diegimo strategijas, įskaitant „blue-green“ ir „canary“ diegimus
- Integruosite azd diegimus su CI/CD vamzdynais ir DevOps darbo eigomis

## Mokymosi rezultatai

Baigę, jūs galėsite:
- Savarankiškai vykdyti ir šalinti visų azd diegimo darbo eigų triktis
- Kurti ir įgyvendinti pasirinktinius diegimo automatizavimus naudojant kabliukus
- Konfigūruoti gamybai paruoštus diegimus su tinkamu saugumu ir stebėjimu
- Valdyti sudėtingus kelių aplinkų diegimo scenarijus
- Optimizuoti diegimo našumą ir įgyvendinti grąžinimo strategijas
- Integruoti azd diegimus į įmonės DevOps praktikas

## Diegimo apžvalga

Azure Developer CLI siūlo kelias diegimo komandas:
- `azd up` - Pilna darbo eiga (paruošimas + diegimas)
- `azd provision` - Tik Azure išteklių kūrimas/atnaujinimas
- `azd deploy` - Tik programos kodo diegimas
- `azd package` - Programų kūrimas ir paketavimas

## Pagrindinės diegimo darbo eigos

### Pilnas diegimas (azd up)
Dažniausiai naudojama darbo eiga naujiems projektams:
```bash
# Diegti viską nuo nulio
azd up

# Diegti su konkrečia aplinka
azd up --environment production

# Diegti su pasirinktiniais parametrais
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Tik infrastruktūros diegimas
Kai reikia atnaujinti tik Azure išteklius:
```bash
# Paruošti/atnaujinti infrastruktūrą
azd provision

# Paruošti su sausu paleidimu, kad peržiūrėtumėte pakeitimus
azd provision --preview

# Paruošti konkrečias paslaugas
azd provision --service database
```

### Tik kodo diegimas
Greitiems programos atnaujinimams:
```bash
# Įdiegti visas paslaugas
azd deploy

# Tikėtinas rezultatas:
# Diegiamos paslaugos (azd deploy)
# - web: Diegiama... Baigta
# - api: Diegiama... Baigta
# SĖKMĖ: Jūsų diegimas baigtas per 2 minutes 15 sekundžių

# Įdiegti konkrečią paslaugą
azd deploy --service web
azd deploy --service api

# Įdiegti su pasirinktiniais kūrimo argumentais
azd deploy --service api --build-arg NODE_ENV=production

# Patikrinti diegimą
azd show --output json | jq '.services'
```

### ✅ Diegimo patikrinimas

Po bet kokio diegimo patikrinkite sėkmę:

```bash
# Patikrinkite, ar visos paslaugos veikia
azd show

# Išbandykite sveikatos galinius taškus
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Patikrinkite žurnalus dėl klaidų
azd logs --service api --since 5m | grep -i error
```

**Sėkmės kriterijai:**
- ✅ Visos paslaugos rodo „Veikia“ būseną
- ✅ Sveikatos galiniai taškai grąžina HTTP 200
- ✅ Nėra klaidų žurnalų per pastarąsias 5 minutes
- ✅ Programa atsako į testinius užklausimus

## 🏗️ Diegimo proceso supratimas

### 1 etapas: Kabliukai prieš paruošimą
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

### 2 etapas: Infrastruktūros paruošimas
- Skaito infrastruktūros šablonus (Bicep/Terraform)
- Kuria arba atnaujina Azure išteklius
- Konfigūruoja tinklus ir saugumą
- Nustato stebėjimą ir žurnalavimą

### 3 etapas: Kabliukai po paruošimo
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

### 4 etapas: Programos paketavimas
- Kuria programos kodą
- Kuria diegimo artefaktus
- Pakuoja tikslinėms platformoms (konteineriai, ZIP failai ir kt.)

### 5 etapas: Kabliukai prieš diegimą
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

### 6 etapas: Programos diegimas
- Diegia supakuotas programas į Azure paslaugas
- Atnaujina konfigūracijos nustatymus
- Paleidžia/perkrauna paslaugas

### 7 etapas: Kabliukai po diegimo
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

## 🎛️ Diegimo konfigūracija

### Paslaugoms specifiniai diegimo nustatymai
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

### Aplinkoms specifinės konfigūracijos
```bash
# Kūrimo aplinka
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Testavimo aplinka
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Gamybos aplinka
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Pažangūs diegimo scenarijai

### Daugiafunkcinės programos
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

### „Blue-Green“ diegimai
```bash
# Sukurti mėlyną aplinką
azd env new production-blue
azd up --environment production-blue

# Išbandyti mėlyną aplinką
./scripts/test-environment.sh production-blue

# Perjungti srautą į mėlyną (rankinis DNS/ apkrovos balansavimo atnaujinimas)
./scripts/switch-traffic.sh production-blue

# Išvalyti žalią aplinką
azd env select production-green
azd down --force
```

### „Canary“ diegimai
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

### Etapiniai diegimai
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

## 🐳 Konteinerių diegimai

### Konteinerių programų diegimai
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

### Daugiapakopis Dockerfile optimizavimas
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

## ⚡ Našumo optimizavimas

### Lygiagretūs diegimai
```bash
# Konfigūruoti lygiagretų diegimą
azd config set deploy.parallelism 5

# Diegti paslaugas lygiagrečiai
azd deploy --parallel
```

### Kūrimo talpyklos
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

### Inkrementiniai diegimai
```bash
# Diegti tik pakeistas paslaugas
azd deploy --incremental

# Diegti su pakeitimų aptikimu
azd deploy --detect-changes
```

## 🔍 Diegimo stebėjimas

### Realaus laiko diegimo stebėjimas
```bash
# Stebėti diegimo eigą
azd deploy --follow

# Peržiūrėti diegimo žurnalus
azd logs --follow --service api

# Patikrinti diegimo būseną
azd show --service api
```

### Sveikatos patikrinimai
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

### Patikrinimas po diegimo
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Patikrinkite programos būklę
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

## 🔐 Saugumo aspektai

### Slaptų duomenų valdymas
```bash
# Saugokite paslaptis saugiai
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Nurodykite paslaptis azure.yaml
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

### Tinklo saugumas
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Tapatybės ir prieigos valdymas
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

## 🚨 Grąžinimo strategijos

### Greitas grąžinimas
```bash
# Grįžti prie ankstesnio diegimo
azd deploy --rollback

# Grįžti prie konkrečios paslaugos
azd deploy --service api --rollback

# Grįžti prie konkrečios versijos
azd deploy --service api --version v1.2.3
```

### Infrastruktūros grąžinimas
```bash
# Atšaukti infrastruktūros pakeitimus
azd provision --rollback

# Peržiūrėti atšauktus pakeitimus
azd provision --rollback --preview
```

### Duomenų bazės migracijos grąžinimas
```bash
#!/bin/bash
# scripts/atstatyti-duomenų-bazę.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Diegimo metrika

### Diegimo našumo stebėjimas
```bash
# Įjungti diegimo metriką
azd config set telemetry.deployment.enabled true

# Peržiūrėti diegimo istoriją
azd history

# Gauti diegimo statistiką
azd metrics --type deployment
```

### Pasirinktinių metrikų rinkimas
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

## 🎯 Geriausios praktikos

### 1. Aplinkos nuoseklumas
```bash
# Naudokite nuoseklius pavadinimus
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Išlaikykite aplinkos lygiavertiškumą
./scripts/sync-environments.sh
```

### 2. Infrastruktūros patikrinimas
```bash
# Patvirtinti prieš diegimą
azd provision --preview
azd provision --what-if

# Naudoti ARM/Bicep lintingą
az bicep lint --file infra/main.bicep
```

### 3. Testavimo integracija
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

### 4. Dokumentacija ir žurnalavimas
```bash
# Dokumentuokite diegimo procedūras
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Kiti žingsniai

- [Išteklių paruošimas](provisioning.md) - Išsamus infrastruktūros valdymas
- [Paruošimo planavimas](../pre-deployment/capacity-planning.md) - Planuokite savo diegimo strategiją
- [Dažnos problemos](../troubleshooting/common-issues.md) - Spręskite diegimo problemas
- [Geriausios praktikos](../troubleshooting/debugging.md) - Gamybai paruoštos diegimo strategijos

## 🎯 Praktiniai diegimo pratimai

### Pratimas 1: Inkrementinio diegimo darbo eiga (20 minučių)
**Tikslas**: Suprasti skirtumą tarp pilnų ir inkrementinių diegimų

```bash
# Pradinis diegimas
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Užregistruoti pradinio diegimo laiką
echo "Full deployment: $(date)" > deployment-log.txt

# Atlikti kodo pakeitimą
echo "// Updated $(date)" >> src/api/src/server.js

# Diegti tik kodą (greitai)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Palyginti laikus
cat deployment-log.txt

# Išvalyti
azd down --force --purge
```

**Sėkmės kriterijai:**
- [ ] Pilnas diegimas trunka 5-15 minučių
- [ ] Tik kodo diegimas trunka 2-5 minutes
- [ ] Kodo pakeitimai atsispindi diegtoje programoje
- [ ] Infrastruktūra nepasikeičia po `azd deploy`

**Mokymosi rezultatas**: `azd deploy` yra 50-70% greitesnis nei `azd up` kodo pakeitimams

### Pratimas 2: Pasirinktinių diegimo kabliukų įgyvendinimas (30 minučių)
**Tikslas**: Įgyvendinti automatizavimą prieš ir po diegimo

```bash
# Sukurti išankstinio diegimo patikros scenarijų
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Patikrinti, ar testai praeina
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Patikrinti, ar nėra neįsipareigojusių pakeitimų
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Sukurti po diegimo patikros testą
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

# Pridėti kabliukus į azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Išbandyti diegimą su kabliukais
azd deploy
```

**Sėkmės kriterijai:**
- [ ] Kabliukas prieš diegimą vykdomas prieš diegimą
- [ ] Diegimas nutraukiamas, jei testai nepavyksta
- [ ] Kabliukas po diegimo patikrina sveikatą
- [ ] Kabliukai vykdomi teisinga tvarka

### Pratimas 3: Kelių aplinkų diegimo strategija (45 minutės)
**Tikslas**: Įgyvendinti etapinio diegimo darbo eigą (dev → staging → production)

```bash
# Sukurti diegimo scenarijų
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# 1 žingsnis: Diegti į dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# 2 žingsnis: Diegti į staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# 3 žingsnis: Rankinis patvirtinimas gamybai
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

# Sukurti aplinkas
azd env new dev
azd env new staging
azd env new production

# Vykdyti etapais diegimą
./deploy-staged.sh
```

**Sėkmės kriterijai:**
- [ ] Dev aplinka sėkmingai diegiama
- [ ] Staging aplinka sėkmingai diegiama
- [ ] Reikalingas rankinis patvirtinimas gamybai
- [ ] Visos aplinkos turi veikiančius sveikatos patikrinimus
- [ ] Galima grąžinti, jei reikia

### Pratimas 4: Grąžinimo strategija (25 minutės)
**Tikslas**: Įgyvendinti ir išbandyti diegimo grąžinimą

```bash
# Įdiegti v1
azd env set APP_VERSION "1.0.0"
azd up

# Išsaugoti v1 konfigūraciją
cp -r .azure/production .azure/production-v1-backup

# Įdiegti v2 su trikdančiu pakeitimu
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Aptikti gedimą
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Atšaukti kodą
    git checkout src/api/src/server.js
    
    # Atšaukti aplinką
    azd env set APP_VERSION "1.0.0"
    
    # Iš naujo įdiegti v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Sėkmės kriterijai:**
- [ ] Galima aptikti diegimo klaidas
- [ ] Grąžinimo scenarijus vykdomas automatiškai
- [ ] Programa grįžta į veikiančią būseną
- [ ] Sveikatos patikrinimai praeina po grąžinimo

## 📊 Diegimo metrikos stebėjimas

### Stebėkite savo diegimo našumą

```bash
# Sukurti diegimo metrikų scenarijų
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

# Registruoti į failą
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Naudokite jį
./track-deployment.sh
```

**Analizuokite savo metrikas:**
```bash
# Peržiūrėti diegimo istoriją
cat deployment-metrics.csv

# Apskaičiuoti vidutinį diegimo laiką
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Papildomi ištekliai

- [Azure Developer CLI diegimo nuoroda](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service diegimas](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps diegimas](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions diegimas](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigacija**
- **Ankstesnė pamoka**: [Jūsų pirmasis projektas](../getting-started/first-project.md)
- **Kita pamoka**: [Išteklių paruošimas](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar neteisingus aiškinimus, atsiradusius naudojant šį vertimą.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
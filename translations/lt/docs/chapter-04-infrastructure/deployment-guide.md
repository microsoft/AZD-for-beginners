# Diegimo vadovas - Įvaldant AZD diegimus

**Skyrių naršymas:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: Skyrius 4 - Infrastruktūra kaip kodas ir diegimas
- **⬅️ Ankstesnis skyrius**: [Skyrius 3: Konfigūracija](../chapter-03-configuration/configuration.md)
- **➡️ Kitas**: [Resursų teikimas](provisioning.md)
- **🚀 Kitas skyrius**: [Skyrius 5: Daugiagentiniai DI sprendimai](../../examples/retail-scenario.md)

## Įvadas

Šis išsamus vadovas apima viską, ką reikia žinoti apie programų diegimą naudojant Azure Developer CLI — nuo paprastų vienos komandos diegimų iki pažangių gamybinių scenarijų su pasirinktinais hook'ais, keliomis aplinkomis ir CI/CD integracija. Įvaldykite visą diegimo gyvenimo ciklą su praktiniais pavyzdžiais ir geriausiomis praktikomis.

## Mokymosi tikslai

Baigę šį vadovą jūs:
- Įvaldysite visas Azure Developer CLI diegimo komandas ir darbo eigas
- Suprasite pilną diegimo gyvenimo ciklą nuo resursų teikimo iki stebėjimo
- Įgyvendinsite pasirinktinius diegimo hook'us prieš ir po diegimo automatizavimui
- Konfigūruosite kelias aplinkas su aplinkai specifiniais parametrais
- Nustatysite pažangias diegimo strategijas, įskaitant blue-green ir canary diegimus
- Integruosite azd diegimus su CI/CD vamzdynais ir DevOps darbo srautais

## Mokymosi rezultatai

Baigę kursą gebėsite:
- Vykdyti ir spręsti visus azd diegimo darbo eigas savarankiškai
- Kurti ir įgyvendinti pasirinktinius diegimo automatizavimo sprendimus naudojant hook'us
- Konfigūruoti gamybinio lygio diegimus su tinkamu saugumu ir stebėjimu
- Valdyti sudėtingus kelioms aplinkoms skirtus diegimo scenarijus
- Optimizuoti diegimo našumą ir įgyvendinti atsitraukimo strategijas
- Integruoti azd diegimus į įmonės DevOps praktikas

## Diegimo apžvalga

Azure Developer CLI teikia kelias diegimo komandas:
- `azd up` - Pilna darbo eiga (provision + deploy)
- `azd provision` - Tik Azure išteklių kūrimas/atnaujinimas
- `azd deploy` - Tik programos kodo diegimas
- `azd package` - Programų kūrimas ir pakavimas

## Pagrindinės diegimo darbo eigos

### Pilnas diegimas (azd up)
Dažniausiai naudojama darbo eiga naujiems projektams:
```bash
# Diegti viską nuo nulio
azd up

# Diegti su konkrečia aplinka
azd up --environment production

# Diegti su pasirinktinais parametrais
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Tik infrastruktūros diegimas
Kai reikia atnaujinti tik Azure išteklius:
```bash
# Paruošti/atnaujinti infrastruktūrą
azd provision

# Paruošti bandomuoju režimu, kad peržiūrėtumėte pakeitimus
azd provision --preview

# Paruošti konkrečias paslaugas
azd provision --service database
```

### Tik kodo diegimas
Greitiems programos atnaujinimams:
```bash
# Diegti visas paslaugas
azd deploy

# Tikėtinas išvestis:
# Diegiamos paslaugos (azd deploy)
# - web: Diegiama... Atlikta
# - api: Diegiama... Atlikta
# SĖKMĖ: Jūsų diegimas užtruko 2 minutes 15 sekundžių

# Diegti konkrečią paslaugą
azd deploy --service web
azd deploy --service api

# Diegti su pasirinktiniais kūrimo argumentais
azd deploy --service api --build-arg NODE_ENV=production

# Patikrinti diegimą
azd show --output json | jq '.services'
```

### ✅ Diegimo patikra

Po kiekvieno diegimo patikrinkite sėkmę:

```bash
# Patikrinkite, ar visos paslaugos veikia
azd show

# Patikrinkite sveikatos galinius taškus
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Stebėkite klaidas (pagal numatytuosius nustatymus atsidaro naršyklėje)
azd monitor --logs
```

**Sėkmės kriterijai:**
- ✅ Visos paslaugos rodo „Running“ būseną
- ✅ Sveikatos endpoint'ai grąžina HTTP 200
- ✅ Per paskutines 5 minutes nėra klaidų žurnalų
- ✅ Programa atsako į testinius užklausimus

## 🏗️ Diegimo proceso supratimas

### 1 etapas: Hook'ai prieš teikimą
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

### 2 etapas: Infrastruktūros teikimas
- Nuskaito infrastruktūros šablonus (Bicep/Terraform)
- Sukuria arba atnaujina Azure išteklius
- Konfigūruoja tinklą ir saugumą
- Nustato stebėjimą ir žurnalavimą

### 3 etapas: Hook'ai po teikimo
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

### 4 etapas: Programos pakavimas
- Sukuria programos kodą
- Paruošia diegimo artefaktus
- Pakuoja tiksliai platformai (konteineriai, ZIP failai ir kt.)

### 5 etapas: Hook'ai prieš diegimą
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
- Paleidžia / perkrauna paslaugas

### 7 etapas: Hook'ai po diegimo
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

### Paslaugai specifiniai diegimo nustatymai
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

### Aplinkai specifinės konfigūracijos
```bash
# Vystymo aplinka
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Parengimo aplinka
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Gamybinė aplinka
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Išplėstiniai diegimo scenarijai

### Daugiapaslauginės programos
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

### Blue-Green diegimai
```bash
# Sukurti mėlynąją aplinką
azd env new production-blue
azd up --environment production-blue

# Išbandyti mėlynąją aplinką
./scripts/test-environment.sh production-blue

# Perkelti srautą į mėlynąją (rankinis DNS arba apkrovos balansavimo įrenginio atnaujinimas)
./scripts/switch-traffic.sh production-blue

# Išvalyti žaliąją aplinką
azd env select production-green
azd down --force
```

### Canary diegimai
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

### Fazių diegimai
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

## ⚡ Veikimo optimizavimas

### Paslaugai specifiniai diegimai
```bash
# Diegti konkrečią paslaugą greitesniam iteravimui
azd deploy --service web
azd deploy --service api

# Diegti visas paslaugas
azd deploy
```

### Konstravimo kešavimas
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Efektyvūs kodo diegimai
```bash
# Naudokite azd deploy (ne azd up) tik kodo pakeitimams
# Tai praleidžia infrastruktūros paruošimą ir yra daug greitesnis
azd deploy

# Diegkite konkrečią paslaugą, kad iteracijos vyktų greičiau
azd deploy --service api
```

## 🔍 Diegimų stebėjimas

### Realaus laiko diegimų stebėjimas
```bash
# Stebėti programą realiuoju laiku
azd monitor --live

# Peržiūrėti programos žurnalus
azd monitor --logs

# Patikrinti diegimo būseną
azd show
```

### Sveikatos patikros
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

### Patikra po diegimo
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Patikrinti programos būklę
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

### Slaptųjų duomenų valdymas
```bash
# Saugokite slaptus duomenis saugiai
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Naudokite nuorodas į slaptus duomenis faile azure.yaml
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

## 🚨 Atsitraukimo strategijos

### Greitas atsitraukimas
```bash
# AZD neturi įmontuoto atšaukimo mechanizmo. Rekomenduojami būdai:

# Parinktis 1: Iš naujo diegti iš Git (rekomenduojama)
git revert HEAD  # Atšaukti probleminį commit'ą
git push
azd deploy

# Parinktis 2: Iš naujo diegti konkretų commit'ą
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastruktūros atsitraukimas
```bash
# Peržiūrėkite infrastruktūros pakeitimus prieš juos pritaikant
azd provision --preview

# Infrastruktūros atkūrimui naudokite versijų valdymą:
git revert HEAD  # Atšaukti infrastruktūros pakeitimus
azd provision    # Pritaikyti ankstesnę infrastruktūros būseną
```

### Duomenų bazės migracijos atsitraukimas
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Diegimų metrika

### Sekite diegimo našumą
```bash
# Peržiūrėti dabartinę diegimo būseną
azd show

# Stebėti programą naudojant Application Insights
azd monitor --overview

# Peržiūrėti metrikas realiu laiku
azd monitor --live
```

### Tinkintų metrikų rinkimas
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

# Užtikrinkite aplinkų suderinamumą
./scripts/sync-environments.sh
```

### 2. Infrastruktūros validacija
```bash
# Peržiūrėti infrastruktūros pakeitimus prieš diegimą
azd provision --preview

# Naudoti ARM/Bicep lintinimą
az bicep lint --file infra/main.bicep

# Patikrinti Bicep sintaksę
az bicep build --file infra/main.bicep
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

### 4. Dokumentacija ir žurnavimas
```bash
# Dokumentuokite diegimo procedūras
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Kiti žingsniai

- [Resursų teikimas](provisioning.md) - Gilesnė apžvalga apie infrastruktūros valdymą
- [Diegimo planavimas](../chapter-06-pre-deployment/capacity-planning.md) - Suplanuokite savo diegimo strategiją
- [Dažnos problemos](../chapter-07-troubleshooting/common-issues.md) - Išspręskite diegimo problemas
- [Geriausios praktikos](../chapter-07-troubleshooting/debugging.md) - Gamybai paruoštos diegimo strategijos

## 🎯 Praktinės diegimo užduotys

### Užduotis 1: Inkrementinis diegimo darbo eiga (20 minutės)
**Tikslas**: Suprasti skirtumą tarp pilno ir inkrementinio diegimo

```bash
# Pradinis diegimas
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Užfiksuoti pradinio diegimo laiką
echo "Full deployment: $(date)" > deployment-log.txt

# Padaryti kodo pakeitimą
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
- [ ] Pilnas diegimas trunka 5–15 minučių
- [ ] Tik kodo diegimas trunka 2–5 minutes
- [ ] Kodo pakeitimai atsispindi diegtoje programoje
- [ ] Infrastruktūra nepakinta po `azd deploy`

**Mokymosi rezultatas**: `azd deploy` yra 50–70 % greitesnis už `azd up` atliekant kodo pakeitimus

### Užduotis 2: Pasirinktiniai diegimo hook'ai (30 minutės)
**Tikslas**: Įgyvendinti prieš ir po diegimo automatizavimą

```bash
# Sukurti prieš diegimą skirtą validacijos skriptą
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Patikrinti, ar testai praeina
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Patikrinti, ar nėra neįrašytų pakeitimų
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Sukurti po diegimo trumpą patikros testą
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

# Pridėti hooks į azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Išbandyti diegimą su hooks
azd deploy
```

**Sėkmės kriterijai:**
- [ ] Prieš diegimą skriptas paleidžiamas prieš diegimą
- [ ] Diegimas nutraukiamas, jei testai nepraeina
- [ ] Po diegimo vykdomas smoke test'as patikrina sveikatą
- [ ] Hook'ai vykdomi teisinga tvarka

### Užduotis 3: Daugiaplatformių aplinkų diegimo strategija (45 minutės)
**Tikslas**: Įgyvendinti fazinę diegimo darbo eigą (dev → staging → production)

```bash
# Sukurti diegimo skriptą
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# 1 žingsnis: Diegti į vystymo aplinką
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# 2 žingsnis: Diegti į parengtinę aplinką
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

# Paleisti diegimą etapais
./deploy-staged.sh
```

**Sėkmės kriterijai:**
- [ ] Dev aplinka sėkmingai įdiegta
- [ ] Staging aplinka sėkmingai įdiegta
- [ ] Produkcijai reikalingas rankinis patvirtinimas
- [ ] Visose aplinkose veikia sveikatos patikros
- [ ] Galima atlikti atsitraukimą, jei reikia

### Užduotis 4: Atsitraukimo strategija (25 minutės)
**Tikslas**: Įgyvendinti ir išbandyti diegimo atsitraukimą naudojant Git

```bash
# Diegti v1
azd env set APP_VERSION "1.0.0"
azd up

# Išsaugoti v1 commito hešą
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Diegti v2 su nesuderinamu pakeitimu
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Aptikti gedimą ir grąžinti ankstesnę versiją
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Atkurti ankstesnę versiją naudojant git
    git revert HEAD --no-edit
    
    # Atkurti aplinką
    azd env set APP_VERSION "1.0.0"
    
    # Perdiegti v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Sėkmės kriterijai:**
- [ ] Galima aptikti diegimo klaidas
- [ ] Atsitraukimo skriptas vykdomas automatiškai
- [ ] Programa grįžta į veikiančią būseną
- [ ] Sveikatos patikros praeina po atsitraukimo

## 📊 Diegimų metrikų stebėjimas

### Stebėkite savo diegimų našumą

```bash
# Sukurti diegimo metrikų skriptą
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

# Rašyti į failą
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Naudokite tai
./track-deployment.sh
```

**Analizuokite savo metrikas:**
```bash
# Peržiūrėti diegimų istoriją
cat deployment-metrics.csv

# Apskaičiuoti vidutinį diegimo laiką
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Papildomi ištekliai

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigacija**
- **Ankstesnė pamoka**: [Jūsų pirmasis projektas](../chapter-01-foundation/first-project.md)
- **Kita pamoka**: [Resursų teikimas](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas jo gimtąja kalba turi būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojamas profesionalus žmogaus atliktas vertimas. Mes neatsakome už jokius nesusipratimus ar neteisingus aiškinimus, kilusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
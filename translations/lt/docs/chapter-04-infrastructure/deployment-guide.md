# Diegimo vadovas – įvaldant AZD diegimus

**Skyriaus naršymas:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 4 skyrius – infrastruktūra kaip kodas ir diegimas
- **⬅️ Ankstesnis skyrius**: [3 skyrius: konfigūracija](../chapter-03-configuration/configuration.md)
- **➡️ Kitas**: [Ištekliai](provisioning.md)
- **🚀 Kitas skyrius**: [5 skyrius: daugiaprogramiai AI sprendimai](../../examples/retail-scenario.md)

## Įvadas

Ši išsami instrukcija apima viską, ką reikia žinoti apie programų diegimą naudojant Azure Developer CLI – nuo paprastų vieno komandos diegimų iki sudėtingų gamybinių scenarijų su pasirinktiniais kabliais, keliais aplinkomis ir CI/CD integracija. Įvaldykite visą diegimo ciklą su praktiniais pavyzdžiais ir geriausiomis praktikomis.

## Mokymosi tikslai

Baigę šią instrukciją jūs:
- Įvaldysite visas Azure Developer CLI diegimo komandas ir darbo eigas
- Suprasite visą diegimo gyvavimo ciklą nuo resursų paruošimo iki stebėjimo
- Įgyvendinsite pasirinktinį diegimo automatizavimą naudojant prieš ir po diegimo kablius
- Konfigūruosite kelias aplinkas su aplinkai būdingomis parametrų reikšmėmis
- Nustatysite pažangias diegimo strategijas, įskaitant mėlyna-žalia ir kanarėlių diegimus
- Integruosite azd diegimus su CI/CD vamzdynais ir DevOps darbo principais

## Mokymosi rezultatai

Baigę vadovą, sugebėsite:
- Savarankiškai vykdyti ir spręsti visas azd diegimo darbo eigas
- Kurti ir įgyvendinti pasirinktinę automatizaciją naudojant kablius
- Konfigūruoti gamybai tinkamus diegimus su tinkamu saugumu ir stebėjimu
- Valdyti sudėtingus daugiaprinio aplinkos diegimo scenarijus
- Optimizuoti diegimo veikimą ir įgyvendinti grąžinimo strategijas
- Integruoti azd diegimus į įmonių DevOps praktiką

## Diegimo apžvalga

Azure Developer CLI suteikia keletą diegimo komandų:
- `azd up` – pilna darbo eiga (paruošimas + diegimas)
- `azd provision` – sukuria/atnaujina tik Azure išteklius
- `azd deploy` – diegia tik programos kodą
- `azd package` – kuria ir pakuoja programas

## Pagrindinės diegimo darbo eigos

### Pilnas diegimas (azd up)
Dažniausiai naudojama darbo eiga naujiems projektams:
```bash
# Diegti viską nuo nulio
azd up

# Diegti su konkrečia aplinka
azd up --environment production

# Diegti su individualiais parametrais
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Tik infrastruktūros diegimas
Kai reikia tik atnaujinti Azure išteklius:
```bash
# Paruošti/atnaujinti infrastruktūrą
azd provision

# Paruošti su sausos eigos režimu, kad peržiūrėti pakeitimus
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
# SĖKMĖ: Jūsų diegimas užbaigtas per 2 minutes 15 sekundžių

# Diegti konkrečią paslaugą
azd deploy --service web
azd deploy --service api

# Diegti su pasirinktinais kūrimo argumentais
azd deploy --service api --build-arg NODE_ENV=production

# Patvirtinkite diegimą
azd show --output json | jq '.services'
```

### ✅ Diegimo patikrinimas

Po kiekvieno diegimo patikrinkite sėkmę:

```bash
# Patikrinkite, ar visi servisai veikia
azd show

# Išbandykite sveikatos patikros galus
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Stebėkite klaidas (pagal numatytuosius nustatymus atidaroma naršyklėje)
azd monitor --logs
```

**Sėkmės kriterijai:**
- ✅ Visos paslaugos rodo „Veikia“ būseną
- ✅ Sveikatos taškai grąžina HTTP 200
- ✅ Nėra klaidų žurnalų per paskutines 5 minutes
- ✅ Programa atsako į testinius užklausimus

## 🏗️ Diegimo proceso supratimas

### 1 etapas: priešparuošimo kabliai
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

### 2 etapas: infrastruktūros paruošimas
- Skaito infrastruktūros šablonus (Bicep/Terraform)
- Sukuria arba atnaujina Azure išteklius
- Konfigūruoja tinklus ir saugumą
- Nustato stebėjimą ir žurnalų kaupimą

### 3 etapas: po paruošimo kabliai
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

### 4 etapas: programos pakavimas
- Kiekia programos kodą
- Kuria diegimo artefaktus
- Pakuoja tiksliai platformai (konteineriai, ZIP failai ir t.t.)

### 5 etapas: prieš diegimo kabliai
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

### 6 etapas: programos diegimas
- Diegia sukurtas programas Azure paslaugose
- Atnaujina konfigūracijas
- Paleidžia/Perkrauna paslaugas

### 7 etapas: po diegimo kabliai
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

### Paslaugų specifinės diegimo nuostatos
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

# Veiklos aplinka
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Pažangūs diegimo scenarijai

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

### Mėlyna-žalia diegimai
```bash
# Sukurkite mėlyną aplinką
azd env new production-blue
azd up --environment production-blue

# Išbandykite mėlyną aplinką
./scripts/test-environment.sh production-blue

# Perjunkite srautą į mėlyną (rankinis DNS/arba apkrovos balansavimo atnaujinimas)
./scripts/switch-traffic.sh production-blue

# Išvalykite žalią aplinką
azd env select production-green
azd down --force
```

### Kanarėlių diegimai
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

### Pakopinis diegimas
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

### Container App diegimai
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

### Paslaugų specifiniai diegimai
```bash
# Diegti konkretų servisą greitesniam iteravimui
azd deploy --service web
azd deploy --service api

# Diegti visus servisus
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
# Naudokite azd deploy (ne azd up) tik kodui keisti
# Tai praleidžia infrastruktūros diegimą ir yra daug greitesnis
azd deploy

# Diegkite konkretų servisą greičiausiam iteravimui
azd deploy --service api
```

## 🔍 Diegimo stebėsena

### Realaus laiko diegimo stebėjimas
```bash
# Stebėkite programą realiu laiku
azd monitor --live

# Peržiūrėkite programos žurnalus
azd monitor --logs

# Patikrinkite diegimo būseną
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

### Diegimo patvirtinimas po diegimo
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
# Saugojimo slaptažodžiai saugiai
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Nuoroda į slaptažodžius faile azure.yaml
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
# AZD neturi įmontuotos atšaukimo funkcijos. Rekomenduojami metodai:

# 1 variantas: Perdiegti iš Git (rekomenduojama)
git revert HEAD  # Atšaukti probleminį commit
git push
azd deploy

# 2 variantas: Perdiegti konkretų commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastruktūros grąžinimas
```bash
# Peržiūrėkite infrastruktūros pakeitimus prieš taikydami
azd provision --preview

# Norėdami atšaukti infrastruktūrą, naudokite versijų kontrolę:
git revert HEAD  # Atšaukti infrastruktūros pakeitimus
azd provision    # Taikyti ankstesnę infrastruktūros būseną
```

### Duomenų bazės migracijos grąžinimas
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Diegimo metrikos

### Diegimo veikimo sekimas
```bash
# Peržiūrėti dabartinę diegimo būseną
azd show

# Stebėti programą naudojant Application Insights
azd monitor --overview

# Peržiūrėti tiesioginius metrikos duomenis
azd monitor --live
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
# Naudokite nuoseklų pavadinimų vartojimą
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Išlaikykite aplinkos atitikimą
./scripts/sync-environments.sh
```

### 2. Infrastruktūros patikra
```bash
# Peržiūrėkite infrastruktūros pakeitimus prieš diegiant
azd provision --preview

# Naudokite ARM/Bicep sintaksės tikrinimą
az bicep lint --file infra/main.bicep

# Patikrinkite Bicep sintaksę
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

### 4. Dokumentavimas ir žurnalavimas
```bash
# Dokumentuoti diegimo procedūras
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Kiti žingsniai

- [Ištekliai](provisioning.md) – gilinamės į infrastruktūros valdymą
- [Priešdiegimo planavimas](../chapter-06-pre-deployment/capacity-planning.md) – planuokite diegimo strategiją
- [Dažnos problemos](../chapter-07-troubleshooting/common-issues.md) – sprendžiame diegimo problemas
- [Geriausios praktikos](../chapter-07-troubleshooting/debugging.md) – gamybai paruoštos diegimo strategijos

## 🎯 Praktinės diegimo užduotys

### Užduotis 1: pakopinė diegimo darbo eiga (20 minučių)
**Tikslas**: suprasti pilno ir pakopinio diegimo skirtumus

```bash
# Pradinis diegimas
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Įrašyti pradinio diegimo laiką
echo "Full deployment: $(date)" > deployment-log.txt

# Atlikti kodo pakeitimą
echo "// Updated $(date)" >> src/api/src/server.js

# Įdiegti tik kodą (greitai)
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
- [ ] Kodo pakeitimai atsispindi veikiančioje programoje
- [ ] Infrastrukturai `azd deploy` metu nėra pakeitimų

**Mokymosi rezultatas**: `azd deploy` yra 50-70 % greitesnis už `azd up` kodui pakeisti

### Užduotis 2: pasirinktiniai diegimo kabliai (30 minučių)
**Tikslas**: įgyvendinti prieš ir po diegimo automatizaciją

```bash
# Sukurti priešdiegiamos validacijos skriptą
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Patikrinti, ar testai praeina
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Patikrinti nepateiktus pakeitimus
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Sukurti po diegimo vykdomą testą
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

# Pridėti kablius prie azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Išbandyti diegimą su kablys
azd deploy
```

**Sėkmės kriterijai:**
- [ ] Prieš diegimą skriptas paleidžiamas prieš diegimą
- [ ] Diegimas nutraukiamas, jei testai nepavyksta
- [ ] Po diegimo vyksta sveikatos patikra (smoke test)
- [ ] Kabliai vykdomi teisinga tvarka

### Užduotis 3: daugiaplinis diegimo strategija (45 minutės)
**Tikslas**: įgyvendinti pakopinę diegimo darbo eigą (dev → staging → production)

```bash
# Sukurti diegimo scenarijų
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# 1 žingsnis: Diegti į dev aplinką
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# 2 žingsnis: Diegti į staging aplinką
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# 3 žingsnis: Rankinis patvirtinimas produkcijai
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

# Vykdyti etapinį diegimą
./deploy-staged.sh
```

**Sėkmės kriterijai:**
- [ ] Dev aplinka sėkmingai įdiegta
- [ ] Staging aplinka sėkmingai įdiegta
- [ ] Gamybai reikalingas rankinis patvirtinimas
- [ ] Visose aplinkose veikia sveikatos patikros
- [ ] Galima atšaukti diegimą jei reikia

### Užduotis 4: atšaukimo strategija (25 minutės)
**Tikslas**: įgyvendinti ir išbandyti diegimo grąžinimo strategiją naudojant Git

```bash
# Diegti v1
azd env set APP_VERSION "1.0.0"
azd up

# Išsaugoti v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Diegti v2 su trikdančiu pakeitimu
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Aptikti klaidą ir grąžinti atgal
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Grąžinti atgal naudojant git
    git revert HEAD --no-edit
    
    # Aplinkos grąžinimas atgal
    azd env set APP_VERSION "1.0.0"
    
    # Perdiegi v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Sėkmės kriterijai:**
- [ ] Suvokti diegimo nesėkmes
- [ ] Gružinimo skriptas paleidžiamas automatiškai
- [ ] Programa grįžta į veikiančią būseną
- [ ] Sveikatos patikros praeina po grąžinimo

## 📊 Diegimo metrikų sekimas

### Stebėkite savo diegimo veikimą

```bash
# Sukurti diegimo metrikos scenarijų
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

# Įrašyti į failą
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
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

**Naršymas**
- **Ankstesnė pamoka**: [Jūsų pirmasis projektas](../chapter-01-foundation/first-project.md)
- **Kita pamoka**: [Ištekliai](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, prašome atkreipti dėmesį, kad automatizuotuose vertimuose gali būti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojamas profesionalus žmogaus vertimas. Mes neatsakome už bet kokius nesusipratimus ar klaidingus interpretavimus, kylančius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
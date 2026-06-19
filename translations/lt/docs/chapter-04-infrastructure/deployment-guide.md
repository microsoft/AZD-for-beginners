# Diegimo vadovas - AZD diegimų įvaldymas

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 4 skyrius - Infrastruktūra kaip kodas ir diegimas
- **⬅️ Ankstesnis skyrius**: [3 skyrius: Konfigūracija](../chapter-03-configuration/configuration.md)
- **➡️ Kitas**: [Išteklių teikimas](provisioning.md)
- **🧩 Taip pat šiame skyriuje**: [Sukurti savo šabloną](custom-templates.md)
- **🚀 Kitas skyrius**: [5 skyrius: Daugiagentės AI sprendimai](../../examples/retail-scenario.md)

## Įvadas

Šis išsamus vadovas apima viską, ką turite žinoti apie programų diegimą naudojant Azure Developer CLI — nuo paprastų vienos komandos diegimų iki pažangių gamybinių scenarijų su pritaikytais hook'ais, keliomis aplinkomis ir CI/CD integracija. Įvaldykite visą diegimo gyvavimo ciklą su praktiniais pavyzdžiais ir geriausia praktika.

## Mokymosi tikslai

Įveikę šį vadovą, jūs:
- Įvaldysite visus Azure Developer CLI diegimo komandų ir darbo eigų niuansus
- Suprasite visą diegimo gyvavimo ciklą nuo išteklių teikimo iki stebėjimo
- Įdiegsime pritaikytus diegimo hook'us prieš ir po diegimo automatizacijai
- Konfigūruosite kelias aplinkas su aplinkai specifiniais parametrais
- Nustatysite pažangias diegimo strategijas, įskaitant blue-green ir canary diegimus
- Integruosite azd diegimus su CI/CD vamzdynais ir DevOps darbo srautais

## Mokymosi rezultatai

Baigę šį skyrių, galėsite:
- Vykdyti ir trikčių šalinimą visų azd diegimo darbo eigų savarankiškai
- Kurti ir įgyvendinti pritaikytą diegimo automatizaciją naudojant hook'us
- Konfigūruoti gamybai paruoštus diegimus su tinkama sauga ir stebėjimu
- Valdyti sudėtingus kelių aplinkų diegimo scenarijus
- Optimizuoti diegimo našumą ir įgyvendinti atsitraukimo (rollback) strategijas
- Integruoti azd diegimus į įmonės DevOps praktiką

## Diegimo apžvalga

Azure Developer CLI suteikia kelias diegimo komandas:
- `azd up` - Visa darbo eiga (provision + deploy)
- `azd provision` - Kuria/atnaujina tik Azure išteklius
- `azd deploy` - Diegia tik programos kodą
- `azd package` - Kurią ir supakuoja programas

## Pagrindinės diegimo darbo eigos

### Pilnas diegimas (azd up)
Dažniausia darbo eiga naujiems projektams:
```bash
# Diegti viską nuo nulio
azd up

# Diegti su konkrečia aplinka
azd up --environment production

# Diegti su pasirinktinais parametrais
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Tik infrastruktūra
Kai reikia atnaujinti tik Azure išteklius:
```bash
# Paruošti/atnaujinti infrastruktūrą
azd provision

# Paruošti naudojant bandomąjį vykdymą, kad peržiūrėtumėte pakeitimus
azd provision --preview

# Paruošti konkrečias paslaugas
azd provision --service database
```

### Tik kodas
Greitiems programos atnaujinimams:
```bash
# Diegti visas paslaugas
azd deploy

# Tikėtinas išvestis:
# Diegiamos paslaugos (azd deploy)
# - web: Diegiama... Atlikta
# - api: Diegiama... Atlikta
# SĖKMĖ: Jūsų diegimas užtruko 2 min. 15 sek.

# Diegti konkrečią paslaugą
azd deploy --service web
azd deploy --service api

# Diegti su pasirinktais kūrimo argumentais
azd deploy --service api --build-arg NODE_ENV=production

# Patikrinti diegimą
azd show --output json | jq '.services'
```

### ✅ Diegimo patikra

Po bet kurio diegimo, patikrinkite sėkmę:

```bash
# Patikrinkite, ar visos paslaugos veikia
azd show

# Išbandykite sveikatos galinius taškus
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Stebėkite klaidas (pagal numatytuosius nustatymus atidaroma naršyklėje)
azd monitor --logs
```

**Sėkmės kriterijai:**
- ✅ Visos paslaugos rodo „Running“ būseną
- ✅ Health endpoint'ai grąžina HTTP 200
- ✅ Nėra klaidų žurnalų per paskutines 5 minutes
- ✅ Programa atsako į bandymų užklausas

## 🏗️ Diegimo proceso supratimas

### Nežinote, kas yra hook'ai? Pradėkite čia

Hook'as yra komanda, kurį azd vykdo automatiškai tam tikru diegimo proceso momentu — prieš arba po išteklių suteikimo, ir prieš arba po kodo diegimo. Jie leidžia automatizuoti mažus darbus, kurie visuomet lydi diegimą: duomenų bazės užpildymas, migracijų vykdymas, išteklių kūrimas ar pagrindinis gyvos programos tikrinimas.

| Hook'as | Vyksta… | Įprastas naudojimas |
|------|-------|------------|
| `preprovision` | Prieš išteklių sukūrimą | Patikrinti išankstines sąlygas, prisijungti prie registracijos |
| `postprovision` | Po to, kai ištekliai egzistuoja | Konfigūruoti išteklius, paruošti duomenų bazę |
| `predeploy` | Prieš kodo diegimą | Sugeneruoti front-end resursus, paleisti vienetinius testus |
| `postdeploy` | Po to, kai kodas gyvas | Vykdyti DB migracijas, atlikti smoke-test'ą endpoint'ui |

Hook'ai yra saugomi jūsų `azure.yaml`. Štai mažiausias įmanomas pavyzdys — jis tik išspausdina žinutę po diegimo:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Viskas — kitą kartą paleidus `azd up`, žinutė bus atspausdinta automatiškai. Taip pat galite paleisti hook'ą atskirai, be pilno diegimo, kas puikiai tinka testavimui:

```bash
azd hooks run postdeploy
```

Žemiau pateiktos fazės rodo realaus pasaulio hook'us (migracijos, testai, validacija) kiekvienam etapui.

### 1 fazė: Prieš-provision hook'ai
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

### 2 fazė: Infrastruktūros sukūrimas
- Skaito infrastruktūros šablonus (Bicep/Terraform)
- Kuria arba atnaujina Azure išteklius
- Konfigūruoja tinklus ir saugumą
- Nustato stebėjimą ir žurnalavimą

### 3 fazė: Po-provision hook'ai
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

### 4 fazė: Programos pakavimas
- Kloja programos kodą
- Kuria diegimo artefaktus
- Pakuoja tikslinei platformai (konteineriai, ZIP failai ir pan.)

### 5 fazė: Prieš-deploy hook'ai
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

### 6 fazė: Programos diegimas
- Diegia supakuotas programas į Azure paslaugas
- Atnaujina konfigūracijos nustatymus
- Paleidžia/persikrauna paslaugas

### 7 fazė: Po-deploy hook'ai
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

### Hook'ų klaidų tvarkymas

Pagal numatytuosius nustatymus, **jei hook'o komanda išeina su nenuliniu kodu, azd sustabdo visą operaciją.** Tai dažnai yra pageidautina — nepavykusi migracija turėtų nutraukti diegimą, o ne pristatyti sugadintą programą. Tačiau tai reiškia, kad hook'ai turi būti rašomi atsargiai.

**1. Padarykite klaidas garsias ir sąmoningas.** Hook'as laikomas nepavykusiu, kai jo paskutinė komanda grąžina nenulinį išeities kodą. Shell skriptuose pridėkite `set -e`, kad hook'as sustotų prie pirmos nepavykusios komandos, o ne tyliai tęstų:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Leiskite hook'ui nepavykti neblokuojant azd.** Neesminiams veiksmams (neprivalomas cache sušildymas, bandymas pranešti) nustatykite `continueOnError: true`. azd užfiksuos klaidą žurnale, bet tęsis toliau:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. Testuokite hook'us izoliuotai prieš pilną paleidimą.** Jums nebūtina paleisti `azd up`, kad derintumėte hook'ą — paleiskite jį atskirai ir iteruokite greitai:

```bash
azd hooks run predeploy          # vykdo tik prieš diegimą skirtą hook'ą
azd hooks run postdeploy --service api
```

**4. Atkreipkite dėmesį į OS specifines shells.** Hook'as, naudojantis `shell: pwsh`, reikalauja PowerShell įdiegtos mašinoje, kuri jį vykdo (įskaitant CI agentus). Naudokite `shell: sh` plačiausiam suderinamumui, arba pateikite tiek `windows`, tiek `posix` variantus:

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

> **Derinimo patarimas:** paleiskite bet kurią azd komandą su `--debug`, kad pamatytumėte tikslų hook'o komandų eilutę ir visą jo išvestį — tai neįkainojama, kai hook'as veikia lokaliai, bet nepavyksta CI.

## 🎛️ Diegimo konfigūracijos

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
# Kūrimo aplinka
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

## 🔧 Pažangūs diegimo scenarijai

### Daugiapaslaugės programos
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
# Sukurti mėlyną aplinką
azd env new production-blue
azd up --environment production-blue

# Išbandyti mėlyną aplinką
./scripts/test-environment.sh production-blue

# Perjungti srautą į mėlyną (rankinis DNS / apkrovos balansatoriaus atnaujinimas)
./scripts/switch-traffic.sh production-blue

# Išvalyti žalią aplinką
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

### Etapizuoti diegimai
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

### Multi-stage Dockerfile optimizacija
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

### Paslaugai specifiniai diegimai
```bash
# Diegti konkrečią paslaugą greitesniam iteravimui
azd deploy --service web
azd deploy --service api

# Diegti visas paslaugas
azd deploy
```

### Build cache naudojimas
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
# Tai apeina infrastruktūros parengimą ir yra žymiai greitesnis
azd deploy

# Norėdami greitesnių iteracijų, diegkite konkrečią paslaugą
azd deploy --service api
```

## 🔍 Diegimo stebėjimas

### Realaus laiko diegimo stebėjimas
```bash
# Stebėti programą realiu laiku
azd monitor --live

# Peržiūrėti programos žurnalus
azd monitor --logs

# Patikrinti diegimo būseną
azd show
```

### Health check'ai
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

### Po diegimo validacija
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Patikrinti programos sveikatą
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

### Slapčių valdymas
```bash
# Laikykite slaptus duomenis saugiai
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Nurodykite slaptus duomenis faile azure.yaml
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

## 🚨 Atsitraukimo (rollback) strategijos

### Greitas atsitraukimas
```bash
# AZD neturi įmontuotos atšaukimo funkcijos. Rekomenduojami būdai:

# Parinktis 1: Iš naujo įdiegti iš Git (rekomenduojama)
git revert HEAD  # Atšaukti probleminį commit'ą
git push
azd deploy

# Parinktis 2: Iš naujo įdiegti konkretų commit'ą
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastruktūros atsitraukimas
```bash
# Peržiūrėkite infrastruktūros pakeitimus prieš juos taikydami
azd provision --preview

# Infrastruktūros grąžinimui naudokite versijų valdymą:
git revert HEAD  # Atšaukti infrastruktūros pakeitimus
azd provision    # Taikyti ankstesnę infrastruktūros būseną
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

## 📊 Diegimo metrikos

### Stebėkite diegimo našumą
```bash
# Peržiūrėti dabartinę diegimo būseną
azd show

# Stebėti programą naudojant Application Insights
azd monitor --overview

# Peržiūrėti tiesioginius rodiklius
azd monitor --live
```

### Vartotojiškų metrikų rinkimas
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

### 1. Aplinkų nuoseklumas
```bash
# Naudokite nuoseklius pavadinimus
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Užtikrinkite aplinkų suderinamumą
./scripts/sync-environments.sh
```

### 2. Infrastruktūros patikra
```bash
# Peržiūrėkite infrastruktūros pakeitimus prieš diegimą
azd provision --preview

# Naudokite ARM/Bicep lintinimą
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
# Dokumentuokite diegimo procedūras
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Kiti žingsniai

- [Išteklių teikimas](provisioning.md) - Gyliau apie infrastruktūros valdymą
- [Prieš-diegimo planavimas](../chapter-06-pre-deployment/capacity-planning.md) - Suplanuokite savo diegimo strategiją
- [Dažnos problemos](../chapter-07-troubleshooting/common-issues.md) - Išspręskite diegimo problemas
- [Geriausios praktikos](../chapter-07-troubleshooting/debugging.md) - Gamybai paruoštos diegimo strategijos

## 🎯 Praktinės diegimo užduotys

### Užduotis 1: Inkrementinis diegimo darbo srautas (20 minučių)
**Tikslas**: Įvaldyti skirtumą tarp pilno ir inkrementinio diegimo

```bash
# Pradinis diegimas
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Užfiksuoti pradinio diegimo laiką
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
- [ ] Pilnas diegimas užtrunka 5–15 minučių
- [ ] Tik kodo diegimas užtrunka 2–5 minutes
- [ ] Kodo pakeitimai atsispindi diegtoje programoje
- [ ] Infrastruktūra nesikeičia po `azd deploy`

**Mokymosi rezultatas**: `azd deploy` yra 50–70% greitesnis už `azd up` kodo pakeitimams

### Užduotis 2: Tinkinti diegimo hook'ai (30 minučių)
**Tikslas**: Įgyvendinti prieš ir po diegimo automatizaciją

```bash
# Sukurti prieš diegimą skirtą patikros skriptą
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

# Sukurti po diegimo trumpą patikros (smoke) testą
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
- [ ] Prieš diegimą paleidžiamas skriptas
- [ ] Diegimas nutraukiamas, jei testai nepraeina
- [ ] Po diegimo atliekamas smoke-test'as patikrina būklę
- [ ] Hook'ai vykdomi teisinga tvarka

### Užduotis 3: Kelių aplinkų diegimo strategija (45 minutės)
**Tikslas**: Įgyvendinti etapizuotą diegimo darbo eigą (dev → staging → production)

```bash
# Sukurti diegimo skriptą
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

# 2 žingsnis: Diegti į paruošiamąją aplinką
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

# Paleisti etapinį diegimą
./deploy-staged.sh
```

**Sėkmės kriterijai:**
- [ ] Dev aplinka sėkmingai diegiama
- [ ] Staging aplinka sėkmingai diegiama
- [ ] Reikalaujamas rankinis patvirtinimas gamybai
- [ ] Visos aplinkos turi veikiančius health check'us
- [ ] Gali būti atliekamas atsitraukimas, jei reikia

### Užduotis 4: Atsitraukimo strategija (25 minutes)
**Tikslas**: Įgyvendinti ir ištestuoti diegimo atsitraukimą naudojant Git

```bash
# Diegti v1
azd env set APP_VERSION "1.0.0"
azd up

# Išsaugoti v1 commito hashą
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Diegti v2 su nesuderinamu pakeitimu
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Nustatyti gedimą ir atkurti ankstesnę versiją
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Atkurti naudojant git
    git revert HEAD --no-edit
    
    # Atstatyti aplinką
    azd env set APP_VERSION "1.0.0"
    
    # Pakartotinai diegti v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Sėkmės kriterijai:**
- [ ] Gali aptikti diegimo klaidas
- [ ] Atsitraukimo skriptas vykdomas automatiškai
- [ ] Programa grįžta į veikiančią būseną
- [ ] Health check'ai praeina po atsitraukimo

## 📊 Diegimo metrikos stebėjimas

### Stebėkite diegimo našumą

```bash
# Sukurkite diegimo metrikų skriptą
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

# Rašykite į failą
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Naudokite jį
./track-deployment.sh
```

**Analizuokite savo metrikas:**
```bash
# Peržiūrėti diegimų istoriją
cat deployment-metrics.csv

# Apskaičiuoti vidutinį diegimo trukmę
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
- **Kita pamoka**: [Išteklių teikimas](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
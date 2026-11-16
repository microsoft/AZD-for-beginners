# Diegimo Vadovas - Įvaldant AZD Diegimus

**Skyriaus Navigacija:**
- **📚 Kurso Pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 4 skyrius - Infrastruktūra kaip Kodas & Diegimas
- **⬅️ Ankstesnis skyrius**: [3 skyrius: Konfigūracija](../chapter-03-configuration/configuration.md)
- **➡️ Kitas**: [Išteklių Paretimas](provisioning.md)
- **🧩 Taip pat šiame skyriuje**: [Savo Šablono Kūrimas](custom-templates.md)
- **🚀 Kitas skyrius**: [5 skyrius: Multi-Agentų DI Sprendimai](../../examples/retail-scenario.md)

## Įvadas

> Peržiūrėta pagal `azd 1.37.2` (2026 m. lapkritis). Komandos naudoja Bash; JSON pavyzdžiai reikalauja `jq`. Išskyrus aiškiai inicializuotą todo užduotį, pažangūs pavyzdžiai yra **integracijos fragmentai**: pateikite savo šaltinį, infrastruktūrą, testus ir skriptus. Šios apžvalgos metu Azure diegimai nebuvo vykdomi.

Šis išsamus vadovas apima viską, ką reikia žinoti apie taikomųjų programų diegimą naudojant Azure Developer CLI — nuo pagrindinių vienos komandos diegimų iki pažangių gamybos scenarijų su pasirinktinais kabliais, keliomis aplinkomis ir CI/CD integracija. Įvaldykite pilną diegimo gyvavimo ciklą su praktiniais pavyzdžiais ir geriausiomis praktikomis.

## Mokymosi Tikslai

Baigę šį vadovą, jūs:
- Išmoksite visas Azure Developer CLI diegimo komandas ir darbo eigas
- Suprasite pilną diegimo gyvavimo ciklą nuo išteklių paretimo iki stebėjimo
- Įgyvendinsite pasirinktinius diegimo kablius prieš ir po diegimo automatizacijai
- Konfigūruosite kelias aplinkas su aplinkai specifiškais parametrais
- Nustatysite pažangias diegimo strategijas, įskaitant blue-green ir canary diegimus
- Integruosite azd diegimus su CI/CD vamzdynais ir DevOps darbo eigomis

## Mokymosi Rezultatai

Užbaigę mokymus galėsite:
- Nepriklausomai vykdyti ir spręsti visas azd diegimo darbo eigas
- Kurti ir įgyvendinti pasirinktines diegimo automatizacijas naudojant kablius
- Konfigūruoti gamybai paruoštus diegimus su tinkama sauga ir stebėjimu
- Valdyti sudėtingas kelių aplinkų diegimo scenarijas
- Optimizuoti diegimo našumą ir taikyti atšaukimo strategijas
- Integruoti azd diegimus į įmonių DevOps praktiką

## Diegimo Apžvalga

Azure Developer CLI siūlo keletą diegimo komandų:
- `azd up` - Pilna darbo eiga (paretimas + diegimas)
- `azd provision` - Kuria/atnaujina tik Azure išteklius
- `azd deploy` - Diegia tik programos kodą
- `azd package` - Kuria ir pakuoja programas

## Pagrindinės Diegimo Darbo Eigos

### Pilnas Diegimas (azd up)
Dažniausia darbo eiga naujiems projektams:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Configure a location for the selected environment before first provisioning
azd env set AZURE_LOCATION westus2
# SKU changes must be wired into your template's parameter file/Bicep.
azd up
```

### Tik Infrastruktūros Diegimas
Kai reikia tik atnaujinti Azure išteklius:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Tik Kodo Diegimas
Greitiems programos atnaujinimams:
```bash
# Deploy all services
azd deploy

# Expected output:
# Deploying services (azd deploy)
# - web: Deploying... Done
# - api: Deploying... Done
# SUCCESS: Your deployment completed in 2 minutes 15 seconds

# Deploy specific service
azd deploy web
azd deploy api

# Docker build arguments belong in azure.yaml: services.api.docker.buildArgs
# They are not an azd deploy --build-arg flag.

# Verify deployment
azd show --output json | jq '.services'
```

### ✅ Diegimo Patikra

Po bet kokio diegimo patikrinkite sėkmę:

```bash
# Inspect configured service targets and ingress URLs (not a health check)
azd show

# Test health endpoints
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

curl -f "$WEB_URL" || { echo "❌ Web request failed"; exit 1; }
# For the todo-nodejs-mongo template, /lists exists; /health does not.
curl -f "$API_URL/lists" || { echo "❌ API request failed"; exit 1; }

# Monitor for errors (opens in browser by default)
azd monitor --logs
```

**Sėkmės Kriterijai:**
- ✅ `azd show` išsprendžia numatytus paslaugų tikslus/URL
- ✅ Užklausos tikriesiems programos maršrutams grąžina numatytą būseną ir turinį
- ✅ Paskutinių 5 minučių klaidų žurnalai nėra
- ✅ Programa reaguoja į testines užklausas

## 🏗️ Diegimo Procesas

### Naujas prie kablių? Pradėkite čia

**Kablys** yra komanda, kurią azd automatiškai vykdo tam tikru momentu diegimo procese — prieš arba po paretimo, ir prieš arba po kodo diegimo. Jie leidžia automatizuoti smulkius darbus, kurie visada lydi diegimą: duomenų bazės užpildymas, migracijų paleidimas, assetų kūrimas arba gyvos programos greitas tikrinimas.

| Kabliukas | Vyksta… | Dažniausia paskirtis |
|------|-------|------------|
| `preprovision` | Prieš išteklių kūrimą | Patvirtinti išankstines sąlygas, prisijungti prie registro |
| `postprovision` | Po išteklių sukūrimo | Konfigūruoti išteklius, sukurti duomenų bazę |
| `predeploy` | Prieš kodo diegimą | Kurti front-end assetus, vykdyti vienetinius testus |
| `postdeploy` | Po kodo diegimo | Vykdyti DB migracijas, atlikti greitą galutinio taško testą |

Kabliai yra jūsų `azure.yaml` faile. Štai mažiausias galimas pavyzdys — jis tik atspausdina žinutę po diegimo:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Štai ir viskas — kitą kartą paleidus `azd up` žinutė bus atspausdinta automatiškai. Taip pat galite paleisti kablys atskirai, ne visą diegimą, kas puiku testavimui:

```bash
azd hooks run postdeploy
```

Žemiau parodytos realios fazės su tikrais kabliais (migracijos, testai, patvirtinimai) kiekviename etape.

### 1 Faza: Prieš paretimą kabliai
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

### 2 Faza: Infrastruktūros Paretimas
- Skaito infrastruktūros šablonus (Bicep/Terraform)
- Kurią ar atnaujina Azure išteklius
- Konfigūruoja tinklą ir saugumą
- Nustato stebėjimą ir žurnalavimą

### 3 Faza: Po paretimo kabliai
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

### 4 Faza: Programos Pakavimas
- Kuria programos kodą
- Kuria diegimo artefaktus
- Pakuoja tiksliai platformai (konteineriai, ZIP failai ir kt.)

### 5 Faza: Prieš diegimą kabliai
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

### 6 Faza: Programos Diegimas
- Diegia supakuotas programas į Azure paslaugas
- Atnaujina konfigūracijos nustatymus
- Paleidžia/Restartuoja paslaugas

### 7 Faza: Po diegimo kabliai
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl --fail "$WEB_URL/health"
```

### Kablio Klaidos Tvarkymas

Pagal nutylėjimą, **jei kablys grąžina ne nulio išeities kodą, azd sustabdo visą operaciją.** Tai paprastai norima — nepavykusi migracija turi sustabdyti diegimą, o ne leisti paskelbti sugadintą programą. Bet tai reiškia, kad kabliai turi būti rašomi atsargiai.

**1. Padarykite klaidas triukšmingas ir sąmoningas.** Kablys nepavyksta, kai jo paskutinė komanda grąžina ne nulio išeities kodą. Shell skriptuose pridėkite `set -e`, kad kablys sustotų prie pirmos klaidos, o ne tyliai tęstųsi:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Leiskite kablys nepavykti nesustabdant azd.** Nesvarbiems žingsniams (neprivalomas talpyklos sušildymas, paslaugos pranešimas) nustatykite `continueOnError: true`. azd užregistruoja klaidą, bet tęsia toliau:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Testuokite kablius izoliuotai prieš pilną vykdymą.** Nebūtina vykdyti `azd up` norint derinti kablys — paleiskite jį atskirai ir greitai tobulinkite:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Atkreipkite dėmesį į OS specifiškumą.** Kablys, naudojantis `shell: pwsh`, turi turėti įdiegtą PowerShell mašinoje, kurioje vykdomas (įskaitant CI agentus). Naudokite `shell: sh` dėl didžiausio suderinamumo arba pateikite abi `windows` ir `posix` variacijas:

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

> **Derinimo patarimas:** paleiskite bet kurią azd komandą su `--debug`, kad pamatytumėte tikslią kablys komandą ir jos pilną išvestį — tai nepakeičiamas, kai kablys veikia vietoje, bet nepavyksta CI.

## 🎛️ Diegimo Konfigūracija

### Paslaugos Specifiški Diegimo Nustatymai
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    language: js
    dist: dist
    
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
    env:
      NODE_ENV: production
      API_VERSION: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    language: js
```

### Aplinkos Specifiškos Konfigūracijos

Tai yra tik lokalūs azd reikšmės. Aiškiai susiekite juos su infrastruktūros/veikimo laiko konfigūracija. `NODE_ENV` paprastai yra `production` diegiamai Node programai, įskaitant statinį diegimą; naudokite atskirą programai specifišką kintamąjį skirtingiems diegimo etapams atskirti.

```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Pažangūs Diegimo Scenarijai

### Daugiapaslauginės Programos
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

### Blue-Green Diegimai

**Operacinė iliustracija:** turite pateikti abi aplinkas, bendrą srautų maršrutizavimo sluoksnį ir žemiau esančius du skriptus. azd automatiškai nepakeičia srauto ir nepatvirtina atšaukimo parengties. Laikykite žalią aplinką tol, kol mėlynoji praeis testus ir atšaukimas nebereikalingas.

```bash
# Create blue environment
azd env new production-blue
azd up --environment production-blue

# Test blue environment
./scripts/test-environment.sh production-blue

# Switch traffic to blue (manual DNS/load balancer update)
./scripts/switch-traffic.sh production-blue

# Clean up green environment
azd env select production-green
azd down --force
```

### Canary Diegimai
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Srauto dalijimasis priklauso Container Apps konfigūracijai (Bicep arba Azure CLI), o ne `azure.yaml` `trafficSplit` savybei. Peržiūros/paretimo ir vėlesni diegimai turi išlaikyti jūsų pasirinktą versijos režimą ir maršrutizavimo taisykles.

### Etapo Diegimai
```bash
#!/bin/bash
# deploy-staged.sh
set -e

echo "Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 Konteinerių Diegimai

### Container App Diegimai
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - BUILD_VERSION=${BUILD_VERSION}
        - NODE_ENV=production
    env:
      NODE_ENV: production
```

Konfigūruokite veikimo laiko slaptuosius raktus su `configuration.secrets`/`secretRef` (arba Key Vault nuorodomis) ir skalavimą su `template.scale` Container App infrastruktūroje. Nekurkite paslaugos lygio `secrets` ar `scale` savybių `azure.yaml`.

### Daugiapakopis Dockerfile Optimizavimas
```dockerfile
# Dockerfile
FROM node:22-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci
COPY . .
RUN npm run build
RUN npm prune --omit=dev

FROM node:22-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ Veiklos Optimizavimas

### Paslaugos Specifiški Diegimai
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Kūrimo Talpyklos Naudojimas
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Standartinė Node darbo eiga naudoja paketo skriptus; paslaugos `prepackage` kabliai gali pridėti reikiamus žingsnius. Docker sluoksnių talpykla yra atskira nuo paslaugos kūrimo komandos apibrėžimo.

### Efektyvūs Kodo Diegimai
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Diegimo Stebėjimas

### Realiojo Laiko Diegimo Stebėjimas
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Sveikatos Patikros
```bicep
// Partial Container App container definition:
// merge into properties.template.containers[] in your Bicep resource.
probes: [
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 3000
      scheme: 'HTTP'
    }
    initialDelaySeconds: 10
    periodSeconds: 30
    timeoutSeconds: 10
    failureThreshold: 3
  }
]
```

Jūsų programa privalo įgyvendinti `/health`; azd jo nepateikia automatiškai. Nėra bendros `azure.yaml` `healthCheck` paslaugos savybės.

### Po Diegimo Patikrinimai
```bash
#!/bin/bash
# scripts/validate-deployment.sh
set -e

echo "Validating deployment..."

# Check application health
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

echo "Testing web application..."
if curl -f "$WEB_URL"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/lists"; then
    echo "✅ API is healthy"
else
    echo "❌ API health check failed"
    exit 1
fi

echo "Running integration tests..."
npm run test:integration

echo "✅ Deployment validation completed successfully"
```

## 🔐 Saugumo Aspektai

### Slaptų Duomenų Valdymas
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` yra neleistinas. Paprasti aplinkos kintamieji yra vietiniai paprastu tekstu; nesitikėkite, kad skaitymo komandos juos išfiltruos. Aukščiau pateiktos komandos saugo Key Vault nuorodas, tačiau jūsų infrastruktūra/programa vis tiek turi suvartoti slaptus duomenis ir suteikti veikimo laiko tapatybei prieigą.

### Tinklo Saugumas
Deklaruokite ir naudokite tinklo parametrus Bicep, ir susiekite juos su `infra/main.parameters.json`. Nėra bendro `infra.parameters` sluoksnio `azure.yaml`. Pavyzdiniai dokumentai naudoja `203.0.113.0/24` ir `198.51.100.0/24`, kurie nėra tikros biurų/VPN tinklų sritys; pakeiskite jas leidžiamais tinklais.

### Tapatybės ir Prieigos Valdymas
Įjunkite Container App `identity` Bicep ir priskirkite reikalingą Key Vault duomenų plokštės vaidmenį talpyklos srityje. Konfigūruokite vardinius Key Vault remiamus slaptus duomenis ir veikimo laiko nuorodas tame resurse; `identity` ir `keyVault` nėra bendros azd paslaugos savybės. Žr. [Autentifikacija & Valdomoji Tapatybė](../chapter-03-configuration/authsecurity.md).

## 🚨 Atšaukimo Strategijos

### Greitas Atšaukimas
```bash
# AZD doesn't have built-in rollback. Recommended approaches:

# Option 1: Redeploy from Git (recommended)
git revert HEAD  # Revert the problematic commit
git push
azd deploy

# Option 2: Redeploy specific commit
git checkout "<previous-commit-hash>"
azd deploy
git checkout main
```

### Infrastruktūros Atšaukimas
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### Duomenų Bazės Migracijos Atšaukimas
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Diegimo Matavimai

### Sekite Diegimo Našumą
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
azd monitor --live
```

### Pasirinktinių Matavimų Rinkimas
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

## 🎯 Geriausios Praktikos

### 1. Aplinkos Nuoseklumas
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Infrastruktūros Patvirtinimas
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
```

### 3. Integruotų Testų Naudojimas
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

### 4. Dokumentacija ir Žurnalo Tvarkymas
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Tolimesni Žingsniai

- [Išteklių Paretimas](provisioning.md) - Gilus infrastruktūros valdymas
- [Diegimo Planavimas](../chapter-06-pre-deployment/capacity-planning.md) - Planavimas jūsų diegimo strategijai
- [Dažnos Problemų Sprendimai](../chapter-07-troubleshooting/common-issues.md) - Diegimo problemų sprendimas
- [Geriausios Praktikos](../chapter-07-troubleshooting/debugging.md) - Gamybai paruošti diegimo metodai

## 🎯 Praktinės Diegimo Užduotys

### Užduotis 1: Palaipsnio Diegimo Darbo Eiga (20 minučių)
**Tikslas**: Įvaldyti skirtumą tarp pilno ir palaipsnio diegimo

**Pradžios taškas:** Bash, Node.js 22, Git, azd prisijungimas ir Azure prenumerata su diegimo teisėmis. Vykdykite naujame kataloge; numatomos apmokestinamos App Service/Cosmos DB paslaugos. Laikas priklauso nuo regiono ir šablono.

```bash
# Initial deployment
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo .
time azd up

# Record initial deployment time
echo "Full deployment: $(date)" > deployment-log.txt

# Make a code change
echo "// Updated $(date)" >> src/api/src/index.ts

# Deploy only code (fast)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Compare times
cat deployment-log.txt

# Clean up
azd down --force --purge
```

**Sėkmės Kriterijai:**
- [ ] Užfiksuokite vykdymo laiką abiejose komandose (nėra garantuoto laiko)
- [ ] Abi komandos sėkmingai užbaigtos
- [ ] API veikia; komentarų redagavimas nekelia matomo UI pakeitimo
- [ ] Infrastruktūra nepakitusi po `azd deploy`

**Mokymosi Rezultatas**: `azd deploy` praleidžia infrastruktūros paretimą. Palyginkite išmatuotą laiką, o ne spėkite apie pastovų greitinimą procentais.

### Užduotis 2: Pasirinktinių Diegimo Kabliukų Įgyvendinimas (30 minučių)
**Tikslas**: Įgyvendinti prieš ir po diegimo automatizavimą

**Pradžios taškas:** aukščiau inicializuotas `deployment-practice` projektas. Jei jį išvalėte, paleiskite `azd up` dar kartą prieš testuojant tik kodo diegimą. Žemiau pateikta patikra naudoja realaus API kūrimo skriptą, o ne neegzistuojantį šaknies `test:unit` skriptą. Šablono API testams reikalingas konfigūruotas duomenų bazės ryšys; tai nėra izoliuoti vienetinių testų rinkinys.

```bash
# Create pre-deploy validation script
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
set -e
echo "⚠️ Running pre-deployment checks..."

# Install API dependencies and check its actual lint/TypeScript build
npm --prefix src/api ci
if ! npm --prefix src/api run build; then
    echo "❌ Build validation failed! Aborting deployment."
    exit 1
fi

# Check for uncommitted changes
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Create post-deploy smoke test
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
set -e
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')

if curl -f "$WEB_URL"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# Merge the following into the EXISTING azure.yaml using your editor.
# If hooks already exists, merge its children; never append a duplicate YAML key.
```

```yaml

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
```

```bash
# Test deployment with hooks
azd deploy
```

**Sėkmės Kriterijai:**
- [ ] Prieš diegimą vykdomas skriptas veikia
- [ ] Diegimas nutraukiamas, jei patikra nepavyksta
- [ ] Po diegimo atliekamas greitas testas patvirtina būklę
- [ ] Kabliai vykdomi teisinga tvarka

### Užduotis 3: Kelių Aplinkų Diegimo Strategija (45 minutės)
**Tikslas**: Implementuoti palaipsnio diegimo darbo eigą (dev → statinis → gamyba)

**Pradžios taškas:** tas pats inicializuotas todo projektas su `jq`. Sukurkite žemiau nurodytas aplinkas su tikromis prenumeratos/vietos reikšmėmis (arba nustatykite `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` kiekvienoje) **prieš** paleidžiant no-prompt darbo eigą. Ji tyčia nepavyksta vietoj to, kad išrengtų trūkstamas reikšmes. Naudokite tik panaudojamas mokymosi aplinkas, ne tikrą gamybinę prenumeratą.

```bash
# Create deployment script
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Step 1: Deploy to dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 2: Deploy to staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 3: Manual approval for production
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Create environments
# Reuse existing dev if you completed Exercise 1; create unused environments
azd env select dev
azd env new staging --subscription "<subscription-id>" --location eastus2
azd env new production --subscription "<subscription-id>" --location eastus2

# Run staged deployment
./deploy-staged.sh

# After verification, delete each disposable deployment (review prompts)
azd down --environment dev
azd down --environment staging
azd down --environment production
```

**Sėkmės kriterijai:**
- [ ] Dev aplinka sėkmingai diegiama
- [ ] Staging aplinka sėkmingai diegiama
- [ ] Gamybai reikia rankinio patvirtinimo
- [ ] Visose aplinkose veikia sveikatos patikrinimai
- [ ] Galima atstatyti ankstesnę būseną, jei reikia

### Pratyba 4: Atsigavimo strategija (25 minutės)
**Tikslas**: Įgyvendinti ir išbandyti diegimo atstatymą naudojant Git

**Pradžios taškas:** atskiras mokymo kopijos iš kortelės su visų pradinių šaltinių įsipareigojimu, švari Git darbo sritis ir panaudojama sukonfigūruota aplinka. Neverta sąmoningai įvesti klaidų tikrame gamybiniame projekte. `APP_VERSION` žemiau yra tik buhalterija, nebent eksplicitiškai prijungsite tai prie programos.

```bash
# Deploy v1
azd env set APP_VERSION "1.0.0"
azd up

# Save v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Deploy v2 with breaking change
echo "throw new Error('Intentional break');" >> src/api/src/index.ts
git add src/api/src/index.ts
git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
DEPLOY_FAILED=false
azd deploy api || DEPLOY_FAILED=true

# Detect failure and rollback
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
if [ "$DEPLOY_FAILED" = true ] || ! curl -f "$API_URL/lists"; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback using git
    git revert HEAD --no-edit
    
    # Rollback environment
    azd env set APP_VERSION "1.0.0"
    
    # Redeploy v1
    azd deploy api
    curl --fail "$API_URL/lists"
    
    echo "✅ Rolled back to v1.0.0"
fi

# Clean up the disposable deployment when finished
azd down
```

**Sėkmės kriterijai:**
- [ ] Gali aptikti diegimo klaidas
- [ ] Atstatymo scenarijus vykdomas automatiškai
- [ ] Programa grįžta į veikiančią būseną
- [ ] Sveikatos patikrinimai praėję po atstatymo

## 📊 Diegimo metrikų stebėjimas

### Stebėkite savo diegimo našumą

```bash
# Create deployment metrics script
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"
DEPLOY_STATUS=$?

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Log to file
echo "$(date +%Y-%m-%dT%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
exit "$DEPLOY_STATUS"
EOF

chmod +x track-deployment.sh

# Use it
./track-deployment.sh
```

**Analizuokite savo metrikas:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Papildomi šaltiniai

- [Azure Developer CLI diegimo nuoroda](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service diegimas](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps diegimas](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions diegimas](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Naršymas**
- **Ankstesnis pamoka**: [Jūsų pirmasis projektas](../chapter-01-foundation/first-project.md)
- **Sekantis pamoka**: [Išteklių teikimas](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->